<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xmlns:prv="https://www.bactriana.org"
    xmlns:xhtml="http://www.w3.org/1999/xhtml"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xml" doctype-system="about:legacy-compat" indent="yes"/>

<!-- ================================================================ -->
<!-- Global Variables   -->
<!-- ================================================================ -->
    <!-- solution for getting unique ids with values (Birnbaum): https://github.com/obdurodon/dh_course/issues/459 -->
    <xsl:variable name="locations" as="element(location)*" select="//location"/>
 
 
<!-- ================================================================ -->
<!-- Functions                                                        -->
<!-- ================================================================ -->
    <xsl:function name="prv:unique_elements" as="element(xhtml:li)">
        <!-- ============================================================ -->
        <!-- prv:unique_elements                                          -->
        <!-- Synopsis:     -->
        <!--                                 -->
        <!--                                                              -->
        <!-- Parameters                                                   -->
        <!--   input as element sequence                                  -->
        <!-- Return:                                                      -->
        <!--   unique elements with table markup                    -->
        <!-- ============================================================ -->
        <xsl:param name="input" as="element(*)*"/>
        <xsl:for-each select="distinct-values($input)">
            <!-- assign local variable -->
            <xsl:variable name="id" select="$locations[. eq current()][1]/@id"
                as="attribute(id)?"/>
            <li>
                <xsl:value-of
                    select="
                    if ($id) then
                    concat($id, ': ')
                    else
                    (),
                    ."
                />
            </li>
        </xsl:for-each>
    </xsl:function>
        
 
 
<!-- ================================================================ -->
<!-- Stylesheet   -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Document no. <xsl:apply-templates select="//document/@serial" mode="serial"
                /></title>
                <link rel="stylesheet" type="text/css" href="persian_document_reading_view.css"/>
                <link href="https://fonts.googleapis.com/css?family=Cinzel" rel="stylesheet"/>
                <link href="https://fonts.googleapis.com/css?family=Scheherazade" rel="stylesheet"/>
                <link href="https://fonts.googleapis.com/css?family=Lato&amp;display=swap" rel="stylesheet"/>                 
            </head>

            <body>
                <h2>Document no. <xsl:apply-templates select="//document/@serial" mode="serial"
                    /></h2>

                <!-- Summary Information Table -->
                <h3>Summary Information</h3>
                <table>
                    <tr>
                        <th>General</th>
                        <th>Individuals</th>
                        <th>Locations</th>
                        <th>Roles</th>
                    </tr>
                    <tr>
                        <td>
                            <ul>
                                <li>
                                    <xsl:for-each select="//document">
                                        <xsl:text>Line Count:</xsl:text>
                                        <xsl:value-of select="count(//lb)"/>
                                    </xsl:for-each>
                                </li>
                                <li>
                                    <xsl:for-each select="//document">
                                        <xsl:text>Character Count:</xsl:text>
                                        <xsl:value-of select="string-length(.)"/>
                                    </xsl:for-each>
                                </li>
                                <li>
                                    <xsl:for-each select="//document">
                                        <xsl:text>Word Count:</xsl:text>
                                        <xsl:value-of
                                            select="string-length(translate(normalize-space(.), ' ', '')) + 1"
                                        />
                                    </xsl:for-each>
                                </li>
                            </ul>

                        </td>
                        <td>
                            <ul>
                                <xsl:for-each select="//individual">
                                    <li>
                                        <xsl:value-of select="distinct-values(.)"/>
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </td>
                        <td>
                            <ul>
                                
                                <!--<xsl:sequence select="prv:unique_elements($locations)"/>-->
                                    
                                <xsl:for-each select="distinct-values($locations)">
                                    <!-- assign local variable -->
                                    <xsl:variable name="id" select="$locations[. eq current()][1]/@id"
                                            as="attribute(id)?"/>
                                    <li>
                                        <xsl:value-of
                                            select="
                                            if ($id) then
                                            concat($id, ': ')
                                            else
                                            (),
                                            ."
                                        />
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </td>
                        <td>
                            <ul>
                                <xsl:for-each select="//role">
                                    <li>
                                        <xsl:value-of select="distinct-values(.)"/>
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </td>
                    </tr>


                </table>

                <h3>The Text</h3>
                
                <!-- Main Text -->

                <xsl:apply-templates/>
                
                <!--<h3>Deciphering</h3>-->
                
            </body>
        </html>
    </xsl:template>


<!-- ================================================================ -->
    
    <!-- Formatting Heading -->
    <xsl:template match="document" mode="serial"/>



    <!-- Diplomatic Sections -->
    
