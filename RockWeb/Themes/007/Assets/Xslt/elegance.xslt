<?xml version="1.0" encoding="utf-8" ?>
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
]]>
</msxsl:script>
	
<xsl:template match="/">
	<script type="text/javascript" src="templates/cccev/007/js/s3slider.js"></script>
	<script type="text/javascript">
		<xsl:comment>
			<![CDATA[
	    jQuery(document).ready(function($) {
	        $("#slider").s3Slider({
	            timeOut: 6000,
	            captionOpacity: 0.7            
	        });			
	    });
			]]>
		</xsl:comment>
	</script>
  <xsl:if test="/*/container[count(item) > 0]">
    <ul id="sliderContent">
        <xsl:for-each select="/*/container[count(item) > 0]">
          <xsl:for-each select="item">
            <li class="sliderImage">
				<a>
				<xsl:attribute name="href">
					<xsl:value-of select="@detailsUrl"/>
				</xsl:attribute>
					<img width="920px" height="380px">
						<xsl:attribute name="src">
						<xsl:value-of select="@imageUrl"/>
						</xsl:attribute>
						<xsl:attribute name="alt">
						<xsl:value-of select="@title"/>
						</xsl:attribute>
					</img>
					<div class="bottom">
						<span class="title_slider"><xsl:value-of select="@title"/></span><br />
						<span class="desc_slider"><xsl:value-of disable-output-escaping="yes" select="cs:TruncateText(@summary, 130, '...')" />&#160; <em>read more</em>									 
						</span>
					</div>
				</a>
            </li>
          </xsl:for-each>
          <li class="clear sliderImage"></li>
        </xsl:for-each>
      </ul>
  </xsl:if>
</xsl:template>

</xsl:stylesheet>

  