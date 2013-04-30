﻿//
// THIS WORK IS LICENSED UNDER A CREATIVE COMMONS ATTRIBUTION-NONCOMMERCIAL-
// SHAREALIKE 3.0 UNPORTED LICENSE:
// http://creativecommons.org/licenses/by-nc-sa/3.0/
//
using System;
using System.Collections.Generic;
using System.IO;
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
using Rock.Model;

namespace Rock.Apps.CheckScannerUtility
{
    /// <summary>
    /// Interaction logic for BatchItemDetailPage.xaml
    /// </summary>
    public partial class BatchItemDetailPage : System.Windows.Controls.Page
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="BatchItemDetailPage"/> class.
        /// </summary>
        public BatchItemDetailPage()
        {
            InitializeComponent();
        }

        /// <summary>
        /// Gets or sets the financial transaction.
        /// </summary>
        /// <value>
        /// The financial transaction.
        /// </value>
        public FinancialTransaction FinancialTransaction { get; set; }

        /// <summary>
        /// Gets or sets the transaction image type value front.
        /// </summary>
        /// <value>
        /// The transaction image type value front.
        /// </value>
        public DefinedValue TransactionImageTypeValueFront { get; set; }

        /// <summary>
        /// Gets or sets the transaction image type value back.
        /// </summary>
        /// <value>
        /// The transaction image type value back.
        /// </value>
        public DefinedValue TransactionImageTypeValueBack { get; set; }

        /// <summary>
        /// Handles the Click event of the btnClose control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="RoutedEventArgs"/> instance containing the event data.</param>
        private void btnClose_Click( object sender, RoutedEventArgs e )
        {
            this.NavigationService.GoBack();
        }

        /// <summary>
        /// Handles the Loaded event of the Page control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="RoutedEventArgs"/> instance containing the event data.</param>
        private void Page_Loaded( object sender, RoutedEventArgs e )
        {
            FinancialTransactionImage frontTranImage = FinancialTransaction.Images.FirstOrDefault( a => a.TransactionImageTypeValueId.Equals(TransactionImageTypeValueFront.Id));
            FinancialTransactionImage backTranImage = FinancialTransaction.Images.FirstOrDefault( a => a.TransactionImageTypeValueId.Equals(TransactionImageTypeValueBack.Id));

            if ( frontTranImage != null )
            {
                BitmapImage bitmapImage = new BitmapImage();
                bitmapImage.BeginInit();
                bitmapImage.StreamSource = new MemoryStream( frontTranImage.BinaryFile.Data );
                bitmapImage.EndInit();
                imgFront.Source = bitmapImage;
            }

            if ( backTranImage != null )
            {
                BitmapImage bitmapImage = new BitmapImage();
                bitmapImage.BeginInit();
                bitmapImage.StreamSource = new MemoryStream( backTranImage.BinaryFile.Data );
                bitmapImage.EndInit();
                imgBack.Source = bitmapImage;
            }
        }
    }
}