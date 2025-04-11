<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
	version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
	xmlns:ve="http://schemas.openxmlformats.org/markup-compatibility/2006" 
	xmlns:o="urn:schemas-microsoft-com:office:office" 
	xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" 
	xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" 
	xmlns:v="urn:schemas-microsoft-com:vml" 
	xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" 
	xmlns:w10="urn:schemas-microsoft-com:office:word" 
	xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" 
	xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml"
	exclude-result-prefixes="msxsl">
	
	<xsl:output method="xml" indent="yes"/>

	<xsl:template match="/">
		<w:document 
			xmlns:ve="http://schemas.openxmlformats.org/markup-compatibility/2006" 
			xmlns:o="urn:schemas-microsoft-com:office:office" 
			xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" 
			xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" 
			xmlns:v="urn:schemas-microsoft-com:vml" 
			xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" 
			xmlns:w10="urn:schemas-microsoft-com:office:word" 
			xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" 
			xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml">
			<w:body>
				<xsl:apply-templates select="MalwareRatingIndexReport"/>
				<w:sectPr w:rsidR="002F1378" w:rsidRPr="00F06A9D" w:rsidSect="00802688">
					<w:headerReference w:type="even" r:id="rId16"/>
					<w:footerReference w:type="default" r:id="rId17"/>
					<w:pgSz w:w="12240" w:h="15840"/>
					<w:pgMar
						w:top="1440" w:right="1440" w:bottom="1440" w:left="1440"
						w:header="0" w:footer="720" w:gutter="0"/>
					<w:cols w:space="720"/>
					<w:docGrid w:linePitch="360"/>
				</w:sectPr>
			</w:body>
		</w:document>
	</xsl:template>
	
	<xsl:template match="MalwareRatingIndexReport">
		<xsl:apply-templates select="./ProcessInformation"/>
		<xsl:apply-templates select="./ProcessScoreEntriesWithFalsePositiveCorrection"/>
		<xsl:apply-templates select="./ModuleTrustSummaries"/>
		<xsl:apply-templates select="./ModuleScoreEntries"/>
	</xsl:template>

	<xsl:template match="ProcessInformation">
		<w:tbl>
			<w:tblPr>
				<w:tblStyle w:val="TableGrid"/>
				<w:tblW w:w="4784" w:type="pct"/>
				<w:tblCellSpacing w:w="0" w:type="dxa"/>
				<w:tblBorders>
					<w:top w:val="none" w:sz="0" w:space="0" w:color="auto"/>
					<w:left w:val="none" w:sz="0" w:space="0" w:color="auto"/>
					<w:bottom w:val="none" w:sz="0" w:space="0" w:color="auto"/>
					<w:right w:val="none" w:sz="0" w:space="0" w:color="auto"/>
					<w:insideH w:val="none" w:sz="0" w:space="0" w:color="auto"/>
					<w:insideV w:val="none" w:sz="0" w:space="0" w:color="auto"/>
				</w:tblBorders>
				<w:tblCellMar>
					<w:left w:w="115" w:type="dxa"/>
					<w:right w:w="115" w:type="dxa"/>
				</w:tblCellMar>
				<w:tblLook w:val="0480"/>
			</w:tblPr>
			<w:tblGrid>
				<w:gridCol w:w="1375"/>
				<w:gridCol w:w="7801"/>
			</w:tblGrid>
			<w:tr w:rsidR="00365729" w:rsidRPr="00F06A9D" w:rsidTr="00F06A9D">
				<w:trPr>
					<w:tblCellSpacing w:w="0" w:type="dxa"/>
				</w:trPr>
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="749" w:type="pct"/>
						<w:vAlign w:val="center"/>
					</w:tcPr>
					<w:p w:rsidR="00365729" w:rsidRPr="00F06A9D" w:rsidRDefault="00365729" w:rsidP="00F06A9D">
						<w:pPr>
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
						</w:pPr>
						<w:r w:rsidRPr="00F06A9D">
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:noProof/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
							<xsl:choose>
								<xsl:when test="../MRIScore = 0">
									<xsl:call-template name="emptyTargetLargeIcon" />
								</xsl:when>
								<xsl:when test="../MRIScore >= 62">
									<xsl:call-template name="fullTargetLargeIcon" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="halfTargetLargeIcon" />
								</xsl:otherwise>
							</xsl:choose>
						</w:r>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="4251" w:type="pct"/>
						<w:shd w:val="clear" w:color="auto" w:fill="auto"/>
						<w:tcMar>
							<w:top w:w="14" w:type="dxa"/>
							<w:left w:w="115" w:type="dxa"/>
							<w:bottom w:w="43" w:type="dxa"/>
							<w:right w:w="115" w:type="dxa"/>
						</w:tcMar>
						<w:vAlign w:val="center"/>
					</w:tcPr>
					<w:p w:rsidR="00365729" w:rsidRPr="00F06A9D" w:rsidRDefault="00365729" w:rsidP="0091797E">
						<w:pPr>
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
						</w:pPr>
						<w:r w:rsidRPr="00F06A9D">
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:color w:val="223342"/>
								<w:sz w:val="52"/>
								<w:szCs w:val="52"/>
							</w:rPr>
							<w:t>
								<xsl:value-of select="./Name"/>
							</w:t>
						</w:r>
						<w:r w:rsidRPr="00F06A9D">
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:b/>
								<w:color w:val="808080" w:themeColor="background1" w:themeShade="80"/>
								<w:sz w:val="32"/>
								<w:szCs w:val="32"/>
							</w:rPr>
							<w:t xml:space="preserve"> </w:t>
						</w:r>
						<w:r w:rsidRPr="00F06A9D">
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:b/>
								<w:color w:val="C8CDD1"/>
								<w:sz w:val="28"/>
								<w:szCs w:val="28"/>
							</w:rPr>
							<w:t xml:space="preserve"><xsl:text>( </xsl:text><xsl:value-of select="./Pid"/><xsl:text> )</xsl:text></w:t>
						</w:r>
					</w:p>
				</w:tc>
			</w:tr>
		</w:tbl>
		<w:p w:rsidR="00F06A9D" w:rsidRPr="00F06A9D" w:rsidRDefault="00F06A9D" w:rsidP="00F06A9D">
			<w:pPr>
				<w:spacing w:after="0"/>
				<w:rPr>
					<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
					<w:b/>
					<w:color w:val="88042C"/>
					<w:sz w:val="28"/>
					<w:szCs w:val="28"/>
				</w:rPr>
			</w:pPr>
		</w:p>
		<w:p w:rsidR="002F1378" w:rsidRPr="00F06A9D" w:rsidRDefault="002F1378" w:rsidP="004F6DB5">
			<w:pPr>
				<w:spacing w:after="120"/>
				<w:rPr>
					<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
					<w:b/>
					<w:color w:val="88042C"/>
					<w:sz w:val="28"/>
					<w:szCs w:val="28"/>
				</w:rPr>
			</w:pPr>
			<w:r w:rsidRPr="00F06A9D">
				<w:rPr>
					<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
					<w:b/>
					<w:color w:val="88042C"/>
					<w:sz w:val="28"/>
					<w:szCs w:val="28"/>
				</w:rPr>
				<w:t xml:space="preserve">Process </w:t>
			</w:r>
			<w:r w:rsidR="00A4799C" w:rsidRPr="00F06A9D">
				<w:rPr>
					<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
					<w:b/>
					<w:color w:val="88042C"/>
					<w:sz w:val="28"/>
					<w:szCs w:val="28"/>
				</w:rPr>
				<w:t>Details</w:t>
			</w:r>
		</w:p>
		<w:tbl>
			<w:tblPr>
				<w:tblStyle w:val="TableGrid"/>
				<w:tblW w:w="5000" w:type="pct"/>
				<w:tblBorders>
					<w:top w:val="none" w:sz="0" w:space="0" w:color="auto"/>
					<w:left w:val="none" w:sz="0" w:space="0" w:color="auto"/>
					<w:bottom w:val="none" w:sz="0" w:space="0" w:color="auto"/>
					<w:right w:val="none" w:sz="0" w:space="0" w:color="auto"/>
					<w:insideH w:val="none" w:sz="0" w:space="0" w:color="auto"/>
					<w:insideV w:val="none" w:sz="0" w:space="0" w:color="auto"/>
				</w:tblBorders>
				<w:tblLook w:val="0480"/>
			</w:tblPr>
			<w:tblGrid>
				<w:gridCol w:w="2898"/>
				<w:gridCol w:w="6678"/>
			</w:tblGrid>
			<w:tr w:rsidR="00A4799C" w:rsidRPr="00F06A9D" w:rsidTr="004F6DB5">
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="1513" w:type="pct"/>
					</w:tcPr>
					<w:p w:rsidR="00A4799C" w:rsidRPr="00F06A9D" w:rsidRDefault="004F6DB5" w:rsidP="0091797E">
						<w:pPr>
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:b/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
						</w:pPr>
						<w:r w:rsidRPr="00F06A9D">
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:b/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
							<w:t>Username:</w:t>
						</w:r>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="3487" w:type="pct"/>
					</w:tcPr>
					<w:p w:rsidR="00A4799C" w:rsidRPr="00F06A9D" w:rsidRDefault="004F6DB5" w:rsidP="0091797E">
						<w:pPr>
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
						</w:pPr>
						<w:r w:rsidRPr="00F06A9D">
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
							<w:t>
								<xsl:value-of select="./Username"/>
							</w:t>
						</w:r>
					</w:p>
				</w:tc>
			</w:tr>
			<w:tr w:rsidR="00A4799C" w:rsidRPr="00F06A9D" w:rsidTr="004F6DB5">
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="1513" w:type="pct"/>
					</w:tcPr>
					<w:p w:rsidR="00A4799C" w:rsidRPr="00F06A9D" w:rsidRDefault="004F6DB5" w:rsidP="0091797E">
						<w:pPr>
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:b/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
						</w:pPr>
						<w:r w:rsidRPr="00F06A9D">
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:b/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
							<w:t>Path:</w:t>
						</w:r>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="3487" w:type="pct"/>
					</w:tcPr>
					<w:p w:rsidR="00A4799C" w:rsidRPr="00F06A9D" w:rsidRDefault="004F6DB5" w:rsidP="004F6DB5">
						<w:pPr>
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
						</w:pPr>
						<w:r w:rsidRPr="00F06A9D">
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
							<w:t>
								<xsl:value-of select="./Path"/>
							</w:t>
						</w:r>
					</w:p>
				</w:tc>
			</w:tr>
			<w:tr w:rsidR="00A4799C" w:rsidRPr="00F06A9D" w:rsidTr="004F6DB5">
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="1513" w:type="pct"/>
					</w:tcPr>
					<w:p w:rsidR="00A4799C" w:rsidRPr="00F06A9D" w:rsidRDefault="004F6DB5" w:rsidP="0091797E">
						<w:pPr>
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:b/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
						</w:pPr>
						<w:r w:rsidRPr="00F06A9D">
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:b/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
							<w:t>Parent:</w:t>
						</w:r>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="3487" w:type="pct"/>
					</w:tcPr>
					<w:p w:rsidR="00A4799C" w:rsidRPr="00F06A9D" w:rsidRDefault="004F6DB5" w:rsidP="0091797E">
						<w:pPr>
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
						</w:pPr>
						<w:r w:rsidRPr="00F06A9D">
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
							<w:t>
								<xsl:value-of select="ParentProcessName"/>
							</w:t>
						</w:r>
					</w:p>
				</w:tc>
			</w:tr>
			<w:tr w:rsidR="00A4799C" w:rsidRPr="00F06A9D" w:rsidTr="004F6DB5">
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="1513" w:type="pct"/>
					</w:tcPr>
					<w:p w:rsidR="00A4799C" w:rsidRPr="00F06A9D" w:rsidRDefault="004F6DB5" w:rsidP="0091797E">
						<w:pPr>
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:b/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
						</w:pPr>
						<w:r w:rsidRPr="00F06A9D">
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:b/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
							<w:t>Parent Process Path:</w:t>
						</w:r>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="3487" w:type="pct"/>
					</w:tcPr>
					<w:p w:rsidR="00A4799C" w:rsidRPr="00F06A9D" w:rsidRDefault="004F6DB5" w:rsidP="004F6DB5">
						<w:pPr>
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
						</w:pPr>
						<w:r w:rsidRPr="00F06A9D">
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
							<w:t>
								<xsl:value-of select="./ParentPath"/>
							</w:t>
						</w:r>
					</w:p>
				</w:tc>
			</w:tr>
			<w:tr w:rsidR="00A4799C" w:rsidRPr="00F06A9D" w:rsidTr="004F6DB5">
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="1513" w:type="pct"/>
					</w:tcPr>
					<w:p w:rsidR="00A4799C" w:rsidRPr="00F06A9D" w:rsidRDefault="004F6DB5" w:rsidP="0091797E">
						<w:pPr>
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:b/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
						</w:pPr>
						<w:r w:rsidRPr="00F06A9D">
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:b/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
							<w:t>Arguments:</w:t>
						</w:r>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="3487" w:type="pct"/>
					</w:tcPr>
					<w:p w:rsidR="00A4799C" w:rsidRPr="00F06A9D" w:rsidRDefault="004F6DB5" w:rsidP="0091797E">
						<w:pPr>
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
						</w:pPr>
						<w:r w:rsidRPr="00F06A9D">
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
							<w:t>
								<xsl:value-of select="./Arguments"/>
							</w:t>
						</w:r>
					</w:p>
				</w:tc>
			</w:tr>
			<w:tr w:rsidR="00A4799C" w:rsidRPr="00F06A9D" w:rsidTr="004F6DB5">
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="1513" w:type="pct"/>
					</w:tcPr>
					<w:p w:rsidR="00A4799C" w:rsidRPr="00F06A9D" w:rsidRDefault="004F6DB5" w:rsidP="0091797E">
						<w:pPr>
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:b/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
						</w:pPr>
						<w:r w:rsidRPr="00F06A9D">
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:b/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
							<w:t>Start Time:</w:t>
						</w:r>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="3487" w:type="pct"/>
					</w:tcPr>
					<w:p w:rsidR="00A4799C" w:rsidRPr="00F06A9D" w:rsidRDefault="004F6DB5" w:rsidP="0091797E">
						<w:pPr>
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
						</w:pPr>
						<w:r w:rsidRPr="00F06A9D">
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
							<w:t>
								<xsl:value-of select="./StartTime"/>
							</w:t>
						</w:r>
					</w:p>
				</w:tc>
			</w:tr>
			<w:tr w:rsidR="00A4799C" w:rsidRPr="00F06A9D" w:rsidTr="004F6DB5">
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="1513" w:type="pct"/>
					</w:tcPr>
					<w:p w:rsidR="00A4799C" w:rsidRPr="00F06A9D" w:rsidRDefault="004F6DB5" w:rsidP="0091797E">
						<w:pPr>
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:b/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
						</w:pPr>
						<w:r w:rsidRPr="00F06A9D">
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:b/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
							<w:t>Kernel Time Elapsed:</w:t>
						</w:r>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="3487" w:type="pct"/>
					</w:tcPr>
					<w:p w:rsidR="00A4799C" w:rsidRPr="00F06A9D" w:rsidRDefault="004F6DB5" w:rsidP="0091797E">
						<w:pPr>
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
						</w:pPr>
						<w:r w:rsidRPr="00F06A9D">
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
							<w:t>
								<xsl:value-of select="./KernelTimeElapsed"/>
							</w:t>
						</w:r>
					</w:p>
				</w:tc>
			</w:tr>
			<w:tr w:rsidR="00A4799C" w:rsidRPr="00F06A9D" w:rsidTr="004F6DB5">
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="1513" w:type="pct"/>
					</w:tcPr>
					<w:p w:rsidR="00A4799C" w:rsidRPr="00F06A9D" w:rsidRDefault="004F6DB5" w:rsidP="0091797E">
						<w:pPr>
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:b/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
						</w:pPr>
						<w:r w:rsidRPr="00F06A9D">
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:b/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
							<w:t>User Time Elapsed:</w:t>
						</w:r>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="3487" w:type="pct"/>
					</w:tcPr>
					<w:p w:rsidR="00A4799C" w:rsidRPr="00F06A9D" w:rsidRDefault="004F6DB5" w:rsidP="0091797E">
						<w:pPr>
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
						</w:pPr>
						<w:r w:rsidRPr="00F06A9D">
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
							<w:t>
								<xsl:value-of select="./UserTimeElapsed"/>
							</w:t>
						</w:r>
					</w:p>
				</w:tc>
			</w:tr>
			<w:tr w:rsidR="00A4799C" w:rsidRPr="00F06A9D" w:rsidTr="004F6DB5">
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="1513" w:type="pct"/>
					</w:tcPr>
					<w:p w:rsidR="00A4799C" w:rsidRPr="00F06A9D" w:rsidRDefault="004F6DB5" w:rsidP="0091797E">
						<w:pPr>
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:b/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
						</w:pPr>
						<w:r w:rsidRPr="00F06A9D">
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:b/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
							<w:t>SID:</w:t>
						</w:r>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="3487" w:type="pct"/>
					</w:tcPr>
					<w:p w:rsidR="00A4799C" w:rsidRPr="00F06A9D" w:rsidRDefault="004F6DB5" w:rsidP="0091797E">
						<w:pPr>
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
						</w:pPr>
						<w:r w:rsidRPr="00F06A9D">
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
							<w:t>
								<xsl:value-of select="./Sid"/>
							</w:t>
						</w:r>
					</w:p>
				</w:tc>
			</w:tr>
			<w:tr w:rsidR="00A4799C" w:rsidRPr="00F06A9D" w:rsidTr="004F6DB5">
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="1513" w:type="pct"/>
					</w:tcPr>
					<w:p w:rsidR="00A4799C" w:rsidRPr="00F06A9D" w:rsidRDefault="004F6DB5" w:rsidP="0091797E">
						<w:pPr>
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:b/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
						</w:pPr>
						<w:r w:rsidRPr="00F06A9D">
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:b/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
							<w:t>SID Type:</w:t>
						</w:r>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="3487" w:type="pct"/>
					</w:tcPr>
					<w:p w:rsidR="00A4799C" w:rsidRPr="00F06A9D" w:rsidRDefault="004F6DB5" w:rsidP="0091797E">
						<w:pPr>
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
						</w:pPr>
						<w:proofErr w:type="spellStart"/>
						<w:r w:rsidRPr="00F06A9D">
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
							<w:t>
								<xsl:value-of select="./SidType"/>
							</w:t>
						</w:r>
					</w:p>
				</w:tc>
			</w:tr>
			<!--<w:tr w:rsidR="00A4799C" w:rsidRPr="00F06A9D" w:rsidTr="004F6DB5">
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="1513" w:type="pct"/>
					</w:tcPr>
					<w:p w:rsidR="00A4799C" w:rsidRPr="00F06A9D" w:rsidRDefault="004F6DB5" w:rsidP="0091797E">
						<w:pPr>
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:b/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
						</w:pPr>
						<w:r w:rsidRPr="00F06A9D">
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:b/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
							<w:t>Hidden:</w:t>
						</w:r>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="3487" w:type="pct"/>
					</w:tcPr>
					<w:p w:rsidR="00A4799C" w:rsidRPr="00F06A9D" w:rsidRDefault="004F6DB5" w:rsidP="0091797E">
						<w:pPr>
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
						</w:pPr>
						<w:r w:rsidRPr="00F06A9D">
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
							<w:t>
								<xsl:value-of select="./Hidden"/>
							</w:t>
						</w:r>
					</w:p>
				</w:tc>
			</w:tr>-->
			<w:tr w:rsidR="00FB3F2F" w:rsidRPr="00F06A9D" w:rsidTr="004F6DB5">
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="1513" w:type="pct"/>
					</w:tcPr>
					<w:p w:rsidR="00FB3F2F" w:rsidRPr="00F06A9D" w:rsidRDefault="004F6DB5" w:rsidP="000978FF">
						<w:pPr>
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:b/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
						</w:pPr>
						<w:r w:rsidRPr="00F06A9D">
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:b/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
							<w:t>Malware Risk Index:</w:t>
						</w:r>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="3487" w:type="pct"/>
					</w:tcPr>
					<w:p w:rsidR="00FB3F2F" w:rsidRPr="00F06A9D" w:rsidRDefault="004F6DB5" w:rsidP="000978FF">
						<w:pPr>
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
						</w:pPr>
						<w:r w:rsidRPr="00F06A9D">
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
							<w:t>
								<xsl:value-of select="../MRIScore"/>
							</w:t>
						</w:r>
					</w:p>
				</w:tc>
			</w:tr>
		</w:tbl>
	</xsl:template>
	
	<xsl:template match="ProcessScoreEntriesWithFalsePositiveCorrection">
		<w:p w:rsidR="00742446" w:rsidRPr="00F06A9D" w:rsidRDefault="00742446" w:rsidP="00F06A9D">
			<w:pPr>
				<w:spacing w:after="0"/>
				<w:rPr>
					<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
					<w:b/>
					<w:color w:val="88042C"/>
					<w:sz w:val="28"/>
					<w:szCs w:val="28"/>
				</w:rPr>
			</w:pPr>
		</w:p>
		<w:p w:rsidR="00C26495" w:rsidRPr="00F06A9D" w:rsidRDefault="00C26495" w:rsidP="005E00FE">
			<w:pPr>
				<w:spacing w:after="120"/>
				<w:rPr>
					<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
					<w:b/>
					<w:color w:val="88042C"/>
					<w:sz w:val="28"/>
					<w:szCs w:val="28"/>
				</w:rPr>
			</w:pPr>
			<w:r w:rsidRPr="00F06A9D">
				<w:rPr>
					<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
					<w:b/>
					<w:color w:val="88042C"/>
					<w:sz w:val="28"/>
					<w:szCs w:val="28"/>
				</w:rPr>
				<w:t xml:space="preserve">Malware </w:t>
			</w:r>
			<w:r w:rsidR="00F06A9D" w:rsidRPr="00F06A9D">
				<w:rPr>
					<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
					<w:b/>
					<w:color w:val="88042C"/>
					<w:sz w:val="28"/>
					<w:szCs w:val="28"/>
				</w:rPr>
				<w:t xml:space="preserve">Risk </w:t>
			</w:r>
			<w:r w:rsidRPr="00F06A9D">
				<w:rPr>
					<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
					<w:b/>
					<w:color w:val="88042C"/>
					<w:sz w:val="28"/>
					<w:szCs w:val="28"/>
				</w:rPr>
				<w:t>Index Hits</w:t>
			</w:r>
		</w:p>
		<w:tbl>
			<w:tblPr>
				<w:tblStyle w:val="TableGrid"/>
				<w:tblW w:w="4893" w:type="pct"/>
				<w:tblBorders>
					<w:top w:val="none" w:sz="0" w:space="0" w:color="auto"/>
					<w:left w:val="none" w:sz="0" w:space="0" w:color="auto"/>
					<w:bottom w:val="single" w:sz="4" w:space="0" w:color="F2F2F2" w:themeColor="background1" w:themeShade="F2"/>
					<w:right w:val="none" w:sz="0" w:space="0" w:color="auto"/>
					<w:insideH w:val="none" w:sz="0" w:space="0" w:color="auto"/>
					<w:insideV w:val="none" w:sz="0" w:space="0" w:color="auto"/>
				</w:tblBorders>
				<w:tblLook w:val="0480"/>
			</w:tblPr>
			<w:tblGrid>
				<w:gridCol w:w="567"/>
				<w:gridCol w:w="8818"/>
			</w:tblGrid>
			<xsl:apply-templates select="./ProcessScoreEntry"/>
		</w:tbl>
	</xsl:template>
	
	<xsl:template match="ProcessScoreEntry">
		<xsl:variable name="mod" select="position() mod 2"/>
		<w:tr w:rsidRPr="00F06A9D" w:rsidTr="0094508F">
			<xsl:attribute name="w:rsidR">
				<xsl:choose>
					<xsl:when test="$mod = 1">00E94FD8</xsl:when>
					<xsl:when test="$mod = 0">00C26495</xsl:when>
				</xsl:choose>
			</xsl:attribute>
			<w:tc>
				<w:tcPr>
					<w:tcW w:w="385" w:type="pct"/>
					<xsl:choose>
						<xsl:when test="$mod = 1">
							<w:shd w:val="clear" w:color="auto" w:fill="F2F2F2" w:themeFill="background1" w:themeFillShade="F2"/>
						</xsl:when>
					</xsl:choose>
					<w:tcMar>
						<w:top w:w="86" w:type="dxa"/>
						<w:left w:w="115" w:type="dxa"/>
						<w:bottom w:w="86" w:type="dxa"/>
						<w:right w:w="115" w:type="dxa"/>
					</w:tcMar>
					<w:vAlign w:val="center"/>
				</w:tcPr>
				<w:p w:rsidR="00276095" w:rsidRPr="00F06A9D" w:rsidRDefault="0094508F" w:rsidP="0094508F">
					<w:pPr>
						<w:jc w:val="center"/>
						<w:rPr>
							<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
							<w:color w:val="808080" w:themeColor="background1" w:themeShade="80"/>
							<w:sz w:val="20"/>
							<w:szCs w:val="20"/>
						</w:rPr>
					</w:pPr>
					<w:r w:rsidRPr="00F06A9D">
						<w:rPr>
							<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
							<w:noProof/>
							<w:color w:val="808080" w:themeColor="background1" w:themeShade="80"/>
							<w:sz w:val="20"/>
							<w:szCs w:val="20"/>
						</w:rPr>
						<xsl:choose>
							<xsl:when test="./FalsePositive = 'true'">
								<xsl:call-template name="halfTargetSmallIcon" />								
							</xsl:when>
							<xsl:when test="./HitType = 'UserInjected'">
								<xsl:call-template name="fullTargetSmallIcon" />
							</xsl:when>
							<xsl:when test="./HitType = 'Comment'">
								<xsl:call-template name="emptyTargetSmallIcon" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="fullTargetSmallIcon" />
							</xsl:otherwise>
						</xsl:choose>
					</w:r>
				</w:p>
			</w:tc>
			<w:tc>
				<w:tcPr>
					<w:tcW w:w="4698" w:type="pct"/>
					<xsl:choose>
						<xsl:when test="$mod = 1">
							<w:shd w:val="clear" w:color="auto" w:fill="F2F2F2" w:themeFill="background1" w:themeFillShade="F2"/>
						</xsl:when>
					</xsl:choose>
					<w:tcMar>
						<w:top w:w="86" w:type="dxa"/>
						<w:left w:w="115" w:type="dxa"/>
						<w:bottom w:w="86" w:type="dxa"/>
						<w:right w:w="115" w:type="dxa"/>
					</w:tcMar>
				</w:tcPr>
				<w:p w:rsidRPr="00F06A9D" w:rsidP="005E00FE">
					<xsl:attribute name="w:rsidR">
						<xsl:choose>
							<xsl:when test="$mod = 1">00C26495</xsl:when>
							<xsl:when test="$mod = 0">00276095</xsl:when>
						</xsl:choose>
					</xsl:attribute>
					<xsl:attribute name="w:rsidRDefault">
						<xsl:choose>
							<xsl:when test="$mod = 1">00C26495</xsl:when>
							<xsl:when test="$mod = 0">00276095</xsl:when>
						</xsl:choose>
					</xsl:attribute>
					<w:pPr>
						<w:rPr>
							<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
							<w:color w:val="223342"/>
							<w:sz w:val="20"/>
							<w:szCs w:val="20"/>
						</w:rPr>
					</w:pPr>
					<xsl:choose>
						<xsl:when test="./FalsePositive = 'true'">
							<w:r w:rsidRPr="00F06A9D">
								<w:rPr>
									<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
									<w:color w:val="00548B"/>
									<w:sz w:val="20"/>
									<w:szCs w:val="20"/>
								</w:rPr>
								<w:t xml:space="preserve">[False Positive]:  </w:t>
							</w:r>
						</xsl:when>
						<xsl:when test="./HitType = 'UserInjected'">
							<w:r w:rsidRPr="00F06A9D">
								<w:rPr>
									<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
									<w:color w:val="88042C"/>
									<w:sz w:val="20"/>
									<w:szCs w:val="20"/>
								</w:rPr>
								<w:t xml:space="preserve">[User Injected]:  </w:t>
							</w:r>
						</xsl:when>
						<xsl:when test="./HitType = 'Comment'">
							<w:r w:rsidR="004F6DB5" w:rsidRPr="00F06A9D">
								<w:rPr>
									<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
									<w:color w:val="223342"/>
									<w:sz w:val="20"/>
									<w:szCs w:val="20"/>
								</w:rPr>
								<w:t xml:space="preserve">[Comment]:  </w:t>
							</w:r>
						</xsl:when>
					</xsl:choose>
					<w:r w:rsidRPr="00F06A9D">
						<w:rPr>
							<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
							<w:color w:val="223342"/>
							<w:sz w:val="20"/>
							<w:szCs w:val="20"/>
						</w:rPr>
						<w:t>
							<xsl:value-of select="./Description"/>
						</w:t>
					</w:r>
				</w:p>
			</w:tc>
		</w:tr>
	</xsl:template>
	
	<xsl:template match="ModuleTrustSummaries">
		<w:p w:rsidR="00742446" w:rsidRPr="00F06A9D" w:rsidRDefault="00742446" w:rsidP="00F06A9D">
			<w:pPr>
				<w:spacing w:after="0"/>
				<w:rPr>
					<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
					<w:b/>
					<w:color w:val="88042C"/>
					<w:sz w:val="28"/>
					<w:szCs w:val="28"/>
				</w:rPr>
			</w:pPr>
		</w:p>
		<w:p w:rsidR="001F509F" w:rsidRPr="00F06A9D" w:rsidRDefault="005E00FE" w:rsidP="005E00FE">
			<w:pPr>
				<w:spacing w:after="120"/>
				<w:rPr>
					<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
					<w:b/>
					<w:color w:val="88042C"/>
					<w:sz w:val="28"/>
					<w:szCs w:val="28"/>
				</w:rPr>
			</w:pPr>
			<w:r w:rsidRPr="00F06A9D">
				<w:rPr>
					<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
					<w:b/>
					<w:color w:val="88042C"/>
					<w:sz w:val="28"/>
					<w:szCs w:val="28"/>
				</w:rPr>
				<w:t>Named Memory Sections</w:t>
			</w:r>
		</w:p>
		<w:tbl>
			<w:tblPr>
				<w:tblStyle w:val="TableGrid"/>
				<w:tblW w:w="1890" w:type="pct"/>
				<w:tblCellSpacing w:w="0" w:type="dxa"/>
				<w:tblBorders>
					<w:top w:val="none" w:sz="0" w:space="0" w:color="auto"/>
					<w:left w:val="none" w:sz="0" w:space="0" w:color="auto"/>
					<w:bottom w:val="none" w:sz="0" w:space="0" w:color="auto"/>
					<w:right w:val="none" w:sz="0" w:space="0" w:color="auto"/>
					<w:insideH w:val="none" w:sz="0" w:space="0" w:color="auto"/>
					<w:insideV w:val="none" w:sz="0" w:space="0" w:color="auto"/>
				</w:tblBorders>
				<w:tblCellMar>
					<w:left w:w="115" w:type="dxa"/>
					<w:right w:w="115" w:type="dxa"/>
				</w:tblCellMar>
				<w:tblLook w:val="0480"/>
			</w:tblPr>
			<w:tblGrid>
				<w:gridCol w:w="533"/>
				<w:gridCol w:w="2282"/>
				<w:gridCol w:w="810"/>
			</w:tblGrid>
			<xsl:apply-templates select="./ModuleTrustSummary"/>
			<w:tr w:rsidR="00727B0C" w:rsidRPr="00F06A9D" w:rsidTr="007F1410">
				<w:trPr>
					<w:tblCellSpacing w:w="0" w:type="dxa"/>
				</w:trPr>
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="735" w:type="pct"/>
						<w:shd w:val="clear" w:color="auto" w:fill="auto"/>
						<w:tcMar>
							<w:top w:w="29" w:type="dxa"/>
							<w:left w:w="115" w:type="dxa"/>
							<w:bottom w:w="29" w:type="dxa"/>
							<w:right w:w="115" w:type="dxa"/>
						</w:tcMar>
						<w:vAlign w:val="center"/>
					</w:tcPr>
					<w:p w:rsidR="00727B0C" w:rsidRPr="00F06A9D" w:rsidRDefault="00727B0C" w:rsidP="0053180F">
						<w:pPr>
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:noProof/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
						</w:pPr>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="3148" w:type="pct"/>
					</w:tcPr>
					<w:p w:rsidR="00727B0C" w:rsidRPr="00F06A9D" w:rsidRDefault="00727B0C" w:rsidP="007F1410">
						<w:pPr>
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
						</w:pPr>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="1117" w:type="pct"/>
						<w:vAlign w:val="center"/>
					</w:tcPr>
					<w:p w:rsidR="00727B0C" w:rsidRPr="00F06A9D" w:rsidRDefault="00727B0C" w:rsidP="001F509F">
						<w:pPr>
							<w:jc w:val="right"/>
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
						</w:pPr>
					</w:p>
				</w:tc>
			</w:tr>
		</w:tbl>
	</xsl:template>
	
	<xsl:template match="ModuleTrustSummary">
		<w:tr w:rsidR="007F1410" w:rsidRPr="00F06A9D" w:rsidTr="007F1410">
			<w:trPr>
				<w:tblCellSpacing w:w="0" w:type="dxa"/>
			</w:trPr>
			<w:tc>
				<w:tcPr>
					<w:tcW w:w="735" w:type="pct"/>
					<w:shd w:val="clear" w:color="auto" w:fill="auto"/>
					<w:tcMar>
						<w:top w:w="29" w:type="dxa"/>
						<w:left w:w="115" w:type="dxa"/>
						<w:bottom w:w="29" w:type="dxa"/>
						<w:right w:w="115" w:type="dxa"/>
					</w:tcMar>
					<w:vAlign w:val="center"/>
				</w:tcPr>
				<w:p w:rsidR="007F1410" w:rsidRPr="00F06A9D" w:rsidRDefault="00727B0C" w:rsidP="0053180F">
					<w:pPr>
						<w:rPr>
							<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
							<w:sz w:val="20"/>
							<w:szCs w:val="20"/>
						</w:rPr>
					</w:pPr>
					<w:r w:rsidRPr="00F06A9D">
						<w:rPr>
							<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
							<w:noProof/>
							<w:sz w:val="20"/>
							<w:szCs w:val="20"/>
						</w:rPr>
						<xsl:choose>
							<xsl:when test="./TrustStatus = 'PositiveFactor'">
								<xsl:call-template name="positiveIcon" />
							</xsl:when>
							<xsl:when test="./TrustStatus = 'NegativeFactor'">
								<xsl:call-template name="negativeIcon" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="ignoredIcon" />
							</xsl:otherwise>
						</xsl:choose>
					</w:r>
				</w:p>
			</w:tc>
			<w:tc>
				<w:tcPr>
					<w:tcW w:w="3148" w:type="pct"/>
				</w:tcPr>
				<w:p w:rsidR="007F1410" w:rsidRPr="00F06A9D" w:rsidRDefault="007F1410" w:rsidP="007F1410">
					<w:pPr>
						<w:rPr>
							<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
							<w:color w:val="223342"/>
							<w:sz w:val="20"/>
							<w:szCs w:val="20"/>
						</w:rPr>
					</w:pPr>
					<w:r w:rsidRPr="00F06A9D">
						<w:rPr>
							<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
							<w:color w:val="223342"/>
							<w:sz w:val="20"/>
							<w:szCs w:val="20"/>
						</w:rPr>
						<w:t>
							<xsl:choose>
								<xsl:when test="./TrustStatus = 'PositiveFactor'">
									<xsl:text>Positive Factors</xsl:text>
								</xsl:when>
								<xsl:when test="./TrustStatus = 'NegativeFactor'">
									<xsl:text>Negative Factors</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:text>Ignored Factors</xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</w:t>
					</w:r>
				</w:p>
			</w:tc>
			<w:tc>
				<w:tcPr>
					<w:tcW w:w="1117" w:type="pct"/>
					<w:vAlign w:val="center"/>
				</w:tcPr>
				<w:p w:rsidR="007F1410" w:rsidRPr="00F06A9D" w:rsidRDefault="007F1410" w:rsidP="001F509F">
					<w:pPr>
						<w:jc w:val="right"/>
						<w:rPr>
							<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
							<w:color w:val="223342"/>
							<w:sz w:val="20"/>
							<w:szCs w:val="20"/>
						</w:rPr>
					</w:pPr>
					<w:r w:rsidRPr="00F06A9D">
						<w:rPr>
							<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
							<w:color w:val="223342"/>
							<w:sz w:val="20"/>
							<w:szCs w:val="20"/>
						</w:rPr>
						<w:t>
							<xsl:value-of select="./Percentage"/>
							<xsl:text>%</xsl:text>
						</w:t>
					</w:r>
				</w:p>
			</w:tc>
		</w:tr>
	</xsl:template>
	
	<xsl:template match="ModuleScoreEntries">
		<w:tbl>
			<w:tblPr>
				<w:tblStyle w:val="MediumShading11"/>
				<w:tblW w:w="4897" w:type="pct"/>
				<w:tblLayout w:type="fixed"/>
				<w:tblLook w:val="0420"/>
			</w:tblPr>
			<w:tblGrid>
				<w:gridCol w:w="470"/>
				<w:gridCol w:w="2881"/>
				<w:gridCol w:w="810"/>
				<w:gridCol w:w="5218"/>
			</w:tblGrid>
			<w:tr w:rsidR="00742446" w:rsidRPr="00F06A9D" w:rsidTr="0094508F">
				<w:trPr>
					<w:cnfStyle w:val="100000000000"/>
					<w:trHeight w:val="30"/>
				</w:trPr>
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="1786" w:type="pct"/>
						<w:gridSpan w:val="2"/>
						<w:shd w:val="clear" w:color="auto" w:fill="D9D9D9" w:themeFill="background1" w:themeFillShade="D9"/>
					</w:tcPr>
					<w:p w:rsidR="0053180F" w:rsidRPr="00F06A9D" w:rsidRDefault="0053180F" w:rsidP="0051184C">
						<w:pPr>
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:b w:val="0"/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
						</w:pPr>
						<w:r w:rsidRPr="00F06A9D">
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:b w:val="0"/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
							<w:lastRenderedPageBreak/>
							<w:t>Trust Status</w:t>
						</w:r>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="432" w:type="pct"/>
						<w:shd w:val="clear" w:color="auto" w:fill="D9D9D9" w:themeFill="background1" w:themeFillShade="D9"/>
					</w:tcPr>
					<w:p w:rsidR="0053180F" w:rsidRPr="00F06A9D" w:rsidRDefault="007F1410" w:rsidP="0053180F">
						<w:pPr>
							<w:jc w:val="center"/>
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:b w:val="0"/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
						</w:pPr>
						<w:r w:rsidRPr="00F06A9D">
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:b w:val="0"/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
							<w:t>Count</w:t>
						</w:r>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcW w:w="2782" w:type="pct"/>
						<w:shd w:val="clear" w:color="auto" w:fill="D9D9D9" w:themeFill="background1" w:themeFillShade="D9"/>
					</w:tcPr>
					<w:p w:rsidR="0053180F" w:rsidRPr="00F06A9D" w:rsidRDefault="0053180F" w:rsidP="0051184C">
						<w:pPr>
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:b w:val="0"/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
						</w:pPr>
						<w:r w:rsidRPr="00F06A9D">
							<w:rPr>
								<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
								<w:b w:val="0"/>
								<w:color w:val="223342"/>
								<w:sz w:val="20"/>
								<w:szCs w:val="20"/>
							</w:rPr>
							<w:t>Name</w:t>
						</w:r>
					</w:p>
				</w:tc>
			</w:tr>
			<xsl:apply-templates select="./ModuleScoreEntry"/>
		</w:tbl>
		<w:p w:rsidR="002F1378" w:rsidRPr="00F06A9D" w:rsidRDefault="002F1378">
			<w:pPr>
				<w:rPr>
					<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
					<w:b/>
					<w:sz w:val="24"/>
					<w:szCs w:val="24"/>
				</w:rPr>
			</w:pPr>
		</w:p>
	</xsl:template>
	
	<xsl:template match="ModuleScoreEntry">
		<xsl:variable name="mod" select="position() mod 2"/>
		<w:tr w:rsidR="00742446" w:rsidRPr="00F06A9D" w:rsidTr="0094508F">
			<xsl:choose>
				<xsl:when test="$mod = 1">
					<w:trPr>
						<w:cnfStyle w:val="000000100000"/>
						<w:trHeight w:val="34"/>
					</w:trPr>
				</xsl:when>
				<xsl:when test="$mod = 0">
					<w:trPr>
						<w:cnfStyle w:val="000000010000"/>
						<w:trHeight w:val="30"/>
					</w:trPr>
				</xsl:when>
			</xsl:choose>
			<w:tc>
				<w:tcPr>
					<w:tcW w:w="250" w:type="pct"/>
				</w:tcPr>
				<w:p w:rsidR="00727B0C" w:rsidRPr="00F06A9D" w:rsidRDefault="00727B0C" w:rsidP="0051184C">
					<w:pPr>
						<w:rPr>
							<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
							<w:color w:val="223342"/>
							<w:sz w:val="20"/>
							<w:szCs w:val="20"/>
						</w:rPr>
					</w:pPr>
					<w:r w:rsidRPr="00F06A9D">
						<w:rPr>
							<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
							<w:noProof/>
							<w:color w:val="223342"/>
							<w:sz w:val="20"/>
							<w:szCs w:val="20"/>
						</w:rPr>
						<xsl:choose>
							<xsl:when test="./TrustStatus = 'ImplicitlyTrusted'">
								<xsl:call-template name="positiveIcon" />
							</xsl:when>
							<xsl:when test="./TrustStatus = 'DigitallySignedAndVerified'">
								<xsl:call-template name="positiveIcon" />
							</xsl:when>
							<xsl:when test="./TrustStatus = 'UserTrusted'">
								<xsl:call-template name="positiveIcon" />
							</xsl:when>
							<xsl:when test="./TrustStatus = 'Untrusted'">
								<xsl:call-template name="negativeIcon" />
							</xsl:when>
							<xsl:when test="./TrustStatus = 'NoDigSigAvailable'">
								<xsl:call-template name="negativeIcon" />
							</xsl:when>
							<xsl:when test="./TrustStatus = 'UserUnTrusted'">
								<xsl:call-template name="negativeIcon" />
							</xsl:when>
							<xsl:when test="./TrustStatus = 'Ignored'">
								<xsl:call-template name="ignoredIcon" />
							</xsl:when>
							<xsl:when test="./TrustStatus = 'Injected'">
								<xsl:call-template name="negativeIcon" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="ignoredIcon" />
							</xsl:otherwise>
						</xsl:choose>
					</w:r>
				</w:p>
			</w:tc>
			<w:tc>
				<w:tcPr>
					<w:tcW w:w="1536" w:type="pct"/>
				</w:tcPr>
				<w:p w:rsidR="00727B0C" w:rsidRPr="00F06A9D" w:rsidRDefault="00727B0C" w:rsidP="0051184C">
					<w:pPr>
						<w:rPr>
							<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
							<w:color w:val="223342"/>
							<w:sz w:val="20"/>
							<w:szCs w:val="20"/>
						</w:rPr>
					</w:pPr>
					<w:r w:rsidRPr="00F06A9D">
						<w:rPr>
							<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
							<w:color w:val="223342"/>
							<w:sz w:val="20"/>
							<w:szCs w:val="20"/>
						</w:rPr>
						<w:t>
							<xsl:choose>
								<xsl:when test="./TrustStatus = 'ImplicitlyTrusted'">
									<xsl:text>Found in </xsl:text>
									<xsl:value-of select="/MalwareRatingIndexReport/ImplicitTrustThreshold"/>
									<xsl:text> of all Processes</xsl:text>
								</xsl:when>
								<xsl:when test="./TrustStatus = 'DigitallySignedAndVerified'">
									<xsl:text>Digitally signed and verified</xsl:text>
								</xsl:when>
								<xsl:when test="./TrustStatus = 'UserTrusted'">
									<xsl:text>User Trusted</xsl:text>
								</xsl:when>
								<xsl:when test="./TrustStatus = 'Untrusted'">
									<xsl:text>Not Signed and Verified</xsl:text>
								</xsl:when>
								<xsl:when test="./TrustStatus = 'NoDigSigAvailable'">
									<xsl:text>No Digital Signature</xsl:text>
								</xsl:when>
								<xsl:when test="./TrustStatus = 'UserUnTrusted'">
									<xsl:text>User Untrusted</xsl:text>
								</xsl:when>
								<xsl:when test="./TrustStatus = 'Ignored'">
									<xsl:text>Ignored per Configuration</xsl:text>
								</xsl:when>
								<xsl:when test="./TrustStatus = 'Injected'">
									<xsl:text>Injected</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:text>Unknown</xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</w:t>
					</w:r>
				</w:p>
			</w:tc>
			<w:tc>
				<w:tcPr>
					<w:tcW w:w="432" w:type="pct"/>
				</w:tcPr>
				<w:p w:rsidR="00727B0C" w:rsidRPr="00F06A9D" w:rsidRDefault="00727B0C" w:rsidP="00727B0C">
					<w:pPr>
						<w:jc w:val="center"/>
						<w:rPr>
							<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
							<w:color w:val="223342"/>
							<w:sz w:val="20"/>
							<w:szCs w:val="20"/>
						</w:rPr>
					</w:pPr>
					<w:r w:rsidRPr="00F06A9D">
						<w:rPr>
							<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
							<w:color w:val="223342"/>
							<w:sz w:val="20"/>
							<w:szCs w:val="20"/>
						</w:rPr>
						<w:t>
							<xsl:value-of select="./Count"/>
						</w:t>
					</w:r>
				</w:p>
			</w:tc>
			<w:tc>
				<w:tcPr>
					<w:tcW w:w="2782" w:type="pct"/>
				</w:tcPr>
				<w:p w:rsidR="00727B0C" w:rsidRPr="00F06A9D" w:rsidRDefault="00727B0C" w:rsidP="00727B0C">
					<w:pPr>
						<w:rPr>
							<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
							<w:color w:val="223342"/>
							<w:sz w:val="20"/>
							<w:szCs w:val="20"/>
						</w:rPr>
					</w:pPr>
					<w:r w:rsidRPr="00F06A9D">
						<w:rPr>
							<w:rFonts w:ascii="Arial" w:hAnsi="Arial" w:cs="Arial"/>
							<w:color w:val="223342"/>
							<w:sz w:val="20"/>
							<w:szCs w:val="20"/>
						</w:rPr>
						<w:t>
							<xsl:value-of select="./ModuleName"/>
						</w:t>
					</w:r>
				</w:p>
			</w:tc>
		</w:tr>
	</xsl:template>
	
	<xsl:template name="positiveIcon">
		<w:drawing>
			<wp:inline distT="0" distB="0" distL="0" distR="0">
				<wp:extent cx="172720" cy="172720"/>
				<wp:effectExtent l="19050" t="0" r="0" b="0"/>
				<wp:docPr id="63" name="Picture 11" descr="M:\SlimCharles\Resources\Images\Positive.png"/>
				<wp:cNvGraphicFramePr>
					<a:graphicFrameLocks xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" noChangeAspect="1"/>
				</wp:cNvGraphicFramePr>
				<a:graphic xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main">
					<a:graphicData uri="http://schemas.openxmlformats.org/drawingml/2006/picture">
						<pic:pic xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture">
							<pic:nvPicPr>
								<pic:cNvPr id="0" name="Picture 11" descr="M:\SlimCharles\Resources\Images\Positive.png"/>
								<pic:cNvPicPr>
									<a:picLocks noChangeAspect="1" noChangeArrowheads="1"/>
								</pic:cNvPicPr>
							</pic:nvPicPr>
							<pic:blipFill>
								<a:blip r:embed="rId14" cstate="print"/>
								<a:srcRect/>
								<a:stretch>
									<a:fillRect/>
								</a:stretch>
							</pic:blipFill>
							<pic:spPr bwMode="auto">
								<a:xfrm>
									<a:off x="0" y="0"/>
									<a:ext cx="172720" cy="172720"/>
								</a:xfrm>
								<a:prstGeom prst="rect">
									<a:avLst/>
								</a:prstGeom>
								<a:noFill/>
								<a:ln w="9525">
									<a:noFill/>
									<a:miter lim="800000"/>
									<a:headEnd/>
									<a:tailEnd/>
								</a:ln>
							</pic:spPr>
						</pic:pic>
					</a:graphicData>
				</a:graphic>
			</wp:inline>
		</w:drawing>
	</xsl:template>
	<xsl:template name="negativeIcon">
		<w:drawing>
			<wp:inline distT="0" distB="0" distL="0" distR="0">
				<wp:extent cx="172720" cy="172720"/>
				<wp:effectExtent l="19050" t="0" r="0" b="0"/>
				<wp:docPr id="75" name="Picture 12" descr="M:\SlimCharles\Resources\Images\Negative.png"/>
				<wp:cNvGraphicFramePr>
					<a:graphicFrameLocks xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" noChangeAspect="1"/>
				</wp:cNvGraphicFramePr>
				<a:graphic xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main">
					<a:graphicData uri="http://schemas.openxmlformats.org/drawingml/2006/picture">
						<pic:pic xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture">
							<pic:nvPicPr>
								<pic:cNvPr id="0" name="Picture 12" descr="M:\SlimCharles\Resources\Images\Negative.png"/>
								<pic:cNvPicPr>
									<a:picLocks noChangeAspect="1" noChangeArrowheads="1"/>
								</pic:cNvPicPr>
							</pic:nvPicPr>
							<pic:blipFill>
								<a:blip r:embed="rId13" cstate="print"/>
								<a:srcRect/>
								<a:stretch>
									<a:fillRect/>
								</a:stretch>
							</pic:blipFill>
							<pic:spPr bwMode="auto">
								<a:xfrm>
									<a:off x="0" y="0"/>
									<a:ext cx="172720" cy="172720"/>
								</a:xfrm>
								<a:prstGeom prst="rect">
									<a:avLst/>
								</a:prstGeom>
								<a:noFill/>
								<a:ln w="9525">
									<a:noFill/>
									<a:miter lim="800000"/>
									<a:headEnd/>
									<a:tailEnd/>
								</a:ln>
							</pic:spPr>
						</pic:pic>
					</a:graphicData>
				</a:graphic>
			</wp:inline>
		</w:drawing>
	</xsl:template>
	<xsl:template name="ignoredIcon">
		<w:drawing>
			<wp:inline distT="0" distB="0" distL="0" distR="0">
				<wp:extent cx="172720" cy="172720"/>
				<wp:effectExtent l="19050" t="0" r="0" b="0"/>
				<wp:docPr id="62" name="Picture 10" descr="M:\SlimCharles\Resources\Images\Ignored.png"/>
				<wp:cNvGraphicFramePr>
					<a:graphicFrameLocks xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" noChangeAspect="1"/>
				</wp:cNvGraphicFramePr>
				<a:graphic xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main">
					<a:graphicData uri="http://schemas.openxmlformats.org/drawingml/2006/picture">
						<pic:pic xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture">
							<pic:nvPicPr>
								<pic:cNvPr id="0" name="Picture 10" descr="M:\SlimCharles\Resources\Images\Ignored.png"/>
								<pic:cNvPicPr>
									<a:picLocks noChangeAspect="1" noChangeArrowheads="1"/>
								</pic:cNvPicPr>
							</pic:nvPicPr>
							<pic:blipFill>
								<a:blip r:embed="rId15" cstate="print"/>
								<a:srcRect/>
								<a:stretch>
									<a:fillRect/>
								</a:stretch>
							</pic:blipFill>
							<pic:spPr bwMode="auto">
								<a:xfrm>
									<a:off x="0" y="0"/>
									<a:ext cx="172720" cy="172720"/>
								</a:xfrm>
								<a:prstGeom prst="rect">
									<a:avLst/>
								</a:prstGeom>
								<a:noFill/>
								<a:ln w="9525">
									<a:noFill/>
									<a:miter lim="800000"/>
									<a:headEnd/>
									<a:tailEnd/>
								</a:ln>
							</pic:spPr>
						</pic:pic>
					</a:graphicData>
				</a:graphic>
			</wp:inline>
		</w:drawing>
	</xsl:template>
	
	<xsl:template name="fullTargetSmallIcon">
		<w:drawing>
			<wp:inline distT="0" distB="0" distL="0" distR="0">
				<wp:extent cx="191135" cy="191135"/>
				<wp:effectExtent l="0" t="0" r="0" b="0"/>
				<wp:docPr id="78" name="Picture 5" descr="M:\SlimCharles\Resources\Images\MRIBadgeFullSmall.png"/>
				<wp:cNvGraphicFramePr>
					<a:graphicFrameLocks xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" noChangeAspect="1"/>
				</wp:cNvGraphicFramePr>
				<a:graphic xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main">
					<a:graphicData uri="http://schemas.openxmlformats.org/drawingml/2006/picture">
						<pic:pic xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture">
							<pic:nvPicPr>
								<pic:cNvPr id="0" name="Picture 5" descr="M:\SlimCharles\Resources\Images\MRIBadgeFullSmall.png"/>
								<pic:cNvPicPr>
									<a:picLocks noChangeAspect="1" noChangeArrowheads="1"/>
								</pic:cNvPicPr>
							</pic:nvPicPr>
							<pic:blipFill>
								<a:blip r:embed="rId10" cstate="print"/>
								<a:srcRect/>
								<a:stretch>
									<a:fillRect/>
								</a:stretch>
							</pic:blipFill>
							<pic:spPr bwMode="auto">
								<a:xfrm>
									<a:off x="0" y="0"/>
									<a:ext cx="191135" cy="191135"/>
								</a:xfrm>
								<a:prstGeom prst="rect">
									<a:avLst/>
								</a:prstGeom>
								<a:noFill/>
								<a:ln w="9525">
									<a:noFill/>
									<a:miter lim="800000"/>
									<a:headEnd/>
									<a:tailEnd/>
								</a:ln>
							</pic:spPr>
						</pic:pic>
					</a:graphicData>
				</a:graphic>
			</wp:inline>
		</w:drawing>
	</xsl:template>
	<xsl:template name="halfTargetSmallIcon">
		<w:drawing>
			<wp:inline distT="0" distB="0" distL="0" distR="0">
				<wp:extent cx="191135" cy="191135"/>
				<wp:effectExtent l="0" t="0" r="0" b="0"/>
				<wp:docPr id="23" name="Picture 7" descr="M:\SlimCharles\Resources\Images\MRIBadgeHalfSmall.png"/>
				<wp:cNvGraphicFramePr>
					<a:graphicFrameLocks xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" noChangeAspect="1"/>
				</wp:cNvGraphicFramePr>
				<a:graphic xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main">
					<a:graphicData uri="http://schemas.openxmlformats.org/drawingml/2006/picture">
						<pic:pic xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture">
							<pic:nvPicPr>
								<pic:cNvPr id="0" name="Picture 7" descr="M:\SlimCharles\Resources\Images\MRIBadgeHalfSmall.png"/>
								<pic:cNvPicPr>
									<a:picLocks noChangeAspect="1" noChangeArrowheads="1"/>
								</pic:cNvPicPr>
							</pic:nvPicPr>
							<pic:blipFill>
								<a:blip r:embed="rId12" cstate="print"/>
								<a:srcRect/>
								<a:stretch>
									<a:fillRect/>
								</a:stretch>
							</pic:blipFill>
							<pic:spPr bwMode="auto">
								<a:xfrm>
									<a:off x="0" y="0"/>
									<a:ext cx="191135" cy="191135"/>
								</a:xfrm>
								<a:prstGeom prst="rect">
									<a:avLst/>
								</a:prstGeom>
								<a:noFill/>
								<a:ln w="9525">
									<a:noFill/>
									<a:miter lim="800000"/>
									<a:headEnd/>
									<a:tailEnd/>
								</a:ln>
							</pic:spPr>
						</pic:pic>
					</a:graphicData>
				</a:graphic>
			</wp:inline>
		</w:drawing>
	</xsl:template>
	<xsl:template name="emptyTargetSmallIcon">
		<w:drawing>
			<wp:inline distT="0" distB="0" distL="0" distR="0">
				<wp:extent cx="191135" cy="191135"/>
				<wp:effectExtent l="0" t="0" r="0" b="0"/>
				<wp:docPr id="25" name="Picture 9" descr="M:\SlimCharles\Resources\Images\MRIBadgeEmptySmall.png"/>
				<wp:cNvGraphicFramePr>
					<a:graphicFrameLocks xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" noChangeAspect="1"/>
				</wp:cNvGraphicFramePr>
				<a:graphic xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main">
					<a:graphicData uri="http://schemas.openxmlformats.org/drawingml/2006/picture">
						<pic:pic xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture">
							<pic:nvPicPr>
								<pic:cNvPr id="0" name="Picture 9" descr="M:\SlimCharles\Resources\Images\MRIBadgeEmptySmall.png"/>
								<pic:cNvPicPr>
									<a:picLocks noChangeAspect="1" noChangeArrowheads="1"/>
								</pic:cNvPicPr>
							</pic:nvPicPr>
							<pic:blipFill>
								<a:blip r:embed="rId11" cstate="print"/>
								<a:srcRect/>
								<a:stretch>
									<a:fillRect/>
								</a:stretch>
							</pic:blipFill>
							<pic:spPr bwMode="auto">
								<a:xfrm>
									<a:off x="0" y="0"/>
									<a:ext cx="191135" cy="191135"/>
								</a:xfrm>
								<a:prstGeom prst="rect">
									<a:avLst/>
								</a:prstGeom>
								<a:noFill/>
								<a:ln w="9525">
									<a:noFill/>
									<a:miter lim="800000"/>
									<a:headEnd/>
									<a:tailEnd/>
								</a:ln>
							</pic:spPr>
						</pic:pic>
					</a:graphicData>
				</a:graphic>
			</wp:inline>
		</w:drawing>
	</xsl:template>

	<xsl:template name="fullTargetLargeIcon">
		<w:drawing>
			<wp:inline distT="0" distB="0" distL="0" distR="0">
				<wp:extent cx="685800" cy="685800"/>
				<wp:effectExtent l="19050" t="0" r="0" b="0"/>
				<wp:docPr id="19" name="Picture 3" descr="M:\SlimCharles\Resources\Images\MRIBadgeFullLarge.png"/>
				<wp:cNvGraphicFramePr>
					<a:graphicFrameLocks xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" noChangeAspect="1"/>
				</wp:cNvGraphicFramePr>
				<a:graphic xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main">
					<a:graphicData uri="http://schemas.openxmlformats.org/drawingml/2006/picture">
						<pic:pic xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture">
							<pic:nvPicPr>
								<pic:cNvPr id="0" name="Picture 3" descr="M:\SlimCharles\Resources\Images\MRIBadgeFullLarge.png"/>
								<pic:cNvPicPr>
									<a:picLocks noChangeAspect="1" noChangeArrowheads="1"/>
								</pic:cNvPicPr>
							</pic:nvPicPr>
							<pic:blipFill>
								<a:blip r:embed="rId7" cstate="print"/>
								<a:srcRect/>
								<a:stretch>
									<a:fillRect/>
								</a:stretch>
							</pic:blipFill>
							<pic:spPr bwMode="auto">
								<a:xfrm>
									<a:off x="0" y="0"/>
									<a:ext cx="687950" cy="687950"/>
								</a:xfrm>
								<a:prstGeom prst="rect">
									<a:avLst/>
								</a:prstGeom>
								<a:noFill/>
								<a:ln w="9525">
									<a:noFill/>
									<a:miter lim="800000"/>
									<a:headEnd/>
									<a:tailEnd/>
								</a:ln>
							</pic:spPr>
						</pic:pic>
					</a:graphicData>
				</a:graphic>
			</wp:inline>
		</w:drawing>
	</xsl:template>
	<xsl:template name="halfTargetLargeIcon">
		<w:drawing>
			<wp:inline distT="0" distB="0" distL="0" distR="0">
				<wp:extent cx="683810" cy="683810"/>
				<wp:effectExtent l="19050" t="0" r="1990" b="0"/>
				<wp:docPr id="1" name="Picture 1" descr="M:\SlimCharles\Resources\Images\MRIBadgeHalfLarge.png"/>
				<wp:cNvGraphicFramePr>
					<a:graphicFrameLocks xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" noChangeAspect="1"/>
				</wp:cNvGraphicFramePr>
				<a:graphic xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main">
					<a:graphicData uri="http://schemas.openxmlformats.org/drawingml/2006/picture">
						<pic:pic xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture">
							<pic:nvPicPr>
								<pic:cNvPr id="0" name="Picture 1" descr="M:\SlimCharles\Resources\Images\MRIBadgeHalfLarge.png"/>
								<pic:cNvPicPr>
									<a:picLocks noChangeAspect="1" noChangeArrowheads="1"/>
								</pic:cNvPicPr>
							</pic:nvPicPr>
							<pic:blipFill>
								<a:blip r:embed="rId9" cstate="print"/>
								<a:srcRect/>
								<a:stretch>
									<a:fillRect/>
								</a:stretch>
							</pic:blipFill>
							<pic:spPr bwMode="auto">
								<a:xfrm>
									<a:off x="0" y="0"/>
									<a:ext cx="684619" cy="684619"/>
								</a:xfrm>
								<a:prstGeom prst="rect">
									<a:avLst/>
								</a:prstGeom>
								<a:noFill/>
								<a:ln w="9525">
									<a:noFill/>
									<a:miter lim="800000"/>
									<a:headEnd/>
									<a:tailEnd/>
								</a:ln>
							</pic:spPr>
						</pic:pic>
					</a:graphicData>
				</a:graphic>
			</wp:inline>
		</w:drawing>
	</xsl:template>
	<xsl:template name="emptyTargetLargeIcon">
		<w:drawing>
			<wp:inline distT="0" distB="0" distL="0" distR="0">
				<wp:extent cx="695325" cy="695325"/>
				<wp:effectExtent l="19050" t="0" r="9525" b="0"/>
				<wp:docPr id="4" name="Picture 3" descr="M:\SlimCharles\Resources\Images\MRIBadgeEmptyLarge.png"/>
				<wp:cNvGraphicFramePr>
					<a:graphicFrameLocks xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main" noChangeAspect="1"/>
				</wp:cNvGraphicFramePr>
				<a:graphic xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main">
					<a:graphicData uri="http://schemas.openxmlformats.org/drawingml/2006/picture">
						<pic:pic xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture">
							<pic:nvPicPr>
								<pic:cNvPr id="0" name="Picture 3" descr="M:\SlimCharles\Resources\Images\MRIBadgeEmptyLarge.png"/>
								<pic:cNvPicPr>
									<a:picLocks noChangeAspect="1" noChangeArrowheads="1"/>
								</pic:cNvPicPr>
							</pic:nvPicPr>
							<pic:blipFill>
								<a:blip r:embed="rId8" cstate="print"/>
								<a:srcRect/>
								<a:stretch>
									<a:fillRect/>
								</a:stretch>
							</pic:blipFill>
							<pic:spPr bwMode="auto">
								<a:xfrm>
									<a:off x="0" y="0"/>
									<a:ext cx="695554" cy="695554"/>
								</a:xfrm>
								<a:prstGeom prst="rect">
									<a:avLst/>
								</a:prstGeom>
								<a:noFill/>
								<a:ln w="9525">
									<a:noFill/>
									<a:miter lim="800000"/>
									<a:headEnd/>
									<a:tailEnd/>
								</a:ln>
							</pic:spPr>
						</pic:pic>
					</a:graphicData>
				</a:graphic>
			</wp:inline>
		</w:drawing>
	</xsl:template>
</xsl:stylesheet>
