<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
       xmlns:msxsl="urn:schemas-microsoft-com:xslt"
       xmlns:cs="urn:cs"
       xmlns:js="urn:custom-javascript"
       exclude-result-prefixes="msxsl js"
 >
	<xsl:output method="html" indent="yes"/>
	<msxsl:script language="c#" implements-prefix="cs">
		<![CDATA[

public static string TruncateText( string text, int maxLength )
{
	return TruncateText( text, maxLength, "" );
}

public static string TruncateText( string text, int maxLength, string append )
{
	if ( text.Length > maxLength )
	{
		text = string.Format("{0}{1}", text.Substring( 0, maxLength - 1), append );
	}
	return text;
}

// as described on StackOverflow http://stackoverflow.com/questions/1714764/c-sharp-truncate-html-safely-for-article-summary
public static string TruncateHTML( string text, int maxLength, string append )
{
	// very greedy and crude...
	text = Regex.Replace(text, @"<[^>]*>", String.Empty);
	text = text.Replace("&nbsp;", " ");
	
	// remove everything after (and including) a "##" in the summary
	text = Regex.Replace(text, @"##.*", String.Empty);
	
	return TruncateText( text, maxLength, append );
}

public static string TruncateTitle( string text, int length )
{
    string title = "";
    string[] titleArray = text.Split(new char[] { ' ' });
    
    foreach (string s in titleArray)
    {
        if ((title.Length + titleArray.Length + 1) <= length)
        {
            title += " " + s;
        }
        else
        {
            break;
        }
    }
    
    return title;
}
]]>
	</msxsl:script>

	<msxsl:script language="JavaScript" implements-prefix="js">
		<![CDATA[
        function getTruncatedTitle(theTitle, length)
        {
	        var title = '';
	        var titleArray = theTitle.split(' ');

	        for (var i = 0; i < titleArray.length; i++)
	        {
		        // Add extra char for space
		        if ((title.length + titleArray[i].length + 1) <= length)
		        {
			        title += ' ' + titleArray[i];
		        }
		        else
		        {
			        break;
		        }
	        }

	        return title;
        }
    ]]>
	</msxsl:script>

	<xsl:template match="/">

		<xsl:if test="/*/container[count(item) > 0]">
		<script type="text/javascript" implements-prefix="js">
			<xsl:comment>
				<![CDATA[
$(document).ready(function()
{
	$("#showcase").awShowcase(
	{
		content_width:			490,
		content_height:			263,
		fit_to_parent:			false,
		auto:					true,
		interval:				5500,
		continuous:				true,
		loading:				true,
		tooltip_width:			80,
		tooltip_icon_width:		32,
		tooltip_icon_height:	32,
		tooltip_offsetx:		18,
		tooltip_offsety:		0,
		arrows:					false,
		buttons:				false,
		btn_numbers:			false,
		keybord_keys:			true,
		mousetrace:				false, /* Trace x and y coordinates for the mouse */
		pauseonover:			true,
		stoponclick:			true,
		transition:				'fade', /* hslide/vslide/fade */
		transition_delay:		300,
		transition_speed:		900,
		show_caption:			'onload', /* onload/onhover/show */
		thumbnails:				true,
		thumbnails_position:	'outside-last', /* outside-last/outside-first/inside-last/inside-first */
		thumbnails_direction:	'vertical', /* vertical/horizontal */
		thumbnails_slidex:		0, /* 0 = auto / 1 = slide one thumbnail / 2 = slide two thumbnails / etc. */
		dynamic_height:			false, /* For dynamic height to work in webkit you need to set the width and height of images in the source. Usually works to only set the dimension of the first slide in the showcase. */
		speed_change:			true, /* Set to true to prevent users from swithing more then one slide at once. */
		viewline:				false /* If set to true content_width, thumbnails, transition and dynamic_height will be disabled. As for dynamic height you need to set the width and height of images in the source. */
	});
});
			]]>
			</xsl:comment>
		</script>
			
			<div id="showcase" class="showcase  showcase-load">
				<xsl:for-each select="*/static">
					<div class="showcase-slide">
						<div class="showcase-content">
							<xsl:value-of disable-output-escaping="yes" select="@embedded" />
						</div>
						<div class="showcase-thumbnail">
							<img width="60px" src="Templates/Cccev/007/images/play-video.png"></img>
							<div class="showcase-thumbnail-caption"></div>
							<div class="showcase-thumbnail-cover"></div>
						</div>
						<div class="showcase-caption" style="width:0px; height:0px; bottom:0px; left:-30px; right:0px;"></div>
					</div>
				</xsl:for-each>
				<!-- Each child div in #showcase with the class .showcase-slide represents a slide. -->
				<xsl:for-each select="/*/container[count(item) > 0]">
					<xsl:for-each select="item">
						<div class="showcase-slide">
							<div class="showcase-content">
								<a>
									<xsl:attribute name="href">
										<xsl:value-of select="@detailsUrl"/>
									</xsl:attribute>
									<img>
										<xsl:attribute name="src">
											<xsl:value-of select="@imageUrl"/>
										</xsl:attribute>
										<xsl:attribute name="alt">
											<xsl:value-of select="@title"/>
										</xsl:attribute>
									</img>
								</a>
							</div>
							<div class="showcase-thumbnail">
								<img width="60px">
									<xsl:attribute name="src">
										<xsl:value-of select="@imageUrl"/>
									</xsl:attribute>
									<xsl:attribute name="alt">
										<xsl:value-of select="@title"/>
									</xsl:attribute>
								</img>
								<div class="showcase-thumbnail-caption">
								</div>
								<div class="showcase-thumbnail-cover"></div>
							</div>
							<div class="showcase-caption">
								<a>
									<xsl:attribute name="href">
										<xsl:value-of select="@detailsUrl"/>
									</xsl:attribute>
									<h3>
										<xsl:value-of disable-output-escaping="yes" select="@title"/>
									</h3>
									<xsl:value-of disable-output-escaping="yes" select="cs:TruncateHTML(@summary, 75, '...')" />
									<xsl:comment>
										<xsl:value-of disable-output-escaping="yes" select="@summary"/>
									</xsl:comment>
								</a>
							</div>
						</div>
					</xsl:for-each>
				</xsl:for-each>
			</div>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
