<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>XML Sitemap - Amitabh Borah</title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <style>
                    body {
                        font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif;
                        font-size: 16px;
                        color: #e0e0e0;
                        background: #1a1a1a;
                        line-height: 1.6;
                        margin: 0;
                        padding: 0;
                    }
                    .wrapper {
                        max-width: 1200px;
                        margin: 0 auto;
                        padding: 20px;
                    }
                    .header {
                        text-align: center;
                        padding: 20px 0;
                        margin-bottom: 40px;
                        border-bottom: 1px solid #2d2d2d;
                    }
                    .title {
                        color: #8b4949;
                        font-size: 2rem;
                        margin: 0;
                        font-weight: 100;
                    }
                    .subtitle {
                        color: #696949;
                        margin-top: 10px;
                    }
                    table {
                        width: 100%;
                        border-collapse: collapse;
                        margin-top: 20px;
                        background: #2d2d2d;
                        border-radius: 8px;
                        overflow: hidden;
                    }
                    th {
                        background: #493939;
                        color: #e0e0e0;
                        padding: 12px;
                        text-align: left;
                    }
                    td {
                        padding: 12px;
                        border-top: 1px solid #3d3d3d;
                    }
                    tr:hover {
                        background: #353535;
                    }
                    a {
                        color: #8b4949;
                        text-decoration: none;
                    }
                    a:hover {
                        color: #694949;
                    }
                    .priority-high {
                        color: #7ed957;
                    }
                    .priority-medium {
                        color: #6b7fff;
                    }
                    .footer {
                        margin-top: 40px;
                        text-align: center;
                        color: #696969;
                        font-size: 0.9rem;
                    }
                    @media (max-width: 768px) {
                        .wrapper {
                            padding: 10px;
                        }
                        table {
                            display: block;
                            overflow-x: auto;
                            -webkit-overflow-scrolling: touch;
                        }
                        th, td {
                            white-space: nowrap;
                        }
                    }
                </style>
            </head>
            <body>
                <div class="wrapper">
                    <div class="header">
                        <h1 class="title">XML Sitemap</h1>
                        <div class="subtitle">
                            This sitemap contains <xsl:value-of select="count(sitemap:urlset/sitemap:url)"/> URLs
                        </div>
                    </div>
                    
                    <table>
                        <tr>
                            <th>URL</th>
                            <th>Last Modified</th>
                            <th>Change Frequency</th>
                            <th>Priority</th>
                        </tr>
                        <xsl:for-each select="sitemap:urlset/sitemap:url">
                            <tr>
                                <td>
                                    <a href="{sitemap:loc}">
                                        <xsl:value-of select="sitemap:loc"/>
                                    </a>
                                </td>
                                <td><xsl:value-of select="sitemap:lastmod"/></td>
                                <td><xsl:value-of select="sitemap:changefreq"/></td>
                                <td>
                                    <xsl:choose>
                                        <xsl:when test="sitemap:priority >= 0.9">
                                            <span class="priority-high">
                                                <xsl:value-of select="sitemap:priority"/>
                                            </span>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <span class="priority-medium">
                                                <xsl:value-of select="sitemap:priority"/>
                                            </span>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                    
                    <div class="footer">
                        <p>Generated by <a href="/">Amitabh Borah</a></p>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>