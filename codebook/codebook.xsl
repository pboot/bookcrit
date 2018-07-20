<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">

    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:apply-templates select="//tei:titleStmt/tei:title"/>
                </title>
                <style type="text/css">
                    * {
                    font-family: Verdana, Geneva, sans-serif;
                    }
                    table {border-collapse: collapse;
                    }
                    table, th, td  {border: 1px solid black;
                                    vertical-align:top
                    }
                </style>
            </head>
            <body>
                <h2>
                    <xsl:apply-templates select="//tei:titleStmt/tei:title"/>
                </h2>
                <h3>
                    <xsl:apply-templates select="//tei:titleStmt/tei:author"/>
                </h3>
                <p>Maintained at 
                    <a href="{//tei:distributor/tei:ptr/@target}"><xsl:value-of select="//tei:distributor/tei:ptr/@target"/></a>.
                    <br/>
                    License: <a href="{//tei:availability/tei:licence/@target}"><xsl:value-of select="//tei:availability/tei:licence/@target"/></a>
                </p>
                <xsl:apply-templates select="//tei:body"/>
                
            </body>
        </html>
    </xsl:template>

    <xsl:template match="tei:item">
        <li><xsl:apply-templates/></li>
    </xsl:template>
    
    <xsl:template match="tei:item[parent::tei:list[@type='codes']]">
        <tr>
            <td>
                <xsl:apply-templates select="tei:label"/>
            </td>
            <td>
                <xsl:apply-templates select="tei:term"/>
            </td>
            <td>
                <xsl:apply-templates select="tei:gloss"/>
                <xsl:apply-templates select="tei:note"/>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="tei:mentioned">
        <i>
            <xsl:apply-templates/>
        </i>
    </xsl:template>

    <xsl:template match="tei:div">
        <div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:ref">
        <a href="{@target}">
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    
    <xsl:template match="tei:title[ancestor::tei:body]">
        <i>
            <xsl:apply-templates/>
        </i>
    </xsl:template>
    
    <xsl:template match="tei:list">
        <div>
            <ul><xsl:apply-templates/></ul>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:list[@type='codes']">
        <div>
            <table>
                <thead>
                    <tr>
                        <td>Label</td>
                        <td>Description</td>
                        <td>Extra info</td>
                    </tr>
                </thead>
                <xsl:apply-templates/>
            </table>
        </div>
    </xsl:template>

    <xsl:template match="tei:note">
        <br/>
        <xsl:text>[</xsl:text>
        <xsl:value-of select="@type"/>
        <xsl:text>] </xsl:text>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:head">
        <h3>
            <xsl:apply-templates/>
        </h3>
    </xsl:template>

</xsl:stylesheet>
