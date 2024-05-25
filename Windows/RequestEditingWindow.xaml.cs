using System;
using System.Collections.Generic;
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
using System.Windows.Shapes;
using TechnoservisApp.Entities;

namespace TechnoservisApp.Windows
{
    /// <summary>
    /// Interaction logic for RequestEditingWindow.xaml
    /// </summary>
    public partial class RequestEditingWindow : Window
    {
        private RepairingRequest _request;

        private TechnoservisEntities _cont = TechnoservisEntities.GetContext();

        public RequestEditingWindow(RepairingRequest request)
        {
            InitializeComponent();
            DataContext = _request = request;
            FillCbx();
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            if (_request.Id == 0)
                _cont.RepairingRequest.Add(_request);

            try
            {
                _cont.SaveChanges();
                MessageBox.Show("Изменения сохранены");
                Close();
            }
            catch 
            {
                if (_request.Id == 0)
                    _cont.RepairingRequest.Remove(_request);
                MessageBox.Show("Не все поля заполнены");
                return;
            }
        }

        private void FillCbx()
        {
            cbxDefectType.ItemsSource = _cont.DefectType.ToList();
            cbxEquipmentType.ItemsSource = _cont.EquipmentType.ToList();
            cbxRequester.ItemsSource = cbxPerformer.ItemsSource = _cont.User.ToList();
            cbxPriority.ItemsSource = _cont.Priority.ToList();
        }
    }
}
