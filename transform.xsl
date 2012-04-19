<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output
  method="xml"
  omit-xml-declaration="yes"
  indent="yes"
  version="1.0"
  encoding="utf-8"
  doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
  doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
/>

<xsl:template match="/">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<xsl:element name="title" namespace="http://www.w3.org/1999/xhtml">
		%%faq.title%% - <xsl:value-of select="/page/category/title"/>
	</xsl:element>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	
	<link href="bootstrap.css" type="text/css" rel="stylesheet" />
	<link href="bootstrap.rtl.css" type="text/css" rel="stylesheet" />
	<link href="style.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
		<xsl:attribute name="class">topbar</xsl:attribute>
		<xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
			<xsl:attribute name="class">topbar-inner</xsl:attribute>
			<xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
				<xsl:attribute name="class">container</xsl:attribute>
				<xsl:element name="h3" namespace="http://www.w3.org/1999/xhtml">
					<xsl:element name="a" namespace="http://www.w3.org/1999/xhtml">
						<xsl:attribute name="href">#</xsl:attribute>
						<xsl:value-of select="/page/category/title"/>
					</xsl:element>
				</xsl:element>
				<xsl:element name="ul" namespace="http://www.w3.org/1999/xhtml">
					<xsl:attribute name="class">nav secondary-nav</xsl:attribute>
						<xsl:element name="li" namespace="http://www.w3.org/1999/xhtml">
							<xsl:element name="a" namespace="http://www.w3.org/1999/xhtml">
								<xsl:attribute name="href">/plf</xsl:attribute>
								%%faq.title%%
							</xsl:element>
						</xsl:element>
				</xsl:element>					
			</xsl:element>
		</xsl:element>
	</xsl:element>
	<xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
		<xsl:attribute name="class">container</xsl:attribute>
		<xsl:apply-templates/>
	
		<xsl:for-each select="/page/files/file">
			<xsl:apply-templates select="document(@name)/page/category" />
			<xsl:variable name="catname" select="document(@name)/page/category/name" />
			
			<xsl:element name="ul" namespace="http://www.w3.org/1999/xhtml">
				<xsl:for-each select="document(@name)/page/questions/question">
					<xsl:element name="li" namespace="http://www.w3.org/1999/xhtml">
						<xsl:attribute name="id">
							<xsl:value-of select="document(@name)/page/category/name"/>-question<xsl:value-of select="position()"/>
						</xsl:attribute>
						<xsl:element name="a" namespace="http://www.w3.org/1999/xhtml">
							<xsl:attribute name="href"><xsl:value-of select="$catname"/>.html#<xsl:value-of select="$catname"/>-answer<xsl:value-of select="position()"/></xsl:attribute>
							<xsl:value-of select="q" disable-output-escaping="yes"/>
						</xsl:element>
					</xsl:element>
				</xsl:for-each>
			</xsl:element>				
		</xsl:for-each>
	</xsl:element>
	</body>
</html>
</xsl:template>

<xsl:template match="page/hero">
	<xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
		<xsl:attribute name="class">extra</xsl:attribute>
		<xsl:element name="h1" namespace="http://www.w3.org/1999/xhtml">
			<xsl:value-of select="title"/>
		</xsl:element>
		<xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
			<xsl:value-of select="body" disable-output-escaping="yes"/>
		</xsl:element>
	</xsl:element>
</xsl:template>

<xsl:template match="/page/category">
	<xsl:element name="div" namespace="http://www.w3.org/1999/xhtml" >
		<xsl:attribute name="class">page-header</xsl:attribute>
		<xsl:element name="h1" namespace="http://www.w3.org/1999/xhtml">
			<xsl:attribute name="id">
				<xsl:value-of select="name"/>
			</xsl:attribute>
			<xsl:value-of select="title"/>
			<xsl:element name="small" namespace="http://www.w3.org/1999/xhtml"><xsl:value-of select="description"/></xsl:element>
		</xsl:element>
	</xsl:element>
</xsl:template>

<xsl:template match="page/questions">
		<xsl:element name="ul" namespace="http://www.w3.org/1999/xhtml">
			<xsl:for-each select="/page/questions/question">
				<xsl:element name="li" namespace="http://www.w3.org/1999/xhtml">
					<xsl:attribute name="id">
						<xsl:value-of select="/page/category/name"/>-question<xsl:value-of select="position()"/>
					</xsl:attribute>
					<xsl:element name="a" namespace="http://www.w3.org/1999/xhtml">
						<xsl:attribute name="href">#<xsl:value-of select="/page/category/name"/>-answer<xsl:value-of select="position()"/></xsl:attribute>
						<xsl:value-of select="q" disable-output-escaping="yes"/>
					</xsl:element>
				</xsl:element>
			</xsl:for-each>
		</xsl:element>	
	<xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
		<xsl:attribute name="class">answers</xsl:attribute>
			<xsl:for-each select="/page/questions/question">
				<xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
					<xsl:attribute name="id">
						<xsl:value-of select="/page/category/name"/>-answer<xsl:value-of select="position()"/>
					</xsl:attribute>
					<xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
						<xsl:attribute name="class">question</xsl:attribute>
						<xsl:element name="strong" namespace="http://www.w3.org/1999/xhtml">
							<xsl:value-of select="q" disable-output-escaping="yes"/>
						</xsl:element>
					</xsl:element>
					<xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
						<xsl:attribute name="class">answer</xsl:attribute>
						<xsl:value-of select="a" disable-output-escaping="yes"/>
					</xsl:element>
					<xsl:element name="ul" namespace="http://www.w3.org/1999/xhtml">
						<xsl:attribute name="class">refrences</xsl:attribute>
						<xsl:for-each select="refrences/refrence">
							<xsl:element name="li" namespace="http://www.w3.org/1999/xhtml">
								<xsl:element name="a" namespace="http://www.w3.org/1999/xhtml">
									<xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute>
									<xsl:value-of select="@title"/>
								</xsl:element>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
					<xsl:element name="a" namespace="http://www.w3.org/1999/xhtml">
						<xsl:attribute name="href">#<xsl:value-of select="/page/category/name"/>-question<xsl:value-of select="position()"/></xsl:attribute>
						%%back.to.top%%
					</xsl:element>
				</xsl:element>
			</xsl:for-each>
	</xsl:element>
</xsl:template>
<xsl:template match="page/files/file">
	
</xsl:template>
</xsl:stylesheet> 
