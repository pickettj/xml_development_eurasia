<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xml" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head xmlns="http://www.w3.org/1999/xhtml">
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
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <!-- PAGE BREAKS -->
    <xsl:template match="pg">
        <hr/>
    </xsl:template>
    <!-- CSS DROP DIV ELEMENT FOR INDIVIDUALS -->
    <xsl:template match="individual">
        <div class="dropdown">
            <span class="ind">
                <xsl:apply-templates/>
            </span>
            <div class="dropdown-content">
                <a>
                    <xsl:text>Ind ID:</xsl:text>
                    <xsl:value-of select="@ind_id"/>
                </a>
                <a>
                    <xsl:text>Role ID: </xsl:text>
                    <xsl:value-of select="role/@id"/>
                </a>
            </div>
        </div>
    </xsl:template>
    <!-- CSS DROP DIV ELEMENT FOR INTERTEXT -->
    <xsl:template match="intertext">
        <div class="dropdown">
            <span class="ind">
                <xsl:apply-templates/>
            </span>
            <div class="dropdown-content">
                <a>
                    <xsl:text>Quran ID: </xsl:text>
                    <xsl:value-of select="@quran_id"/>
                </a>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>
