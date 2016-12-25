<xsl:stylesheet xmlns="" version="!n">
	<xsl:template match="/">
		<html>
			<body>
				<h1> Our Order № <xsl: value-of select="/company/@number"/></h1>
				<xsl: apply-template select="//order"/>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="order">
		<xsl:if test="generate-id(.)= generate-id(//order[@model=current()/@model][1])"
		<h2><xsl: value-of select="@model"/></h2>
		<h2><xsl: value-of select="generate-id(.)"/></h2>


			<table>
				<thead>
					<tr>
						<td>Id</td>
						<td>Name</td>
						<td>City</td>
						<td>Color</td>
					</tr>
				</thead>
				<tbody>
					<xsl: apply-template select="//order[@model=current()/@model]" mode="table"/>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template match="order" mode="table">
		<tr>
			<td><xsl: value-of select="@name"/></td>
			<td><xsl: value-of select="@city"/></td>
			<td><xsl: value-of select="@color"/></td>
		</tr>
	</xsl:template>
</xsl:stylesheet>
