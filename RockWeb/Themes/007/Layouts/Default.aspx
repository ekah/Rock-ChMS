<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Themes/007/Layouts/Site.master" Inherits="Rock.Web.UI.RockPage" %>

<asp:Content ID="ctMain" runat="server" ContentPlaceHolderID="main">
    <div id="wrapper" class="container-fluid">
        <Rock:Zone runat="server" ID="apex" Name="Apex"/>
        <div class="container">
            <header id="top" class="row-fluid">
                <div id="top-left" class="span2">
                    <Rock:Zone runat="server" ID="logo" Name="Logo"/>
                </div>
                <div id="top-right" class="span10">
                    <div class="row-fluid">
                        <div class="span10"><Rock:Zone runat="server" ID="Menu" Name="Menu"/></div>
                        <div class="span2"><Rock:Zone runat="server" ID="Search" Name="Search"/></div>
                    </div>
                </div>
            </header>
            <section id="header-inner" class="row-fluid">
                <div class="span6">
                    <h1><Rock:PageTitle runat="server" ID="PageTitle"/></h1>
                </div>
                <div class="span6">
                    <p><Rock:PageDescription runat="server" ID="PageDescription"/></p>
                </div>
            </section>
            <section id="main-inner" class="row-fluid">
                <div id="content-full" class="span12">
                    <Rock:Zone runat="server" ID="Main"/>
                </div>
            </section>
        </div>
        <div class="container">
            <footer class="row-fluid">
                <div class="span12">
                    <Rock:Zone runat="server" ID="footer"/>
                </div>
                <div class="span12">
                    <Rock:Zone runat="server" ID="bottom"/>
                </div>
            </footer>
        </div>
    </div>
    <%--<script type="text/javascript">
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
</asp:Content>