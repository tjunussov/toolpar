<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ui="ui" xmlns:e="entity" xmlns:xhtml="xhtml" xmlns:page="page" xmlns:exslt="http://exslt.org/common" exclude-result-prefixes="exslt page e ui html xhtml">

	<!-- <Includes> -->
	
    <xsl:import href="template_index.xsl"/>
        
	<!-- <Root> -->    

    <xsl:template name="body"><link href="_css/app.scss" rel="stylesheet" type="text/css" /><link href="_css/layout.css" rel="stylesheet" type="text/css" /><link href="_css/form.css" rel="stylesheet" type="text/css" /><link theme="default" href="_css/color/default/form.css" rel="stylesheet" type="text/css" /><link theme="kazpost" href="_css/color/kazpost/form.css" rel="stylesheet" type="text/css" disabled="disabled" /><link theme="light" href="_css/color/light/form.css" rel="stylesheet" type="text/css" disabled="disabled" /><link theme="colvir" href="_css/color/colvir/form.css" rel="stylesheet" type="text/css" disabled="disabled" /><link href="static/_css/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" /><link rel="prefetch" name="branch_tpl" href="_templates/template.xsl" type="text/xml"/>
    
    
    	
        
        
        
        
        
        
        
        
        
        
    
    
    
        
        
        
        
        
        
        
        
        
        
        
        
        
    
        <script src="_js/xpolyfill.js"></script>
        <script src="_js/app.js"></script>
        <script src="_js/jquery.maskedinput.min.js" type="text/javascript"></script>
	    <script src="_js/xnavigateformz.js" type="text/javascript"></script>
    
        <div class="content">
            <div class="menu-sidebar sidebar">
                <xsl:call-template name="ui:menu"/>
            </div>
            <div class="body-wrapper">
                <div class="body">
                	<div class="page-content">

                        <div class="page-breadcrumb">
                            <a>Прием</a>
                            <a>Чек 123456789KZ</a>
                        </div>
                        
	                    <xsl:apply-templates select="ui:body"/>
                        
                    </div>
                </div>
            </div>
            <xsl:apply-templates select="ui:right"/>
        </div>
    </xsl:template>
    
    <xsl:template match="ui:right" name="ui:right">
	    <input class="hidden xtoggler" type="checkbox" checked="checked" accesskey="k" id="right-toggler" />
    	<div class="right-sidebar xtoggler-target">
        	<xsl:apply-templates/>
        </div>
    </xsl:template>
    
    
    
    <xsl:template name="head">
    		<input class="hidden xtoggler" type="checkbox" id="alert-toggler"  accesskey="a" />
            <div class="head-alert xtoggler-target">
                <b class="blink">Внимание!</b>&#160; CPILS будет отключен с 01 Июля 2016 года, по всем вопросам обращаться в ServiceDesk по телефонам 7777, или Email: 7777@kazpost.kz или Telegram: #KazpostServiceDesk
            </div>
            <input class="hidden" type="checkbox" id="toggler" />
		
		<div class="head">

			<div class="sidebar">
				<label for="toggler" class="toggler" title="Alt+m" accessKey="m"></label>
                <a href="index.xhtml">
                    <logo-horse></logo-horse>
                    <logo></logo>
                </a>
			</div>

			<button class="create" title="Alt+c" accessKey="c" onclick="location.href='service.xhtml'">Создать</button>

			<div class="global-search dropdown-menu" style="width: 35%;">
				<input class="global-search var2" type="text" placeholder="Поиск посылки, клиента, адреса, документов ... " title="Alt+s" autofocus="autofocus" accessKey="s" />
                <div class="dropdown-menu-content">
				<ul id="global-search-result" style="display:none;">
	                <li>
	                	<a href="#">
		                	<i class="icon-envelope"></i> ШПИ <b>GD222231995KZ</b><br/>
		                 	Возврат с хранения - Астана 11.06.2016 17:43 <loader></loader>
		                 </a>
	                 </li>
	                 <li>
	                	<a href="#">
		                	<i class="icon-envelope"></i> ШПИ <b>GD222231995KZ</b><br/>
		                 	Возврат с хранения - Астана 11.06.2016 17:43
		                 </a>
	                 </li>
	                 <li>
	                	<a href="#">
		                	<i class="icon-envelope"></i> ШПИ <b>GD222231995KZ</b><br/>
		                 	Возврат с хранения - Астана 11.06.2016 17:43
		                 </a>
	                 </li>
	                <li><a href="#">Расширенный поиск...</a></li>
	            </ul>
                </div>
	        </div>

			<right>
				


				<a badge="2" href="503.xhtml" title="Alt+i" accessKey="i">Inbox</a>

				<div class="cloudq">
					<div class="cloudq-content">
						<h3>367</h3>
						<span>10</span>
						<span>00:05</span>
						<button><i class="icon-arrow-right"></i></button>
					</div>
				</div>

				<a href="500.xhtml" title="Alt+o" accessKey="o">Outbox</a>
				<a href="monitor/index.xhtml" title="Alt+v" accessKey="v">Монитор</a>

				
				<a badge="5"><i class="icon-bell"></i></a>
				<a><i class="icon-envelope-open"></i></a>



				<user-profile class="dropdown-menu">
					<a>
	                    <img class="img-circle" src="static/_img/avatar-small.jpg"/>
	                    <span class="username">Астана Аселька</span>
	                    <i class="arrow-down"></i>
	                </a>
					<ul class="dropdown-menu-content">
                        <li><a>КГПО г.Астана</a></li>
                        <li><a>Прием почты</a></li>
                        <li><a>Смена языка</a></li>
                        <li><a>Смена пароля</a></li>
                        <li><a onClick="themes();" accesskey="n">Тема</a></li>
                        <li><a href="#/account"><i class="icon-user"></i>Мой профиль</a></li>
                    </ul>
				</user-profile>
				<a href="login.xhtml" title="Alt+]" accessKey="]">
	                <i class="icon-logout"></i>
	            </a>
			</right>
		</div>
    </xsl:template>
    
    
    <xsl:template name="footer">
        <div class="footer">
            <div class="sidebar">
                © 2016 Toolpar, АО Казпочта 
            </div>
            <div class="footer-content">
                <a href="feedback.xhtml">Обратная связь</a>   |     <a href="#">Сервис Деск 7777</a>    |  <a href="#">API Сервис</a>   |   <a href="#">Документация</a>
                <right>
                    ОПС, 010017 , г. Астана <dl></dl> version 1.0-SNAPSHOT-<a href="#">9205ae4</a> 2016-04-29
                </right>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>