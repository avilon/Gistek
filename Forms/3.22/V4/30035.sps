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
						<properties columncount="1" columngap="0.50in" headerfooterheight="fixed" pagemultiplepages="0" pagenumberingformat="1" pagenumberingstartat="auto" pagestart="next" paperheight="11in" papermarginbottom="0.79in" papermarginfooter="0.30in" papermarginheader="0.30in" papermarginleft="0.60in" papermarginright="0.60in" papermargintop="0.79in" paperwidth="12.50in"/>
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
									<tgridcol>
										<properties width="1000"/>
										<styles width="10.99in"/>
									</tgridcol>
									<tgridcol>
										<properties width="1000"/>
										<styles width="inherit"/>
									</tgridcol>
								</children>
							</tgridbody-cols>
							<tgridbody-rows>
								<styles caption-side="top" table-layout="fixed" vertical-align="top"/>
								<children>
									<tgridrow>
										<styles height="6.31in" table-layout="fixed"/>
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
													<text fixtext="14	Промышленные запасы угля на конец"/>
													<newline/>
													<text fixtext="	отчетного года                                    _______________________ "/>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=27" match="strdata_012">
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
													<text fixtext="в том числе по маркам:   "/>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code!=27" match="strdata_012">
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
													<text fixtext="в том числе подготовленные   __________________ "/>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=28" match="strdata_013">
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
													<text fixtext="     из них готовые к выемке    __________________ "/>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=29" match="strdata_013">
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
													<newline/>
													<text fixtext="15.	Эксплуатационные потери угля  _________________ "/>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=30" match="strdata_013">
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
													<newline/>
													<text fixtext="16.	Количество уступов на конец отчетного года"/>
													<newline/>
													<text fixtext="	угольных    _____ "/>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=31" match="strdata_013">
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
													<text fixtext="	породных   _____ "/>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=32" match="strdata_013">
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
													<text fixtext="17.	Действующая длина уступов"/>
													<newline/>
													<text fixtext="	угольных    _____ "/>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=33" match="strdata_013">
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
													<text fixtext="	породных   _____ "/>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=34" match="strdata_013">
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
													<text fixtext=" м"/>
													<newline/>
													<text fixtext=" "/>
													<newline/>
													<text fixtext="18.	Среднедействующая высота уступов"/>
													<newline/>
													<text fixtext="	угольных    _____ "/>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=35" match="strdata_013">
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
													<text fixtext=" м"/>
													<newline/>
													<text fixtext="	породных   _____ "/>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=36" match="strdata_013">
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
													<text fixtext=" м"/>
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
					<text fixtext="Раздел II. Добыча угля и вскрышные работы за отчетный год"/>
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
													<text fixtext="Наименование"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="№ строки"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Единица измерения"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Фактически"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Зольность на рабочее топливо, %"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Общая влага рабочего топлива, %"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Содержа-ние серы на сухое состояние, %"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Выход летучих веществ, %"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Низшая теплота сгорания на рабочее  топливо, ккал/кг"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Толщина пластического слоя (для углей для коксования), мм"/>
												</children>
											</tgridcell>
										</children>
									</tgridrow>
									<tgridrow>
										<children>
											<tgridcell>
												<children>
													<text fixtext="А"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Б"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="В"/>
												</children>
											</tgridcell>
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
											<tgridcell>
												<children>
													<text fixtext="5"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="6"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="7"/>
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
															<template subtype="element" match="strdata_020">
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
																			<tgridcell/>
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
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="column3">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="column4">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="column5">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="column6">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="column7">
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
					<text fixtext="Раздел III. Использование фонда времени экскаваторов за отчетный год (часов)"/>
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
									<tgridcol/>
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
													<text fixtext="Виды работ"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<newline/>
													<newline/>
													<text fixtext="№ строки"/>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Календарный фонд"/>
													<newline/>
													<text fixtext="времени"/>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Число часов работы"/>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="В том числе в перегоне"/>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="ППР"/>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Регламентируемые простои"/>
												</children>
											</tgridcell>
											<tgridcell joinleft="1"/>
											<tgridcell>
												<children>
													<text fixtext="Непланируемые простои"/>
												</children>
											</tgridcell>
											<tgridcell joinleft="1"/>
											<tgridcell joinleft="1"/>
											<tgridcell joinleft="1"/>
											<tgridcell joinleft="1"/>
										</children>
									</tgridrow>
									<tgridrow>
										<children>
											<tgridcell joinabove="1"/>
											<tgridcell joinabove="1"/>
											<tgridcell joinabove="1"/>
											<tgridcell joinabove="1"/>
											<tgridcell joinabove="1"/>
											<tgridcell joinabove="1"/>
											<tgridcell>
												<children>
													<text fixtext="связанные с режимом работы экскаватора"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Выходные и праздничные дни"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Всего, из них"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="аварии и неполадки с экскаваторами"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Неподготовленность рабочего места"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="плохое состояние путей, аварии на транспорте"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="отсутствие средств"/>
													<newline/>
													<text fixtext="транспорта"/>
													<newline/>
												</children>
											</tgridcell>
										</children>
									</tgridrow>
									<tgridrow>
										<children>
											<tgridcell>
												<children>
													<text fixtext="А"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Б"/>
												</children>
											</tgridcell>
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
											<tgridcell>
												<children>
													<text fixtext="5"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="6"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="7"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="8"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="9"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="10"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="11"/>
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
															<template subtype="element" match="strdata_030">
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
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="column3">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="column4">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="column5">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="column6">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="column7">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="column8">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="column9">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="column10">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="column11">
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
					<text fixtext="                                                            "/>
					<newline/>
					<newline/>
					<text fixtext="Раздел IV. Показатели работы экскаваторов и погрузчиков за отчетный год"/>
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
								</children>
							</tgridbody-cols>
							<tgridheader-rows>
								<children>
									<tgridrow>
										<children>
											<tgridcell>
												<children>
													<text fixtext="Наименование"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="№ строки"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Среднесписочное число, шт."/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Объем работ,"/>
													<newline/>
													<text fixtext="тыс. м3"/>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Объем работ, тонн"/>
												</children>
											</tgridcell>
										</children>
									</tgridrow>
									<tgridrow>
										<children>
											<tgridcell>
												<children>
													<text fixtext="А"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Б"/>
												</children>
											</tgridcell>
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
															<template subtype="element" match="strdata_040">
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
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="column3">
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
					<text fixtext="Раздел V. Добыча угля и вскрышные работы по видам выемки и транспортировки за отчетный год"/>
					<newline/>
					<tgrid>
						<properties border="1" width="100%"/>
						<children>
							<tgridbody-cols>
								<children>
									<tgridcol/>
									<tgridcol/>
									<tgridcol/>
									<tgridcol/>
									<tgridcol/>
									<tgridcol/>
									<tgridcol/>
									<tgridcol/>
									<tgridcol/>
									<tgridcol/>
									<tgridcol/>
									<tgridcol/>
								</children>
							</tgridbody-cols>
							<tgridbody-rows>
								<children>
									<tgridrow>
										<children>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="На"/>
													<text fixtext="именование">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="№ строки">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="Ед.">
														<styles font-weight="bold"/>
													</text>
													<newline/>
													<text fixtext="изм.">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="Экскаваторами">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell joinleft="1">
												<styles text-align="center"/>
											</tgridcell>
											<tgridcell joinleft="1">
												<styles text-align="center"/>
											</tgridcell>
											<tgridcell joinleft="1">
												<styles text-align="center"/>
											</tgridcell>
											<tgridcell joinleft="1">
												<styles text-align="center"/>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="Гидравлическим способом">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="Прочими способами (указать какими)">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell joinleft="1">
												<styles text-align="center"/>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="Всего">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
										</children>
									</tgridrow>
									<tgridrow>
										<children>
											<tgridcell joinabove="1">
												<styles text-align="center"/>
											</tgridcell>
											<tgridcell joinabove="1">
												<styles text-align="center"/>
											</tgridcell>
											<tgridcell joinabove="1">
												<styles text-align="center"/>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="на ж.-д. транспорт">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="на конвейеры">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="на авто-транспорт">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="вскрыша отвальными мостами">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="бестранспортная вскрыша">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell joinabove="1">
												<styles text-align="center"/>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="всего">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="в т.ч. погрузчиками">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell joinabove="1">
												<styles text-align="center"/>
											</tgridcell>
										</children>
									</tgridrow>
									<tgridrow>
										<children>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="А">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="Б">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="В">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="1">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="2">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="3">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="4">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="5">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="6">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="7">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="8">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="9">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
										</children>
									</tgridrow>
									<tgridrow>
										<styles height="0.24in"/>
										<children>
											<tgridcell>
												<children>
													<text fixtext="Добыча"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="01"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="тыс. т"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=1" match="strdata_050">
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
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=6" match="strdata_050">
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
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=3" match="strdata_050">
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
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=7" match="strdata_050">
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
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=4" match="strdata_050">
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
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=74" match="strdata_050">
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
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=75" match="strdata_050">
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
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=76" match="strdata_050">
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
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=72" match="strdata_050">
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
												</children>
											</tgridcell>
										</children>
									</tgridrow>
									<tgridrow>
										<children>
											<tgridcell>
												<children>
													<text fixtext="Вскрыша"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="02"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="тыс. м3"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=1" match="strdata_050">
																				<children>
																					<template subtype="attribute" match="column2">
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
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=6" match="strdata_050">
																				<children>
																					<template subtype="attribute" match="column2">
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
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=3" match="strdata_050">
																				<children>
																					<template subtype="attribute" match="column2">
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
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=7" match="strdata_050">
																				<children>
																					<template subtype="attribute" match="column2">
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
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=4" match="strdata_050">
																				<children>
																					<template subtype="attribute" match="column2">
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
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=74" match="strdata_050">
																				<children>
																					<template subtype="attribute" match="column2">
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
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=75" match="strdata_050">
																				<children>
																					<template subtype="attribute" match="column2">
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
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=76" match="strdata_050">
																				<children>
																					<template subtype="attribute" match="column2">
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
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=72" match="strdata_050">
																				<children>
																					<template subtype="attribute" match="column2">
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
												</children>
											</tgridcell>
										</children>
									</tgridrow>
								</children>
							</tgridbody-rows>
						</children>
					</tgrid>
					<newline/>
					<newline/>
					<text fixtext="Раздел VI.  Показатели работы локомотивосоставов, занятых на транспортировке вскрыши"/>
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
													<text fixtext="№ п/п"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Наименование локомотива"/>
													<newline/>
													<text fixtext="(с составами)"/>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Среднемесячное количество локомотивосоставов по списку"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Всего погружено локомотивосоставов"/>
													<newline/>
													<text fixtext="за год"/>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Количество вывезенной вскрышной породы,"/>
													<newline/>
													<text fixtext="тыс. м3"/>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Среднее расстояние транспортировки,"/>
													<newline/>
													<text fixtext="км "/>
													<newline/>
												</children>
											</tgridcell>
										</children>
									</tgridrow>
									<tgridrow>
										<children>
											<tgridcell>
												<children>
													<text fixtext="А"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Б"/>
												</children>
											</tgridcell>
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
															<template subtype="element" match="strdata_060">
																<children>
																	<tgridrow>
																		<children>
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
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="column3">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="column4">
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
					<text fixtext="Раздел VII. Показатели работы буровых станков за отчетный год"/>
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
									<tgridcol/>
								</children>
							</tgridbody-cols>
							<tgridheader-rows>
								<children>
									<tgridrow>
										<children>
											<tgridcell>
												<children>
													<text fixtext="Наименование"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="№ строки"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Пробурено за год, пог.м"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Среднемесячное количество станков"/>
												</children>
											</tgridcell>
											<tgridcell joinleft="1"/>
											<tgridcell>
												<children>
													<text fixtext="Отработано за год станкосмен"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Среднемесячная произво-дительность списочного станка (гр.1:гр.2):12"/>
												</children>
											</tgridcell>
										</children>
									</tgridrow>
									<tgridrow>
										<children>
											<tgridcell joinabove="1"/>
											<tgridcell joinabove="1"/>
											<tgridcell joinabove="1"/>
											<tgridcell>
												<children>
													<text fixtext="по списку"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="в работе"/>
												</children>
											</tgridcell>
											<tgridcell joinabove="1"/>
											<tgridcell joinabove="1"/>
										</children>
									</tgridrow>
									<tgridrow>
										<children>
											<tgridcell>
												<children>
													<text fixtext="А"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Б"/>
												</children>
											</tgridcell>
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
											<tgridcell>
												<children>
													<text fixtext="5"/>
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
															<template subtype="element" match="strdata_070">
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
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="column3">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="column4">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="column5">
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
					<text fixtext="Раздел VIII. Наличие и использование оборудования на конец отчетного года"/>
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
													<text fixtext="Наименование"/>
													<newline/>
													<text fixtext="(тип и марка)"/>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="№ строки"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Единица измерения"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="В нали-чии"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="В том числе в работе"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="За отчетный год"/>
												</children>
											</tgridcell>
											<tgridcell joinleft="1"/>
											<tgridcell>
												<children>
													<text fixtext="Из общего наличия (гр.1)арендованное"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Из арендованного -по лизингу"/>
												</children>
											</tgridcell>
										</children>
									</tgridrow>
									<tgridrow>
										<children>
											<tgridcell joinabove="1"/>
											<tgridcell joinabove="1"/>
											<tgridcell joinabove="1"/>
											<tgridcell joinabove="1"/>
											<tgridcell joinabove="1"/>
											<tgridcell>
												<children>
													<text fixtext="Списано"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Приобретено"/>
												</children>
											</tgridcell>
											<tgridcell joinabove="1"/>
											<tgridcell joinabove="1"/>
										</children>
									</tgridrow>
									<tgridrow>
										<children>
											<tgridcell>
												<children>
													<text fixtext="А"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Б"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="В"/>
												</children>
											</tgridcell>
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
											<tgridcell>
												<children>
													<text fixtext="5"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="6"/>
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
															<template subtype="element" match="strdata_080">
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
																			<tgridcell/>
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
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="column3">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="column4">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="column5">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="column6">
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
					<text fixtext="Раздел IX. Численность персонала и производительность труда за отчетный год"/>
					<newline/>
					<tgrid>
						<properties border="1" width="100%"/>
						<children>
							<tgridbody-cols>
								<children>
									<tgridcol/>
									<tgridcol/>
									<tgridcol/>
									<tgridcol/>
									<tgridcol/>
									<tgridcol/>
									<tgridcol/>
									<tgridcol/>
									<tgridcol/>
									<tgridcol/>
									<tgridcol/>
									<tgridcol/>
									<tgridcol/>
									<tgridcol/>
								</children>
							</tgridbody-cols>
							<tgridbody-rows>
								<children>
									<tgridrow>
										<children>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="Наименова">
														<styles font-weight="bold"/>
													</text>
													<newline/>
													<text fixtext="ние">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="№ строки">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="Среднесписочная численность">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell joinleft="1">
												<styles text-align="center"/>
											</tgridcell>
											<tgridcell joinleft="1">
												<styles text-align="center"/>
											</tgridcell>
											<tgridcell joinleft="1">
												<styles text-align="center"/>
											</tgridcell>
											<tgridcell joinleft="1">
												<styles text-align="center"/>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="Всего персонала на конец отчетного года ">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="Добыча уг-ля, приня-тая к учету для определения произво-дительности труда">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="Среднемесячная производительность труда">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell joinleft="1">
												<styles text-align="center"/>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="Отработано человеко-дней рабочими по добыче угля">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="Из них:">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell joinleft="1">
												<styles text-align="center"/>
											</tgridcell>
										</children>
									</tgridrow>
									<tgridrow>
										<children>
											<tgridcell joinabove="1">
												<styles text-align="center"/>
											</tgridcell>
											<tgridcell joinabove="1">
												<styles text-align="center"/>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="рабочие на добычных работах">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="рабочие на вскрышных работах">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="рабочие прочих цехов">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="рабочие по добыче угля) (гр.1+гр.2">
														<styles font-weight="bold"/>
													</text>
													<newline/>
													<text fixtext="+гр.3)">
														<styles font-weight="bold"/>
													</text>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="всего работников по основному виду деятельности">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell joinabove="1">
												<styles text-align="center"/>
											</tgridcell>
											<tgridcell joinabove="1">
												<styles text-align="center"/>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="рабочего по добыче угля (гр.7:гр.4) :12, т">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="рабочего на вскрыше, м3">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell joinabove="1">
												<styles text-align="center"/>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="на добычных работах">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="на вскрышных работах">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
										</children>
									</tgridrow>
									<tgridrow>
										<children>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="А">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="Б">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="1">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="2">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="3">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="4">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="5">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="6">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="7">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="8">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="9">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="10">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="11">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="12">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
										</children>
									</tgridrow>
									<tgridrow>
										<children>
											<tgridcell>
												<children>
													<text fixtext="Фактически"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="01"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=148" match="strdata_090">
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
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=149" match="strdata_090">
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
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=150" match="strdata_090">
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
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=151" match="strdata_090">
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
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=152" match="strdata_090">
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
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=153" match="strdata_090">
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
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=154" match="strdata_090">
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
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=155" match="strdata_090">
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
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=156" match="strdata_090">
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
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=157" match="strdata_090">
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
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=158" match="strdata_090">
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
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<template subtype="source" match="XML">
														<children>
															<template subtype="element" match="document">
																<children>
																	<template subtype="element" match="flat">
																		<children>
																			<template subtype="element" filter="@code=159" match="strdata_090">
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
												</children>
											</tgridcell>
										</children>
									</tgridrow>
								</children>
							</tgridbody-rows>
						</children>
					</tgrid>
					<newline/>
					<text fixtext="Распределение акций по акционерам"/>
					<newline/>
					<tgrid>
						<properties border="1" width="100%"/>
						<children>
							<tgridbody-cols>
								<children>
									<tgridcol/>
									<tgridcol/>
									<tgridcol/>
									<tgridcol/>
								</children>
							</tgridbody-cols>
							<tgridbody-rows>
								<children>
									<tgridrow>
										<children>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="№п/п">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="Наименование">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="Количество акций">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="% от уставного капитала">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
										</children>
									</tgridrow>
									<tgridrow>
										<children>
											<tgridcell/>
											<tgridcell/>
											<tgridcell/>
											<tgridcell/>
										</children>
									</tgridrow>
									<tgridrow>
										<children>
											<tgridcell/>
											<tgridcell/>
											<tgridcell/>
											<tgridcell/>
										</children>
									</tgridrow>
									<tgridrow>
										<children>
											<tgridcell/>
											<tgridcell/>
											<tgridcell/>
											<tgridcell/>
										</children>
									</tgridrow>
									<tgridrow>
										<children>
											<tgridcell/>
											<tgridcell/>
											<tgridcell/>
											<tgridcell/>
										</children>
									</tgridrow>
								</children>
							</tgridbody-rows>
						</children>
					</tgrid>
					<newline/>
					<text fixtext="«____» ___________20__ год"/>
					<newline/>
					<text fixtext="(дата предоставления"/>
					<newline/>
					<text fixtext=" информации в "/>
					<newline/>
					<text fixtext="государственную информационную "/>
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
