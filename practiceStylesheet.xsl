<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:exslt="http://exslt.org/common" xmlns="http://www.tei-c.org/ns/1.0" xmlns:xi="http://www.w3.org/2001/XInclude" xmlns:svg="http://www.w3.org/2000/svg" xmlns:_="http://www.tei-c.org/ns/1.0" xmlns:DEFAULT="http://www.tei-c.org/ns/1.0" version="1.0" extension-element-prefixes="exslt">
    <xsl:output omit-xml-declaration="yes" indent="no"/>
    <xsl:template match="/">
        <xsl:for-each select="//tei:body//tei:seg[@subtype='event']">
            <xsl:call-template name="value-of-template">
                <xsl:with-param name="select" select="/tei:TEI/@xml:id"/>
            </xsl:call-template>
            <xsl:text>&#09;</xsl:text>
            <xsl:call-template name="value-of-template">
                <xsl:with-param name="select" select="normalize-space(.)"/>
            </xsl:call-template>
            <xsl:text>&#09;</xsl:text>
            <xsl:call-template name="value-of-template">
                <xsl:with-param name="select" select="@role"/>
            </xsl:call-template>
            <xsl:value-of select="'&#10;'"/>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="value-of-template">
        <xsl:param name="select"/>
        <xsl:value-of select="$select"/>
        <xsl:for-each select="exslt:node-set($select)[position()&gt;1]">
            <xsl:value-of select="'&#10;'"/>
            <xsl:value-of select="."/>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
