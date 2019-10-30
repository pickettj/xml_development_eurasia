<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xml" doctype-system="about:legacy-compat" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Reading View</title>
                <link rel="stylesheet" type="text/css" href="readingview.css"/>
            </head>

            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>

    <!-- FORMATTING METADATA.  WOULD THIS WORK BETTER AS A TABLE?-->
    <xsl:template match="metadata">
        <!-- DOCUMENT TITLE -->
        <h2>
            <xsl:apply-templates select="archive"/>
        </h2>

        <ul>
            <li>
                <xsl:text>Serial: </xsl:text>
                <xsl:value-of select="serial"/>
            </li>
            <li>
                <xsl:text>Entity: </xsl:text>
                <xsl:value-of select="entity"/>
            </li>
            <li>
                <xsl:text>Reference Document Type: </xsl:text>
                <xsl:value-of select="original/@type"/>
            </li>
            <li>
                <xsl:text>Transcription Complete? </xsl:text>
                <xsl:value-of select="complete/@type"/>
            </li>
            <li>
                <xsl:text>Gloss: </xsl:text>
                <xsl:value-of select="cat_gloss"/>
            </li>
            <li>
                <xsl:text>Dates: </xsl:text>
                <xsl:text>Hij- </xsl:text>
                <xsl:value-of select="cat_date/@hij_date"/>
                <xsl:text>
                        
                    </xsl:text>
                <xsl:text>Greg- </xsl:text>
                <xsl:value-of select="cat_date/@greg_date"/>
            </li>
        </ul>


    </xsl:template>
    <!-- FORMATTING TEXT -->
    <xsl:template match="body">
        <div class="body">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="body/div">
        <xsl:if test="@type='gloss'">
            <div class="gloss">
                <xsl:apply-templates/>
            </div>
        </xsl:if>
        <div class="body">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <!-- PAGE BREAKS -->
    <xsl:template match="pg">
        <hr/>
        <p>
            <xsl:value-of select="@folio"/>
        </p>
    </xsl:template>
    <!-- XML COMMENTS -->
    <xsl:template match="body/comment()">
        <div class="dropdown">
            <span class="comment"> * </span>
            <ul class="dropdown-content">
                <li>
                    <xsl:value-of select="."/>
                </li>
            </ul>
        </div>
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
    <!-- CSS DROP DIV ELEMENT FOR INDIVIDUALS -->
    <xsl:template match="individual">
        <div class="dropdown">
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
        </div>
    </xsl:template>
    <!-- CSS DROP DIV ELEMENT FOR INTERTEXT -->
    <xsl:template match="intertext">
        <div class="dropdown">
            <span class="int">
                <xsl:apply-templates/>
            </span>
            <ul class="dropdown-content">
                <li>
                    <xsl:text>Quran ID: </xsl:text>
                    <xsl:value-of select="@quran_id"/>
                </li>
            </ul>
        </div>
    </xsl:template>
    <!-- CSS DROP DIV ELEMENT FOR LOCATION -->
    <xsl:template match="div/location">
        <div class="dropdown">
            <span class="loc">
                <xsl:apply-templates/>
            </span>
            <ul class="dropdown-content">
                <li>
                    <xsl:text>Location ID: </xsl:text>
                    <xsl:value-of select="@id"/>
                </li>
            </ul>
        </div>
    </xsl:template>
    <!-- CSS DROP DIV ELEMENT FOR FLAGS -->
    <xsl:template match="flag">
        <div class="dropdown">
            <span class="flag">
                <xsl:apply-templates/>
            </span>
            <ul class="dropdown-content">
                <li>
                    <xsl:value-of select="@type"/>
                </li>
            </ul>
        </div>
    </xsl:template>
    <!-- CSS DROP DIV ELEMENT FOR DATES -->
    <xsl:template match="date">
        <div class="dropdown">
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
        </div>
    </xsl:template>
</xsl:stylesheet>
