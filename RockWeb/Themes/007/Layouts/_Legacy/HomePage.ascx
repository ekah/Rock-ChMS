<%@ Control Language="C#" ClassName="Arena.Templates.Cccev.Double07.HomePage" Inherits="Arena.Portal.PortalControl" %>
<% 
/**********************************************************************
* Description:  007 Home Page Template based on the Elegance Theme
* Created By:	Jason Ake @ Central Christian Church of the East Valley
* Date Created:	10/19/2011 12:59:59 PM
*
* $Workfile: HomePage.ascx $
* $Revision: 7 $ 
* $Header: /trunk/Arena/Templates/Cccev/007/HomePage.ascx   7   2012-11-14 09:56:14-07:00   JasonO $
**********************************************************************/
%>
<asp:ScriptManagerProxy ID="smpScripts" runat="server" />

<script runat="server">
    public PlaceHolder Apex { get { return phApex; } }
	public PlaceHolder Logo { get { return phLogo; } }
	public PlaceHolder Login { get { return phLogin; } }
	public PlaceHolder MainNav { get { return phMainNav; } }
	public PlaceHolder Slider { get { return phSlider; } }
	public PlaceHolder Col1 { get { return phCol1; } }
	public PlaceHolder Col2 { get { return phCol2; } }
	public PlaceHolder Col3 { get { return phCol3; } }
	public PlaceHolder MainBottom { get { return phMainBottom; } }
	public PlaceHolder Footer { get { return phFooter; } }
	public PlaceHolder Social { get { return phSocial; } }

    private void Page_Load(object sender, EventArgs e)
    {
        BasePage.AddCssLink(Page, "~/Templates/CCCEV/007/css/style.css");
        BasePage.AddCssLink(Page, "~/Templates/CCCEV/007/css/slider.css");
		//BasePage.AddJavascriptInclude( Page, "http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" );
		BasePage.AddJavascriptInclude( Page, BasePage.JQUERY_INCLUDE );
        Page.Header.Controls.AddAt(0, new LiteralControl("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"/>"));
    }
</script>

<div id="wrapper">
    <div id="apex"><asp:PlaceHolder ID="phApex" runat="server" /></div>
	<div id="container-top">
		<div class="container">
			<div id="top">
				<div id="top-left">
					<div id="logo"> <asp:PlaceHolder ID="phLogo" runat="server" /> </div><!-- end #logo -->
				</div><!-- end #top-left -->
				<div id="top-right">
					<div id="top-search"> <asp:PlaceHolder ID="phLogin" runat="server" /> </div><!-- end #top-search -->
					<div id="top-navigation"> <asp:PlaceHolder ID="phMainNav" runat="server" />  </div><!-- end #top-navigation -->
				</div><!-- end #top-right -->
			</div><!-- end #top -->
			<div id="header">
				<div id="header-slide">
					<div id="slider"> <asp:PlaceHolder ID="phSlider" runat="server" />  </div>
				</div><!-- end #header-slide -->
			</div><!-- end #header -->
			<div id="main">
			 	<div id="contentfull">
				<div class="col1">  <asp:PlaceHolder ID="phCol1" runat="server" />  </div>
				<div class="col2">  <asp:PlaceHolder ID="phCol2" runat="server" />  </div>
                <div class="col3">  <asp:PlaceHolder ID="phCol3" runat="server" />  </div>
				</div><!-- end #content -->
                
				<div class="clear"></div><!-- clear float -->
                
                <div id="contentfull">  <asp:PlaceHolder ID="phMainBottom" runat="server" />  </div>
           		<div class="clear"></div><!-- clear float -->     
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

</script>