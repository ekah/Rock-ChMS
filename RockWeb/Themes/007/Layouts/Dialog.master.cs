using System;
using System.Web.UI;

namespace com.CentralAZ.Themes.DoubleOhSeven.Layouts
{
    public partial class Dialog : Rock.Web.UI.DialogMasterPage
    {
        protected void btnSave_Click( object sender, EventArgs e )
        {
            base.FireSave( sender, e );
        }

        protected void btnCancel_Click( object sender, EventArgs e )
        {
            const string script = @"window.parent.Rock.controls.modal.close();";
            ScriptManager.RegisterStartupScript( this.Page, this.GetType(), "close-modal", script, true );
        }

        protected override void OnInit( EventArgs e )
        {
            base.OnInit( e );
            lTitle.Text = Request.QueryString["t"] ?? "Title";

            btnSave.Text = Request.QueryString["pb"] ?? "Save";
            btnSave.Visible = btnSave.Text.Trim() != string.Empty;

            btnCancel.Text = Request.QueryString["sb"] ?? "Cancel";
            btnCancel.Visible = btnCancel.Text.Trim() != string.Empty;
        }
    }
}

