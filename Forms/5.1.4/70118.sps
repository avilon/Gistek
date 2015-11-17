<?xml version="1.0" encoding="UTF-8"?>
<structure version="17" html-doctype="HTML4 Transitional" compatibility-view="IE9" html-outputextent="Complete" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="ISO-8859-1" encodingpdf="UTF-8" useimportschema="1" embed-images="1" enable-authentic-scripts="1" authentic-scripts-in-debug-mode-external="0" generated-file-location="DEFAULT">
	<parameters/>
	<schemasources>
		<namespaces/>
		<schemasources>
			<xsdschemasource name="XML" main="1" schemafile="70118.xsd" workingxmlfile="70118.xml"/>
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
					<newline/>
					<text fixtext="Сведения о показателях (индикаторах) энергетической эффективности государственных программ Российской Федерации">
						<styles font-size="16pt"/>
					</text>
					<newline/>
					<line/>
					<newline/>
					<text fixtext="Раздел  1 Сведения о показателях (индикаторах) энергетической эффективности государственных программ Российской Федерации"/>
					<newline/>
					<tgrid>
						<properties border="1"/>
						<children>
							<tgridbody-cols>
								<children>
									<tgridcol/>
									<tgridcol/>
									<tgridcol/>
									<tgridcol conditional-processing="count( document/flat/strdata/@column1 ) &gt; 0"/>
									<tgridcol conditional-processing="count( document/flat/strdata/@column2 ) &gt; 0"/>
									<tgridcol conditional-processing="count( document/flat/strdata/@column3 ) &gt; 0"/>
									<tgridcol conditional-processing="count( document/flat/strdata/@column4 ) &gt; 0"/>
									<tgridcol conditional-processing="count( document/flat/strdata/@column5 ) &gt; 0"/>
									<tgridcol conditional-processing="count( document/flat/strdata/@column6 ) &gt; 0"/>
									<tgridcol conditional-processing="count( document/flat/strdata/@column7 ) &gt; 0"/>
									<tgridcol conditional-processing="count( document/flat/strdata/@column8 ) &gt; 0"/>
									<tgridcol conditional-processing="count( document/flat/strdata/@column9 ) &gt; 0"/>
									<tgridcol conditional-processing="count( document/flat/strdata/@column10 ) &gt; 0"/>
									<tgridcol conditional-processing="count( document/flat/strdata/@column11 ) &gt; 0"/>
									<tgridcol conditional-processing="count( document/flat/strdata/@column12 ) &gt; 0"/>
									<tgridcol conditional-processing="count( document/flat/strdata/@column13 ) &gt; 0"/>
									<tgridcol conditional-processing="count( document/flat/strdata/@column14 ) &gt; 0"/>
									<tgridcol conditional-processing="count( document/flat/strdata/@column15 ) &gt; 0"/>
									<tgridcol conditional-processing="count( document/flat/strdata/@column16 ) &gt; 0"/>
									<tgridcol conditional-processing="count( document/flat/strdata/@column17 ) &gt; 0"/>
									<tgridcol conditional-processing="count( document/flat/strdata/@column18 ) &gt; 0"/>
									<tgridcol conditional-processing="count( document/flat/strdata/@column19 ) &gt; 0"/>
								</children>
							</tgridbody-cols>
							<tgridheader-rows>
								<children>
									<tgridrow>
										<children>
											<tgridcell>
												<children>
													<text fixtext="Наименование показателя (индикатора)"/>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Ед. изм."/>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<text fixtext="Код строки"/>
													<newline/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<autocalc xpath="number(document/flat/param/@year) - 1"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<autocalc xpath="number(document/flat/param/@year) - 2"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<autocalc xpath="number(document/flat/param/@year) - 3"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<autocalc xpath="number(document/flat/param/@year) - 4"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<autocalc xpath="number(document/flat/param/@year) - 5"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<autocalc xpath="number(document/flat/param/@year) - 6"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<autocalc xpath="number(document/flat/param/@year) - 7"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<autocalc xpath="number(document/flat/param/@year) - 8"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<autocalc xpath="number(document/flat/param/@year) - 9"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<autocalc xpath="number(document/flat/param/@year)"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<autocalc xpath="number(document/flat/param/@year) + 1"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<autocalc xpath="number(document/flat/param/@year) + 2"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<autocalc xpath="number(document/flat/param/@year) + 3"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<autocalc xpath="number(document/flat/param/@year) + 4"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<autocalc xpath="number(document/flat/param/@year) + 5"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<autocalc xpath="number(document/flat/param/@year) + 6"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<autocalc xpath="number(document/flat/param/@year) + 7"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<autocalc xpath="number(document/flat/param/@year) + 8"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<autocalc xpath="number(document/flat/param/@year) + 9"/>
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
													<autocalc xpath="count( document/flat/strdata/@column1 ) &gt; 0 + 1"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<autocalc xpath="number(count( document/flat/strdata/@column1 ) &gt; 0) +
