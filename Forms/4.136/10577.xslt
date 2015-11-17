<?xml version="1.0" encoding="UTF-8"?>
<!--Designed and generated by Altova StyleVision Enterprise Edition 2015 sp2 - see http://www.altova.com/stylevision for more information.-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:altova="http://www.altova.com" xmlns:altovaext="http://www.altova.com/xslt-extensions" xmlns:clitype="clitype" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:iso4217="http://www.xbrl.org/2003/iso4217" xmlns:ix="http://www.xbrl.org/2008/inlineXBRL" xmlns:java="java" xmlns:link="http://www.xbrl.org/2003/linkbase" xmlns:map="http://www.w3.org/2005/xpath-functions/map" xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:sps="http://www.altova.com/StyleVision/user-xpath-functions" xmlns:xbrldi="http://xbrl.org/2006/xbrldi" xmlns:xbrli="http://www.xbrl.org/2003/instance" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="#all">
	<xsl:output version="4.0" method="html" indent="no" encoding="UTF-8" use-character-maps="spaces" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN" doctype-system="http://www.w3.org/TR/html4/loose.dtd"/>
	<xsl:character-map name="spaces">
		<xsl:output-character character="&#160;" string="&amp;nbsp;"/>
	</xsl:character-map>
	<xsl:param name="altova:bGeneratingFromPxf" select="false()"/>
	<xsl:param name="SV_OutputFormat" select="'HTML'"/>
	<xsl:param name="SV_BaseOutputFileName" as="xs:string?">
		<xsl:sequence select="for $i in altovaext:get-base-output-uri(), $j in tokenize( $i, &apos;[/\\]&apos; )[last()] return replace( $j, &apos;\.[^\.\s#%;]*$&apos;, &apos;&apos; )" use-when="function-available(&apos;altovaext:get-base-output-uri&apos;)"/>
	</xsl:param>
	<xsl:param name="SV_GeneratedFileNamePrefix" select="if ( $SV_BaseOutputFileName ) then $SV_BaseOutputFileName else &apos;10577&apos;" as="xs:string?"/>
	<xsl:variable name="XML" select="/"/>
	<xsl:variable name="altova:nPxPerIn" select="96"/>
	<xsl:import-schema schema-location="10577.xsd" use-when="system-property('xsl:is-schema-aware')='yes'"/>
	<xsl:variable name="altova:CssImages" select="()"/>
	<xsl:template match="/">
		<xsl:call-template name="altova:Root"/>
	</xsl:template>
	<xsl:template name="altova:Root">
		<html>
			<head>
				<title/>
				<meta name="generator" content="Altova StyleVision Enterprise Edition 2015 sp2 (http://www.altova.com)"/>
				<meta http-equiv="X-UA-Compatible" content="IE=7"/>
				<xsl:comment>[if IE]&gt;&lt;STYLE type=&quot;text/css&quot;&gt;.altova-rotate-left-textbox{filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=3)} .altova-rotate-right-textbox{filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=1)} &lt;/STYLE&gt;&lt;![endif]</xsl:comment>
				<xsl:comment>[if !IE]&gt;&lt;!</xsl:comment>
				<style type="text/css">.altova-rotate-left-textbox{-webkit-transform: rotate(-90deg) translate(-100%, 0%); -webkit-transform-origin: 0% 0%;-moz-transform: rotate(-90deg) translate(-100%, 0%); -moz-transform-origin: 0% 0%;-ms-transform: rotate(-90deg) translate(-100%, 0%); -ms-transform-origin: 0% 0%;}.altova-rotate-right-textbox{-webkit-transform: rotate(90deg) translate(0%, -100%); -webkit-transform-origin: 0% 0%;-moz-transform: rotate(90deg) translate(0%, -100%); -moz-transform-origin: 0% 0%;-ms-transform: rotate(90deg) translate(0%, -100%); -ms-transform-origin: 0% 0%;}</style>
				<xsl:comment>&lt;![endif]</xsl:comment>
				<style type="text/css">@page { margin-left:0.79in; margin-right:0.79in; margin-top:0.60in; margin-bottom:0.60in } @media print { br.altova-page-break { page-break-before: always; } }</style>
			</head>
			<body>
				<xsl:for-each select="$XML">
					<pre style="text-align:right; ">
						<span style="font-family:Times New Roman; padding-left:inherit; ">
							<xsl:text>Приложение № 1.75</xsl:text>
						</span>
						<br/>
						<span style="font-family:Times New Roman; padding-left:inherit; ">
							<xsl:text>к приказу Минэнерго России</xsl:text>
						</span>
						<br/>
						<span style="font-family:Times New Roman; padding-left:inherit; ">
							<xsl:text>от «__» ______ 2015 г. №___</xsl:text>
						</span>
					</pre>
					<center>
						<span style="font-family:Times New Roman; font-size:12pt; font-weight:bold; ">
							<xsl:text>ГОСУДАРСТВЕННАЯ ИНФОРМАЦИОННАЯ СИСТЕМА ТОПЛИВНО-ЭНЕРГЕТИЧЕСКОГО КОМПЛЕКСА</xsl:text>
						</span>
					</center>
					<xsl:variable name="altova:table">
						<table border="1" width="100%">
							<xsl:variable name="altova:CurrContextGrid_0" select="."/>
							<xsl:variable name="altova:ColumnData"/>
							<tbody>
								<tr>
									<td>
										<center>
											<span style="font-family:Times New Roman; font-size:12pt; ">
												<xsl:text>ПРЕДОСТАВЛЯЕТСЯ В ЭЛЕКТРОННОМ ВИДЕ </xsl:text>
											</span>
											<br/>
											<span style="font-family:Times New Roman; font-size:12pt; ">
												<xsl:text>В МИНИСТЕРСТВО ЭНЕРГЕТИКИ РОССИЙСКОЙ ФЕДЕРАЦИИ</xsl:text>
											</span>
										</center>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:variable>
					<xsl:variable name="altova:col-count" select="sum( for $altova:cell in $altova:table/table/(thead | tbody | tfoot)[ 1 ]/tr[ 1 ]/(th | td) return altova:col-span( $altova:cell ) )"/>
					<xsl:variable name="altova:generate-cols" as="xs:boolean*" select="for $altova:pos in 1 to $altova:col-count return true()"/>
					<xsl:apply-templates select="$altova:table" mode="altova:generate-table">
						<xsl:with-param name="altova:generate-cols" select="$altova:generate-cols"/>
					</xsl:apply-templates>
					<span style="font-size:8pt; ">
						<xsl:text>&#160;</xsl:text>
					</span>
					<br/>
					<xsl:variable name="altova:table">
						<table border="1" width="100%">
							<xsl:variable name="altova:CurrContextGrid_1" select="."/>
							<xsl:variable name="altova:ColumnData"/>
							<tbody>
								<tr>
									<td style="text-align:center; ">
										<center>
											<span style="font-family:Times New Roman; font-size:12pt; font-weight:bold; ">
												<xsl:text>Сведения о привлечении кредитных ресурсов</xsl:text>
											</span>
										</center>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:variable>
					<xsl:variable name="altova:col-count" select="sum( for $altova:cell in $altova:table/table/(thead | tbody | tfoot)[ 1 ]/tr[ 1 ]/(th | td) return altova:col-span( $altova:cell ) )"/>
					<xsl:variable name="altova:generate-cols" as="xs:boolean*" select="for $altova:pos in 1 to $altova:col-count return true()"/>
					<xsl:apply-templates select="$altova:table" mode="altova:generate-table">
						<xsl:with-param name="altova:generate-cols" select="$altova:generate-cols"/>
					</xsl:apply-templates>
					<span>
						<xsl:text>&#160;</xsl:text>
					</span>
					<br/>
					<xsl:variable name="altova:table">
						<table border="1" width="100%">
							<xsl:variable name="altova:CurrContextGrid_2" select="."/>
							<xsl:variable name="altova:ColumnData"/>
							<tbody>
								<tr>
									<td width="60%">
										<center>
											<span style="font-family:Times New Roman; font-size:12pt; ">
												<xsl:text>Сегмент в области</xsl:text>
											</span>
											<br/>
											<span style="font-family:Times New Roman; font-size:12pt; ">
												<xsl:text>электроэнергетики, теплоэнергетики</xsl:text>
											</span>
										</center>
									</td>
									<td>
										<center>
											<span style="font-family:Times New Roman; font-size:12pt; ">
												<xsl:text>Шифр формы: 4.136.</xsl:text>
											</span>
										</center>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:variable>
					<xsl:variable name="altova:col-count" select="sum( for $altova:cell in $altova:table/table/(thead | tbody | tfoot)[ 1 ]/tr[ 1 ]/(th | td) return altova:col-span( $altova:cell ) )"/>
					<xsl:variable name="altova:generate-cols" as="xs:boolean*" select="for $altova:pos in 1 to $altova:col-count return true()"/>
					<xsl:apply-templates select="$altova:table" mode="altova:generate-table">
						<xsl:with-param name="altova:generate-cols" select="$altova:generate-cols"/>
					</xsl:apply-templates>
					<span>
						<xsl:text>&#160;</xsl:text>
					</span>
					<br/>
					<xsl:variable name="altova:table">
						<table border="1" width="100%">
							<xsl:variable name="altova:CurrContextGrid_3" select="."/>
							<xsl:variable name="altova:ColumnData"/>
							<tbody>
								<tr>
									<td width="60%">
										<center>
											<span style="font-family:Times New Roman; font-size:12pt; ">
												<xsl:text>Представляют:</xsl:text>
											</span>
										</center>
									</td>
									<td width="20%">
										<center>
											<span style="font-family:Times New Roman; font-size:12pt; ">
												<xsl:text>Сроки представления:</xsl:text>
											</span>
										</center>
									</td>
									<td width="20%">
										<center>
											<span style="font-family:Times New Roman; font-size:12pt; ">
												<xsl:text>Периодичность предоставления:</xsl:text>
											</span>
										</center>
									</td>
								</tr>
								<tr>
									<td width="60%">
										<span style="font-family:Times New Roman; font-size:12pt; ">
											<xsl:text>субъекты оптового рынка электрической энергии и мощности</xsl:text>
										</span>
										<br/>
									</td>
									<td width="20%">
										<span style="font-family:Times New Roman; font-size:12pt; ">
											<xsl:text>до 20-го числа месяца, следующего за отчетным периодом</xsl:text>
										</span>
									</td>
									<td width="20%">
										<center>
											<span style="font-family:Times New Roman; font-size:12pt; ">
												<xsl:text>ежемесячная</xsl:text>
											</span>
										</center>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:variable>
					<xsl:variable name="altova:col-count" select="sum( for $altova:cell in $altova:table/table/(thead | tbody | tfoot)[ 1 ]/tr[ 1 ]/(th | td) return altova:col-span( $altova:cell ) )"/>
					<xsl:variable name="altova:generate-cols" as="xs:boolean*" select="for $altova:pos in 1 to $altova:col-count return true()"/>
					<xsl:apply-templates select="$altova:table" mode="altova:generate-table">
						<xsl:with-param name="altova:generate-cols" select="$altova:generate-cols"/>
					</xsl:apply-templates>
					<br/>
					<xsl:variable name="altova:table">
						<table border="1" width="100%">
							<xsl:variable name="altova:CurrContextGrid_4" select="."/>
							<xsl:variable name="altova:ColumnData"/>
							<tbody>
								<tr>
									<td style="width:3.38in; " valign="baseline">
										<span style="font-family:Times New Roman; font-size:12pt; ">
											<xsl:text>Наименование отчитывающейся организации:</xsl:text>
										</span>
									</td>
									<td>
										<xsl:for-each select="document">
											<xsl:for-each select="flat">
												<xsl:for-each select="strsubject[@id=321]">
													<xsl:for-each select="@col1">
														<span style="font-family:Times New Roman; font-size:12pt; ">
															<xsl:value-of select="string(.)"/>
														</span>
													</xsl:for-each>
												</xsl:for-each>
											</xsl:for-each>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td style="width:3.38in; " valign="baseline">
										<span style="font-family:Times New Roman; font-size:12pt; ">
											<xsl:text>ОГРН/ИНН/ОКПО/ОКОГУ:</xsl:text>
										</span>
									</td>
									<td>
										<xsl:for-each select="document">
											<xsl:for-each select="flat">
												<xsl:for-each select="strsubject[@id=324]">
													<xsl:for-each select="@col1">
														<span style="font-family:Times New Roman; font-size:12pt; ">
															<xsl:value-of select="string(.)"/>
														</span>
													</xsl:for-each>
												</xsl:for-each>
											</xsl:for-each>
										</xsl:for-each>
										<span style="font-family:Times New Roman; font-size:12pt; ">
											<xsl:text>/</xsl:text>
										</span>
										<xsl:for-each select="document">
											<xsl:for-each select="flat">
												<xsl:for-each select="strsubject[@id=325]">
													<xsl:for-each select="@col1">
														<span style="font-family:Times New Roman; font-size:12pt; ">
															<xsl:value-of select="string(.)"/>
														</span>
													</xsl:for-each>
												</xsl:for-each>
											</xsl:for-each>
										</xsl:for-each>
										<span style="font-family:Times New Roman; font-size:12pt; ">
											<xsl:text>/</xsl:text>
										</span>
										<xsl:for-each select="document">
											<xsl:for-each select="flat">
												<xsl:for-each select="strsubject[@id=327]">
													<xsl:for-each select="@col1">
														<span style="font-family:Times New Roman; font-size:12pt; ">
															<xsl:value-of select="string(.)"/>
														</span>
													</xsl:for-each>
												</xsl:for-each>
											</xsl:for-each>
										</xsl:for-each>
										<span>
											<xsl:text>/</xsl:text>
										</span>
										<xsl:for-each select="document">
											<xsl:for-each select="flat">
												<xsl:for-each select="strsubject[@id=330]">
													<xsl:for-each select="@col1">
														<span style="font-family:Times New Roman; font-size:12pt; ">
															<xsl:value-of select="string(.)"/>
														</span>
													</xsl:for-each>
												</xsl:for-each>
											</xsl:for-each>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td style="width:3.38in; " valign="baseline">
										<span style="font-family:Times New Roman; font-size:12pt; ">
											<xsl:text>Почтовый адрес:</xsl:text>
										</span>
									</td>
									<td>
										<xsl:for-each select="document">
											<xsl:for-each select="flat">
												<xsl:for-each select="strsubject[@id=322]">
													<xsl:for-each select="@col1">
														<span style="font-family:Times New Roman; font-size:12pt; ">
															<xsl:value-of select="string(.)"/>
														</span>
													</xsl:for-each>
												</xsl:for-each>
											</xsl:for-each>
										</xsl:for-each>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:variable>
					<xsl:variable name="altova:col-count" select="sum( for $altova:cell in $altova:table/table/(thead | tbody | tfoot)[ 1 ]/tr[ 1 ]/(th | td) return altova:col-span( $altova:cell ) )"/>
					<xsl:variable name="altova:generate-cols" as="xs:boolean*" select="for $altova:pos in 1 to $altova:col-count return true()"/>
					<xsl:apply-templates select="$altova:table" mode="altova:generate-table">
						<xsl:with-param name="altova:generate-cols" select="$altova:generate-cols"/>
					</xsl:apply-templates>
					<br class="altova-page-break" clear="all"/>
					<center/>
					<span style="font-family:Times New Roman; font-size:12pt; ">
						<xsl:text>Раздел 1. Сведения о кредитах и займах в российских рублях</xsl:text>
					</span>
					<br/>
					<xsl:variable name="altova:table">
						<table border="0" width="100%">
							<xsl:variable name="altova:CurrContextGrid_5" select="."/>
							<xsl:variable name="altova:ColumnData"/>
							<tbody>
								<tr>
									<td style="text-align:right; ">
										<span>
											<xsl:text>Коды по ОКЕИ: тысяча рублей&#160; - 384</xsl:text>
										</span>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:variable>
					<xsl:variable name="altova:col-count" select="sum( for $altova:cell in $altova:table/table/(thead | tbody | tfoot)[ 1 ]/tr[ 1 ]/(th | td) return altova:col-span( $altova:cell ) )"/>
					<xsl:variable name="altova:generate-cols" as="xs:boolean*" select="for $altova:pos in 1 to $altova:col-count return true()"/>
					<xsl:apply-templates select="$altova:table" mode="altova:generate-table">
						<xsl:with-param name="altova:generate-cols" select="$altova:generate-cols"/>
					</xsl:apply-templates>
					<xsl:variable name="altova:table">
						<table border="1" width="100%">
							<xsl:variable name="altova:CurrContextGrid_6" select="."/>
							<xsl:variable name="altova:ColumnData"/>
							<thead align="center" valign="middle">
								<tr>
									<th>
										<span style="font-family:Times New Roman; font-size:12pt; ">
											<xsl:text>Код строки</xsl:text>
										</span>
									</th>
									<th>
										<span style="font-family:Times New Roman; font-size:12pt; ">
											<xsl:text>Наименование показателей</xsl:text>
										</span>
									</th>
									<th>
										<span style="font-family:Times New Roman; font-size:12pt; ">
											<xsl:text>Всего</xsl:text>
										</span>
									</th>
									<th>
										<span style="font-family:Times New Roman; font-size:12pt; ">
											<xsl:text>Краткосрочные кредиты и займы (до 12 месяцев)</xsl:text>
										</span>
									</th>
									<th>
										<span style="font-family:Times New Roman; font-size:12pt; ">
											<xsl:text>Долгосрочные кредиты и займы (свыше 12 месяцев)</xsl:text>
										</span>
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="document">
									<xsl:for-each select="flat">
										<xsl:for-each select="strdata1">
											<tr>
												<td style="text-align:center; ">
													<xsl:for-each select="@id">
														<span style="font-family:Times New Roman; font-size:12pt; ">
															<xsl:value-of select="string(.)"/>
														</span>
													</xsl:for-each>
												</td>
												<td>
													<xsl:for-each select="@name">
														<span style="font-family:Times New Roman; font-size:12pt; ">
															<xsl:value-of select="string(.)"/>
														</span>
													</xsl:for-each>
												</td>
												<td style="text-align:right; ">
													<xsl:for-each select="@col1">
														<span style="font-family:Times New Roman; font-size:12pt; ">
															<xsl:value-of select="string(.)"/>
														</span>
													</xsl:for-each>
												</td>
												<td style="text-align:right; ">
													<xsl:for-each select="@col2">
														<span style="font-family:Times New Roman; font-size:12pt; ">
															<xsl:value-of select="string(.)"/>
														</span>
													</xsl:for-each>
												</td>
												<td style="text-align:right; ">
													<xsl:for-each select="@col3">
														<span style="font-family:Times New Roman; font-size:12pt; ">
															<xsl:value-of select="string(.)"/>
														</span>
													</xsl:for-each>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:variable>
					<xsl:variable name="altova:col-count" select="sum( for $altova:cell in $altova:table/table/(thead | tbody | tfoot)[ 1 ]/tr[ 1 ]/(th | td) return altova:col-span( $altova:cell ) )"/>
					<xsl:variable name="altova:generate-cols" as="xs:boolean*" select="for $altova:pos in 1 to $altova:col-count return true()"/>
					<xsl:apply-templates select="$altova:table" mode="altova:generate-table">
						<xsl:with-param name="altova:generate-cols" select="$altova:generate-cols"/>
					</xsl:apply-templates>
					<br/>
					<span style="font-family:Times New Roman; font-size:12pt; ">
						<xsl:text>Раздел 2. Сведения о кредитах и займах в иностранной валюте</xsl:text>
					</span>
					<br/>
					<xsl:variable name="altova:table">
						<table border="1" width="100%">
							<xsl:variable name="altova:CurrContextGrid_7" select="."/>
							<xsl:variable name="altova:ColumnData"/>
							<thead align="center" valign="middle">
								<tr>
									<th>
										<span style="font-family:Times New Roman; font-size:12pt; ">
											<xsl:text>Код строки</xsl:text>
										</span>
									</th>
									<th>
										<span style="font-family:Times New Roman; font-size:12pt; ">
											<xsl:text>Наименование показателей</xsl:text>
										</span>
									</th>
									<th>
										<span style="font-family:Times New Roman; font-size:12pt; ">
											<xsl:text>Всего</xsl:text>
										</span>
									</th>
									<th>
										<span style="font-family:Times New Roman; font-size:12pt; ">
											<xsl:text>Краткосрочные кредиты и займы (до 12 месяцев)</xsl:text>
										</span>
									</th>
									<th>
										<span style="font-family:Times New Roman; font-size:12pt; ">
											<xsl:text>Долгосрочные кредиты и займы (свыше 12 месяцев)</xsl:text>
										</span>
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="document">
									<xsl:for-each select="flat">
										<xsl:for-each select="strdata2">
											<tr>
												<td style="text-align:center; ">
													<xsl:for-each select="@id">
														<span style="font-family:Times New Roman; font-size:12pt; ">
															<xsl:value-of select="string(.)"/>
														</span>
													</xsl:for-each>
												</td>
												<td>
													<xsl:for-each select="@name">
														<span style="font-family:Times New Roman; font-size:12pt; ">
															<xsl:value-of select="string(.)"/>
														</span>
													</xsl:for-each>
												</td>
												<td style="text-align:right; ">
													<xsl:for-each select="@col1">
														<span style="font-family:Times New Roman; font-size:12pt; ">
															<xsl:value-of select="string(.)"/>
														</span>
													</xsl:for-each>
												</td>
												<td style="text-align:right; ">
													<xsl:for-each select="@col2">
														<span style="font-family:Times New Roman; font-size:12pt; ">
															<xsl:value-of select="string(.)"/>
														</span>
													</xsl:for-each>
												</td>
												<td style="text-align:right; ">
													<xsl:for-each select="@col3">
														<span style="font-family:Times New Roman; font-size:12pt; ">
															<xsl:value-of select="string(.)"/>
														</span>
													</xsl:for-each>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:variable>
					<xsl:variable name="altova:col-count" select="sum( for $altova:cell in $altova:table/table/(thead | tbody | tfoot)[ 1 ]/tr[ 1 ]/(th | td) return altova:col-span( $altova:cell ) )"/>
					<xsl:variable name="altova:generate-cols" as="xs:boolean*" select="for $altova:pos in 1 to $altova:col-count return true()"/>
					<xsl:apply-templates select="$altova:table" mode="altova:generate-table">
						<xsl:with-param name="altova:generate-cols" select="$altova:generate-cols"/>
					</xsl:apply-templates>
					<br class="altova-page-break" clear="all"/>
					<center/>
					<span style="font-family:Times New Roman; font-size:12pt; ">
						<xsl:text>Раздел 3. Дата предоставления информации для включения в государственную информационную систему топливно-энергетического комплекса</xsl:text>
					</span>
					<br/>
					<xsl:variable name="altova:table">
						<table border="1" width="100%">
							<xsl:variable name="altova:CurrContextGrid_8" select="."/>
							<xsl:variable name="altova:ColumnData"/>
							<tbody>
								<tr>
									<td width="80%">
										<span style="font-family:Times New Roman; font-size:12pt; ">
											<xsl:text>Дата предоставления информации для включения в государственную информационную систему топливно-энергетического комплекса</xsl:text>
										</span>
									</td>
									<td/>
								</tr>
							</tbody>
						</table>
					</xsl:variable>
					<xsl:variable name="altova:col-count" select="sum( for $altova:cell in $altova:table/table/(thead | tbody | tfoot)[ 1 ]/tr[ 1 ]/(th | td) return altova:col-span( $altova:cell ) )"/>
					<xsl:variable name="altova:generate-cols" as="xs:boolean*" select="for $altova:pos in 1 to $altova:col-count return true()"/>
					<xsl:apply-templates select="$altova:table" mode="altova:generate-table">
						<xsl:with-param name="altova:generate-cols" select="$altova:generate-cols"/>
					</xsl:apply-templates>
					<br/>
					<span style="font-family:Times New Roman; font-size:12pt; ">
						<xsl:text>Раздел 4. Контактная информация</xsl:text>
					</span>
					<br/>
					<xsl:variable name="altova:table">
						<table border="1" width="100%">
							<xsl:variable name="altova:CurrContextGrid_9" select="."/>
							<xsl:variable name="altova:ColumnData"/>
							<thead align="center" valign="middle">
								<tr>
									<th rowspan="2" style="text-align:center; ">
										<span style="font-family:Times New Roman; font-size:12pt; ">
											<xsl:text>Контактная информация</xsl:text>
										</span>
									</th>
									<th rowspan="2" style="text-align:center; ">
										<span style="font-family:Times New Roman; font-size:12pt; ">
											<xsl:text>Код строки</xsl:text>
										</span>
									</th>
									<th style="text-align:center; ">
										<span style="font-family:Times New Roman; font-size:12pt; ">
											<xsl:text>ФИО</xsl:text>
										</span>
									</th>
									<th style="text-align:center; ">
										<span style="font-family:Times New Roman; font-size:12pt; ">
											<xsl:text>Должность</xsl:text>
										</span>
									</th>
									<th style="text-align:center; ">
										<span style="font-family:Times New Roman; font-size:12pt; ">
											<xsl:text>Контактный телефон </xsl:text>
										</span>
										<br/>
										<span style="font-family:Times New Roman; font-size:12pt; ">
											<xsl:text>(с кодом города)</xsl:text>
										</span>
										<br/>
									</th>
									<th style="text-align:center; ">
										<span style="font-family:Times New Roman; font-size:12pt; ">
											<xsl:text>Электронный адрес</xsl:text>
										</span>
									</th>
								</tr>
								<tr>
									<th style="text-align:center; ">
										<span style="font-family:Times New Roman; font-size:12pt; ">
											<xsl:text>1</xsl:text>
										</span>
									</th>
									<th style="text-align:center; ">
										<span style="font-family:Times New Roman; font-size:12pt; ">
											<xsl:text>2</xsl:text>
										</span>
									</th>
									<th style="text-align:center; ">
										<span style="font-family:Times New Roman; font-size:12pt; ">
											<xsl:text>3</xsl:text>
										</span>
									</th>
									<th style="text-align:center; ">
										<span style="font-family:Times New Roman; font-size:12pt; ">
											<xsl:text>4</xsl:text>
										</span>
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="document">
									<xsl:for-each select="flat">
										<xsl:for-each select="strcontact">
											<tr>
												<td>
													<xsl:for-each select="@name">
														<span style="font-family:Times New Roman; font-size:12pt; ">
															<xsl:value-of select="string(.)"/>
														</span>
													</xsl:for-each>
												</td>
												<td style="text-align:center; ">
													<xsl:for-each select="@id">
														<span style="font-family:Times New Roman; font-size:12pt; ">
															<xsl:value-of select="string(.)"/>
														</span>
													</xsl:for-each>
												</td>
												<td>
													<xsl:for-each select="@col1">
														<span style="font-family:Times New Roman; font-size:12pt; ">
															<xsl:value-of select="string(.)"/>
														</span>
													</xsl:for-each>
												</td>
												<td>
													<xsl:for-each select="@col2">
														<span style="font-family:Times New Roman; font-size:12pt; ">
															<xsl:value-of select="string(.)"/>
														</span>
													</xsl:for-each>
												</td>
												<td>
													<xsl:for-each select="@col3">
														<span style="font-family:Times New Roman; font-size:12pt; ">
															<xsl:value-of select="string(.)"/>
														</span>
													</xsl:for-each>
												</td>
												<td>
													<xsl:for-each select="@col4">
														<span style="font-family:Times New Roman; font-size:12pt; ">
															<xsl:value-of select="string(.)"/>
														</span>
													</xsl:for-each>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:variable>
					<xsl:variable name="altova:col-count" select="sum( for $altova:cell in $altova:table/table/(thead | tbody | tfoot)[ 1 ]/tr[ 1 ]/(th | td) return altova:col-span( $altova:cell ) )"/>
					<xsl:variable name="altova:generate-cols" as="xs:boolean*" select="for $altova:pos in 1 to $altova:col-count return true()"/>
					<xsl:apply-templates select="$altova:table" mode="altova:generate-table">
						<xsl:with-param name="altova:generate-cols" select="$altova:generate-cols"/>
					</xsl:apply-templates>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
	<xsl:function name="altova:is-cell-empty" as="xs:boolean">
		<xsl:param name="altova:cell" as="element()"/>
		<xsl:sequence select="altova:is-node-empty( $altova:cell )"/>
	</xsl:function>
	<xsl:function name="altova:is-node-empty" as="xs:boolean">
		<xsl:param name="altova:node" as="element()"/>
		<xsl:sequence select="every $altova:child in $altova:node/child::node() satisfies ( ( boolean( $altova:child/self::text() ) and string-length( $altova:child ) = 0 ) or ( ( boolean( $altova:child/self::div ) or boolean( $altova:child/self::span ) or boolean( $altova:child/self::a ) ) and altova:is-node-empty( $altova:child ) ) )"/>
	</xsl:function>
	<xsl:function name="altova:col-span" as="xs:integer">
		<xsl:param name="altova:cell" as="element()"/>
		<xsl:sequence select="if ( exists( $altova:cell/@colspan ) ) then xs:integer( $altova:cell/@colspan ) else 1"/>
	</xsl:function>
	<xsl:template match="@* | node()" mode="altova:generate-table">
		<xsl:param name="altova:generate-cols"/>
		<xsl:copy>
			<xsl:apply-templates select="@* | node()" mode="#current">
				<xsl:with-param name="altova:generate-cols" select="$altova:generate-cols"/>
			</xsl:apply-templates>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="tbody" mode="altova:generate-table">
		<xsl:param name="altova:generate-cols"/>
		<xsl:choose>
			<xsl:when test="empty(tr)">
				<xsl:copy>
					<tr>
						<td/>
					</tr>
				</xsl:copy>
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy>
					<xsl:apply-templates select="@* | node()" mode="#current">
						<xsl:with-param name="altova:generate-cols" select="$altova:generate-cols"/>
					</xsl:apply-templates>
				</xsl:copy>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="th | td" mode="altova:generate-table">
		<xsl:choose>
			<xsl:when test="altova:is-cell-empty( . )">
				<xsl:copy>
					<xsl:apply-templates select="@*" mode="#current"/>
					<xsl:text>&#160;</xsl:text>
				</xsl:copy>
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy>
					<xsl:apply-templates select="@* | node()" mode="#current"/>
				</xsl:copy>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:function name="altova:GetChartYValuesForSingleSeries">
		<xsl:param name="seqCategoryLeafPos" as="node()*"/>
		<xsl:param name="nodeSeriesLeafPos" as="node()"/>
		<xsl:param name="bValuesInCategory" as="xs:boolean"/>
		<xsl:for-each select="$seqCategoryLeafPos">
			<xsl:element name="altova:Value">
				<xsl:value-of select="altova:GetChartYValueForSingleSeriesPos($nodeSeriesLeafPos, ., $bValuesInCategory)"/>
			</xsl:element>
		</xsl:for-each>
	</xsl:function>
	<xsl:function name="altova:GetChartYValueForSingleSeriesPos">
		<xsl:param name="nodeSeriesLeafPos" as="node()"/>
		<xsl:param name="nodeCategoryLeafPos" as="node()"/>
		<xsl:param name="bValuesInCategory" as="xs:boolean"/>
		<xsl:variable name="altova:seqCategoryContextIds" select="$nodeCategoryLeafPos/altova:Context/@altova:ContextId" as="xs:string*"/>
		<xsl:variable name="altova:seqSeriesContextIds" select="$nodeSeriesLeafPos/altova:Context/@altova:ContextId" as="xs:string*"/>
		<xsl:variable name="altova:sCommonContextId" select="for $i in $altova:seqCategoryContextIds return if (some $j in $altova:seqSeriesContextIds satisfies $i eq $j) then $i else ()" as="xs:string*"/>
		<xsl:choose>
			<xsl:when test="count($altova:sCommonContextId) gt 1">
				<xsl:message select="concat('Found several values instead of a single one (contexts: ', string-join($altova:sCommonContextId, ', '), ').')" terminate="yes"/>
			</xsl:when>
			<xsl:when test="count($altova:sCommonContextId) lt 1">
				<xsl:message select="concat('XBRL Chart: Info: No value found for position labeled &quot;', $nodeCategoryLeafPos/@altova:sLabel, '&quot;')" terminate="no"/>
				<xsl:sequence select="'altova:no-value'"/>
			</xsl:when>
			<xsl:when test="$bValuesInCategory">
				<xsl:sequence select="xs:string($nodeCategoryLeafPos/altova:Context[@altova:ContextId eq $altova:sCommonContextId]/@altova:Value)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="xs:string($nodeSeriesLeafPos/altova:Context[@altova:ContextId eq $altova:sCommonContextId]/@altova:Value)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<xsl:function name="altova:GetChartLabelForPos" as="xs:string">
		<xsl:param name="nodeParam" as="node()"/>
		<xsl:value-of select="string-join($nodeParam/ancestor-or-self::altova:Pos/@altova:sLabel, ' ')"/>
	</xsl:function>
	<xsl:function name="altova:convert-length-to-pixel" as="xs:decimal">
		<xsl:param name="altova:length"/>
		<xsl:variable name="normLength" select="normalize-space($altova:length)"/>
		<xsl:choose>
			<xsl:when test="ends-with($normLength, 'px')">
				<xsl:value-of select="substring-before($normLength, 'px')"/>
			</xsl:when>
			<xsl:when test="ends-with($normLength, 'in')">
				<xsl:value-of select="xs:decimal(substring-before($normLength, 'in')) * $altova:nPxPerIn"/>
			</xsl:when>
			<xsl:when test="ends-with($normLength, 'cm')">
				<xsl:value-of select="xs:decimal(substring-before($normLength, 'cm')) * $altova:nPxPerIn div 2.54"/>
			</xsl:when>
			<xsl:when test="ends-with($normLength, 'mm')">
				<xsl:value-of select="xs:decimal(substring-before($normLength, 'mm')) * $altova:nPxPerIn div 25.4"/>
			</xsl:when>
			<xsl:when test="ends-with($normLength, 'pt')">
				<xsl:value-of select="xs:decimal(substring-before($normLength, 'pt')) * $altova:nPxPerIn div 72.0"/>
			</xsl:when>
			<xsl:when test="ends-with($normLength, 'pc')">
				<xsl:value-of select="xs:decimal(substring-before($normLength, 'pc')) * $altova:nPxPerIn div 6.0"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$normLength"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
	<xsl:function name="altova:convert-length-to-mm" as="xs:decimal">
		<xsl:param name="altova:length"/>
		<xsl:variable name="normLength" select="normalize-space($altova:length)"/>
		<xsl:choose>
			<xsl:when test="ends-with($normLength, 'px')">
				<xsl:value-of select="xs:decimal(substring-before($normLength, 'px')) div $altova:nPxPerIn * 25.4"/>
			</xsl:when>
			<xsl:when test="ends-with($normLength, 'in')">
				<xsl:value-of select="xs:decimal(substring-before($normLength, 'in')) * 25.4"/>
			</xsl:when>
			<xsl:when test="ends-with($normLength, 'cm')">
				<xsl:value-of select="xs:decimal(substring-before($normLength, 'cm')) * 10"/>
			</xsl:when>
			<xsl:when test="ends-with($normLength, 'mm')">
				<xsl:value-of select="substring-before($normLength, 'mm') "/>
			</xsl:when>
			<xsl:when test="ends-with($normLength, 'pt')">
				<xsl:value-of select="xs:decimal(substring-before($normLength, 'pt')) * 25.4 div 72.0"/>
			</xsl:when>
			<xsl:when test="ends-with($normLength, 'pc')">
				<xsl:value-of select="xs:decimal(substring-before($normLength, 'pc')) * 25.4 div 6.0"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="number($normLength) div $altova:nPxPerIn * 25.4"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
</xsl:stylesheet>
