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

            if(MainWindow.currentUser.RoleId == 2) // Repairer
            {
                spRepairer.Visibility = Visibility.Visible;
                spManager.Visibility = Visibility.Hidden;
                dtgRequests.ItemsSource = _cont.RepairingRequest.Where(req => req.PerformerId == MainWindow.currentUser.Id && req.StatusId != 3).ToList();
            }
            else // Manager
            {
                spRepairer.Visibility = Visibility.Hidden;
                spManager.Visibility = Visibility.Visible;
                dtgRequests.ItemsSource = _cont.RepairingRequest.ToList();
            }
        }



        private void btnCreate_Click(object sender, RoutedEventArgs e)
        {
            var request = new RepairingRequest()
            {
                CreationDate = DateTime.Now,
                RequestStatus = _cont.RequestStatus.First(s => s.Id == 1)
            };

            new RequestEditingWindow(request).ShowDialog();
            dtgRequests.ItemsSource = _cont.RepairingRequest.ToList();
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
            dtgRequests.ItemsSource = _cont.RepairingRequest.ToList();
        }



        private void btnStartRepairing_Click(object sender, RoutedEventArgs e)
        {
            var request = dtgRequests.SelectedItem as RepairingRequest;
            if (request == null)
            {
                MessageBox.Show("Выберите заявку");
                return;
            }

            request.StatusId = 2;
            request.StartDate = DateTime.Now;
            _cont.SaveChanges();
            MessageBox.Show("Заявка получила статус \"в работе\"");
            dtgRequests.ItemsSource = _cont.RepairingRequest.Where(req => req.PerformerId == MainWindow.currentUser.Id && req.StatusId != 3).ToList();
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
            dtgRequests.ItemsSource = _cont.RepairingRequest.Where(req => req.PerformerId == MainWindow.currentUser.Id && req.StatusId != 3).ToList();
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
            var completed = _cont.RepairingRequest.Where(r => r.StatusId == 3);
            var avgHours = completed.Where(r => r.Report != null).Average(r => r.Report.HoursSpent);
            var sb = new StringBuilder($"Выполнено заявок: {completed.Count()}\nСреднее время выполнения: {avgHours}ч\n");
            foreach(var type in _cont.DefectType)
            {
                int amount = 0;
                if(type.RepairingRequest != null)
                    amount = type.RepairingRequest.Count(r => r.StatusId == 3);
                sb.AppendLine($"{type.Name} - {amount}");
            }

            MessageBox.Show(sb.ToString(), "Статистика работы отдела обслуживания");
        }
    }
}
