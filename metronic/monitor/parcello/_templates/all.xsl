<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:date="http://exslt.org/dates-and-times" xmlns:exslt="http://exslt.org/common" xmlns:gps="gps" exclude-result-prefixes="exslt gps date">
	
	<!--xsl:output method="xml" omit-xml-declaration="yes"/-->
	<xsl:strip-space elements="*" />
	
	<xsl:param name="block_sizing"/>
	<xsl:param name="layout"/>
	<xsl:param name="collapse"/>
	<xsl:param name="S_LIMIT_MAXTIME_WAITING"/>
	<xsl:param name="S_LIMIT_MAXTIME_SERVING"/>
	<xsl:param name="S_MAXTIME_TOGGLE"/>
	
	<xsl:variable name="LIMIT_MAXTIME_WAITING" select="number($S_LIMIT_MAXTIME_WAITING) * 60000"/>
	<xsl:variable name="LIMIT_MAXTIME_SERVING" select="number($S_LIMIT_MAXTIME_SERVING) * 60000"/>
	<xsl:variable name="MAXTIME_TOGGLE" select="number($S_MAXTIME_TOGGLE)"/>
	
    
    <xsl:decimal-format NaN="-"/>
    
    <xsl:variable name="LIMIT_MAXSERVE" select="600000"/>
    <xsl:variable name="LIMIT_MAXWAIT" select="600000"/>
    <xsl:variable name="LIMIT_WAITCNT" select="600000"/>

    <xsl:param name="GPSXML">
      <gps:branches>
      	<city code="kazpost-01" name="Астана" x="820" y="280"/>
      	<city code="kazpost-02" name="Акмолинская" x="820" y="450"/>
      	<city code="kazpost-03" name="Актобе" x="470" y="350"/>
      	<city code="kazpost-04" name="Талдыкорган" x="1590" y="660"/>
        <city code="kazpost-05" name="Алматы" x="1310" y="660"/>
        <city code="kazpost-06" name="Атырау" x="130" y="550"/>
        <city code="kazpost-07" name="Усть-Каменогорск" x="1480" y="350"/>
        <city code="kazpost-08" name="Тараз" x="1030" y="840"/>
        <city code="kazpost-09" name="Уральск" x="130" y="350"/>
        <city code="kazpost-10" name="Караганда" x="1150" y="350"/>
        <city code="kazpost-11" name="Костанай" x="470" y="100"/>
        <city code="kazpost-12" name="Кызылорда" x="470" y="660"/>
        <city code="kazpost-13" name="Актау" x="130" y="790"/>
        <city code="kazpost-14" name="Павлодар" x="1320" y="100"/>
        <city code="kazpost-15" name="Петропавловск" x="820" y="100"/>
        <city code="kazpost-16" name="Шымкент" x="750" y="790"/>
      </gps:branches>
    </xsl:param>
    
    <xsl:variable name="GPS" select="exslt:node-set($GPSXML)/gps:branches[1]"/>
    
    <!--xsl:variable name="team" select="document('/data/cloudq/branches.xml')/gps:branches"/--> 

	<xsl:template match="/stats">
	
        <xsl:call-template name="data"/>
        
        
        <div style="right:20px; top:275px;" onclick="toggleSizing();">
           	<xsl:attribute name="class">toggler <xsl:if test="$block_sizing='small'">on</xsl:if></xsl:attribute>
           	<xsl:attribute name="title"><xsl:if test="$block_sizing='small'">МЕЛКИЙ</xsl:if></xsl:attribute>
           	<label>Размер Отделений</label>
        </div>
        
        <div style="right:20px; top:260px;" onclick="toggleMaxtime();">
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
        </div>
           
		<div class="stats">
		
			<h2>ВСЕГО ПО РК</h2>
			<l>НА <xsl:call-template name="formatDate"><xsl:with-param name="value" select="ts"/></xsl:call-template></l><br/>
			<hr/>
            <l>ПРИНЯТО</l>
            <v><xsl:value-of select="format-number(sum(data/total_cnt_visitors[number(.)=number(.)]),'0')"/></v><br/>
            <l>ВЫДАНО</l>
            <v><xsl:value-of select="format-number(sum(data/serving_stat/total_cnt_is_served[number(.)=number(.)]),'0')"/></v><br/>
            <l>ХРАНЕНИЕ</l>
            <v><xsl:value-of select="format-number(sum(data/total_cnt_visitors[number(.)=number(.)])-sum(data/serving_stat/total_cnt_is_served[number(.)=number(.)]),'0')"/></v><br/>
            <hr/>
            <l>ИМПОРТ</l>
            <v><xsl:value-of select="count(data)"/></v><br/>
            <l>ЭКСПОРТ</l>
            <v><xsl:value-of select="sum(data/online_operators_now[number(.)=number(.)])"/></v><br/>
            <hr/>
            <l>ОТДЕЛЕНИЙ</l>
            <v><xsl:value-of select="sum(data/online_dashboard_now[number(.)=number(.)])"/></v><br/>
            <l>ОПЕРАТОРОВ</l>
            <v><xsl:value-of select="sum(data/online_kiosks_now[number(.)=number(.)])"/><w><xsl:value-of select="sum(data/total_operators_count[number(.)=number(.)])"/></w></v><br/>
            <hr/>
            <l>В ПУТИ</l>
            <v><xsl:value-of select="format-number(sum(data/waiting_stat/total_cnt_is_waiting_now[number(.)=number(.)]),'0')"/></v><br/>
            <l>НА ХРАНЕНИИ</l>
            <v><xsl:value-of select="format-number(sum(data/serving_stat/total_cnt_is_serving_now[number(.)=number(.)]),'0')"/></v><br/>
            <hr/>
            <l>AVG ВРЕМЯ</l>
            <v>5<w>10</w></v>
            
		</div>
	</xsl:template>

	<xsl:template name="data">
		<xsl:variable name="data" select="data" />
		
		<xsl:for-each select="$GPS/city">
			<xsl:variable name="code" select="@code" />
			<xsl:variable name="branch" select="$data[$code and starts-with(code,$code)]" />
			
			<xsl:if test="$branch">
				<city name="{@name}">
					<xsl:attribute name="style">left:<xsl:value-of select="@x"/>px;top:<xsl:value-of select="@y"/>px;</xsl:attribute>
					<h1>Ω <xsl:value-of select="substring-after(@code, '-')"/> - <xsl:value-of select="@name"/> ( <xsl:value-of select="count($branch)"/> ШТ )</h1>
					
					<xsl:for-each select="$branch">
						<xsl:sort select="substring-after(code, '-')"/>
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
                    	<xsl:when test="$block_sizing='small'"><xsl:value-of select="substring(substring-after(code, '-'),3,6)"/></xsl:when>
                    	<xsl:otherwise><xsl:value-of select="substring-after(code, '-')"/></xsl:otherwise>
                    </xsl:choose>
                </h2>
    			
    			<xsl:if test="online_dashboard_now='' and online_operators_now!=''"><ds></ds></xsl:if>
    			<xsl:if test="online_kiosks_now='' and online_operators_now!=''"><ko></ko></xsl:if>
    			
                <v class="diff"><xsl:value-of select="format-number(number(waiting_stat/total_cnt_is_waiting_now),'0')"/></v><xsl:if test="waiting_stat/total_cnt_exceed_waiting!='' and waiting_stat/max_time_waiting!=''">/<v>
                		<xsl:value-of select="number(waiting_stat/total_cnt_exceed_waiting)"/>
                </v>
                
                </xsl:if>
                
                <br/>
                
                <v class="diff"><xsl:value-of select="format-number(number(serving_stat/total_cnt_is_serving_now),'0')"/></v><xsl:if test="serving_stat/total_cnt_exceed_serving!='' and serving_stat/max_time_serving!=''">/<v><xsl:if test="number(serving_stat/max_time_serving) &gt;= $LIMIT_MAXTIME_SERVING"><xsl:attribute name="class">max blink</xsl:attribute></xsl:if>
    	        	<xsl:value-of select="number(serving_stat/total_cnt_exceed_serving)"/>
    	        </v>
                </xsl:if>
    		</div>
        </binfo>
	</xsl:template>


    <xsl:template name="branch-full">
        <div title="{branch_id}-{code}"  class="branch branch-full" style="display:none;">
            
            <h2><xsl:value-of select="branch_title"/></h2>
            
            <l>ПОСЕТИЛО</l>
            <v><xsl:value-of select="format-number(number(total_cnt_visitors),'0 ЧЛ')"/></v><br/>
            <l>ОБСЛУЖИЛОСЬ</l>
            <v><xsl:value-of select="format-number(number(serving_stat/total_cnt_is_served),'0 УС')"/></v><br/>
            <!--l>ПО БРОНИ</l>
            <v><xsl:value-of select="format-number(number(total_cnt_via_booking),'0 ЧЛ')"/></v><br/-->
            <l>ОПЕРАТОРОВ</l>
            <v><xsl:value-of select="format-number(number(online_operators_now),'0')"/> <w><xsl:value-of select="total_operators_count"/></w></v><br/>
            <hr/>
            <l>ЭКРАНОВ</l>
            <v><xsl:value-of select="format-number(number(online_dashboard_now),'0')"/></v><br/>
            <l>КИОСКОВ</l>
            <v><xsl:value-of select="format-number(number(online_kiosks_now),'0')"/></v><br/>
           
            <hr/>
            <l>ОЖИДАЮТ</l>
            <v><xsl:value-of select="format-number(number(waiting_stat/total_cnt_is_waiting_now),'0 ЧЛ')"/></v><br/>
            
            <xsl:if test="waiting_stat/total_cnt_exceed_waiting!=''">
                <l>ПРЕВЫСИЛО</l>
                <v><xsl:value-of select="format-number(number(waiting_stat/total_cnt_exceed_waiting),'0 ЧЛ')"/></v><br/>
            </xsl:if>
            
            <xsl:if test="waiting_stat/avg_time_waited &gt; 60000">
            <l>AVG ВРЕМЯ</l>
            <v><xsl:value-of select="format-number(number(waiting_stat/avg_time_waited) div 60 div 1000,'0 МИН')"/></v><br/>
            </xsl:if>
            
            <xsl:if test="waiting_stat/max_time_waiting!=''">
                <l>МАX ВРЕМЯ</l>
                <v>
                    <xsl:if test="number(waiting_stat/max_time_waiting) &gt;= $LIMIT_MAXTIME_WAITING"><xsl:attribute name="class">max blink</xsl:attribute></xsl:if>
                    <xsl:value-of select="format-number(number(waiting_stat/max_time_waiting) div 60 div 1000,'0 МИН')"/>
                </v><br/>
            </xsl:if>
            
            <xsl:if test="waiting_stat/lane_max_time_is_waiting">
                <v><s><xsl:value-of select="waiting_stat/lane_max_time_is_waiting/title"/></s></v><br/>
            </xsl:if>
            
            <hr/>
            <l>ОБСЛУЖИВАЮТ</l>
            <v>
                <xsl:value-of select="format-number(number(serving_stat/total_cnt_is_serving_now),'0 ЧЛ')"/><xsl:if test="serving_stat/total_cnt_is_pending_now!=''"><w><xsl:value-of select="format-number(number(serving_stat/total_cnt_is_pending_now),'0')"/></w></xsl:if>
            </v><br/>
            
            <xsl:if test="serving_stat/total_cnt_exceed_serving!=''">
                <l>ПРЕВЫСИЛО</l>
                <v><xsl:value-of select="format-number(number(serving_stat/total_cnt_exceed_serving),'0 ЧЛ')"/></v><br/>
            </xsl:if>
            
            <xsl:if test="serving_stat/avg_time_served &gt; 60000">
            <l>AVG ВРЕМЯ</l>
            <v><xsl:value-of select="format-number(number(serving_stat/avg_time_served) div 60 div 1000,'0 МИН')"/></v><br/>
            </xsl:if>
            
            <xsl:if test="serving_stat/max_time_serving!=''">
                <l>МАX ВРЕМЯ</l>
                <v>
                    <xsl:if test="number(serving_stat/max_time_serving) &gt;= $LIMIT_MAXTIME_SERVING"><xsl:attribute name="class">max blink</xsl:attribute></xsl:if>
                    <xsl:value-of select="format-number(number(serving_stat/max_time_serving) div 60 div 1000,'0 МИН')"/>
                 </v><br/>
            </xsl:if>
            <xsl:if test="serving_stat/lane_max_time_is_serving">
                <v><s><xsl:value-of select="serving_stat/lane_max_time_is_serving/title"/></s></v><br/>
            </xsl:if>
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