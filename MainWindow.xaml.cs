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
using TechnoservisApp.Pages;

namespace TechnoservisApp
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public static User currentUser;

        public MainWindow()
        {
            InitializeComponent();
            mainFrame.Content = new AuthPage();
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            currentUser = null;
            mainFrame.Content = new AuthPage();
        }

        private void mainFrame_Navigated(object sender, NavigationEventArgs e)
        {
            spUserInfo.DataContext = currentUser;
            spUserInfo.Visibility = currentUser == null ? Visibility.Collapsed : Visibility.Visible;
        }
    }
}
