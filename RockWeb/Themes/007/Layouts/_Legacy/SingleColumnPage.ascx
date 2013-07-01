<%--<%@ Control Language="C#" ClassName="Arena.Templates.Cccev.Double07.HomePage" Inherits="Arena.Portal.PortalControl" %>
<% 
/**********************************************************************
* Description:  007 Single Column Page Template based on the Elegance Theme
* Created By:	Jason Ake @ Central Christian Church of the East Valley
* Date Created:	10/19/2011 12:59:59 PM
*
* $Workfile: SingleColumnPage.ascx $
* $Revision: 8 $ 
* $Header: /trunk/Arena/Templates/Cccev/007/SingleColumnPage.ascx   8   2012-11-14 09:56:14-07:00   JasonO $
**********************************************************************/
%>
<%@ Import Namespace="Arena.Portal" %>
<%@ Import Namespace="System.Linq" %>
<asp:ScriptManagerProxy ID="smpScripts" runat="server" />

<script runat="server">
    public PlaceHolder Apex { get { return phApex; } }
    public PlaceHolder Logo { get { return phLogo; } }
    public PlaceHolder Login { get { return phLogin; } }
    public PlaceHolder MainNav { get { return phMainNav; } }
    public PlaceHolder Main { get { return phMain; } }
    public PlaceHolder Footer { get { return phFooter; } }
    public PlaceHolder Social { get { return phSocial; } }

    private void Page_PreRender( object sender, EventArgs e )
    {
        if ( string.IsNullOrEmpty( CurrentPortalPage.Description ) )
        {
            return;
        }

        var meta = Page.Header.Controls.OfType<Control>()
            .FirstOrDefault( c => c is HtmlMeta && ( (HtmlMeta)c ).Name.ToLower() == "description" ) as HtmlMeta;

        if ( meta == null )
        {
            BasePage.AddMetaTag( Page, "description", CurrentPortalPage.Description );
        }
        else
        {
            meta.Content = CurrentPortalPage.Description;
        }
    }

    private void Page_Load(object sender, EventArgs e)
    {
        BasePage.AddCssLink(Page, "~/Templates/CCCEV/007/css/style.css");
        BasePage.AddCssLink(Page, "~/Templates/CCCEV/007/css/inner.css");
		//BasePage.AddJavascriptInclude( Page, "http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" );
		BasePage.AddJavascriptInclude( Page, BasePage.JQUERY_INCLUDE );
        Page.Header.Controls.AddAt(0, new LiteralControl("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"/>"));
    }
</script>

<div id="wrapper">
    <div id="apex"><asp:PlaceHolder ID="phApex" runat="server" /></div>
	<div id="container-top-inner">
		<div class="container">
			<div id="top">
				<div id="top-left">
					<div id="logo"> <asp:PlaceHolder ID="phLogo" runat="server" /> </div><!-- end #logo -->
				</div><!-- end #top-left -->

					<div id="top-search"> <asp:PlaceHolder ID="phLogin" runat="server" /> </div><!-- end #top-search -->
					<div id="top-navigation"> <asp:PlaceHolder ID="phMainNav" runat="server" />  </div><!-- end #top-navigation -->

			</div><!-- end #top -->
			<div id="header-inner">
				<div id="header-inner-left">
					<h1 class="pagetitle"> <%=CurrentPortalPage.Title%> </h1>
				</div>
				<div id="header-inner-right"><p><%=CurrentPortalPage.Description%></p> </div>
			</div><!-- end #header-inner -->
			<div id="main-inner">
			 	<div id="contentfull"><asp:PlaceHolder ID="phMain" runat="server" /></div><!-- end #contentfull -->
			</div>
			<!-- end #main -->
		</div><!-- end container -->
	</div><!-- end #container-top -->
	<div id="container-bottom">
		<div class="container">
			<div id="footer"> <asp:PlaceHolder ID="phFooter" runat="server" />  </div><!-- end #footer -->
            <div id="social"> <asp:PlaceHolder ID="phSocial" runat="server" />  </div><!-- end #social -->
		</div><!-- end container -->
	</div><!-- end #container-top -->
</div><!-- end #wrapper -->
    <script type="text/javascript">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-2410682-5']);
        _gaq.push(['_setDomainName', '.centralaz.com']);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();

</script>--%>