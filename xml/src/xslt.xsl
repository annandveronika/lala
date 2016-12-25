<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <body>
                <h1>Our Order
                </h1>
                <xsl:apply-templates select="//order"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="order">
        <xsl:if test="generate-id(.)= generate-id(//order[@model=current()/@model][1])">
            <h2>
                <xsl:value-of select="@model"/>
            </h2>
            <h2>
                <xsl:value-of select="generate-id(.)"/>
            </h2>


            <table  border="1" bordercolor="black">
                <thead>
                    <tr>
                        <td>Name</td>
                        <td>City</td>
                        <td>Color</td>
                    </tr>
                </thead>
                <tbody>
                    <xsl:apply-templates select="//order[@model=current()/@model]" mode="table"/>
                </tbody>
            </table>
        </xsl:if>
    </xsl:template>
    <xsl:template match="order" mode="table">
        <tr>
            <td>
                <xsl:value-of select="@name"/>
            </td>
            <td>
                <xsl:value-of select="@city"/>
            </td>
            <td>
                <xsl:value-of select="@color"/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>