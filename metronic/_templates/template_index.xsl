<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ui="ui" xmlns:e="entity" xmlns:xhtml="xhtml" xmlns:page="page" xmlns:exslt="http://exslt.org/common" exclude-result-prefixes="exslt page e ui html xhtml">

	<!-- <Includes> -->
	
    <xsl:import href="template.xsl"/>
        
	<!-- <Root> -->    

    <xsl:template name="body">
        <div class="content">
            <div class="menu-sidebar sidebar">
                <xsl:apply-templates select="ui:menu"/>
            </div>
            <div class="body-wrapper">
                <div class="body">
                    <xsl:apply-templates select="ui:body"/>
                </div>
            </div>
        </div>
    </xsl:template>
    
    <xsl:template name="head">
            <div class="head-alert">
                <b class="blink">Внимание!</b>&#160; CPILS будет отключен с 01 Июля 2016 года, по всем вопросам обращаться в ServiceDesk по телефонам 7777, или Email: 7777@kazpost.kz или Telegram: #KazpostServiceDesk
            </div>
            <input class="hidden" type="checkbox" id="toggler" />
        <xsl:apply-templates select="ui:head"/>
    </xsl:template>
    
    <xsl:template name="footer">
        <div class="footer">
            <div class="sidebar">
                © 2016 Toolpar, АО Казпочта 
            </div>
            <div class="footer-content">
                <a href="#">Обратная связь</a>   |     <a href="#">Сервис Деск 7777</a>    |  <a href="#">API Сервис</a>   |   <a href="#">Документация</a>
                <right>
                    ОПС, 010017 , г. Астана <dl></dl> version 1.0-SNAPSHOT-<a href="#">9205ae4</a> 2016-04-29
                </right>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>