number(count( document/flat/strdata/@column2 ) &gt; 0) + 1"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<autocalc xpath="number(count( document/flat/strdata/@column1 ) &gt; 0) +
number(count( document/flat/strdata/@column2 ) &gt; 0) + 
number(count( document/flat/strdata/@column3 ) &gt; 0) + 1"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<autocalc xpath="number(count( document/flat/strdata/@column1 ) &gt; 0) +
number(count( document/flat/strdata/@column2 ) &gt; 0) + 
number(count( document/flat/strdata/@column3 ) &gt; 0) + 
number(count( document/flat/strdata/@column4 ) &gt; 0) + 1"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<autocalc xpath="number(count( document/flat/strdata/@column1 ) &gt; 0) +
number(count( document/flat/strdata/@column2 ) &gt; 0) + 
number(count( document/flat/strdata/@column3 ) &gt; 0) + 
number(count( document/flat/strdata/@column4 ) &gt; 0) + 
number(count( document/flat/strdata/@column5 ) &gt; 0) + 1"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<autocalc xpath="number(count( document/flat/strdata/@column1 ) &gt; 0) +
number(count( document/flat/strdata/@column2 ) &gt; 0) + 
number(count( document/flat/strdata/@column3 ) &gt; 0) + 
number(count( document/flat/strdata/@column4 ) &gt; 0) + 
number(count( document/flat/strdata/@column5 ) &gt; 0) + 
number(count( document/flat/strdata/@column6 ) &gt; 0) +1"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<autocalc xpath="number(count( document/flat/strdata/@column1 ) &gt; 0) +
number(count( document/flat/strdata/@column2 ) &gt; 0) + 
number(count( document/flat/strdata/@column3 ) &gt; 0) + 
number(count( document/flat/strdata/@column4 ) &gt; 0) + 
number(count( document/flat/strdata/@column5 ) &gt; 0) + 
number(count( document/flat/strdata/@column6 ) &gt; 0) +
number(count( document/flat/strdata/@column7 ) &gt; 0) + 1"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<autocalc xpath="number(count( document/flat/strdata/@column1 ) &gt; 0) +
number(count( document/flat/strdata/@column2 ) &gt; 0) + 
number(count( document/flat/strdata/@column3 ) &gt; 0) + 
number(count( document/flat/strdata/@column4 ) &gt; 0) + 
number(count( document/flat/strdata/@column5 ) &gt; 0) + 
number(count( document/flat/strdata/@column6 ) &gt; 0) +
number(count( document/flat/strdata/@column7 ) &gt; 0) + 
number(count( document/flat/strdata/@column8 ) &gt; 0) + 1"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<autocalc xpath="number(count( document/flat/strdata/@column1 ) &gt; 0) +
number(count( document/flat/strdata/@column2 ) &gt; 0) + 
number(count( document/flat/strdata/@column3 ) &gt; 0) + 
number(count( document/flat/strdata/@column4 ) &gt; 0) + 
number(count( document/flat/strdata/@column5 ) &gt; 0) + 
number(count( document/flat/strdata/@column6 ) &gt; 0) +
number(count( document/flat/strdata/@column7 ) &gt; 0) + 
number(count( document/flat/strdata/@column8 ) &gt; 0) + 
number(count( document/flat/strdata/@column9 ) &gt; 0) + 1"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<autocalc xpath="number(count( document/flat/strdata/@column1 ) &gt; 0) +
number(count( document/flat/strdata/@column2 ) &gt; 0) + 
number(count( document/flat/strdata/@column3 ) &gt; 0) + 
number(count( document/flat/strdata/@column4 ) &gt; 0) + 
number(count( document/flat/strdata/@column5 ) &gt; 0) + 
number(count( document/flat/strdata/@column6 ) &gt; 0) +
number(count( document/flat/strdata/@column7 ) &gt; 0) + 
number(count( document/flat/strdata/@column8 ) &gt; 0) + 
number(count( document/flat/strdata/@column9 ) &gt; 0) + 
number(count( document/flat/strdata/@column10 ) &gt; 0) +1"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<autocalc xpath="number(count( document/flat/strdata/@column1 ) &gt; 0) +
number(count( document/flat/strdata/@column2 ) &gt; 0) + 
number(count( document/flat/strdata/@column3 ) &gt; 0) + 
number(count( document/flat/strdata/@column4 ) &gt; 0) + 
number(count( document/flat/strdata/@column5 ) &gt; 0) + 
number(count( document/flat/strdata/@column6 ) &gt; 0) +
number(count( document/flat/strdata/@column7 ) &gt; 0) + 
number(count( document/flat/strdata/@column8 ) &gt; 0) + 
number(count( document/flat/strdata/@column9 ) &gt; 0) + 
number(count( document/flat/strdata/@column10 ) &gt; 0) +
number(count( document/flat/strdata/@column11 ) &gt; 0) +1"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<autocalc xpath="number(count( document/flat/strdata/@column1 ) &gt; 0) +
number(count( document/flat/strdata/@column2 ) &gt; 0) + 
number(count( document/flat/strdata/@column3 ) &gt; 0) + 
number(count( document/flat/strdata/@column4 ) &gt; 0) + 
number(count( document/flat/strdata/@column5 ) &gt; 0) + 
number(count( document/flat/strdata/@column6 ) &gt; 0) +
number(count( document/flat/strdata/@column7 ) &gt; 0) + 
number(count( document/flat/strdata/@column8 ) &gt; 0) + 
number(count( document/flat/strdata/@column9 ) &gt; 0) + 
number(count( document/flat/strdata/@column10 ) &gt; 0) +
number(count( document/flat/strdata/@column11 ) &gt; 0) +
number(count( document/flat/strdata/@column12 ) &gt; 0) +1"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<autocalc xpath="number(count( document/flat/strdata/@column1 ) &gt; 0) +
number(count( document/flat/strdata/@column2 ) &gt; 0) + 
number(count( document/flat/strdata/@column3 ) &gt; 0) + 
number(count( document/flat/strdata/@column4 ) &gt; 0) + 
number(count( document/flat/strdata/@column5 ) &gt; 0) + 
number(count( document/flat/strdata/@column6 ) &gt; 0) +
number(count( document/flat/strdata/@column7 ) &gt; 0) + 
number(count( document/flat/strdata/@column8 ) &gt; 0) + 
number(count( document/flat/strdata/@column9 ) &gt; 0) + 
number(count( document/flat/strdata/@column10 ) &gt; 0) +
number(count( document/flat/strdata/@column11 ) &gt; 0) +
number(count( document/flat/strdata/@column12 ) &gt; 0) +
number(count( document/flat/strdata/@column13 ) &gt; 0) + 1"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<autocalc xpath="number(count( document/flat/strdata/@column1 ) &gt; 0) +
number(count( document/flat/strdata/@column2 ) &gt; 0) + 
number(count( document/flat/strdata/@column3 ) &gt; 0) + 
number(count( document/flat/strdata/@column4 ) &gt; 0) + 
number(count( document/flat/strdata/@column5 ) &gt; 0) + 
number(count( document/flat/strdata/@column6 ) &gt; 0) +
number(count( document/flat/strdata/@column7 ) &gt; 0) + 
number(count( document/flat/strdata/@column8 ) &gt; 0) + 
number(count( document/flat/strdata/@column9 ) &gt; 0) + 
number(count( document/flat/strdata/@column10 ) &gt; 0) +
number(count( document/flat/strdata/@column11 ) &gt; 0) +
number(count( document/flat/strdata/@column12 ) &gt; 0) +
number(count( document/flat/strdata/@column13 ) &gt; 0) + 
number(count( document/flat/strdata/@column14 ) &gt; 0) + 1"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<autocalc xpath="number(count( document/flat/strdata/@column1 ) &gt; 0) +
number(count( document/flat/strdata/@column2 ) &gt; 0) + 
number(count( document/flat/strdata/@column3 ) &gt; 0) + 
number(count( document/flat/strdata/@column4 ) &gt; 0) + 
number(count( document/flat/strdata/@column5 ) &gt; 0) + 
number(count( document/flat/strdata/@column6 ) &gt; 0) +
number(count( document/flat/strdata/@column7 ) &gt; 0) + 
number(count( document/flat/strdata/@column8 ) &gt; 0) + 
number(count( document/flat/strdata/@column9 ) &gt; 0) + 
number(count( document/flat/strdata/@column10 ) &gt; 0) +
number(count( document/flat/strdata/@column11 ) &gt; 0) +
number(count( document/flat/strdata/@column12 ) &gt; 0) +
number(count( document/flat/strdata/@column13 ) &gt; 0) + 
number(count( document/flat/strdata/@column14 ) &gt; 0) + 
number(count( document/flat/strdata/@column15 ) &gt; 0) + 1"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<autocalc xpath="number(count( document/flat/strdata/@column1 ) &gt; 0) +
number(count( document/flat/strdata/@column2 ) &gt; 0) + 
number(count( document/flat/strdata/@column3 ) &gt; 0) + 
number(count( document/flat/strdata/@column4 ) &gt; 0) + 
number(count( document/flat/strdata/@column5 ) &gt; 0) + 
number(count( document/flat/strdata/@column6 ) &gt; 0) +
number(count( document/flat/strdata/@column7 ) &gt; 0) + 
number(count( document/flat/strdata/@column8 ) &gt; 0) + 
number(count( document/flat/strdata/@column9 ) &gt; 0) + 
number(count( document/flat/strdata/@column10 ) &gt; 0) +
number(count( document/flat/strdata/@column11 ) &gt; 0) +
number(count( document/flat/strdata/@column12 ) &gt; 0) +
number(count( document/flat/strdata/@column13 ) &gt; 0) + 
number(count( document/flat/strdata/@column14 ) &gt; 0) + 
number(count( document/flat/strdata/@column15 ) &gt; 0) + 
number(count( document/flat/strdata/@column16 ) &gt; 0) +1"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<autocalc xpath="number(count( document/flat/strdata/@column1 ) &gt; 0) +
number(count( document/flat/strdata/@column2 ) &gt; 0) + 
number(count( document/flat/strdata/@column3 ) &gt; 0) + 
number(count( document/flat/strdata/@column4 ) &gt; 0) + 
number(count( document/flat/strdata/@column5 ) &gt; 0) + 
number(count( document/flat/strdata/@column6 ) &gt; 0) +
number(count( document/flat/strdata/@column7 ) &gt; 0) + 
number(count( document/flat/strdata/@column8 ) &gt; 0) + 
number(count( document/flat/strdata/@column9 ) &gt; 0) + 
number(count( document/flat/strdata/@column10 ) &gt; 0) +
number(count( document/flat/strdata/@column11 ) &gt; 0) +
number(count( document/flat/strdata/@column12 ) &gt; 0) +
number(count( document/flat/strdata/@column13 ) &gt; 0) + 
number(count( document/flat/strdata/@column14 ) &gt; 0) + 
number(count( document/flat/strdata/@column15 ) &gt; 0) + 
number(count( document/flat/strdata/@column16 ) &gt; 0) +
number(count( document/flat/strdata/@column17 ) &gt; 0) +1"/>
												</children>
											</tgridcell>
											<tgridcell>
												<children>
													<autocalc xpath="number(count( document/flat/strdata/@column1 ) &gt; 0) +
