<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ui="ui" xmlns:e="entity" xmlns:xhtml="xhtml" xmlns:page="page" xmlns:exslt="http://exslt.org/common" exclude-result-prefixes="exslt page e ui html xhtml">

	<!-- <Includes> -->
	
    <xsl:include href="template_menu.xsl"/>
    
    <xsl:output method="html" doctype-system="about:legacy-compat" omit-xml-declaration="yes" indent="yes"/>
    
    
    <xsl:strip-space elements="*" />
        
    <!-- <Data> -->
    
    <page:page name="about" title="Toolpar : Информационаня система"></page:page>
    
    <xsl:variable name="title" select="/ui:page/title"/>
        
	<!-- <Root> -->

	<xsl:template match="/ui:page">
		<!--xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text-->
		<html style="background-color:#363f4c">
        	<xsl:copy-of select="@*" />
		<head>
		    <meta charset="utf-8"/>
		    <title>Toolpar™ - <xsl:value-of select="$title"/> - АО Казпочта</title>
		    
		    
            <script src="http://localhost:35729/livereload.js?snipver=1"></script>

            <link type="image/x-icon" rel="shortcut icon" href="static/_img/favicon.png?v1" /> 
            <link type="image/x-icon" rel="icon" href="static/_img/favicon.png?v1" />
            
            <xsl:apply-templates select="link[@type='image/x-icon']"/>
		                

            <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,300,400,400italic,600,600italic,700,700italic&amp;subset=latin,cyrillic"/>
            
            <link rel="stylesheet" type="text/css" href="_css/style.css" />
            <link rel="stylesheet" type="text/css" href="static/_css/roboto.css" />

            <xsl:apply-templates select="link[not(@type='image/x-icon')]"/>
            <xsl:apply-templates select="style"/>
            
            <script type="text/javascript" src="static/_js/jquery-1.11.1.min.js"></script>
            <!--script type="text/javascript" src="_js/angular.min.js"></script-->
		    
            <xsl:apply-templates select="script"/>
		    
        </head>
        <body class="collapsed {ui:body/@class}">
        	<xsl:copy-of select="ui:body/@*" />
            <xsl:call-template name="head"/>
            <xsl:call-template name="body"/>
            <xsl:call-template name="footer"/>
        </body>
    </html>
    </xsl:template>
    

<xsl:template name="head"><xsl:apply-templates select="ui:head"/></xsl:template>
<xsl:template name="body"><xsl:apply-templates select="ui:body"/></xsl:template>
<xsl:template name="footer"><xsl:apply-templates select="ui:footer"/></xsl:template>

<!--xsl:template match="ui:body">
   <xsl:apply-templates/>
</xsl:template-->

<!--xsl:template match="node() | @*">
    <xsl:copy>
        <xsl:apply-templates select="node() | @*"/>
    </xsl:copy>
</xsl:template-->

<!-- template to copy elements -->

<xsl:template match="ui:progressbar">
    <progressbar><d></d><d></d><d></d></progressbar>
</xsl:template>

<!-- EXCLUDE ui tags -->
<xsl:template match="ui:*">
    <xsl:apply-templates />
</xsl:template>

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
<!--xsl:template match="comment() | text()">
    <xsl:value-of select="." disable-output-escaping="yes"/>
</xsl:template-->


<xsl:template match="style">
   <xsl:element name="style">
      	<xsl:value-of select="." disable-output-escaping="yes"/>
   </xsl:element>
</xsl:template>

</xsl:stylesheet>