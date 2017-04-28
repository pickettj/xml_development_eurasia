<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output indent="yes" doctype-system="about:legacy-compat" method="xml"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Title</title>
            </head>
            <body>
                <div><xsl:apply-templates select="//metadata"/></div>
                <div><xsl:apply-templates select="//body"/></div>
            </body>
        </html>

    </xsl:template>

<xsl:template match="metadata">
    <p>
        <xsl:text>reference: </xsl:text>
        <xsl:apply-templates select="//name"/>
        <xsl:apply-templates select="//serial"/>
        <xsl:apply-templates select="//fol"/>
    </p>
</xsl:template>
    
<xsl:template match="body">
    <p>
        <xsl:apply-templates select="//div"/>
    </p>
    
    
</xsl:template>

</xsl:stylesheet>
