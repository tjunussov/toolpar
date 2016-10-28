<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ui="ui" xmlns:e="entity" xmlns:xhtml="xhtml" xmlns:page="page" xmlns="html" xmlns:exslt="http://exslt.org/common" exclude-result-prefixes="exslt page e ui html xhtml">

	<!-- <Includes> -->
	
    <!--xsl:import href="template_grids.xsl"/-->
    
    <xsl:output method="html" omit-xml-declaration="yes" indent="no"/>
    
    <xsl:strip-space elements="*" />
        
    <!-- <Data> -->
    
    <page:page name="about" title="Dashboard : Ситуационный центр"></page:page>
    
    <xsl:variable name="title" select="/ui:page/title"/>
        
	<!-- <Root> -->

	<xsl:template match="/ui:page">
		<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
		<html style="background-color:#3e4045;">
		<head>
		    <meta charset="utf-8"/>
		    <title><xsl:value-of select="$title"/> - АО Казпочта</title>
		    <meta name="viewport" content="width=1920,height=1200"/>
		    
		    <link type="image/x-icon" rel="shortcut icon" href="favicon.png" /> 
    		<link type="image/x-icon" rel="icon" href="favicon.png" /> 
		    
		    <link rel="stylesheet" type="text/css" href="_css/style.css" />
		    <link rel="stylesheet" type="text/css" href="_css/roboto.css" />
		                
            <xsl:apply-templates select="link"/>
            <xsl:apply-templates select="style"/>
            
            <script type="text/javascript" src="_js/jquery-1.11.1.js"></script>
		    
            <xsl:apply-templates select="script"/>
		    
        </head>
        <body style="background-color:#3e4045;">
	        
            <div id="errormsg"></div>
            <xsl:call-template name="body"/>
        </body>
    </html>
    </xsl:template>
    

<xsl:template name="body">
	<div class="body">
	    <xsl:call-template name="content"/>
	</div>
</xsl:template>

<xsl:template name="content">
	<div id="wrap" class="content">
        <xsl:apply-templates select="ui:body"/>
    </div>
</xsl:template>

<xsl:template match="ui:body">
   <xsl:apply-templates/>
</xsl:template>

<!--xsl:template match="node() | @*">
    <xsl:copy>
        <xsl:apply-templates select="node() | @*"/>
    </xsl:copy>
</xsl:template-->

<!-- template to copy elements -->
<xsl:template match="*">
    <xsl:element name="{local-name()}">
        <xsl:apply-templates select="@* | node()"/>
    </xsl:element>
</xsl:template>

<xsl:template match="br">
<xsl:if test="not(preceding-sibling::node()
                        [not(self::text() and normalize-space(.) = '')][1]
                        [self::br])">
      <xsl:copy>
          <xsl:apply-templates select="@*|node()" />
      </xsl:copy>
   </xsl:if>
</xsl:template>

<!-- template to copy attributes -->
<xsl:template match="@*">
    <xsl:attribute name="{local-name()}">
        <xsl:value-of select="." disable-output-escaping="yes"/>
    </xsl:attribute>
</xsl:template>

<xsl:template match="@*" mode="html">
    <xsl:attribute name="{local-name()}">
        <xsl:value-of select="." disable-output-escaping="yes"/>
    </xsl:attribute>
</xsl:template>

<!-- template to copy the rest of the nodes -->
<xsl:template match="comment() | text()">
    <xsl:value-of select="." disable-output-escaping="yes"/>
</xsl:template>


<xsl:template match="style">
   <xsl:element name="style">
      	<xsl:value-of select="." disable-output-escaping="yes"/>
   </xsl:element>
</xsl:template>

</xsl:stylesheet>