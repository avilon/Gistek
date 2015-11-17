<?xml version="1.0" encoding="UTF-8"?>
<structure version="17" html-doctype="HTML4 Transitional" compatibility-view="IE9" html-outputextent="Complete" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="ISO-8859-1" encodingpdf="UTF-8" useimportschema="1" embed-images="1" enable-authentic-scripts="1" authentic-scripts-in-debug-mode-external="0" generated-file-location="DEFAULT">
	<parameters/>
	<schemasources>
		<namespaces/>
		<schemasources>
			<xsdschemasource name="XML" main="1" schemafile="40068.xsd" workingxmlfile="40068.xml"/>
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
					<text fixtext="Сведения о добыче газа на месторождениях, в том числе на условиях льготного налогообложения">
						<styles font-size="16pt"/>
					</text>
					<newline/>
					<line/>
					<text fixtext="Раздел 1. Сведения о добыче газа, облагаемой по полной ставке НДПИ"/>
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
													<text fixtext="Субъект РФ"/>
												</children>
											</tgridcell>
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
													<text fixtext="Срок действия лицензии"/>
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
													<text fixtext="Объем добычи за отчетный месяц, тыс. куб. м"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Объем добычи с начала года, тыс. куб. м"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Объем добычи с начала разра-ботки, тыс. куб. м"/>
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
															<template subtype="element" match="strdata_01">
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
																								<format basic-type="xsd" datatype="byte"/>
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
					<newline/>
					<text fixtext="Раздел 2. Сведения о добыче газа, облагаемой по льготной ставке НДПИ"/>
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
								</children>
							</tgridbody-cols>
							<tgridheader-rows>
								<children>
									<tgridrow>
										<children>
											<tgridcell>
												<children>
													<text fixtext="Субъект РФ"/>
												</children>
											</tgridcell>
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
													<text fixtext="Срок действия лицензии"/>
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
													<text fixtext="Степень выработанности месторожде-ния, %"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Объем добычи за отчетный месяц, тыс. куб. м"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Объем добычи с начала года, тыс. куб. м"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Объем добычи с начала разработки, тыс. куб. м"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Применяемая ставка НДПИ, руб./тыс. куб. м"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="НДПИ, тыс. руб."/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Кате-гория 1 льго-ты по став-ке НДПИ"/>
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
													<text fixtext="Категория льготы по ставке НДПИ: Степень выработанности"/>
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
															<template subtype="element" match="strdata_02">
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
																								<format basic-type="xsd" datatype="byte"/>
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
																					<template subtype="attribute" match="column17">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="column18">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="column19">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="column20">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="column21">
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
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="column12">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="column13">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="column14">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="column15">
																						<children>
																							<content subtype="regular"/>
																						</children>
																						<variables/>
																					</template>
																				</children>
																			</tgridcell>
																			<tgridcell>
																				<children>
																					<template subtype="attribute" match="column16">
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
					<newline/>
					<text fixtext="Сведения о Субъекте ТЭК, предоставившем информацию"/>
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
								<children>
									<tgridrow>
										<children>
											<tgridcell>
												<children>
													<text fixtext="Полное наименование отчитывающейся организации"/>
												</children>
											</tgridcell>
											<tgridcell/>
										</children>
									</tgridrow>
									<tgridrow>
										<children>
											<tgridcell>
												<children>
													<text fixtext="ОГРН "/>
												</children>
											</tgridcell>
											<tgridcell/>
										</children>
									</tgridrow>
									<tgridrow>
										<children>
											<tgridcell>
												<children>
													<text fixtext="ИНН "/>
												</children>
											</tgridcell>
											<tgridcell/>
										</children>
									</tgridrow>
									<tgridrow>
										<children>
											<tgridcell>
												<children>
													<text fixtext="КПП "/>
												</children>
											</tgridcell>
											<tgridcell/>
										</children>
									</tgridrow>
								</children>
							</tgridbody-rows>
						</children>
					</tgrid>
					<newline/>
					<newline/>
					<text fixtext="Сведения о времени поступления информации"/>
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
								<children>
									<tgridrow>
										<children>
											<tgridcell>
												<children>
													<text fixtext="Дата формирования отчета техническими средствами ГИС ТЭК"/>
												</children>
											</tgridcell>
											<tgridcell/>
										</children>
									</tgridrow>
									<tgridrow>
										<children>
											<tgridcell>
												<children>
													<text fixtext="Дата получения последнего электронного документа, необходимого для формирования отчета"/>
												</children>
											</tgridcell>
											<tgridcell/>
										</children>
									</tgridrow>
								</children>
							</tgridbody-rows>
						</children>
					</tgrid>
					<newline/>
					<newline/>
					<text fixtext="Контактная информация"/>
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
								</children>
							</tgridbody-cols>
							<tgridbody-rows>
								<children>
									<tgridrow>
										<children>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="Контактная информация">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="Код строки">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="Ф.И.О.">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="Должность">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="Контактный телефон (с кодом города)">
														<styles font-weight="bold"/>
													</text>
												</children>
											</tgridcell>
											<tgridcell>
												<styles text-align="center"/>
												<children>
													<text fixtext="Электронный адрес">
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
										</children>
									</tgridrow>
									<tgridrow>
										<children>
											<tgridcell>
												<children>
													<text fixtext="Руководитель организации"/>
												</children>
											</tgridcell>
											<tgridcell/>
											<tgridcell/>
											<tgridcell/>
											<tgridcell/>
											<tgridcell/>
										</children>
									</tgridrow>
									<tgridrow>
										<children>
											<tgridcell>
												<children>
													<text fixtext="Ответственный за заполнение формы"/>
												</children>
											</tgridcell>
											<tgridcell/>
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