number(count( document/flat/strdata/@column2 ) &gt; 0) + 
number(count( document/flat/strdata/@column3 ) &gt; 0) + 
number(count( document/flat/strdata/@column4 ) &gt; 0) + 
number(count( document/flat/strdata/@column5 ) &gt; 0) + 
number(count( document/flat/strdata/@column6 ) &gt; 0) +
number(count( document/flat/strdata/@column7 ) &gt; 0) + 
number(count( document/flat/strdata/@column8 ) &gt; 0) + 
number(count( document/flat/strdata/@column9 ) &gt; 0) + 
number(count( document/flat/strdata/@column10 ) &gt; 0) +
number(count( document/flat/strdata/@column11 ) &gt; 0) +
number(count( document/flat/strdata/@column12 ) &gt; 0) +
number(count( document/flat/strdata/@column13 ) &gt; 0) + 
number(count( document/flat/strdata/@column14 ) &gt; 0) + 
number(count( document/flat/strdata/@column15 ) &gt; 0) + 
number(count( document/flat/strdata/@column16 ) &gt; 0) +
number(count( document/flat/strdata/@column17 ) &gt; 0) +
number(count( document/flat/strdata/@column18 ) &gt; 0) +1"/>
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
																					<template subtype="attribute" match="measure">
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
