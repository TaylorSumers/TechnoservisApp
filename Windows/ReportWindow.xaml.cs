using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using TechnoservisApp.Entities;

namespace TechnoservisApp.Windows
{
    /// <summary>
    /// Interaction logic for ReportWindow.xaml
    /// </summary>
    public partial class ReportWindow : Window
    {
        private RepairingRequest _request;

        private Report _report;

        private TechnoservisEntities _cont = TechnoservisEntities.GetContext();

        public ReportWindow(RepairingRequest request)
        {
            InitializeComponent();
            _request = request;
            if(_request.Report != null) // Просмотр заявки
            {
                _report = _request.Report;
                IsEnabled = false;
            }
            else // Редактирование
            {
                _report = new Report()
                {
                    Id = _request.Id,
                    HoursSpent = (int)(DateTime.Now - _request.StartDate.Value).TotalHours,
                    Cost = _request.ReparingComponent == null ? 0 : _request.ReparingComponent.Sum(c => c.Component.Cost * c.Amount)
                };
            }
            DataContext = _report;    
        }

        private void btnFinish_Click(object sender, RoutedEventArgs e)
        {
            _cont.Report.Add(_report);


            try
            {
                _cont.SaveChanges();
                MessageBox.Show("Заявка завершена");
                
                _request.CompleteDate = DateTime.Now;
                _request.StatusId = 3;
                _cont.SaveChanges();
                Close();
            }
            catch
            {
                _cont.Report.Remove(_report);
                MessageBox.Show("Не все поля заполнены");
            }
        }
    }
}
