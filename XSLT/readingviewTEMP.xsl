<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xml" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>Reading View</head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>

    <!-- FORMATTING METADATA.  WOULD THIS WORK BETTER AS A TABLE?-->
    <xsl:template match="metadata">
        <div>
            <h2>
                <!-- DOCUMENT TITLE -->
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
            
        </div>
    </xsl:template>
    <!-- FORMATTING TEXT -->
    <xsl:template match="div">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <!-- PAGE BREAKS -->
    <xsl:template match="pg">
        <hr/>
    </xsl:template>
    <!-- SPAN ELEMENT FOR INDIVIDUALS -->
    <xsl:template match="individual">
        <span class="ind">
            <xsl:apply-templates/>
        </span>
        <!--  USE THIS TO CREATE DROPDOWNS?
            <ul>
            <li><xsl:value-of select="role/@id"/></li>
        </ul>-->
    </xsl:template>

</xsl:stylesheet>
