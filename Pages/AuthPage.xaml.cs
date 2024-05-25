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
using System.Windows.Navigation;
using System.Windows.Shapes;
using TechnoservisApp.Entities;

namespace TechnoservisApp.Pages
{
    /// <summary>
    /// Interaction logic for AuthPage.xaml
    /// </summary>
    public partial class AuthPage : Page
    {
        private TechnoservisEntities _cont = TechnoservisEntities.GetContext();

        public AuthPage()
        {
            InitializeComponent();
        }

        private void btnEnter_Click(object sender, RoutedEventArgs e)
        {
            var login = tbxLogin.Text;
            var pass = pbxPassword.Password;

            var user = _cont.User.FirstOrDefault(u => u.Login == login && u.Password == pass);
            if (user != null)
            {
                MainWindow.currentUser = user;
                NavigationService.Navigate(new RequestsPage());
            }
            else
            {
                MessageBox.Show("Неверные данные");
            }
        }
    }
}
