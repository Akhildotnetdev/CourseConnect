using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RecoverPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void PasswordRecovery1_SendingMail(object sender, MailMessageEventArgs e)
    {
        //cancel the email
        e.Cancel = true;
        //show the message that would have been sent in the amil on the screen
        //Use the sucessstext property of the passwordrecovery to show the message
        PasswordRecovery1.SuccessText = e.Message.Body;
    }
}