using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Diagnostics;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using TechnoservisApp.Entities;
using TechnoservisApp.Windows;

namespace TechnoservisApp.Pages
{
    /// <summary>
    /// Interaction logic for RequestsPage.xaml
    /// </summary>
    public partial class RequestsPage : Page
    {
        private TechnoservisEntities _cont = TechnoservisEntities.GetContext();

        public RequestsPage()
        {
            InitializeComponent();
            ShowControls();
            UpdateDataGrid();
        }

        private void ShowControls()
        {
            switch (MainWindow.currentUser.TypeId)
            {
                case (int)TypeOfUser.Manager:
                    spManager.Visibility = Visibility.Visible;
                    break;
                case (int)TypeOfUser.Master:
                    spMaster.Visibility = Visibility.Visible;
                    break;
                case (int)TypeOfUser.Operator:
                    spClientOperator.Visibility = Visibility.Visible;
                    break;
                case (int)TypeOfUser.Client:
                    spClientOperator.Visibility = Visibility.Visible;
                    break;
            }
        }

        private void UpdateDataGrid(string searchText=null)
        {
            var requests = _cont.RepairingRequest.ToList();
            if (!string.IsNullOrEmpty(searchText))
                requests = requests.Where(r => searchText.Contains(r.Id.ToString())).ToList();
            switch (MainWindow.currentUser.TypeId)
            {
                case (int)TypeOfUser.Manager:
                    dtgRequests.ItemsSource = requests.ToList();
                    break;
                case (int)TypeOfUser.Master:
                    dtgRequests.ItemsSource = requests.Where(r => r.MasterId == MainWindow.currentUser.Id).ToList();
                    break;
                case (int)TypeOfUser.Operator:
                    dtgRequests.ItemsSource = requests.ToList();
                    break;
                case (int)TypeOfUser.Client: 
                    dtgRequests.ItemsSource = requests.Where(r => r.ClientId == MainWindow.currentUser.Id).ToList();
                    break;
            }
        }

        private void btnCreate_Click(object sender, RoutedEventArgs e)
        {
            var request = new RepairingRequest()
            {
                CreationDate = DateTime.Now,
                RequestStatus = _cont.RequestStatus.Single(s => s.Id == (int)StatusOfRequest.New)
            };

            new RequestEditingWindow(request).ShowDialog();
            UpdateDataGrid();
        }

        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {
            var request = dtgRequests.SelectedItem as RepairingRequest;
            if(request == null)
            {
                MessageBox.Show("Выберите заявку");
                return;
            }

            new RequestEditingWindow(request).ShowDialog();
            _cont.ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
            UpdateDataGrid();
        }

        private void btnStartRepairing_Click(object sender, RoutedEventArgs e)
        {
            var request = dtgRequests.SelectedItem as RepairingRequest;
            if (request == null)
            {
                MessageBox.Show("Выберите заявку");
                return;
            }

            request.StatusId = (int)StatusOfRequest.InProgress;
            request.StartDate = DateTime.Now;
            _cont.SaveChanges();
            MessageBox.Show("Заявка получила статус \"В процессе ремонта\"");
            UpdateDataGrid();
        }

        private void btnFinishRepairing_Click(object sender, RoutedEventArgs e)
        {
            var request = dtgRequests.SelectedItem as RepairingRequest;
            if (request == null)
            {
                MessageBox.Show("Выберите заявку");
                return;
            }

            if(request.StartDate == null)
            {
                MessageBox.Show("Нельзя завершить заявку, так как она не была ранее начата");
                return;
            }

            new ReportWindow(request).ShowDialog();
            UpdateDataGrid();
        }

        private void btnAddEquipment_Click(object sender, RoutedEventArgs e)
        {
            var request = dtgRequests.SelectedItem as RepairingRequest;
            if (request == null)
            {
                MessageBox.Show("Выберите заявку");
                return;
            }

            new EquipmentWindow(request).ShowDialog();
        }

        private void tbnReports_Click(object sender, RoutedEventArgs e)
        {
            var request = dtgRequests.SelectedItem as RepairingRequest;
            if (request == null)
            {
                MessageBox.Show("Выберите заявку");
                return;
            }

            if(request.Report == null)
            {
                MessageBox.Show("Отчет по заявке отсутствует");
                return;
            }

            new ReportWindow(request).ShowDialog();
        }

        private void btnStat_Click(object sender, RoutedEventArgs e)
        {
            var completed = _cont.RepairingRequest.Where(r => r.StatusId == (int)StatusOfRequest.Completed).ToList();
            var avgHours = (int)completed.Average(r => (DateTime.Now - r.StartDate.Value).TotalHours);

            MessageBox.Show($"Выполнено заявок: {completed.Count()}\nСреднее время выполнения: {avgHours}ч\n", "Статистика работы отдела обслуживания");
        }

        private void btnComments_Click(object sender, RoutedEventArgs e)
        {
            var request = dtgRequests.SelectedItem as RepairingRequest;
            if (request == null)
            {
                MessageBox.Show("Выберите заявку");
                return;
            }

            new CommentsWindow(request).ShowDialog();
        }

        private void tbxSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            UpdateDataGrid(tbxSearch.Text);
        }
    }
}
