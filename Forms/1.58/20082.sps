<?xml version="1.0" encoding="UTF-8"?>
<structure version="17" html-doctype="HTML4 Transitional" compatibility-view="IE9" html-outputextent="Complete" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="ISO-8859-1" encodingpdf="UTF-8" useimportschema="1" embed-images="1" enable-authentic-scripts="1" authentic-scripts-in-debug-mode-external="0" generated-file-location="DEFAULT">
	<parameters/>
	<schemasources>
		<namespaces/>
		<schemasources>
			<xsdschemasource name="XML" main="1" schemafile="20082_rpt.xsd" workingxmlfile="20082_rpt.xml"/>
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
					<text fixtext="Сведения о поставке нефти и газового конденсата на внутренний рынок">
						<styles font-size="16pt"/>
					</text>
					<newline/>
					<line/>
					<text fixtext="Раздел 1. Сведения о трубопроводной транспортировке и распределении нефти и газового конденсата на внутреннем рынке"/>
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
													<text fixtext="Грузоотправитель"/>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Импорт продукта"/>
													<newline/>
													<text fixtext="(Да/Нет)"/>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Направление использования продукта"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Грузополучатель/"/>
													<newline/>
													<text fixtext="Объект по-требления"/>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Пункт назначения"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Код строки"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Объем сдачи, план, т"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Объем сдачи, "/>
													<newline/>
													<text fixtext="факт, т"/>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Стоимость отгруженного продукта,"/>
													<newline/>
													<text fixtext="тыс. руб."/>
													<newline/>
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
											<tgridcell joinabove="1"/>
											<tgridcell/>
											<tgridcell/>
											<tgridcell/>
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
															<template subtype="element" match="strfree_1">
																<children>
																	<tgridrow>
																		<children>
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
					<newline/>
					<text fixtext="Раздел 2. Сведения о транспортировке прочими видами транспорта и распределении нефти и газового конденсата на внутреннем рынке"/>
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
													<text fixtext="Грузоотправитель"/>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Импорт продукта"/>
													<newline/>
													<text fixtext="(Да/Нет)"/>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Направление использования продукта"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Вид транспортировки"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Грузополу-чатель/"/>
													<newline/>
													<text fixtext="Объект потребления"/>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Пункт назначения"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Код строки"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Объем сдачи, план, т"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Объем сдачи, "/>
													<newline/>
													<text fixtext="факт, т"/>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Стоимость отгруженного продукта,"/>
													<newline/>
													<text fixtext="тыс. руб."/>
													<newline/>
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
											<tgridcell joinabove="1"/>
											<tgridcell joinabove="1"/>
											<tgridcell/>
											<tgridcell/>
											<tgridcell/>
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
															<template subtype="element" match="strfree_2">
																<children>
																	<tgridrow>
																		<children>
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
					<newline/>
					<text fixtext="Cлужебный раздел">
						<styles font-size="larger"/>
					</text>
					<newline/>
					<line/>
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
								<children>
									<tgridrow>
										<children>
											<tgridcell>
												<children>
													<text fixtext="Служебная информация">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Значение 1">
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
													<text fixtext="Наименование отчитывающейся организации"/>
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
																			<template subtype="element" match="strServiceInf">
																				<children>
																					<template subtype="attribute" match="col1">
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
													<text fixtext="Почтовый адрес"/>
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
																			<template subtype="element" match="strServiceInf">
																				<children>
																					<template subtype="attribute" match="col2">
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
													<text fixtext="Фактический адрес"/>
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
																			<template subtype="element" match="strServiceInf">
																				<children>
																					<template subtype="attribute" match="col3">
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
													<text fixtext="ОГРН (Основной государственный регистрационный номер)"/>
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
																			<template subtype="element" match="strServiceInf">
																				<children>
																					<template subtype="attribute" match="col4">
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
													<text fixtext="ИНН (Идентификационный номер налогоплательщика)"/>
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
																			<template subtype="element" match="strServiceInf">
																				<children>
																					<template subtype="attribute" match="col5">
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
													<text fixtext="КПП (Код причины постановки на учет)"/>
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
																			<template subtype="element" match="strServiceInf">
																				<children>
																					<template subtype="attribute" match="col6">
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
										<styles height="0.24in"/>
										<children>
											<tgridcell>
												<children>
													<text fixtext="ОКПО (Общероссийский классификатор предприятий и организаций)"/>
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
																			<template subtype="element" match="strServiceInf">
																				<children>
																					<template subtype="attribute" match="col7">
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
													<text fixtext="ОКВЭД (Код вида деятельности)"/>
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
																			<template subtype="element" match="strServiceInf">
																				<children>
																					<template subtype="attribute" match="col8">
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
													<text fixtext="ОКАТО (Код территории)"/>
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
																			<template subtype="element" match="strServiceInf">
																				<children>
																					<template subtype="attribute" match="col9">
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
													<text fixtext="ОКОГУ (Код министерства (ведомства), органа управления)"/>
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
																			<template subtype="element" match="strServiceInf">
																				<children>
																					<template subtype="attribute" match="col10">
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
													<text fixtext="ОКОПФ (Код организационно-правовой формы)"/>
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
																			<template subtype="element" match="strServiceInf">
																				<children>
																					<template subtype="attribute" match="col11">
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
													<text fixtext="ОКФС (Код формы собственности)"/>
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
																			<template subtype="element" match="strServiceInf">
																				<children>
																					<template subtype="attribute" match="col12">
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
					<text fixtext="Контактная информация">
						<styles font-size="larger"/>
					</text>
					<newline/>
					<newline/>
					<tgrid>
						<properties border="1"/>
						<children>
							<tgridbody-cols>
								<children>
									<tgridcol/>
									<tgridcol>
										<styles width="4in"/>
									</tgridcol>
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
													<text fixtext="Контактная информация"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Ф.И.О"/>
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
													<text fixtext="Электронный адрес"/>
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
					<text fixtext="информационную систему "/>
					<newline/>
					<text fixtext="топливно-энергетического "/>
					<newline/>
					<text fixtext="комплекса)"/>
					<newline/>
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