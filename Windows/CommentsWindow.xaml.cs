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
    /// Interaction logic for CommentsWindow.xaml
    /// </summary>
    public partial class CommentsWindow : Window
    {
        private TechnoservisEntities _cont = TechnoservisEntities.GetContext();

        private RepairingRequest _request;

        public CommentsWindow(RepairingRequest request)
        {
            InitializeComponent();
            _request = request;
            lbComments.ItemsSource = _cont.Comment.Where(c => c.RequestId == _request.Id).ToList();
        }

        private void btnAddComment_Click(object sender, RoutedEventArgs e)
        {
            if(string.IsNullOrEmpty(tbxComment.Text))
            {
                MessageBox.Show("Введите комментарий");
                return;
            }

            var comment = new Comment()
            {
                Message = tbxComment.Text,
                MasterId = MainWindow.currentUser.Id,
                RequestId = _request.Id
            };
            _cont.Comment.Add(comment);
            _cont.SaveChanges();
            tbxComment.Clear();

            lbComments.ItemsSource = _cont.Comment.Where(c => c.RequestId == _request.Id).ToList();
        }
    }
}
