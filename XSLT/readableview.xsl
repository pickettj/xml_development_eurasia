<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" >
    <xsl:output method="text" omit-xml-declaration="yes" indent="no"/>
   
    <xsl:template match="/">
        <xsl:text>Meta&#xa;</xsl:text>
        <xsl:apply-templates select="//name"/>
        <xsl:apply-templates select="//call"/>
        <xsl:apply-templates select="//fol"/>
        <xsl:text>Body&#xa;&#xa;</xsl:text>
        <xsl:apply-templates select="//body"/>
            
    </xsl:template>
    <xsl:template match="name">
        <xsl:text>Name: </xsl:text>
        <xsl:value-of select="."/>
        <xsl:text>&#xa;</xsl:text>
   </xsl:template>
    <xsl:template match="call">
        <xsl:text>Call: </xsl:text>
        <xsl:value-of select="normalize-space(.)"/>
        <xsl:text>&#xa;</xsl:text>
    </xsl:template>
    <xsl:template match="fol">
        <xsl:text>Fol: </xsl:text>
        <xsl:value-of select="normalize-space(.)"/>
        <xsl:text>&#xa;&#xa;</xsl:text>
    </xsl:template>
    <xsl:template match="body">
        <xsl:apply-templates select="div"/>
    </xsl:template>
    <xsl:template match="div">
        <xsl:apply-templates/><xsl:text>LINE&#xa;</xsl:text>
    </xsl:template>
</xsl:stylesheet>