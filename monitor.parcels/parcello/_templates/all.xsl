<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:date="http://exslt.org/dates-and-times" xmlns:exslt="http://exslt.org/common" xmlns:gps="gps" exclude-result-prefixes="exslt gps date">
	
	<!--xsl:output method="xml" omit-xml-declaration="yes"/-->
	<xsl:strip-space elements="*" />
	
	<xsl:param name="block_sizing"/>
    <xsl:param name="total_sizing" select="'default'"/>    
	<xsl:param name="layout"/>
	<xsl:param name="collapse"/>
	<xsl:param name="S_LIMIT_MAXTIME_WAITING"/>
	<xsl:param name="S_LIMIT_MAXTIME_SERVING"/>
	<xsl:param name="S_MAXTIME_TOGGLE"/>
	
	<xsl:variable name="LIMIT_MAXTIME_WAITING" select="number($S_LIMIT_MAXTIME_WAITING) * 60000"/>
	<xsl:variable name="LIMIT_MAXTIME_SERVING" select="number($S_LIMIT_MAXTIME_SERVING) * 60000"/>
	<xsl:variable name="MAXTIME_TOGGLE" select="number($S_MAXTIME_TOGGLE)"/>
	
    
    <xsl:decimal-format NaN="-"/>
    <xsl:decimal-format name="money" decimal-separator="," NaN="-" grouping-separator="."/>
    <xsl:decimal-format name="spaces" grouping-separator=" " />

    
    <xsl:variable name="LIMIT_MAXSERVE" select="600000"/>
    <xsl:variable name="LIMIT_MAXWAIT" select="600000"/>
    <xsl:variable name="LIMIT_WAITCNT" select="600000"/>

    <xsl:param name="GPSXML">
      <gps:branches>
      	<city code="01" name="Астана" x="820" y="280"/>
      	<city code="02" name="Акмолинская" x="820" y="450"/>
      	<city code="03" name="Актобе" x="470" y="350"/>
      	<city code="04" name="Талдыкорган" x="1590" y="660"/>
        <city code="05" name="Алматы" x="1310" y="660"/>
        <city code="06" name="Атырау" x="130" y="550"/>
        <city code="07" name="Усть-Каменогорск" x="1480" y="350"/>
        <city code="08" name="Тараз" x="1030" y="840"/>
        <city code="09" name="Уральск" x="130" y="350"/>
        <city code="10" name="Караганда" x="1150" y="350"/>
        <city code="11" name="Костанай" x="470" y="100"/>
        <city code="12" name="Кызылорда" x="470" y="660"/>
        <city code="13" name="Актау" x="130" y="790"/>
        <city code="14" name="Павлодар" x="1320" y="100"/>
        <city code="15" name="Петропавловск" x="820" y="100"/>
        <city code="16" name="Шымкент" x="750" y="790"/>
      </gps:branches>
    </xsl:param>
    
    <xsl:variable name="GPS" select="exslt:node-set($GPSXML)/gps:branches[1]"/>

    <xsl:key name="settings" match="/root/settings/array" use="code" />
    
    <!--xsl:variable name="team" select="document('/data/cloudq/branches.xml')/gps:branches"/--> 

	<xsl:template match="/root">
	
        <xsl:call-template name="data"/>

        <div class="right-menu" style="right:20px; top:250px;">
        
            <div onclick="toggleSizing();">
                <xsl:attribute name="class">toggler <xsl:if test="$block_sizing='small'">on</xsl:if></xsl:attribute>
                <xsl:attribute name="title"><xsl:if test="$block_sizing='small'">МЕЛКИЙ</xsl:if></xsl:attribute>
                <label>Размер Отделений</label>
            </div>

            <div onclick="toggleTotals();">
                <xsl:attribute name="class">toggler <xsl:if test="$total_sizing='default'">on</xsl:if></xsl:attribute>
                <xsl:attribute name="title"><xsl:if test="$total_sizing='default'">СТАНДАРТ</xsl:if></xsl:attribute>
                <label>Итоги</label>
            </div>
            
            <!--div style="right:20px; top:260px;" onclick="toggleMaxtime();">
                <xsl:attribute name="class">toggler m<xsl:value-of select="$MAXTIME_TOGGLE"/></xsl:attribute>
                <xsl:attribute name="title">
                    Ожидание - <xsl:value-of select="$LIMIT_MAXTIME_WAITING div 60 div 1000"/> Мин, Обслуживание - <xsl:value-of select="$LIMIT_MAXTIME_SERVING div 60 div 1000"/> Мин
                </xsl:attribute>
                <label>Лимиты времени</label>
            </div>
            
            <div style="right:20px; top:245px;" onclick="toggleLayout(this);">
                <xsl:attribute name="class">toggler <xsl:if test="$layout='separate'">on</xsl:if></xsl:attribute>
                <label>Расположение разделов</label>
            </div>
            
            <div style="right:20px; top:230px;" onclick="toggleCollapse(this);">
                <xsl:attribute name="class">toggler <xsl:if test="$collapse!='expanded'">on</xsl:if></xsl:attribute>
                <xsl:attribute name="title"><xsl:if test="$collapse!='expanded'">Раскрыта</xsl:if></xsl:attribute>
                <label>Группировка ожидания</label>
            </div-->

        </div>        
           
		<div class="stats">
		
			<h2>ВСЕГО ПО РК</h2>
			<l>НА <xsl:call-template name="formatDate"><xsl:with-param name="value" select="ts"/></xsl:call-template>
                PER 1 МИН
            </l><br/>
			<hr/>
            <l>ПРИНЯТО</l>
            <v><xsl:value-of select="format-number(sum(data/receivedCount[number(.)=number(.)]),'###.###','money')"/></v><br/>
            <l>ДОСТАВЛЕНО</l>
            <v><xsl:value-of select="format-number(sum(data/deliveredCount[number(.)=number(.)]),'###.###','money')"/></v><br/>
            <l>ПРОСРОЧЕНО</l>
            <v><xsl:value-of select="format-number(sum(data/deliveredExpireCount[number(.)=number(.)]),'###.###','money')"/></v><br/>
            <hr/>
            <l>ПОЛУЧЕНО</l>
            <v><xsl:value-of select="format-number(sum(data/receivedAmount[number(.)=number(.)]),'###.### ₸','money')"/></v><br/>
            <hr/>
            <l>СТОРНО</l>
            <v><xsl:value-of select="format-number(sum(data/stornoCount[number(.)=number(.)]),'###.###','money')"/></v><br/>
            <l>СУММА СТОРНО</l>
            <v><xsl:value-of select="format-number(sum(data/stornoAmount[number(.)=number(.)]),'###.### ₸','money')"/></v><br/>
            <hr/>
            <l>ОТДЕЛЕНИЙ</l>
            <v><xsl:value-of select="count(data)"/><w>-</w></v><br/>
            <l>ОПЕРАТОРОВ</l>
            <v>-<w>-</w></v><br/>
            <hr/>
            <l>В ПУТИ</l>
            <v>-</v><br/>
            <l>НА ХРАНЕНИИ</l>
            <v>-</v><br/>

		</div>

        <xsl:if test="$total_sizing='default'">

            <div class="hero-stats">
            
                <h2>ВСЕГО ПО РК <cursor/> </h2>



                <l>Получено</l>
                <v hero="5m"><xsl:value-of select="format-number(sum(data/receivedCount[number(.)=number(.)]),'###.### ШТ','money')"/></v><br/>
                <l>Продано</l>
                <v hero="1h"><xsl:value-of select="format-number(sum(data/receivedAmount[number(.)=number(.)]),'###.### ₸','money')"/></v><br/>
                <hr/>
                <l>Сторно</l>
                <v><xsl:value-of select="format-number(sum(data/stornoAmount[number(.)=number(.)]),'###.### ₸','money')"/></v>
                <w><xsl:value-of select="format-number(sum(data/stornoCount[number(.)=number(.)]),'0')"/></w>
                <br/>
                <hr/>
                <l>Отделения</l>
                <v hero="24h"><xsl:value-of select="count(data)"/></v><br/>
                <l>Операторы</l>
                <v hero="5m">-</v><br/>
            </div>
        </xsl:if>

	</xsl:template>

	<xsl:template name="data">
		<xsl:variable name="data" select="data" />
		
		<xsl:for-each select="$GPS/city">
			<xsl:variable name="code" select="@code" />
			<xsl:variable name="branch" select="$data[$code and starts-with(code,$code)]" />
			
			<xsl:if test="$branch">
				<city name="{@name}">
					<xsl:attribute name="style">left:<xsl:value-of select="@x"/>px;top:<xsl:value-of select="@y"/>px;</xsl:attribute>
					<h1>Ω <xsl:value-of select="@code"/> - <xsl:value-of select="@name"/> ( <xsl:value-of select="count($branch)"/> ШТ )</h1>
					
					<xsl:for-each select="$branch">
						<xsl:sort select="code"/>
					 	<xsl:call-template name="branch"/>
					</xsl:for-each>
					
				</city>
			</xsl:if>
		</xsl:for-each>
					
	</xsl:template>
	
	<xsl:template name="branch">
        
        <binfo>
    		<div  id="B{branch_id}" branch="{branch_id}" prefix="{code}">
    			<xsl:attribute name="class">
    				branch branch-mini <xsl:value-of select="$block_sizing"/>
    			</xsl:attribute>
    			<xsl:if test="online_operators_now=''"><xsl:attribute name="style">opacity:0.2; outline: 1px solid rgba(255,255,255,0.4);</xsl:attribute></xsl:if>
    			
    			<h2>Ω <xsl:choose>
                    	<xsl:when test="$block_sizing='small'">
                            <xsl:value-of select="substring(code,3,4)"/>
                            <xsl:if test="substring(code,8)"><span><xsl:value-of select="substring(code,8)"/></span></xsl:if>
                        </xsl:when>
                    	<xsl:otherwise><xsl:value-of select="code"/></xsl:otherwise>
                    </xsl:choose>
                </h2>
    			
    			<!--xsl:if test="online_dashboard_now='' and online_operators_now!=''"><ds></ds></xsl:if>
    			<xsl:if test="online_kiosks_now='' and online_operators_now!=''"><ko></ko></xsl:if-->
    			<l>П</l>
                <v><xsl:value-of select="format-number(number(receivedCount),'0')"/></v>
                <br/>
                
                <l>Д</l>
                <v><xsl:value-of select="format-number(number(deliveredCount),'0')"/></v>
                <xsl:if test="deliveredExpireCount">
                <v>
                    <xsl:attribute name="class">
                        <xsl:choose>
                            <xsl:when test="number(deliveredExpireCount) &gt; 0">max</xsl:when>
                            <xsl:otherwise><xsl:text>max</xsl:text></xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                    <xsl:text>/</xsl:text><xsl:value-of select="number(deliveredExpireCount)"/>
                </v>
                </xsl:if>
    		</div>
            <xsl:call-template name="branch-full"/>
        </binfo>
	</xsl:template>


    <xsl:template name="branch-full">
        <xsl:variable name="meta" select="key('settings',code)"/>
        <div title="{branch_id}-{code}" class="branch branch-full" style="display:none;">
            
            <h2> Ω <xsl:value-of select="code"/> - <xsl:value-of select="$meta/name"/></h2>

            <xsl:for-each select="*[not(self::code|self::receivedCount|self::deliveredCount|self::deliveredExpireCount|self::receivedAmount|self::stornoCount|self::stornoAmount)]">
                <!--l><xsl:value-of select="$meta/@name"/></l-->
                <l><xsl:value-of select="name()"/></l>
                <v><xsl:value-of select="format-number(number(.),$meta/@format)"/></v><br/>
            </xsl:for-each>

            <l>ПРИНЯТО</l>
            <v><xsl:value-of select="format-number(number(receivedCount),'0')"/></v><br/>
            <l>ДОСТАВЛЕНО</l>
            <v><xsl:value-of select="format-number(number(deliveredCount),'0')"/></v><br/>
            <l>ПРОСРОЧЕНО</l>
            <v><xsl:value-of select="format-number(number(deliveredExpireCount),'0')"/></v><br/>
            <hr/>
            <xsl:if test="stornoCount">
            <l>СТОРНО</l>
            <v><xsl:value-of select="format-number(number(stornoCount),'0')"/></v><br/>
            <l>СУММА СТОРНО</l>
            <v><xsl:value-of select="format-number(number(stornoAmount),'0')"/></v><br/>
            <hr/>
            </xsl:if>
            <l>ПОЛУЧЕНО</l>
            <v><xsl:value-of select="format-number(number(receivedAmount),'0₸')"/></v><br/>
            <hr/>
            <l>ОПЕРАТОРОВ</l>
            <v>-<w>-</w></v><br/>
            <hr/>
            <l>НА ХРАНЕНИИ</l>
            <v>-</v>    
        </div>
    </xsl:template>
    
    
    <xsl:template name="check_limit">
        <xsl:param name="value"/>
        <xsl:if test="number($value) &gt; $LIMIT_WAITCNT"><xsl:attribute name="class">max blink</xsl:attribute></xsl:if>
    </xsl:template>
    
    <xsl:template name="formatDate">
        <xsl:param name="value" />
        <xsl:variable name="date" select="substring-before($value, 'T')" />
        <xsl:variable name="year" select="substring-before($date, '-')" />
        <xsl:variable name="month" select="substring-before(substring-after($date, '-'), '-')" />
        <xsl:variable name="day" select="substring-after(substring-after($date, '-'), '-')" />
        
        <xsl:variable name="time" select="substring-before(substring-after($value, 'T'), '.')" />
        
        <xsl:value-of select="concat($month, '-', $day, '-', $year, ' ' , $time)" />
        
      </xsl:template>
      
	<xsl:template name="formatTimeNum">
		<xsl:param name="value" />
		<xsl:variable name="hour" select="format-number(floor(number($value) div 3600),'00')" />
		<xsl:variable name="min" select="format-number(number($value) mod 3600 div 60,'00')" />
		<xsl:if test="$value!=''">
		    <xsl:value-of select="concat($hour,':',$min)" />
		</xsl:if>
	</xsl:template>
	

</xsl:stylesheet>