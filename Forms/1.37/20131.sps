<?xml version="1.0" encoding="UTF-8"?>
<structure version="17" html-doctype="HTML4 Transitional" compatibility-view="IE9" html-outputextent="Complete" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="ISO-8859-1" encodingpdf="UTF-8" useimportschema="1" embed-images="1" enable-authentic-scripts="1" authentic-scripts-in-debug-mode-external="0" generated-file-location="DEFAULT">
	<parameters/>
	<schemasources>
		<namespaces/>
		<schemasources>
			<xsdschemasource name="XML" main="1" schemafile="20131.xsd" workingxmlfile="20131.xml"/>
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
					<text fixtext="Сведения об объемах добычи и льготах при извлечении и распределении трудноизвлекаемой нефти">
						<styles font-size="16pt"/>
					</text>
					<newline/>
					<line/>
					<text fixtext="Раздел 1. Сведения о добыче нефти, облагаемой по полной ставке НДПИ"/>
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
								</children>
							</tgridbody-cols>
							<tgridheader-rows>
								<children>
									<tgridrow>
										<children>
											<tgridcell>
												<children>
													<text fixtext="Предприятие"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Место-рождение"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Номер ли-цензии"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Срок дей-ствия лицен-зии"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Залежь"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Вид уг-леводо-родного сырья"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Код стро-ки"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Степень вырабо-танности место-рожде-ния, %"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Объем добычи за отчетный месяц, т (тыс. куб. м)"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Объем добычи с начала года, т (тыс. куб. м)"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Объем добычи с начала разработки, т (тыс. куб. м)"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="НДПИ, тыс. руб."/>
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
															<template subtype="element" match="data_01">
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
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="col5">
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
																					<template subtype="attribute" match="col6">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="col7">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="col8">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="col9">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="col10">
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
					<text fixtext="Раздел 2. Сведения о добыче нефти, облагаемой по льготной ставке НДПИ"/>
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
													<text fixtext="Месторождение"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Номер лицензии"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Срок действия лицензии "/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Залежь"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Вид углеводородного сырья"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Код строки"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Степень выработанности месторождения, %"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Объем добычи за отчетный месяц, т (тыс. куб. м)"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Объем добычи с начала года, т (тыс. куб. м)"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Объем добычи с начала разработки, т (тыс. куб. м)"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Применяемая ставка НДПИ, руб./т (руб./ тыс. куб. м)"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="НДПИ, тыс. руб."/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Категория льготы по ставке НДПИ: Величина запасов"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Категория льготы по ставке НДПИ: Глубина залегания"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Категория льготы по ставке НДПИ: Качество запасов"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Категория льготы по ставке НДПИ: Регион добычи (вкл. Новые месторождения)"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Категория льготы по ставке НДПИ: Свойства нефти"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Категория льготы по ставке НДПИ: Степень выработанности"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Категория льготы по ставке НДПИ: Степень сложности добычи нефти"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Категория льготы по ставке НДПИ: Владение объектами ЕСГ"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Категория льготы по ставке НДПИ: Участки недр, принадлежащие к региональной системе газоснабжения"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Категория льготы по ставке НДПИ: Нормативные потери"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Категория льготы по ставке НДПИ: Добыча ПНГ"/>
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
											<tgridcell>
												<children>
													<text fixtext="12"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="13"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="14"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="15"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="16"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="17"/>
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
															<template subtype="element" match="data_02">
																<children>
																	<tgridrow>
																		<children>
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
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="col5">
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
																					<template subtype="attribute" match="col6">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="col7">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="col8">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="col9">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="col10">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="col11">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="col12">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="col13">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="col14">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="col15">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="col16">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="col17">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="col18">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="col19">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="col20">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="col21">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="col22">
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
					<text fixtext="Раздел 3. Сведения о реализации нефти на экспорт, облагаемой по льготной экспортной пошлине"/>
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
													<text fixtext="name"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Место-рождение"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Нмер лицензии"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Срок действия лицензии"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Вид углеводородного сырья"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Код по ТН ВЭД ТС"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Код строки"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Объем реализации на экспорт, т "/>
													<newline/>
													<text fixtext="(тыс. куб. м)"/>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell joinleft="1"/>
											<tgridcell>
												<children>
													<text fixtext="Применяемая ставка вывозной таможенной пошлины"/>
												</children>
											</tgridcell>
											<tgridcell joinleft="1"/>
											<tgridcell>
												<children>
													<text fixtext="Вывозная таможенная пошлина, тыс. руб."/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Категория льготы по экспортной пошлине"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Категория льготы по экспортной пошлине"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Категория льготы по экспортной пошлине"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Категория льготы по экспортной пошлине"/>
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
											<tgridcell>
												<children>
													<text fixtext="Всего"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Страна-импор-тер"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="руб./т (руб./тыс. куб. м)"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="%"/>
												</children>
											</tgridcell>
											<tgridcell joinabove="1"/>
											<tgridcell joinabove="1"/>
											<tgridcell joinabove="1"/>
											<tgridcell joinabove="1"/>
											<tgridcell joinabove="1"/>
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
															<template subtype="element" match="data_03">
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
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="col5">
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
																					<template subtype="attribute" match="col6">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="col7">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="col8">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="col9">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="col10">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="col11">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="col12">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="col13">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="col14">
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