<!--    <xsl:template match="div">
        <div class = "section">
            <xsl:for-each-group select="descendant::text() | lb" group-starting-with="lb">
                <span class="numeration">
                    <xsl:text>(</xsl:text>
                    <xsl:value-of select="position()"/>
                    <xsl:text>) </xsl:text></span>
                    <xsl:value-of select="current-group()"/>
                <br/>
            </xsl:for-each-group>
        </div>
    </xsl:template>-->
    
       
    
    <xsl:template match="div">
        <h4>
         <xsl:value-of select="count(preceding-sibling::div)+1"/><xsl:text>. </xsl:text>
        <xsl:value-of select = "./@type"/>
        </h4>
        <div class = "section"><xsl:apply-templates/></div>
    </xsl:template>
    
    <!-- Lines -->
    
    <xsl:template match="lb">
        <br/>
        <span class = "numeration">(<xsl:value-of select="count(preceding-sibling::lb)+1"/>)</span>
    </xsl:template>
   
   
    <!-- Thematic Sections -->
    
    <xsl:template match="ts">
        <br/>
        <h5><xsl:value-of select = "./@type"/></h5>
        <br/>
    </xsl:template>


    <!-- Flags -->
    <xsl:template match="flag">
        
            <span class="flag">
                <xsl:apply-templates/>
            </span>
            
    </xsl:template>
    
    
    <!-- Locations -->
    <xsl:template match="location">
        
        <span class="location">
            <xsl:apply-templates/>
        </span>
        
    </xsl:template>
    
    
    <!-- Individuals -->
    <xsl:template match="individual">
        
        <span class="individual">
            <xsl:apply-templates/>
        </span>
        
    </xsl:template>
    

    <!-- Pages -->
    <xsl:template match="pg">
        <hr/>
        <p>
            <xsl:value-of select="@folio"/>
        </p>
    </xsl:template>
    
    
    <!-- Gloss -->
    <xsl:template match="glossed">
        <span class="dropdown">
            <xsl:apply-templates/>  
        </span>   
    </xsl:template>
   
    <xsl:template match="target">
        <span class="gloss">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="gloss">
        <span class="dropdown-content {@type}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    

<!--
    <!-\- XML COMMENTS -\->
    <xsl:template match="body/comment()">
        <span class="dropdown">
            <span class="comment"> * </span>
            <ul class="dropdown-content">
                <li>
                    <xsl:value-of select="."/>
                </li>
            </ul>
        </span>
    </xsl:template>
    <xsl:template match="div/comment()">
        <div class="dropdown">
            <span class="comment"> * </span>
            <ul class="dropdown-content">
                <li>
                    <xsl:value-of select="."/>
                </li>
            </ul>
        </div>
    </xsl:template>



    <!-\- CSS DROP DIV ELEMENT FOR INDIVIDUALS -\->
    <xsl:template match="individual">
        <span class="dropdown">
            <span class="ind">
                <xsl:apply-templates/>
            </span>
            <ul class="dropdown-content">
                <li>
                    <xsl:text>Ind ID: </xsl:text>
                    <xsl:value-of select="@id"/>
                </li>
                <li>
                    <xsl:text>Role ID: </xsl:text>
                    <xsl:value-of select="role/@id"/>
                </li>
                <xsl:if test="./location">
                    <li>
                        <xsl:text>Location ID:  </xsl:text>
                        <xsl:value-of select="@loc_id"/>
                    </li>
                </xsl:if>
            </ul>
        </span>
    </xsl:template>
    
    
    
    <!-\- CSS DROP DIV ELEMENT FOR INTERTEXT -\->
    <xsl:template match="intertext">
        <span class="dropdown">
            <span class="int">
                <xsl:apply-templates/>
            </span>
            <ul class="dropdown-content">
                <li>
                    <xsl:text>Quran ID: </xsl:text>
                    <xsl:value-of select="@quran_id"/>
                </li>
            </ul>
        </span>
    </xsl:template>

    <!-\- CSS DROP DIV ELEMENT FOR LOCATION -\->
    <xsl:template match="div/location">
        <span class="dropdown">
            <span class="loc">
                <xsl:apply-templates/>
            </span>
            <ul class="dropdown-content">
                <li>
                    <xsl:text>Location ID: </xsl:text>
                    <xsl:value-of select="@id"/>
                </li>
            </ul>
        </span>
    </xsl:template>


    <!-\- CSS DROP DIV ELEMENT FOR DATES -\->
    <xsl:template match="date">
        <span class="dropdown">
            <span class="date">
                <xsl:apply-templates/>
            </span>
            <ul class="dropdown-content">
                <xsl:if test="comment()">
                    <li>
                        <xsl:text>Comment:  </xsl:text>
                        <xsl:value-of select="comment()"/>
                    </li>
                </xsl:if>
                <xsl:if test="@jul_date">
                    <li>
                        <xsl:text>Julian date:  </xsl:text>
                        <xsl:value-of select="@jul_date"/>
                    </li>
                </xsl:if>
                <xsl:if test="@hij_date">
                    <li>
                        <xsl:text>Hijri date:  </xsl:text>
                        <xsl:value-of select="@hij_date"/>
                    </li>
                </xsl:if>
                <xsl:if test="@greg_date">
                    <li>
                        <xsl:text>Gregorian date:  </xsl:text>
                        <xsl:value-of select="@greg_date"/>
                    </li>
                </xsl:if>
            </ul>
        </span>
    </xsl:template>-->
</xsl:stylesheet>
