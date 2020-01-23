<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Sample output</title>
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="div[@type eq 'inscriptio']">
        <h1>
            <xsl:apply-templates/>
        </h1>
    </xsl:template>
    <xsl:template match="div[@type eq 'section']">
        <p>
            <xsl:for-each-group select="descendant::text() | lb" group-starting-with="lb">
                <span>
                    <xsl:text>(</xsl:text>
                    <xsl:value-of select="position()"/>
                    <xsl:text>) </xsl:text>
                    <xsl:value-of select="current-group()"/>
                </span>
                <br/>
            </xsl:for-each-group>
        </p>
    </xsl:template>
</xsl:stylesheet>
