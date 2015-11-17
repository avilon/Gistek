<?xml version="1.0" encoding="UTF-8"?>
<structure version="17" html-doctype="HTML4 Transitional" compatibility-view="IE9" html-outputextent="Complete" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="ISO-8859-1" encodingpdf="UTF-8" useimportschema="1" embed-images="1" enable-authentic-scripts="1" authentic-scripts-in-debug-mode-external="0" generated-file-location="DEFAULT">
	<parameters/>
	<schemasources>
		<namespaces/>
		<schemasources>
			<xsdschemasource name="XML" main="1" schemafile="30035.xsd" workingxmlfile="30035.xml"/>
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
						<properties columncount="2" columngap="0.50in" headerfooterheight="fixed" pagemultiplepages="0" pagenumberingformat="1" pagenumberingstartat="auto" pagestart="next" paperheight="11in" papermarginbottom="0.79in" papermarginfooter="0.30in" papermarginheader="0.30in" papermarginleft="0.60in" papermarginright="0.60in" papermargintop="0.79in" paperwidth="8.50in"/>
						<watermark>
							<image transparency="50" fill-page="1" center-if-not-fill="1"/>
							<text transparency="50"/>
						</watermark>
					</documentsection>
					<newline/>
					<text fixtext="Раздел I. Общие сведения"/>
					<newline/>
					<text fixtext="Отчетный период: 20__ год."/>
					<newline/>
					<text fixtext="Количество разрезов, включенных в отчет: административных (структурных единиц)__________, технических единиц___________"/>
					<newline/>
					<newline/>
					<newline/>
					<tgrid>
						<properties border="1" width="100%"/>
						<children>
							<tgridbody-cols>
								<children>
									<tgridcol/>
									<tgridcol/>
								</children>
							</tgridbody-cols>
							<tgridbody-rows>
								<styles caption-side="top" table-layout="fixed"/>
								<children>
									<tgridrow>
										<styles height="6.31in"/>
										<children>
											<tgridcell>
												<styles caption-side="top" text-align="left"/>
												<children>
													<text fixtext="1.	Сведения о лицензиях на добычу угля :"/>
													<newline/>
													<text fixtext="	номер и дата выдачи лицензии __________________________"/>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=3" match="strdata_010">
																				<children>
																					<template subtype="attribute" match="column1">
																						<children>
																							<content subtype="regular"/>
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
														<variables/>
													</template>
													<newline/>
													<text fixtext="срок действия лицензии с "/>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=5" match="strdata_010">
																				<children>
																					<template subtype="attribute" match="column1">
																						<children>
																							<content subtype="regular"/>
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
														<variables/>
													</template>
													<text fixtext=" по "/>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=6" match="strdata_010">
																				<children>
																					<template subtype="attribute" match="column1">
																						<children>
																							<content subtype="regular"/>
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
														<variables/>
													</template>
													<newline/>
													<newline/>
													<text fixtext="2.	Производственная мощность на конец отчетного года  "/>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=7" match="strdata_010">
																				<children>
																					<template subtype="attribute" match="column1">
																						<children>
																							<content subtype="regular"/>
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
														<variables/>
													</template>
													<text fixtext="  тыс.т"/>
													<newline/>
													<text fixtext="	ввод мощности за отчетный период    ________________ "/>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=8" match="strdata_010">
																				<children>
																					<template subtype="attribute" match="column1">
																						<children>
																							<content subtype="regular"/>
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
														<variables/>
													</template>
													<text fixtext=" тыс.т"/>
													<newline/>
													<text fixtext="	выбытие мощностей за отчетный период_____________ "/>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=9" match="strdata_010">
																				<children>
																					<template subtype="attribute" match="column1">
																						<children>
																							<content subtype="regular"/>
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
														<variables/>
													</template>
													<text fixtext="тыс.т"/>
													<newline/>
													<text fixtext="	       использование среднегодовой мощности __________  "/>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=10" match="strdata_010">
																				<children>
																					<template subtype="attribute" match="column1">
																						<children>
																							<content subtype="regular"/>
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
														<variables/>
													</template>
													<text fixtext=" %"/>
													<newline/>
													<newline/>
													<text fixtext="3.	Год сдачи в эксплуатацию / последней реконструкции ______ "/>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=11" match="strdata_010">
																				<children>
																					<template subtype="attribute" match="column1">
																						<children>
																							<content subtype="regular"/>
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
														<variables/>
													</template>
													<newline/>
													<newline/>
													<text fixtext="4.	Месторождение  _____________________________________ "/>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=12" match="strdata_010">
																				<children>
																					<template subtype="attribute" match="column1">
																						<children>
																							<content subtype="regular"/>
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
														<variables/>
													</template>
													<newline/>
													<newline/>
													<text fixtext="5.	Максимальная глубина разработки на конец  года ______ "/>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=15" match="strdata_010">
																				<children>
																					<template subtype="attribute" match="column1">
																						<children>
																							<content subtype="regular"/>
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
														<variables/>
													</template>
													<text fixtext="  м."/>
													<newline/>
													<newline/>
													<text fixtext="6.	Приток воды: нормальный     ______  "/>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=16" match="strdata_010">
																				<children>
																					<template subtype="attribute" match="column1">
																						<children>
																							<content subtype="regular"/>
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
														<variables/>
													</template>
													<text fixtext=" м3/ч"/>
													<newline/>
													<text fixtext="	максимальный сезонный _____ "/>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=17" match="strdata_010">
																				<children>
																					<template subtype="attribute" match="column1">
																						<children>
																							<content subtype="regular"/>
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
														<variables/>
													</template>
													<text fixtext=" м3/ч"/>
													<newline/>
													<newline/>
													<text fixtext="7.	Число разрабатываемых пластов на конец года (в сводных отчетах по компании - не заполнять)   _______ "/>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=18" match="strdata_010">
																				<children>
																					<template subtype="attribute" match="column1">
																						<children>
																							<content subtype="regular"/>
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
														<variables/>
													</template>
													<newline/>
													<newline/>
													<text fixtext="8.	Их суммарная мощность геологическая/рабочая _______ "/>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=19" match="strdata_010">
																				<children>
																					<template subtype="attribute" match="column1">
																						<children>
																							<content subtype="regular"/>
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
														<variables/>
													</template>
													<text fixtext="  / "/>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=20" match="strdata_010">
																				<children>
																					<template subtype="attribute" match="column1">
																						<children>
																							<content subtype="regular"/>
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
														<variables/>
													</template>
													<text fixtext="м"/>
													<newline/>
													<newline/>
													<text fixtext="9.	Угол падения разрабатываемых пластов:"/>
													<newline/>
													<text fixtext="	       от  _____ "/>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=21" match="strdata_010">
																				<children>
																					<template subtype="attribute" match="column1">
																						<children>
																							<content subtype="regular"/>
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
														<variables/>
													</template>
													<text fixtext=" о"/>
													<newline/>
													<text fixtext="	       до _____ "/>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=22" match="strdata_010">
																				<children>
																					<template subtype="attribute" match="column1">
																						<children>
																							<content subtype="regular"/>
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
														<variables/>
													</template>
													<text fixtext=" о "/>
													<newline/>
													<newline/>
													<text fixtext="10.	Средний объемный вес угля __________ "/>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=23" match="strdata_010">
																				<children>
																					<template subtype="attribute" match="column1">
																						<children>
																							<content subtype="regular"/>
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
														<variables/>
													</template>
													<text fixtext=" т/м3	"/>
													<newline/>
													<newline/>
													<text fixtext="11.	Мощность покрывающих (вмещающих) пород на конец года _____ "/>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=24" match="strdata_010">
																				<children>
																					<template subtype="attribute" match="column1">
																						<children>
																							<content subtype="regular"/>
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
														<variables/>
													</template>
													<text fixtext="  м"/>
													<newline/>
													<newline/>
													<text fixtext="12.	Средний объемный вес вскрышных пород _______ "/>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=25" match="strdata_010">
																				<children>
																					<template subtype="attribute" match="column1">
																						<children>
																							<content subtype="regular"/>
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
														<variables/>
													</template>
													<text fixtext=" т/м3"/>
													<newline/>
													<newline/>
													<newline/>
													<newline/>
													<newline/>
													<newline/>
													<newline/>
													<newline/>
													<newline/>
													<newline/>
													<newline/>
													<newline/>
													<newline/>
													<newline/>
													<newline/>
													<newline/>
													<newline/>
													<newline/>
													<newline/>
													<newline/>
													<newline/>
													<newline/>
													<newline/>
													<newline/>
													<newline/>
													<newline/>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<styles caption-side="top"/>
												<children>
													<text fixtext="13.	Балансовые запасы угля (кат. А+В+С1) "/>
													<newline/>
													<text fixtext="	на конец отчетного года "/>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=26" match="strdata_011">
																				<children>
																					<template subtype="attribute" match="column1">
																						<children>
																							<content subtype="regular"/>
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
														<variables/>
													</template>
													<text fixtext="  тыс.т"/>
													<newline/>
													<text fixtext="в том числе по маркам:  "/>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code!=26" match="strdata_011">
																				<children>
																					<template subtype="userdefined" match="concat( &quot;        &quot; ,  @name ,  &quot; _____  &quot;, @column1 )">
																						<children>
																							<paragraph paragraphtag="p">
																								<children>
																									<content subtype="regular"/>
																								</children>
																							</paragraph>
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
														<variables/>
													</template>
													<newline/>
													<newline/>
												</children>
											</tgridcell>
										</children>
									</tgridrow>
								</children>
							</tgridbody-rows>
						</children>
					</tgrid>
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
