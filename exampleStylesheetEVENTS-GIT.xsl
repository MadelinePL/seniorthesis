<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:exslt="http://exslt.org/common" xmlns="http://www.tei-c.org/ns/1.0" xmlns:xi="http://www.w3.org/2001/XInclude" xmlns:svg="http://www.w3.org/2000/svg" xmlns:_="http://www.tei-c.org/ns/1.0" xmlns:DEFAULT="http://www.tei-c.org/ns/1.0" version="1.0" extension-element-prefixes="exslt">
    <xsl:output omit-xml-declaration="yes" indent="no"/>
    <xsl:template match="/">
        <xsl:for-each select="//tei:body//tei:seg[@subtype='event']">
            
            <xsl:variable name="xmlID" select="@xml:id"></xsl:variable>
            
            <!--OUTPUTS MANUSCRIPT ID-->
            <xsl:call-template name="value-of-template">
                <xsl:with-param name="select" select="/tei:TEI/@xml:id"/>
            </xsl:call-template>
            
            <!--OUTPUTS LATIN DEPOSITION-->
            <xsl:text>&#09;</xsl:text>
            <xsl:call-template name="value-of-template">
                <xsl:with-param name="select" select="normalize-space(.)"/>
            </xsl:call-template>
            
            <!--OUTPUTS ENGLISH DEPOSITION-->
            <xsl:text>&#09;</xsl:text>
            <xsl:call-template name="value-of-template">
                <xsl:with-param name="select" select="normalize-space(//tei:seg[@type='trans' and @corresp=concat('#',$xmlID)])"/>
            </xsl:call-template>
            
            <!--OUTPUTS LATIN DATE-->
            <xsl:text>&#09;</xsl:text>
            <xsl:call-template name="value-of-template">
                <xsl:with-param name="select" select="normalize-space(tei:date[@type='event_date'])"/>
            </xsl:call-template>
            
            <!--OUTPUTS DATE (year)-->
            <xsl:text>&#09;</xsl:text>
            <xsl:call-template name="value-of-template">
                <xsl:with-param name="select" select="tei:date[@type='event_date']/@when"/>
            </xsl:call-template>
            
            <!--OUTPUTS LATIN LOCATION-->
            <xsl:text>&#09;</xsl:text>
            <xsl:call-template name="value-of-template">
                <xsl:with-param name="select" select="normalize-space(tei:placeName[@type='event_loc'])"/>
            </xsl:call-template>
            
            <!--OUTPUTS LOCATION TAG-->
            <xsl:text>&#09;</xsl:text>
            <xsl:call-template name="value-of-template">
                <xsl:with-param name="select" select="normalize-space(tei:placeName[@type='event_loc']/@nymRef)"/>
            </xsl:call-template>
            
            <!--Note: JPR's documents seem to imply that he tagged the place types, but that doesn't seem to be the case in the actual XML. See his readme/JPR's website: encoding the digital edition
            <xsl:text>&#09;</xsl:text>
            <xsl:call-template name="value-of-template">
                <xsl:with-param name="select" select="/seg/placeName/@type"/>
            </xsl:call-template>-->
            
            
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
