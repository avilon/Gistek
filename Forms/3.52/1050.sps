<?xml version="1.0" encoding="UTF-8"?>
<structure version="17" html-doctype="HTML4 Transitional" compatibility-view="IE9" html-outputextent="Complete" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="ISO-8859-1" encodingpdf="UTF-8" useimportschema="1" embed-images="1" enable-authentic-scripts="1" authentic-scripts-in-debug-mode-external="0" generated-file-location="DEFAULT">
	<parameters/>
	<schemasources>
		<namespaces/>
		<schemasources>
			<xsdschemasource name="XML" main="1" schemafile="1050_rpt.xsd" workingxmlfile="1050_rpt.xml"/>
		</schemasources>
	</schemasources>
	<modules/>
	<flags>
		<scripts/>
		<mainparts/>
		<globalparts/>
		<designfragments/>
		<pagelayouts/>
		<xpath-functions/>
	</flags>
	<scripts>
		<script language="javascript"/>
	</scripts>
	<script-project>
		<Project version="3" app="AuthenticView"/>
	</script-project>
	<importedxslt/>
	<globalstyles/>
	<mainparts>
		<children>
			<globaltemplate subtype="main" match="/">
				<document-properties/>
				<children>
					<documentsection>
						<properties columncount="1" columngap="0.50in" headerfooterheight="fixed" pagemultiplepages="0" pagenumberingformat="1" pagenumberingstartat="auto" pagestart="next" paperheight="11in" papermarginbottom="0.79in" papermarginfooter="0.30in" papermarginheader="0.30in" papermarginleft="0.60in" papermarginright="0.60in" papermargintop="0.79in" paperwidth="8.50in"/>
						<watermark>
							<image transparency="50" fill-page="1" center-if-not-fill="1"/>
							<text transparency="50"/>
						</watermark>
					</documentsection>
					<text fixtext="Сведения о поставках угля и угольной продукции по направлениям использования">
						<styles font-size="16pt"/>
					</text>
					<newline/>
					<text fixtext="за __________________20 ___ г."/>
					<newline/>
					<line/>
					<text fixtext="Наименование отчитывающейся организации:"/>
					<newline/>
					<text fixtext="ОГРН/ИНН/ОКПО:"/>
					<newline/>
					<text fixtext="Почтовый адрес:"/>
					<newline/>
					<newline/>
					<text fixtext="Раздел 1. Сведения о поставках угля и угольной продукции по направлениям использования "/>
					<newline/>
					<tgrid>
						<properties border="1"/>
						<children>
							<tgridbody-cols>
								<children>
									<tgridcol/>
									<tgridcol/>
									<tgridcol/>
									<tgridcol/>
								</children>
							</tgridbody-cols>
							<tgridheader-rows>
								<children>
									<tgridrow>
										<children>
											<tgridcell>
												<children>
													<text fixtext="Направление поставки "/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Код строки "/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Фактическая поставка за месяц, (тонн) "/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Фактическая поставка с начала года, (тонн) "/>
												</children>
											</tgridcell>
										</children>
									</tgridrow>
									<tgridrow>
										<children>
											<tgridcell joinabove="1"/>
											<tgridcell joinabove="1"/>
											<tgridcell>
												<children>
													<text fixtext="1"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="2"/>
												</children>
											</tgridcell>
										</children>
									</tgridrow>
								</children>
							</tgridheader-rows>
							<tgridbody-rows>
								<children>
									<template subtype="source" match="XML">
										<children>
											<template subtype="element" match="document">
												<children>
													<template subtype="element" match="flat">
														<children>
															<template subtype="element" match="strdata">
																<children>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="name">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="code">
																						<children>
																							<content subtype="regular">
																								<format basic-type="xsd" datatype="short"/>
																							</content>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="column1">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="column2">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																</children>
																<variables/>
															</template>
														</children>
														<variables/>
													</template>
												</children>
												<variables/>
											</template>
										</children>
										<variables/>
									</template>
								</children>
							</tgridbody-rows>
						</children>
					</tgrid>
					<newline/>
					<text fixtext="Служебный раздел">
						<styles font-size="16pt"/>
					</text>
					<newline/>
					<line/>
					<tgrid>
						<properties border="1"/>
						<children>
							<tgridbody-cols>
								<children>
									<tgridcol/>
									<tgridcol/>
									<tgridcol/>
								</children>
							</tgridbody-cols>
							<tgridheader-rows>
								<children>
									<tgridrow>
										<children>
											<tgridcell>
												<children>
													<text fixtext="Служебная информация "/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Значение 1"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Значение 2"/>
												</children>
											</tgridcell>
										</children>
									</tgridrow>
								</children>
							</tgridheader-rows>
							<tgridbody-rows>
								<children>
									<template subtype="source" match="XML">
										<children>
											<template subtype="element" match="document">
												<children>
													<template subtype="element" match="flat">
														<children>
															<template subtype="element" match="strServiceInf">
																<children>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="name">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="code">
																						<children>
																							<content subtype="regular">
																								<format basic-type="xsd" datatype="short"/>
																							</content>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="col1">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																</children>
																<variables/>
															</template>
														</children>
														<variables/>
													</template>
												</children>
												<variables/>
											</template>
										</children>
										<variables/>
									</template>
								</children>
							</tgridbody-rows>
						</children>
					</tgrid>
					<newline/>
					<text fixtext="Контактная информация "/>
					<newline/>
					<tgrid>
						<properties border="1"/>
						<children>
							<tgridbody-cols>
								<children>
									<tgridcol/>
									<tgridcol/>
									<tgridcol/>
									<tgridcol/>
									<tgridcol/>
									<tgridcol/>
								</children>
							</tgridbody-cols>
							<tgridheader-rows>
								<children>
									<tgridrow>
										<children>
											<tgridcell>
												<children>
													<text fixtext="Контактная информация "/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Код"/>
													<newline/>
													<text fixtext="строки"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Ф.И.О."/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Должность"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Контактный телефон (с кодом города)"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Электрнный адрес"/>
												</children>
											</tgridcell>
										</children>
									</tgridrow>
									<tgridrow>
										<children>
											<tgridcell joinabove="1"/>
											<tgridcell joinabove="1"/>
											<tgridcell>
												<children>
													<text fixtext="1"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="2"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="3"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="4"/>
												</children>
											</tgridcell>
										</children>
									</tgridrow>
								</children>
							</tgridheader-rows>
							<tgridbody-rows>
								<children>
									<template subtype="source" match="XML">
										<children>
											<template subtype="element" match="document">
												<children>
													<template subtype="element" match="flat">
														<children>
															<template subtype="element" match="strContactInf">
																<children>
																	<tgridrow>
																		<children>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="name">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="code">
																						<children>
																							<content subtype="regular">
																								<format basic-type="xsd" datatype="byte"/>
																							</content>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="col1">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="col2">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="col3">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="col4">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																		</children>
																	</tgridrow>
																</children>
																<variables/>
															</template>
														</children>
														<variables/>
													</template>
												</children>
												<variables/>
											</template>
										</children>
										<variables/>
									</template>
								</children>
							</tgridbody-rows>
						</children>
					</tgrid>
					<newline/>
					<text fixtext="«____» ___________20__ год"/>
					<newline/>
					<text fixtext="(дата предоставления "/>
					<newline/>
					<text fixtext="информации в "/>
					<newline/>
					<text fixtext="государственную "/>
					<newline/>
					<text fixtext="информационную "/>
					<newline/>
					<text fixtext="систему топливно-энергетического "/>
					<newline/>
					<text fixtext="комплекса)"/>
					<newline/>
					<newline/>
				</children>
			</globaltemplate>
		</children>
	</mainparts>
	<globalparts/>
	<designfragments/>
	<xmltables/>
	<authentic-custom-toolbar-buttons/>
</structure>