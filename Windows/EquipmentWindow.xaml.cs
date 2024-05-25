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
    /// Interaction logic for EquipmentWindow.xaml
    /// </summary>
    public partial class EquipmentWindow : Window
    {
        private RepairingRequest _repairingRequest;

        private TechnoservisEntities _cont = TechnoservisEntities.GetContext();

        public EquipmentWindow(RepairingRequest repairingRequest)
        {
            InitializeComponent();
            _repairingRequest = repairingRequest;
            lbComponents.ItemsSource = _repairingRequest.ReparingComponent;
            cbxComponents.ItemsSource = _cont.Component.ToList();
        }

        private void btnAddComponent_Click(object sender, RoutedEventArgs e)
        {
            var amount = tbxAmount.Text;
            var componentId = (int)cbxComponents.SelectedValue;
            if (!amount.All(char.IsDigit))
            {
                MessageBox.Show("Введите количество");
                return;
            }

            var repairingComponent = new ReparingComponent()
            {
                RepairingRequestId = _repairingRequest.Id,
                ComponentId = componentId,
                Amount = int.Parse(amount)
            };

            _cont.ReparingComponent.Add(repairingComponent);
            _cont.SaveChanges();

            MessageBox.Show("Деталь добавлена");
            lbComponents.ItemsSource = null;
            lbComponents.ItemsSource = _repairingRequest.ReparingComponent;
        }
    }
}
