<?xml version="1.0" encoding="UTF-8"?>
<structure version="17" html-doctype="HTML4 Transitional" compatibility-view="IE9" html-outputextent="Complete" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="ISO-8859-1" encodingpdf="UTF-8" useimportschema="1" embed-images="1" enable-authentic-scripts="1" authentic-scripts-in-debug-mode-external="0" generated-file-location="DEFAULT">
	<parameters/>
	<schemasources>
		<namespaces/>
		<schemasources>
			<xsdschemasource name="XML" main="1" schemafile="70124.xsd" workingxmlfile="70124.xml"/>
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
					<text fixtext="Сводная форма мониторинга реализации программы энергосбережения и повышения энергетической эффективности организаций, осуществляющих регулируемые виды деятельности">
						<styles font-size="16pt"/>
					</text>
					<newline/>
					<line/>
					<text fixtext="Раздел  1 Краткая информация о программе"/>
					<newline/>
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
											<tgridcell/>
											<tgridcell>
												<children>
													<text fixtext="Код строки"/>
												</children>
											</tgridcell>
											<tgridcell/>
										</children>
									</tgridrow>
									<tgridrow>
										<children>
											<tgridcell>
												<children>
													<text fixtext="A"/>
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
															<template subtype="element" filter="@code&lt;5" match="strdata">
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
					<text fixtext="Раздел 2 Затраты на реализацию программы"/>
					<newline/>
					<newline/>
					<tgrid>
						<properties border="1" width="100%"/>
						<children>
							<tgridbody-cols>
								<children>
									<tgridcol/>
									<tgridcol/>
									<tgridcol>
										<styles width="0.38in"/>
									</tgridcol>
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
													<text fixtext="Период">
														<styles font-weight="bold"/>
													</text>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="План/факт/отклонение">
														<styles font-weight="bold"/>
													</text>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="Код строки">
														<styles font-weight="bold"/>
													</text>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="Затраты, млн. руб. без НДС	">
														<styles font-weight="bold"/>
													</text>
													<newline/>
													<text fixtext="	">
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
													<text fixtext="Доля затрат в инвестиционной программе, направленной на реализацию целевых мероприятий в области энергосбережения и повышения энергетической эффективности, %">
														<styles font-weight="bold"/>
													</text>
													<newline/>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="Топливно-энергетические ресурсы (ТЭР)							">
														<styles font-weight="bold"/>
													</text>
													<newline/>
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
											<tgridcell joinleft="1">
												<styles text-align="center"/>
											</tgridcell>
											<tgridcell joinleft="1">
												<styles text-align="center"/>
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
											<tgridcell joinabove="1">
												<styles text-align="center"/>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="всего">
														<styles font-weight="bold"/>
													</text>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="в т. ч. ">
														<styles font-weight="bold"/>
													</text>
													<newline/>
													<text fixtext="капитальные">
														<styles font-weight="bold"/>
													</text>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell joinabove="1">
												<styles text-align="center"/>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="при осуществлении регулируемого вида деятельности			">
														<styles font-weight="bold"/>
													</text>
													<newline/>
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
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="при осуществлении прочей деятельности, в т. ч. хозяйственные нужды			">
														<styles font-weight="bold"/>
													</text>
													<newline/>
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
													<text fixtext="суммарные затраты ТЭР	">
														<styles font-weight="bold"/>
													</text>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell joinleft="1">
												<styles text-align="center"/>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="экономия ТЭР в результате реализации программы	">
														<styles font-weight="bold"/>
													</text>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell joinleft="1">
												<styles text-align="center"/>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="суммарные затраты ТЭР	">
														<styles font-weight="bold"/>
													</text>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell joinleft="1">
												<styles text-align="center"/>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="экономия ТЭР в результате реализации программы	">
														<styles font-weight="bold"/>
													</text>
													<newline/>
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
											<tgridcell joinabove="1">
												<styles text-align="center"/>
											</tgridcell>
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
													<text fixtext="т у. т. без учета воды">
														<styles font-weight="bold"/>
													</text>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="млн. руб. без НДС с учетом воды">
														<styles font-weight="bold"/>
													</text>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="т у. т. без учета воды">
														<styles font-weight="bold"/>
													</text>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="млн. руб. без НДС с учетом воды">
														<styles font-weight="bold"/>
													</text>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="т у. т. без учета воды">
														<styles font-weight="bold"/>
													</text>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="млн. руб. без НДС с учетом воды">
														<styles font-weight="bold"/>
													</text>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="т у. т. без учета воды">
														<styles font-weight="bold"/>
													</text>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="млн. руб. без НДС с учетом воды">
														<styles font-weight="bold"/>
													</text>
													<newline/>
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
										</children>
									</tgridrow>
									<tgridrow>
										<children>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="за отчетный год">
														<styles font-weight="bold"/>
													</text>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="left"/>
												<children>
													<text fixtext="план">
														<styles font-weight="bold"/>
													</text>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="005">
														<styles font-weight="bold"/>
													</text>
													<newline/>
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
																			<template subtype="element" filter="@code=5" match="strdata">
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
																			<template subtype="element" filter="@code=5" match="strdata">
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
																			<template subtype="element" filter="@code=5" match="strdata">
																				<children>
																					<template subtype="attribute" match="column3">
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
																			<template subtype="element" filter="@code=5" match="strdata">
																				<children>
																					<template subtype="attribute" match="column4">
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
																			<template subtype="element" filter="@code=5" match="strdata">
																				<children>
																					<template subtype="attribute" match="column5">
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
																			<template subtype="element" filter="@code=5" match="strdata">
																				<children>
																					<template subtype="attribute" match="column6">
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
																			<template subtype="element" filter="@code=5" match="strdata">
																				<children>
																					<template subtype="attribute" match="column7">
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
																			<template subtype="element" filter="@code=5" match="strdata">
																				<children>
																					<template subtype="attribute" match="column8">
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
																			<template subtype="element" filter="@code=5" match="strdata">
																				<children>
																					<template subtype="attribute" match="column9">
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
																			<template subtype="element" filter="@code=5" match="strdata">
																				<children>
																					<template subtype="attribute" match="column10">
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
																			<template subtype="element" filter="@code=5" match="strdata">
																				<children>
																					<template subtype="attribute" match="column11">
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
											<tgridcell joinabove="1"/>
											<tgridcell>
												<children>
													<text fixtext="факт">
														<styles font-weight="bold"/>
													</text>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="006">
														<styles font-weight="bold"/>
													</text>
													<newline/>
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
																			<template subtype="element" filter="@code=6" match="strdata">
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
																			<template subtype="element" filter="@code=6" match="strdata">
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
																			<template subtype="element" filter="@code=6" match="strdata">
																				<children>
																					<template subtype="attribute" match="column3">
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
																			<template subtype="element" filter="@code=6" match="strdata">
																				<children>
																					<template subtype="attribute" match="column4">
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
																			<template subtype="element" filter="@code=6" match="strdata">
																				<children>
																					<template subtype="attribute" match="column5">
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
																			<template subtype="element" filter="@code=6" match="strdata">
																				<children>
																					<template subtype="attribute" match="column6">
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
																			<template subtype="element" filter="@code=6" match="strdata">
																				<children>
																					<template subtype="attribute" match="column7">
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
																			<template subtype="element" filter="@code=6" match="strdata">
																				<children>
																					<template subtype="attribute" match="column8">
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
																			<template subtype="element" filter="@code=6" match="strdata">
																				<children>
																					<template subtype="attribute" match="column9">
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
																			<template subtype="element" filter="@code=6" match="strdata">
																				<children>
																					<template subtype="attribute" match="column10">
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
																			<template subtype="element" filter="@code=6" match="strdata">
																				<children>
																					<template subtype="attribute" match="column11">
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
										<styles height="0.18in"/>
										<children>
											<tgridcell joinabove="1"/>
											<tgridcell>
												<children>
													<text fixtext="отклонение">
														<styles font-weight="bold"/>
													</text>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="007">
														<styles font-weight="bold"/>
													</text>
													<newline/>
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
																			<template subtype="element" filter="@code=7" match="strdata">
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
																			<template subtype="element" filter="@code=7" match="strdata">
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
																			<template subtype="element" filter="@code=7" match="strdata">
																				<children>
																					<template subtype="attribute" match="column3">
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
																			<template subtype="element" filter="@code=7" match="strdata">
																				<children>
																					<template subtype="attribute" match="column4">
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
																			<template subtype="element" filter="@code=7" match="strdata">
																				<children>
																					<template subtype="attribute" match="column5">
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
																			<template subtype="element" filter="@code=7" match="strdata">
																				<children>
																					<template subtype="attribute" match="column6">
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
																			<template subtype="element" filter="@code=7" match="strdata">
																				<children>
																					<template subtype="attribute" match="column7">
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
																			<template subtype="element" filter="@code=7" match="strdata">
																				<children>
																					<template subtype="attribute" match="column8">
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
																			<template subtype="element" filter="@code=7" match="strdata">
																				<children>
																					<template subtype="attribute" match="column9">
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
																			<template subtype="element" filter="@code=7" match="strdata">
																				<children>
																					<template subtype="attribute" match="column10">
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
																			<template subtype="element" filter="@code=7" match="strdata">
																				<children>
																					<template subtype="attribute" match="column11">
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
												<styles text-align="center"/>
												<children>
													<text fixtext="нарастающим итогом">
														<styles font-weight="bold"/>
													</text>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="план">
														<styles font-weight="bold"/>
													</text>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="008">
														<styles font-weight="bold"/>
													</text>
													<newline/>
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
																			<template subtype="element" filter="@code=8" match="strdata">
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
																			<template subtype="element" filter="@code=8" match="strdata">
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
																			<template subtype="element" filter="@code=8" match="strdata">
																				<children>
																					<template subtype="attribute" match="column3">
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
																			<template subtype="element" filter="@code=8" match="strdata">
																				<children>
																					<template subtype="attribute" match="column4">
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
																			<template subtype="element" filter="@code=8" match="strdata">
																				<children>
																					<template subtype="attribute" match="column5">
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
																			<template subtype="element" filter="@code=8" match="strdata">
																				<children>
																					<template subtype="attribute" match="column6">
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
																			<template subtype="element" filter="@code=8" match="strdata">
																				<children>
																					<template subtype="attribute" match="column7">
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
																			<template subtype="element" filter="@code=8" match="strdata">
																				<children>
																					<template subtype="attribute" match="column8">
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
																			<template subtype="element" filter="@code=8" match="strdata">
																				<children>
																					<template subtype="attribute" match="column9">
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
																			<template subtype="element" filter="@code=8" match="strdata">
																				<children>
																					<template subtype="attribute" match="column10">
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
																			<template subtype="element" filter="@code=8" match="strdata">
																				<children>
																					<template subtype="attribute" match="column11">
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
											<tgridcell joinabove="1"/>
											<tgridcell>
												<styles text-align="left"/>
												<children>
													<text fixtext="факт">
														<styles font-weight="bold"/>
													</text>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="009">
														<styles font-weight="bold"/>
													</text>
													<newline/>
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
																			<template subtype="element" filter="@code=9" match="strdata">
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
																			<template subtype="element" filter="@code=9" match="strdata">
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
																			<template subtype="element" filter="@code=9" match="strdata">
																				<children>
																					<template subtype="attribute" match="column3">
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
																			<template subtype="element" filter="@code=9" match="strdata">
																				<children>
																					<template subtype="attribute" match="column4">
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
																			<template subtype="element" filter="@code=9" match="strdata">
																				<children>
																					<template subtype="attribute" match="column5">
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
																			<template subtype="element" filter="@code=9" match="strdata">
																				<children>
																					<template subtype="attribute" match="column6">
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
																			<template subtype="element" filter="@code=9" match="strdata">
																				<children>
																					<template subtype="attribute" match="column7">
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
																			<template subtype="element" filter="@code=9" match="strdata">
																				<children>
																					<template subtype="attribute" match="column8">
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
																			<template subtype="element" filter="@code=9" match="strdata">
																				<children>
																					<template subtype="attribute" match="column9">
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
																			<template subtype="element" filter="@code=9" match="strdata">
																				<children>
																					<template subtype="attribute" match="column10">
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
																			<template subtype="element" filter="@code=9" match="strdata">
																				<children>
																					<template subtype="attribute" match="column11">
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
										<styles height="0.23in"/>
										<children>
											<tgridcell joinabove="1"/>
											<tgridcell>
												<children>
													<text fixtext="отклонение">
														<styles font-weight="bold"/>
													</text>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="010">
														<styles font-weight="bold"/>
													</text>
													<newline/>
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
																			<template subtype="element" filter="@code=10" match="strdata">
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
																			<template subtype="element" filter="@code=10" match="strdata">
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
																			<template subtype="element" filter="@code=10" match="strdata">
																				<children>
																					<template subtype="attribute" match="column3">
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
																			<template subtype="element" filter="@code=10" match="strdata">
																				<children>
																					<template subtype="attribute" match="column4">
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
																			<template subtype="element" filter="@code=10" match="strdata">
																				<children>
																					<template subtype="attribute" match="column5">
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
																			<template subtype="element" filter="@code=10" match="strdata">
																				<children>
																					<template subtype="attribute" match="column6">
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
																			<template subtype="element" filter="@code=10" match="strdata">
																				<children>
																					<template subtype="attribute" match="column7">
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
																			<template subtype="element" filter="@code=10" match="strdata">
																				<children>
																					<template subtype="attribute" match="column8">
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
																			<template subtype="element" filter="@code=10" match="strdata">
																				<children>
																					<template subtype="attribute" match="column9">
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
																			<template subtype="element" filter="@code=10" match="strdata">
																				<children>
																					<template subtype="attribute" match="column10">
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
																			<template subtype="element" filter="@code=10" match="strdata">
																				<children>
																					<template subtype="attribute" match="column11">
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
					<text fixtext="Служебный раздел">
						<styles font-size="16pt"/>
					</text>
					<newline/>
					<line/>
					<text fixtext="Сведения о Субъекте ТЭК, предоставившем информацию"/>
					<newline/>
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
													<text fixtext="Служебная информация"/>
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
					<text fixtext="Контактная информация"/>
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
													<text fixtext="Контактная иформация"/>
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
													<text fixtext="Электронный адрес"/>
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
					<newline/>
					<text fixtext=" «____» ___________20_ год"/>
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
				</children>
			</globaltemplate>
		</children>
	</mainparts>
	<globalparts/>
	<designfragments/>
	<xmltables/>
	<authentic-custom-toolbar-buttons/>
</structure>
