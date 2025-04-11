CREATE TABLE SessionInformation
(
	ID INTEGER NOT NULL PRIMARY KEY,
	DatabaseVersion TEXT NULL,
	CollectionType TEXT NULL,
	AuditPlatform TEXT NULL,
	AuditLocation TEXT NULL,
	MemoryImageLocation TEXT NULL,
	AcquisitionsLocation TEXT NULL,
	TimelineConfiguration TEXT NULL,
	DigSigsAvailable BOOLEAN NULL,
	WhitelistUID TEXT NULL,
	ApplianceUri TEXT
);

CREATE TABLE AuditModules
(
	ID INTEGER NOT NULL PRIMARY KEY,
	Generator TEXT NULL,
	AuditItemsCount INTEGER NULL,
	AuditFileLocation TEXT NULL,
	IssuesFileLocation TEXT NULL,
	HasIssues BOOLEAN NULL,
	SuppressAudit BOOLEAN NULL
);
CREATE TABLE AuditModuleConfiguration
(
	ID INTEGER NOT NULL PRIMARY KEY,
	ParameterName TEXT NULL,
	ParameterValue TEXT NULL,
	AuditModuleID INTEGER NULL,
	FOREIGN KEY(AuditModuleID) REFERENCES AuditModules(ID) ON DELETE SET NULL	
);
CREATE TABLE AuditModuleIssues
(
	ID INTEGER NOT NULL PRIMARY KEY,
	AuditModuleID INTEGER NULL,
	Number INTEGER NULL,
	Level TEXT NULL,
	Summary TEXT NULL,
	Code TEXT NULL,
	Reference TEXT NULL,
	Context TEXT NULL,
	ContextSummary TEXT NULL,
	FOREIGN KEY(AuditModuleID) REFERENCES AuditModules(ID) ON DELETE SET NULL	
);
CREATE TABLE AcquisitionHistory
(
	ID INTEGER NOT NULL PRIMARY KEY,
	Name TEXT NULL,
	AcquireValue TEXT NULL,
	State TEXT NULL,
	Location TEXT NULL,
	Type TEXT NULL,
	AcquisitionDate TIMESTAMP NULL,
	Exception TEXT NULL
);

CREATE TABLE ItemSummaries
(
	ID INTEGER NOT NULL PRIMARY KEY,
	ItemID INTEGER NOT NULL,
	AuditType TEXT NULL,
	RowGUID TEXT NULL,
	Tag INTEGER NULL,
	Comment TEXT NULL,
	Summary1 TEXT NULL,
	Summary2 TEXT NULL,
	Summary3 TEXT NULL,
	Summary4 TEXT NULL,
	Summary5 TEXT NULL,
	Summary6 TEXT NULL,
	Summary7 TEXT NULL,
	Summary8 TEXT NULL,
	Hash TEXT NULL,
	UniqueUsername TEXT NULL,
	UniquePID1 INTEGER NULL,
	UniquePID2 INTEGER NULL,
	NormalizedPath TEXT NULL, 
	IsDuplicate BOOLEAN NULL
);

CREATE TABLE SystemInformation
(	
	ID INTEGER NOT NULL PRIMARY KEY,
	AvailablePhysicalMemory INTEGER NULL,
	AvailablePhysicalMemoryAsDisplayed TEXT NULL,
	BiosDate TEXT NULL,
	BiosVersion TEXT NULL,
	BiosType TEXT NULL,
	Domain TEXT NULL,
	Hostname TEXT NULL,
	InstallDate TIMESTAMP NULL,
	LoggedInUser TEXT NULL,
	MachineName TEXT NULL,
	OsBitness TEXT NULL,
	OsBuild TEXT NULL,
	OsString TEXT NULL,
	KernelVersion TEXT NULL,
	PatchLevel TEXT NULL,
	NetworkAdapter TEXT NULL,
	ProcessorIdentity TEXT NULL,
	ProcessorType TEXT NULL,
	ProductID TEXT NULL,
	ProductName TEXT NULL,
	Organization TEXT NULL,
	Owner TEXT NULL,
	SystemDate TIMESTAMP NULL,
	SystemDirectory TEXT NULL,
	TimeZoneDST TEXT NULL,
	TimeZoneStandard TEXT NULL,
	TotalPhysicalMemory INTEGER NULL,
	TotalPhysicalMemoryAsDisplayed TEXT NULL,
	Uptime TEXT NULL,
	LitmusScriptID TEXT NULL,
	ContainmentState TEXT NULL,
	ClockSkew TEXT NULL,
	StateAgentStatus TEXT NULL,
	ApplicationVersion TEXT NULL,
	ApplicationCreated TIMESTAMP NULL,
	ApplicationConfigHash TEXT NULL,
	PrimaryIPAddress TEXT NULL,
	Drives TEXT NULL,
	LoggedOnUser TEXT NULL,
	ItemSummaryID INTEGER NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL
);
CREATE TABLE NetworkAdapters
(
	ID INTEGER NOT NULL PRIMARY KEY,
	Adapter TEXT NULL,
	Description TEXT NULL,
	DHCPLeaseExpires TIMESTAMP NULL,
	DHCPLeaseObtained TIMESTAMP NULL,
	MACAddress TEXT NULL,		
	SystemID INTEGER NULL,	
	FOREIGN KEY (SystemID) REFERENCES SystemInformation(ID) ON DELETE SET NULL
);
CREATE TABLE NetworkAdapterIPAddresses
(
	ID INTEGER NOT NULL PRIMARY KEY,
	IPAddress TEXT NULL,
	SubnetMask TEXT NULL,	
	NetworkAdapterID INTEGER NULL,	
	FOREIGN KEY (NetworkAdapterID) REFERENCES NetworkAdapters(ID) ON DELETE SET NULL
);
CREATE TABLE NetworkAdapterDHCPServers
(
	ID INTEGER NOT NULL PRIMARY KEY,
	IPAddress TEXT NULL,
	NetworkAdapterID INTEGER NULL,	
	FOREIGN KEY (NetworkAdapterID) REFERENCES NetworkAdapters(ID) ON DELETE SET NULL
);
CREATE TABLE NetworkAdapterIPGateways
(
	ID INTEGER NOT NULL PRIMARY KEY,
	IPAddress TEXT NULL,
	NetworkAdapterID INTEGER NULL,	
	FOREIGN KEY (NetworkAdapterID) REFERENCES NetworkAdapters(ID) ON DELETE SET NULL
);

CREATE TABLE Processes
(
	ID INTEGER NOT NULL PRIMARY KEY,
	PID INTEGER NULL,
	ParentPID INTEGER NULL,
	Username TEXT NULL,
	Path TEXT NULL,
	ProcessName TEXT NULL,
	Arguments TEXT NULL,
	StartTime TIMESTAMP NULL,
	KernelTimeElapsed TEXT NULL,
	UserTimeElapsed TEXT NULL,
	SID TEXT NULL,
	SIDType TEXT NULL,
	ItemSummaryID INTEGER NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL
);
CREATE TABLE ProcessHandles
(
	ID INTEGER NOT NULL PRIMARY KEY,
	HandleName TEXT NULL,
	HandleIndex INTEGER NULL,
	HandleIndexAsDisplayed TEXT NULL,
	AccessMask INTEGER NULL,
	AccessMaskAsDisplayed TEXT NULL,
	ObjectAddress INTEGER NULL,
	ObjectAddressAsDisplayed TEXT NULL,
	HandleCount INTEGER NULL,
	HandleCountAsDisplayed TEXT NULL,
	PointerCount INTEGER NULL,
	PointerCountAsDisplayed TEXT NULL,
	HandleType TEXT NULL,
	ProcessID INTEGER NULL,
	FOREIGN KEY(ProcessID) REFERENCES Processes(ID) ON DELETE SET NULL
);
CREATE TABLE ProcessSections
(
	ID INTEGER NOT NULL PRIMARY KEY,
	Protection TEXT NULL,
	RegionStart INTEGER NULL,
	RegionStartAsDisplayed TEXT NULL,
	RegionSize INTEGER NULL,
	RegionSizeAsDisplayed TEXT NULL,
	Mapped BOOLEAN NULL,
	RawFlags INTEGER NULL,
	RawFlagsAsDisplayed TEXT NULL,
	SectionName TEXT NULL,
	Injected BOOLEAN NULL,
	SignatureExists BOOLEAN NULL,
	SignatureVerified BOOLEAN NULL,
	SignatureDescription TEXT NULL,
	CertificateIssuer TEXT NULL,
	CertificateSubject TEXT NULL,
	MD5 TEXT NULL,
	SHA1 TEXT NULL,
	SHA256 TEXT NULL,
	MemD5 TEXT NULL,
	IsMD5InWhitelist BOOLEAN NULL,
	IsMemD5InWhitelist BOOLEAN NULL,
	ProcessID INTEGER NULL,
	ItemSummaryID INTEGER NULL,
	FOREIGN KEY(ProcessId) REFERENCES Processes(ID) ON DELETE SET NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL
);
CREATE TABLE ProcessStrings
(
	ID INTEGER NOT NULL PRIMARY KEY,
	String TEXT NULL,
	ProcessID INTEGER NULL,
	FOREIGN KEY (ProcessId) REFERENCES Processes(ID) ON DELETE SET NULL
);
CREATE TABLE ProcessTree
(
	ID INTEGER NOT NULL PRIMARY KEY,
	Depth INTEGER NULL,
	HasChildren BOOLEAN NULL,
	ProcessID INTEGER NULL,
	FOREIGN KEY (ProcessId) REFERENCES Processes(ID) ON DELETE SET NULL
);

CREATE TABLE PEInfos
(
	ID INTEGER NOT NULL PRIMARY KEY,
	PEType TEXT NULL,
	Subsystem TEXT NULL,
	BaseAddress INTEGER NULL,
	BaseAddressAsDisplayed TEXT NULL,
	PETimeStamp TEXT NULL,
	ExtraneousBytes INTEGER NULL,
	ExtraneousBytesAsDisplayed TEXT NULL,
	JumpCodeDepth INTEGER NULL,
	JumpCodeDepthAsDisplayed TEXT NULL,
	JumpCodeOpCodes TEXT NULL,
	PECheckSumPEFileRaw INTEGER NULL,
	PECheckSumPEFileAPI INTEGER NULL,
	PECheckSumPEComputedAPI INTEGER NULL,
	ExportsTimeStamp TEXT NULL,
	ExportsFunctionsCount INTEGER NULL,
	ExportsFunctionsCountAsDisplayed TEXT NULL,
	ExportsNamesCount INTEGER NULL,
	ExportsNamesCountAsDisplayed TEXT NULL,
	ExportsDLL TEXT NULL,
	SignatureExists BOOLEAN NULL,
	SignatureVerified BOOLEAN NULL,
	SignatureDescription TEXT NULL,
	CertificateIssuer TEXT NULL,
	CertificateSubject TEXT NULL,
	CertificateChain TEXT NULL,
	SectionsCount INTEGER NULL,
	SectionsCountAsDisplayed TEXT NULL,
	SectionsActualCount INTEGER NULL,
	SectionsActualCountAsDisplayed TEXT NULL,
	FileID INTEGER NULL,
	ProcessSectionID INTEGER NULL,
	DriverID INTEGER NULL,
	FOREIGN KEY (FileID) REFERENCES Files(ID) ON DELETE SET NULL,
	FOREIGN KEY (ProcessSectionID) REFERENCES ProcessSections(ID) ON DELETE SET NULL,
	FOREIGN KEY (DriverID) REFERENCES Drivers(ID) ON DELETE SET NULL
);
CREATE TABLE PEInfoSections
(
	ID INTEGER NOT NULL PRIMARY KEY,
	PEInfoSectionName TEXT NULL,
	SectionType TEXT NULL,
	Size INTEGER NULL,
	SizeAsDisplayed TEXT NULL,
	DetectedCharacteristics TEXT NULL,
	AverageEntropy FLOAT NULL,
	PEInfoID INTEGER NULL,
	FOREIGN KEY (PEInfoID) REFERENCES PEInfos(ID) ON DELETE SET NULL
);
CREATE TABLE PEInfoSectionsDetectedSignatureKeys
(
	ID INTEGER NOT NULL PRIMARY KEY,
	DetectedSignatureKey TEXT NULL,
	PEInfoSectionID INTEGER NULL,	
	FOREIGN KEY (PEInfoSectionID) REFERENCES PEInfoSections(ID) ON DELETE SET NULL
);
CREATE TABLE PEInfoExports
(
	ID INTEGER NOT NULL PRIMARY KEY,
	Export TEXT NULL,
	PEInfoID INTEGER NULL,	
	FOREIGN KEY (PEInfoID) REFERENCES PEInfos(ID) ON DELETE SET NULL
);
CREATE TABLE PEInfoModules
(
	ID INTEGER NOT NULL PRIMARY KEY,
	ModuleName TEXT NULL,
	FunctionsCount INTEGER NULL,
	FunctionsCountAsDisplayed TEXT NULL,
	PEInfoID INTEGER NULL,	
	FOREIGN KEY (PEInfoID) REFERENCES PEInfos(ID) ON DELETE SET NULL
);
CREATE TABLE PEInfoModuleImports
(
	ID INTEGER NOT NULL PRIMARY KEY,
	Import TEXT NULL,
	ModuleName TEXT NULL,
	PEInfoModuleID INTEGER NULL,
	PEInfoID INTEGER NULL,	
	FOREIGN KEY (PEInfoModuleID) REFERENCES PEInfoModules(ID) ON DELETE SET NULL,	
	FOREIGN KEY (PEInfoID) REFERENCES PEInfos(ID) ON DELETE SET NULL
);
CREATE TABLE PEInfoDetectedAnomalies
(
	ID INTEGER NOT NULL PRIMARY KEY,
	DetectedAnomaly TEXT NULL,
	PEInfoID INTEGER NULL,	
	FOREIGN KEY (PEInfoID) REFERENCES PEInfos(ID) ON DELETE SET NULL
);
CREATE TABLE PEInfoVersionInformations
(
	ID INTEGER NOT NULL PRIMARY KEY,
	Language TEXT NULL,
	ProductName TEXT NULL,
	ProductVersion TEXT NULL,
	Comments TEXT NULL,
	CompanyName TEXT NULL,
	FileDescription TEXT NULL,
	FileVersion TEXT NULL,
	InternalName TEXT NULL,
	LegalCopyright TEXT NULL,
	OriginalFilename TEXT NULL,
	LegalTrademarks TEXT NULL,
	PrivateBuild TEXT NULL,
	SpecialBuild TEXT NULL,
	PEInfoId INTEGER NULL,
	FOREIGN KEY (PEInfoId) REFERENCES PEInfos(ID) ON DELETE SET NULL
);
CREATE TABLE PEInfoDetectedEntryPoints
(
	ID INTEGER NOT NULL PRIMARY KEY,
	EntryPointName TEXT NULL,
	DetectedType TEXT NULL,
	PEInfoId INTEGER NULL,
	FOREIGN KEY (PEInfoId) REFERENCES PEInfos(ID) ON DELETE SET NULL
);
CREATE TABLE PEInfoResourceInformations
(
	ID INTEGER NOT NULL PRIMARY KEY,
	ResourceName TEXT NULL,
	ResourceType TEXT NULL,
	Size INTEGER NULL,
	SizeAsDisplayed TEXT NULL,
	Language TEXT NULL,
	Data BLOB NULL,
	PEInfoId INTEGER NULL,
	FOREIGN KEY (PEInfoId) REFERENCES PEInfos(ID) ON DELETE SET NULL
);

CREATE TABLE Files
(
	ID INTEGER NOT NULL PRIMARY KEY,
	FullPath TEXT NULL,
	FilePath TEXT NULL,
	FileName TEXT NULL,
	FileExt TEXT NULL,
	Drive TEXT NULL,
	Device TEXT NULL,
	Size INTEGER NULL,
	SizeAsDisplayed TEXT NULL,
	Created TIMESTAMP NULL,
	Modified TIMESTAMP NULL,
	Accessed TIMESTAMP NULL,
	Changed TIMESTAMP NULL,
	FilenameCreated TIMESTAMP NULL,
	FilenameModified TIMESTAMP NULL,
	FilenameAccessed TIMESTAMP NULL,
	FilenameChanged TIMESTAMP NULL,
	FileAttributes TEXT NULL,
	INode INTEGER NULL,
	INodeAsDisplayed TEXT NULL,
	PeakEntropy FLOAT NULL,
	PeakCodeEntropy FLOAT NULL,
	Username TEXT NULL,
	SID TEXT NULL,
	SIDType TEXT NULL,
	MD5 TEXT NULL,
	SHA1 TEXT NULL,
	SHA256 TEXT NULL,
	IsMD5InWhitelist BOOLEAN NULL,
	PEInfoTimestamp TEXT NULL,
	PEInfoExportsTimestamp TEXT NULL,
	Group0 TEXT NULL,
	GroupID TEXT NULL,
	Permissions INTEGER NULL,
	FromPersistence BOOLEAN NULL,
	ItemSummaryID INTEGER NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL	
);
CREATE TABLE FileDigitalSignature
(
	ID INTEGER NOT NULL PRIMARY KEY,
	FileID INTEGER NULL,
	SignatureExists BOOLEAN NULL,
	SignatureVerified BOOLEAN NULL,
	SignatureDescription TEXT NULL,
	CertificateIssuer TEXT NULL,
	CertificateSubject TEXT NULL,
	CertificateChain TEXT NULL,
	FOREIGN KEY (FileID) REFERENCES Files(ID) ON DELETE SET NULL
);
CREATE TABLE FileStreams
(
	ID INTEGER NOT NULL PRIMARY KEY,
	Size INTEGER NULL,
	SizeAsDisplayed TEXT NULL,
	Name TEXT NULL,
	MD5 TEXT NULL,
	SHA1 TEXT NULL,
	SHA256 TEXT NULL,
	IsMD5InWhitelist BOOLEAN NULL,
	FileID INTEGER NULL,
	FOREIGN KEY (FileID) REFERENCES Files(ID) ON DELETE SET NULL
);
CREATE TABLE FileStrings
(
	ID INTEGER NOT NULL PRIMARY KEY,
	String TEXT NULL,
	FileID INTEGER NULL,
	FOREIGN KEY (FileID) REFERENCES Files(ID) ON DELETE SET NULL
);
CREATE TABLE DirectoryTree
(
	ID INTEGER NOT NULL PRIMARY KEY, 
	Name TEXT NULL,
	TreePath TEXT NULL,
	HasChildren BOOLEAN NULL,
	Selected BOOLEAN NULL,
	Displayed BOOLEAN NULL,
	Expanded BOOLEAN NULL,
	ParentID INTEGER NULL,
	FileID INTEGER NULL,
	FOREIGN KEY (FileID) REFERENCES Files(ID) ON DELETE SET NULL
);

CREATE TABLE RegistryKeys
(	
	ID INTEGER NOT NULL PRIMARY KEY,
	Hive TEXT NULL,
	KeyPath TEXT NULL,
	Modified TIMESTAMP NULL,
	SubKeyCount INTEGER NULL,
	SubKeyCountAsDisplayed TEXT NULL,
	ValuesCount INTEGER NULL,
	ValuesCountAsDisplayed TEXT NULL,
	Path TEXT NULL,
	ReportedLength INTEGER NULL,
	ReportedLengthAsDisplayed TEXT NULL,
	RegistryType TEXT NULL,
	Username TEXT NULL,
	SID TEXT NULL,
	ValueName TEXT NULL,	
	Value BLOB NULL,
	TextValue TEXT NULL,
	FromPersistence BOOLEAN NULL,
	ItemSummaryID INTEGER NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL	
);
CREATE TABLE RegistryKeyTextValues
(
	ID INTEGER NOT NULL PRIMARY KEY,
	TextValue TEXT NOT NULL,	
	RegistryKeyID INTEGER NULL,
	FOREIGN KEY (RegistryKeyID) REFERENCES RegistryKeys(ID) ON DELETE SET NULL
);
CREATE TABLE RegistryTree 
( 
	ID INTEGER NOT NULL PRIMARY KEY, 
	Name TEXT NULL,
	TreePath TEXT NULL,
	HasChildren BOOLEAN NULL,
	Selected BOOLEAN NULL,
	Displayed BOOLEAN NULL,
	Expanded BOOLEAN NULL,
	ParentID INTEGER NULL,
	RegistryKeyID INTEGER NULL,
	FOREIGN KEY (RegistryKeyID) REFERENCES RegistryKeys(ID) ON DELETE SET NULL
);

CREATE TABLE Services
(	
	ID INTEGER NOT NULL PRIMARY KEY,
	PID INTEGER NULL,
	Arguments TEXT NULL,
	DescriptiveName TEXT NULL,
	Mode TEXT NULL,
	Name TEXT NULL,
	Description TEXT NULL,
	StartedAs TEXT NULL,
	ServiceStatus TEXT NULL,
	ServiceType TEXT NULL,
	Path TEXT NULL,
	PathSignatureExists BOOLEAN NULL,
	PathSignatureVerified BOOLEAN NULL,
	PathSignatureDescription TEXT NULL,
	PathCertificateIssuer TEXT NULL,
	PathCertificateSubject TEXT NULL,
	PathMD5 TEXT NULL,
	PathSHA1 TEXT NULL,
	PathSHA256 TEXT NULL,
	PathIsMD5InWhitelist BOOLEAN NULL,
	ServiceDLL TEXT NULL,
	ServiceDLLSignatureExists BOOLEAN NULL,
	ServiceDLLSignatureVerified BOOLEAN NULL,
	ServiceDLLSignatureDescription TEXT NULL,
	ServiceDLLCertificateIssuer TEXT NULL,
	ServiceDLLCertificateSubject TEXT NULL,
	ServiceDLLMD5 TEXT NULL,
	ServiceDLLSHA1 TEXT NULL,
	ServiceDLLSHA256 TEXT NULL,
	ServiceDLLIsMD5InWhitelist BOOLEAN NULL,
	Username TEXT NULL,
	Groupname TEXT NULL,
	Reference TEXT NULL,
	FromPersistence BOOLEAN NULL,
	ItemSummaryID INTEGER NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL	
);
CREATE TABLE ServiceDescriptions
(
	ID INTEGER NOT NULL PRIMARY KEY,
	Description TEXT NOT NULL,	
	ServiceID INTEGER NULL,
	FOREIGN KEY (ServiceID) REFERENCES Services(ID) ON DELETE SET NULL
);

CREATE TABLE MachServices
(
	ID INTEGER NOT NULL PRIMARY KEY,
	MachService TEXT NOT NULL,	
	ServiceID INTEGER NULL,
	FOREIGN KEY (ServiceID) REFERENCES Services(ID) ON DELETE SET NULL
);

CREATE TABLE PersistenceItems
(	
	ID INTEGER NOT NULL PRIMARY KEY,
	PersistenceType TEXT NULL,
	LinkFilePath TEXT NULL,
	HasFile BOOLEAN NULL,
	HasRegistry BOOLEAN NULL,
	HasService BOOLEAN NULL,

	RegPath TEXT NULL,
	RegModified TIMESTAMP NULL,
	RegOwner TEXT NULL,
	RegContext TEXT NULL,
	RegText TEXT NULL,
	RegValue TEXT NULL,

	FilePath TEXT NULL,				
	FileOwner TEXT NULL,
	FileMD5 TEXT NULL,
	FileSHA1 TEXT NULL,
	FileSHA256 TEXT NULL,
	FileIsMD5InWhitelist BOOLEAN NULL,
	FileCreated TIMESTAMP NULL,
	FileAccessed TIMESTAMP NULL,
	FileModified TIMESTAMP NULL,
	FileChanged TIMESTAMP NULL,
	FileSignatureExists BOOLEAN NULL,
	FileSignatureVerified BOOLEAN NULL,
	FileSignatureDescription TEXT NULL,
	FileCertificateIssuer TEXT NULL,
	FileCertificateSubject TEXT NULL,

	ServiceName TEXT NULL,
	ServiceDescriptiveName TEXT NULL,
	ServicePath TEXT NULL,
	ServiceArguments TEXT NULL,
	ServiceStatus TEXT NULL,
	ServiceMode TEXT NULL,
	ServiceDLL TEXT NULL,
	ServiceStartedAs TEXT NULL,
	ServicePathMD5 TEXT NULL,
	ServicePathIsMD5InWhitelist BOOLEAN NULL,
	ServicePathSHA1 TEXT NULL,
	ServicePathSHA256 TEXT NULL,
	ServiceDLLMD5 TEXT NULL,
	ServiceDLLIsMD5InWhitelist BOOLEAN NULL,
	ServiceDLLSHA1 TEXT NULL,
	ServiceDLLSHA256 TEXT NULL,
	ServicePathSignatureExists BOOLEAN NULL,
	ServicePathSignatureVerified BOOLEAN NULL,
	ServicePathSignatureDescription TEXT NULL,
	ServicePathCertificateIssuer TEXT NULL,
	ServicePathCertificateSubject TEXT NULL,
	ServiceDLLSignatureExists BOOLEAN NULL,
	ServiceDLLSignatureVerified BOOLEAN NULL,
	ServiceDLLSignatureDescription TEXT NULL,
	ServiceDLLCertificateIssuer TEXT NULL,
	ServiceDLLCertificateSubject TEXT NULL,

	Group0 TEXT NULL,
	Size INTEGER NULL,
	CertificateChain TEXT NULL,
	Name TEXT NULL,
	Username TEXT NULL,
	Groupname TEXT NULL,
	Reference TEXT NULL,
	KeepAlive BOOLEAN NULL,
	Disabled BOOLEAN NULL,
	Alias TEXT NULL,

	ItemSummaryID INTEGER NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL	
);
CREATE TABLE PersistenceRelations
(	
	ID INTEGER NOT NULL PRIMARY KEY,
	FileID INTEGER NULL,
	ServiceID INTEGER NULL,
	RegistryID INTEGER NULL,
	PersistenceID INTEGER NULL,
	FOREIGN KEY(FileID) REFERENCES Files(ID) ON DELETE SET NULL,
	FOREIGN KEY(ServiceID) REFERENCES Services(ID) ON DELETE SET NULL,
	FOREIGN KEY(RegistryID) REFERENCES RegistryKeys(ID) ON DELETE SET NULL,
	FOREIGN KEY(PersistenceID) REFERENCES PersistenceItems(ID) ON DELETE SET NULL
);

CREATE TABLE AgentEventsMetadata
(
	ID INTEGER NOT NULL PRIMARY KEY,
	EventType TEXT NULL,
	HasEvents BOOLEAN NULL,
	EarliestEvent TIMESTAMP NULL,
	LatestEvent TIMESTAMP NULL
);
CREATE TABLE AgentEvents
(
	ID INTEGER NOT NULL PRIMARY KEY,
	EventTimestamp TIMESTAMP NULL,	
	EventType TEXT NULL,
	PID INTEGER NULL,
	ProcessName TEXT NULL,
	ItemSummaryID INTEGER NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL
);
CREATE TABLE FileWriteAgentEvents
(
	ID INTEGER NOT NULL PRIMARY KEY,
	FullPath TEXT NULL,
	FilePath TEXT NULL,
	FileName TEXT NULL,
	FileExt TEXT NULL,
	Drive TEXT NULL,
	Device TEXT NULL,
	Size INTEGER NULL,
	SizeAsDisplayed TEXT NULL,
	MD5 TEXT NULL,
	IsMD5InWhitelist BOOLEAN NULL,
	WritesCount INTEGER NULL,
	WritesCountAsDisplayed TEXT NULL,
	BytesWritten INTEGER NULL,
	BytesWrittenAsDisplayed TEXT NULL,
	DataOffset INTEGER NULL,
	DataOffsetAsDisplayed TEXT NULL,
	Data TEXT NULL,
	TextData TEXT NULL,
	IsClosed BOOLEAN NULL,
	AgentEventID INTEGER NULL,
	ItemSummaryID INTEGER NULL,
	ProcessPath TEXT NULL,
	Username TEXT NULL,
	FOREIGN KEY(AgentEventID) REFERENCES AgentEvents(ID) ON DELETE SET NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL
);
CREATE TABLE ImageLoadAgentEvents
(
	ID INTEGER NOT NULL PRIMARY KEY,
	FullPath TEXT NULL,
	FilePath TEXT NULL,
	FileName TEXT NULL,
	FileExt TEXT NULL,
	Username TEXT NULL,
	ImageType TEXT NULL,
	AgentEventID INTEGER NULL,
	ItemSummaryID INTEGER NULL,
	ParentPID INTEGER NULL,
	ProcessPath TEXT NULL,
	DevicePath TEXT NULL,
	Drive TEXT NULL,
	FOREIGN KEY(AgentEventID) REFERENCES AgentEvents(ID) ON DELETE SET NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL
);
CREATE TABLE AddressNotificationAgentEvents
(
	ID INTEGER NOT NULL PRIMARY KEY,
	Address TEXT NULL,
	AgentEventID INTEGER NULL,
	ItemSummaryID INTEGER NULL,
	FOREIGN KEY(AgentEventID) REFERENCES AgentEvents(ID) ON DELETE SET NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL
);
CREATE TABLE NetworkAgentEvents
(
	ID INTEGER NOT NULL PRIMARY KEY,
	LocalAddress TEXT NULL,
	LocalPort INTEGER NULL,
	RemoteAddress TEXT NULL,
	RemotePort INTEGER NULL,
	Protocol TEXT NULL,
	AgentEventID INTEGER NULL,
	ItemSummaryID INTEGER NULL,
	ProcessPath TEXT NULL,
	Username TEXT NULL,
	FOREIGN KEY(AgentEventID) REFERENCES AgentEvents(ID) ON DELETE SET NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL
);
CREATE TABLE RegistryKeyAgentEvents
(
	ID INTEGER NOT NULL PRIMARY KEY,
	Hive TEXT NULL,
	Path TEXT NULL,
	OriginalPath TEXT NULL,
	RegistryKey TEXT NULL,
	NotificationType TEXT NULL,
	ValueName TEXT NULL,
	ValueType TEXT NULL,
	Data TEXT NULL,
	TextData TEXT NULL,
	AgentEventID INTEGER NULL,
	ItemSummaryID INTEGER NULL,
	ProcessPath TEXT NULL,
	Username TEXT NULL,
	FOREIGN KEY(AgentEventID) REFERENCES AgentEvents(ID) ON DELETE SET NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL
);
CREATE TABLE DNSLookupAgentEvents
(
	ID INTEGER NOT NULL PRIMARY KEY,
	Hostname TEXT NULL,
	AgentEventID INTEGER NULL,
	ItemSummaryID INTEGER NULL,
	ProcessPath TEXT NULL,
	Username TEXT NULL,
	FOREIGN KEY(AgentEventID) REFERENCES AgentEvents(ID) ON DELETE SET NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL
);
CREATE TABLE ProcessAgentEvents
(
	ID INTEGER NOT NULL PRIMARY KEY,
	FullPath TEXT NULL,
	ParentPID INTEGER NULL,
	ParentProcessName TEXT NULL,
	ParentFullPath TEXT NULL,
	Username TEXT NULL,
	NotificationType TEXT NULL,
	StartTime TIMESTAMP NULL,
	MD5 TEXT NULL,
	AgentEventID INTEGER NULL,
	ItemSummaryID INTEGER NULL,
	CmdLine TEXT NULL,
	FOREIGN KEY(AgentEventID) REFERENCES AgentEvents(ID) ON DELETE SET NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL
);

CREATE TABLE UrlMonitorAgentEvents
(
	ID INTEGER NOT NULL PRIMARY KEY,
	Hostname TEXT NULL,
	RequestUrl TEXT NULL,
	UrlMethod TEXT NULL,
	UserAgent TEXT NULL,
	HttpHeader TEXT NULL,
	RemoteIpAddress TEXT NULL,
	RemotePort INTEGER NULL,
	LocalPort INTEGER NULL,
	ProcessPath TEXT NULL,
	Username TEXT NULL,
	AgentEventID INTEGER NULL,
	ItemSummaryID INTEGER NULL,
	FOREIGN KEY(AgentEventID) REFERENCES AgentEvents(ID) ON DELETE SET NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL
);


CREATE TABLE Users
(	
	ID INTEGER NOT NULL PRIMARY KEY,
	Description TEXT NULL, 
	Disabled BOOLEAN NULL, 
	FullName TEXT NULL, 
	GroupNames TEXT NULL, 
	HomeDirectory TEXT NULL, 
	LastLogin TIMESTAMP NULL, 
	LockedOut BOOLEAN NULL, 
	PasswordRequired BOOLEAN NULL, 
	ScriptPath TEXT  NULL, 
	SID TEXT NULL, 
	SIDType TEXT NULL, 
	Username TEXT NULL, 
	UserPasswordAge TEXT NULL,
	Shell TEXT NULL,
	UserID INTEGER NULL,
	UserGuid TEXT NULL,
	AutoLogin BOOLEAN NULL,
	ItemSummaryID INTEGER NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL
);
CREATE TABLE EventLogs
(
	ID INTEGER NOT NULL PRIMARY KEY,
	Blob BLOB NULL,
	Category TEXT NULL,
	CategoryNumber INTEGER NULL,
	CorrelationActivityID TEXT NULL,
	CorrelationRelatedActivityID TEXT NULL,
	EID INTEGER NULL,
	ExecutionPID INTEGER NULL,
	ExecutionThreadID TEXT NULL,
	GenTime TIMESTAMP NULL,
	EventLogIndex INTEGER NULL,
	SystemLog TEXT NULL,
	Machine TEXT NULL,
	Message TEXT NULL,
	Reserved INTEGER NULL,
	EventLogSource TEXT NULL,
	EventLogType TEXT NULL,
	Username TEXT NULL,
	WriteTime TIMESTAMP NULL,
	ItemSummaryID INTEGER NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL
);
CREATE TABLE EventLogMessages
(
	ID INTEGER NOT NULL PRIMARY KEY,
	Message TEXT NOT NULL,	
	EventLogID INTEGER NULL,
	FOREIGN KEY(EventLogID) REFERENCES EventLogs(ID) ON DELETE SET NULL	
);
CREATE TABLE Tasks
(
	ID INTEGER NOT NULL PRIMARY KEY,
	AccountLogonType TEXT NULL,
	AccountName TEXT NULL,
	AccountRunLevel TEXT NULL,           
	ApplicationName TEXT NULL,
	TaskComment TEXT NULL,          
	Creator TEXT NULL,
	Flags TEXT NULL,
	MD5 TEXT NULL,
	SHA1 TEXT NULL,
	SHA256 TEXT NULL,
	IsMD5InWhitelist BOOLEAN NULL,
	Name TEXT NULL,              
	TaskParameters TEXT NULL,
	TaskPriority TEXT NULL,
	TaskStatus TEXT NULL,
	VirtualPath TEXT NULL,
	WorkingDirectory TEXT NULL,   
	MostRecentRunTime TIMESTAMP NULL,
	CreationDate TIMESTAMP NULL,
	NextRunTime TIMESTAMP NULL,
	MaxRunTime TEXT NULL,
	ExitCode INTEGER NULL,  
	WorkItemData BLOB NULL,	
	SignatureExists BOOLEAN NULL,
	SignatureVerified BOOLEAN NULL,
	SignatureDescription TEXT NULL,
	CertificateIssuer TEXT NULL,
	CertificateSubject TEXT NULL,
	CertificateChain TEXT NULL,
	Path TEXT NULL,
	Arguments TEXT NULL,
	Username TEXT NULL,
	Groupname TEXT NULL,
	Disabled BOOLEAN NULL,
	Reference TEXT NULL,
	CrontabPath TEXT NULL,
	CrontabMinute TEXT NULL,
	CrontabHour TEXT NULL,
	CrontabDayOfMonth TEXT NULL,
	CrontabMonth TEXT NULL,
	CrontabDayOfWeek TEXT NULL,
	CrontabEvent TEXT NULL,
	CrontabCommand TEXT NULL,
	CrontabPeriod TEXT NULL,
	CrontabDelay INTEGER NULL,
	CrontabJobIdentifier TEXT NULL,
	ItemSummaryID INTEGER NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL	
);
CREATE TABLE TaskTriggers
(
	ID INTEGER NOT NULL PRIMARY KEY,
	TaskBegin TIMESTAMP NULL,
	TaskEnd TIMESTAMP NULL,                      
	TaskEnabled BOOLEAN NULL,
	Frequency TEXT NULL,
	MaxRunTime TEXT NULL,
	SessionChangeType TEXT NULL,
	Subscription TEXT NULL,
	Username TEXT NULL,
	ValueQueries TEXT NULL,
	TaskDelay TEXT NULL,
	TaskID INTEGER NULL,
	FOREIGN KEY(TaskID) REFERENCES Tasks(ID) ON DELETE SET NULL	
);
CREATE TABLE TaskTriggers2
(
	ID INTEGER NOT NULL PRIMARY KEY,
	Type TEXT NULL,
	Delay TEXT NULL,                      
	Schedule TEXT NULL,
	Details TEXT NULL,
	TaskID INTEGER NULL,
	FOREIGN KEY(TaskID) REFERENCES Tasks(ID) ON DELETE SET NULL	
);
CREATE TABLE TaskActions
(
	ID INTEGER NOT NULL PRIMARY KEY,
	ActionType TEXT NULL,
	COMClassID TEXT NULL,
	COMData TEXT NULL,
	EmailAttachments TEXT NULL,
	EmailBCC TEXT NULL,
	EmailBody TEXT NULL,
	EmailCC TEXT NULL,
	EmailFrom TEXT NULL,
	EmailReplyTo TEXT NULL,
	EmailServer TEXT NULL,
	EmailSubject TEXT NULL,
	EmailTo TEXT NULL,
	ExecArguments TEXT NULL,
	MD5 TEXT NULL,
	SHA1 TEXT NULL,
	SHA256 TEXT NULL,
	IsMD5InWhitelist BOOLEAN NULL,
	ExecProgramPath TEXT NULL,
	ExecWorkingDirectory TEXT NULL,
	ShowMessageBody TEXT NULL,
	ShowMessageTitle TEXT NULL,	
	SignatureExists BOOLEAN NULL,
	SignatureVerified BOOLEAN NULL,
	SignatureDescription TEXT NULL,
	CertificateIssuer TEXT NULL,
	CertificateSubject TEXT NULL,
	TaskID INTEGER NULL,
	FOREIGN KEY(TaskID) REFERENCES Tasks(ID) ON DELETE SET NULL	
);

CREATE TABLE Ports
(
	ID INTEGER NOT NULL PRIMARY KEY,
	LocalAddress TEXT NULL,
	LocalPort INTEGER NULL,
	RemoteAddress TEXT NULL,
	RemotePort INTEGER NULL,
	Protocol TEXT NULL,
	PortState TEXT NULL,
	Created TIMESTAMP NULL,
	PortPID INTEGER NULL,
	PortProcessName TEXT NULL,
	PortProcessPath TEXT NULL,
	ProcessID INTEGER NULL,
	IsIPv6 BOOLEAN NULL,
	ItemSummaryID INTEGER NULL,
	FOREIGN KEY(ProcessID) REFERENCES Processes(ID) ON DELETE SET NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL
);

CREATE TABLE Modules
(
	ID INTEGER NOT NULL PRIMARY KEY,
	ModuleName TEXT NULL,
	ModulePath TEXT NULL,	 
	ModuleSize INTEGER NULL,
	ModuleSizeAsDisplayed TEXT NULL,
	ModuleAddress INTEGER NULL,
	ModuleAddressAsDisplayed TEXT NULL,
	ModuleBase INTEGER NULL,
	ModuleBaseAsDisplayed TEXT NULL,
	ModuleInit INTEGER NULL,
	ModuleInitAsDisplayed TEXT NULL,
	ItemSummaryID INTEGER NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL	
);

CREATE TABLE Drivers
(
	ID INTEGER NOT NULL PRIMARY KEY,
	DriverName TEXT NULL,
	MD5 TEXT NULL,
	SHA1 TEXT NULL,
	SHA256 TEXT NULL,
	IsMD5InWhitelist BOOLEAN NULL,
	SignatureExists BOOLEAN NULL,
	SignatureVerified BOOLEAN NULL,
	SignatureDescription TEXT NULL,
	CertificateIssuer TEXT NULL,
	CertificateSubject TEXT NULL,
	DriverInit INTEGER NULL,
	DriverObjectAddress INTEGER NULL,
	DriverStartIO INTEGER NULL,
	DriverUnload INTEGER NULL,
	ImageBase INTEGER NULL,
	ImageSize INTEGER NULL,
	IrpMJCleanup INTEGER NULL,
	IrpMJClose INTEGER NULL,
	IrpMJCreate INTEGER NULL,
	IrpMJCreateMailslot INTEGER NULL,
	IrpMJCreateNamedPipe INTEGER NULL,
	IrpMJDeviceChange INTEGER NULL,
	IrpMJDeviceControl INTEGER NULL,
	IrpMJDirectoryControl INTEGER NULL,
	IrpMJFileSystemControl INTEGER NULL,
	IrpMJFlushBuffers INTEGER NULL,
	IrpMJInternalDeviceControl INTEGER NULL,
	IrpMJLockControl INTEGER NULL,
	IrpMJPNP INTEGER NULL,
	IrpMJPower INTEGER NULL,
	IrpMJQueryInformation INTEGER NULL,
	IrpMJQueryQuota INTEGER NULL,
	IrpMJQuerySecurity INTEGER NULL,
	IrpMJQueryVolumeInformation INTEGER NULL,
	IrpMJRead INTEGER NULL,
	IrpMJSetEA INTEGER NULL,
	IrpMJSetInformation INTEGER NULL,
	IrpMJSetQuota INTEGER NULL,
	IrpMJSetSecurity INTEGER NULL,
	IrpMJSetVolumeInformation INTEGER NULL,
	IrpMJShutdown INTEGER NULL,
	IrpMJSystemControl INTEGER NULL,
	IrpMJWrite INTEGER NULL,
	IrpMJQueryEA INTEGER NULL,
	DriverInitAsDisplayed TEXT NULL,
	DriverObjectAddressAsDisplayed TEXT NULL,
	DriverStartIOAsDisplayed TEXT NULL,
	DriverUnloadAsDisplayed TEXT NULL,
	ImageBaseAsDisplayed TEXT NULL,
	ImageSizeAsDisplayed TEXT NULL,
	IRPMJCleanupAsDisplayed TEXT NULL,
	IRPMJCloseAsDisplayed TEXT NULL,
	IRPMJCreateAsDisplayed TEXT NULL,
	IRPMJCreateMailslotAsDisplayed TEXT NULL,
	IRPMJCreateNamedPipeAsDisplayed TEXT NULL,
	IRPMJDeviceChangeAsDisplayed TEXT NULL,
	IRPMJDeviceControlAsDisplayed TEXT NULL,
	IRPMJDirectoryControlAsDisplayed TEXT NULL,
	IRPMJFileSystemControlAsDisplayed TEXT NULL,
	IRPMJFlushBuffersAsDisplayed TEXT NULL,
	IRPMJInternalDeviceControlAsDisplayed TEXT NULL,
	IRPMJLockControlAsDisplayed TEXT NULL,
	IRPMJPNPAsDisplayed TEXT NULL,
	IRPMJPowerAsDisplayed TEXT NULL,
	IRPMJQueryInformationAsDisplayed TEXT NULL,
	IRPMJQueryQuotaAsDisplayed TEXT NULL,
	IRPMJQuerySecurityAsDisplayed TEXT NULL,
	IRPMJQueryVolumeInformationAsDisplayed TEXT NULL,
	IRPMJReadAsDisplayed TEXT NULL,
	IRPMJSetEAAsDisplayed TEXT NULL,
	IRPMJSetInformationAsDisplayed TEXT NULL,
	IRPMJSetQuotaAsDisplayed TEXT NULL,
	IRPMJSetSecurityAsDisplayed TEXT NULL,
	IRPMJSetVolumeInformationAsDisplayed TEXT NULL,
	IRPMJShutdownAsDisplayed TEXT NULL,
	IRPMJSystemControlAsDisplayed TEXT NULL,
	IRPMJWriteAsDisplayed TEXT NULL,
	IRPMJQueryEAAsDisplayed TEXT NULL,
	Constituents INTEGER NULL,
	MasterItemID INTEGER NULL
);
CREATE TABLE DriverDevices
(
	ID INTEGER NOT NULL PRIMARY KEY,	
	DeviceDriverName TEXT NULL,
	DeviceName TEXT NULL,
	DeviceObject INTEGER NULL,
	DeviceObjectAsDisplayed TEXT NULL,
	AttachedDriverName TEXT NULL,
	AttachedDriverObject INTEGER NULL,
	AttachedDriverObjectAsDisplayed TEXT NULL,
	AttachedDeviceName TEXT NULL,
	AttachedDeviceObject INTEGER NULL,
	AttachedDeviceObjectAsDisplayed TEXT NULL,
	AttachedToDriverName TEXT NULL,
	AttachedToDriverObject INTEGER NULL,
	AttachedToDriverObjectAsDisplayed TEXT NULL,
	AttachedToDeviceName TEXT NULL,
	AttachedToDeviceObject INTEGER NULL,
	AttachedToDeviceObjectAsDisplayed TEXT NULL,
	DriverID INTEGER NULL,
	FOREIGN KEY(DriverID) REFERENCES Drivers(ID) ON DELETE SET NULL	
);
CREATE TABLE DriverStrings
(
	ID INTEGER NOT NULL PRIMARY KEY,
	String TEXT NULL,
	DriverID INTEGER NULL,
	FOREIGN KEY (DriverID) REFERENCES Drivers(ID) ON DELETE SET NULL
);
CREATE TABLE DeviceTree
(
	ID INTEGER NOT NULL PRIMARY KEY,
	Depth INTEGER NULL,
	HasChildren BOOLEAN NULL,
	DeviceType TEXT NULL,
	Name TEXT NULL,
	TrustStatus TEXT NULL,
	DriverId INTEGER NULL,
	DeviceId INTEGER NULL,
	Constituents INTEGER NULL,
	ItemSummaryID INTEGER NULL,
	FOREIGN KEY(DriverId) REFERENCES Drivers(ID) ON DELETE SET NULL,
	FOREIGN KEY(DeviceId) REFERENCES DriverDevices(ID) ON DELETE SET NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL	
);

CREATE TABLE Hooks
(
	ID INTEGER NOT NULL PRIMARY KEY,
	HookDescription TEXT NULL,
	HookedFunction TEXT NULL,
	HookedModule TEXT NULL,
	HookingModule TEXT NULL,
	HookingAddress INTEGER NULL,
	HookingAddressAsDisplayed TEXT NULL,
	HookedSignatureExists BOOLEAN NULL,
	HookedSignatureVerified BOOLEAN NULL,	
	HookedSignatureDescription TEXT NULL,
	HookedCertificateIssuer TEXT NULL,
	HookedCertificateSubject TEXT NULL,	
	HookingSignatureExists BOOLEAN NULL,
	HookingSignatureVerified BOOLEAN NULL,	
	HookingSignatureDescription TEXT NULL,
	HookingCertificateIssuer TEXT NULL,
	HookingCertificateSubject TEXT NULL,
	ItemSummaryID INTEGER NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL	
);
CREATE TABLE HookTrustStatus
(
	ID INTEGER NOT NULL PRIMARY KEY,
	TrustStatus TEXT NULL,
	HookID INTEGER NULL,
	FOREIGN KEY(HookID) REFERENCES Hooks(ID) ON DELETE SET NULL
);

CREATE TABLE DNSEntries
(	
	ID INTEGER NOT NULL PRIMARY KEY,
	DataLength INTEGER NULL,
	DataLengthAsDisplayed TEXT NULL,
	Flags TEXT NULL,
	Hostname TEXT NULL,
	RecordName TEXT NULL,
	RecordType TEXT NULL,
	TimeToLive TEXT NULL, 
	ItemSummaryID INTEGER NULL
);
CREATE TABLE DNSEntryRecordData
(	
	ID INTEGER NOT NULL PRIMARY KEY,
	AddressType TEXT NULL,
	AdministratorName TEXT NULL,
	Algorithm TEXT NULL,
	ATMAddress BLOB NULL,
	Bitmask INTEGER NULL,
	Blob BLOB NULL,
	CacheTimeout TEXT NULL,
	CreationDate TIMESTAMP NULL,
	DateSigned TIMESTAMP NULL,
	DefaultTimeToLive TEXT NULL,
	Digest BLOB NULL,
	DigestLength INTEGER NULL,
	DigestLengthAsDisplayed TEXT NULL,
	DigestType TEXT NULL,
	Error TEXT NULL,
	ExpirationDate TIMESTAMP NULL,
	Expire TEXT NULL,
	FudgeTime INTEGER NULL,
	Host TEXT NULL,
	IPv4Address TEXT NULL,
	IPv6Address TEXT NULL,
	KeyData BLOB NULL,
	KeyFlags INTEGER NULL,
	KeyLength INTEGER NULL,
	KeyLengthAsDisplayed TEXT NULL,
	KeyName TEXT NULL,
	KeyTag INTEGER NULL,
	LabelCount INTEGER NULL,
	LabelCountAsDisplayed TEXT NULL,
	LookupTimeout TEXT NULL,
	MailboxErrorsName TEXT NULL,
	MailboxName TEXT NULL,
	MappingFlag TEXT NULL,
	Mode TEXT NULL,
	MXHost TEXT NULL,
	NextHost TEXT NULL,
	RecordDataOrder INTEGER NULL,
	OriginalTimeToLive TEXT NULL,
	OriginalXID INTEGER NULL,
	Port INTEGER NULL,
	Preference INTEGER NULL,
	PrimaryServerName TEXT NULL,
	Priority INTEGER NULL,
	Protocol TEXT NULL,
	PublicKey BLOB NULL,
	Refresh TEXT NULL,
	RegularExpression TEXT NULL,
	Replacement TEXT NULL,
	Retry TEXT NULL,
	SerialNumber INTEGER NULL,
	ServiceNames TEXT NULL,
	Signature BLOB NULL,
	SignatureLength INTEGER NULL,
	SignatureLengthAsDisplayed TEXT NULL,
	Signer TEXT NULL,
	TargetHost TEXT NULL,
	TypeCovered TEXT NULL,
	Weight INTEGER NULL,
	DNSEntryID INTEGER NULL,
	FOREIGN KEY(DNSEntryID) REFERENCES DNSEntries(ID) ON DELETE SET NULL
);
CREATE TABLE DNSEntryRecordDataStrings
(
	ID INTEGER NOT NULL PRIMARY KEY,
	StringValue TEXT NOT NULL,
	RecordDataID INTEGER NULL,
	FOREIGN KEY (RecordDataID) REFERENCES DNSEntryRecordData(ID) ON DELETE SET NULL
);
CREATE TABLE DNSEntryRecordDataTypes
(
	ID INTEGER NOT NULL PRIMARY KEY,
	DataType TEXT NOT NULL,
	RecordDataID INTEGER NULL,
	FOREIGN KEY (RecordDataID) REFERENCES DNSEntryRecordData(ID) ON DELETE SET NULL
);
CREATE TABLE DNSEntryRecordDataWinsServerIPs
(
	ID INTEGER NOT NULL PRIMARY KEY,
	WinsServerIPv4Address TEXT NOT NULL,
	RecordDataID INTEGER NULL,
	FOREIGN KEY (RecordDataID) REFERENCES DNSEntryRecordData(ID) ON DELETE SET NULL
);

CREATE TABLE ARPEntries
(	
	ID INTEGER NOT NULL PRIMARY KEY,
	CacheType TEXT NULL,
	ARPInterface TEXT NULL,
	InterfaceType TEXT NULL,
	IPv4Address TEXT NULL,
	IPv6Address TEXT NULL,
	IsRouter BOOLEAN NULL,
	LastReachable TEXT NULL,
	LastUnreachable TEXT NULL,
	MACAddress TEXT NULL,
	State TEXT NULL,	
	ItemSummaryID INTEGER NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL
);
CREATE TABLE RouteEntries
(
	ID INTEGER NOT NULL PRIMARY KEY,
	Destination TEXT NULL,
	Gateway TEXT NULL,
	RouteInterface TEXT NULL,
	IsAutoconfigureAddress BOOLEAN NULL,
	IsImmortal BOOLEAN NULL,
	IsIPv6 BOOLEAN NULL,
	IsLoopback BOOLEAN NULL,
	IsPublish BOOLEAN NULL,
	Metric INTEGER NULL,
	MetricAsDisplayed TEXT NULL,
	Netmask TEXT NULL,
	Origin TEXT NULL,
	PreferredLifetime TEXT NULL,
	Protocol TEXT NULL,
	RouteAge TEXT NULL,
	RouteType TEXT NULL,
	ValidLifetime TEXT NULL,
	ItemSummaryID INTEGER NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL
);

CREATE TABLE SystemRestores
(	
	ID INTEGER NOT NULL PRIMARY KEY,
	ACLChangeSID TEXT NULL,
	ACLChangeUsername TEXT NULL,
	BackupFileName TEXT NULL,
	ChangeEvent TEXT NULL,
	ChangeLogEntryFlags TEXT NULL,
	ChangeLogEntrySequenceNumber INTEGER NULL,
	ChangeLogEntrySequenceNumberAsDisplayed TEXT NULL,
	ChangeLogEntryType TEXT NULL,
	ChangeLogFileName TEXT NULL,
	Created TIMESTAMP NULL,
	DebugInfoPID INTEGER NULL,
	DebugInfoProcessName TEXT NULL,
	DebugInfoThreadID INTEGER NULL,
	DebugInfoTimeStamp TIMESTAMP NULL,
	FileAttributes TEXT NULL,
	NewFileName TEXT NULL,
	OriginalFileName TEXT NULL,
	OriginalShortFileName TEXT NULL,
	OriginalVolumePath TEXT NULL,
	ProcessName TEXT NULL,
	RestorePointDescription TEXT NULL,
	RestorePointFullPath TEXT NULL,
	RestorePointName TEXT NULL,
	RestorePointType TEXT NULL,
	ItemSummaryID INTEGER NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL
);
CREATE TABLE SystemRestoreHives
(
	ID INTEGER NOT NULL PRIMARY KEY,
	Hive TEXT NOT NULL,	
	SystemRestoreID INTEGER NULL,
	FOREIGN KEY (SystemRestoreID) REFERENCES SystemRestores(ID) ON DELETE SET NULL
);
CREATE TABLE Prefetch
(	
	ID INTEGER NOT NULL PRIMARY KEY,
	FullPath TEXT NULL,
	ApplicationFileName TEXT NULL,			
	ApplicationFullPath TEXT NULL,		
	LastRun TIMESTAMP NULL,
	Created TIMESTAMP NULL,
	PrefetchHash TEXT NULL,
	Size INTEGER NULL,
	SizeAsDisplayed TEXT NULL,
	ReportedSize INTEGER NULL,
	ReportedSizeAsDisplayed TEXT NULL,
	TimesExecuted INTEGER NULL,
	TimesExecutedAsDisplayed TEXT NULL,		
	ItemSummaryID INTEGER NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL
);
CREATE TABLE PrefetchAccessedFiles
(
	ID INTEGER NOT NULL PRIMARY KEY,
	AccessedFile TEXT NOT NULL,	
	PrefetchID INTEGER NULL,
	FOREIGN KEY (PrefetchID) REFERENCES Prefetch(ID) ON DELETE SET NULL
);

CREATE TABLE Disks
(
	ID INTEGER NOT NULL PRIMARY KEY,
	DiskName TEXT NULL,
	DiskSize INTEGER NULL,
	DiskSizeAsDisplayed TEXT NULL,
	DevicePath TEXT NULL,
	DiskConnection TEXT NULL,
	DiskType TEXT NULL,
	ItemSummaryID INTEGER NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL	
);
CREATE TABLE PartitionInformations
(
	ID INTEGER NOT NULL PRIMARY KEY,
	PartitionNumber INTEGER NULL,	
	PartitionLength INTEGER NULL,	
	PartitionLengthAsDisplayed TEXT NULL,
	PartitionOffset INTEGER NULL,	
	PartitionOffsetAsDisplayed TEXT NULL,
	PartitionType TEXT NULL,
	DiskID INTEGER NULL,
	FOREIGN KEY (DiskID) REFERENCES Disks(ID) ON DELETE SET NULL
);
CREATE TABLE Volumes
(
	ID INTEGER NOT NULL PRIMARY KEY,
	ActualAvailableAllocationUnits INTEGER NULL,
	ActualAvailableAllocationUnitsAsDisplayed TEXT NULL,
	TotalAllocationUnits INTEGER NULL,
	TotalAllocationUnitsAsDisplayed TEXT NULL,
	VolumeSerialNumber TEXT NULL,
	BytesPerSector INTEGER NULL,
	BytesPerSectorAsDisplayed TEXT NULL,
	SectorsPerAllocationUnit INTEGER NULL,
	SectorsPerAllocationUnitAsDisplayed TEXT NULL,
	CreationTime TIMESTAMP NULL,
	IsMounted BOOLEAN NULL,
	Device TEXT NULL,
	Drive TEXT NULL,
	FileSystemFlags TEXT NULL,
	FileSystemName TEXT NULL,
	Name TEXT NULL,
	VolumeName TEXT NULL,
	VolumeType TEXT NULL,
	VolumeID TEXT NULL,
	TotalSize INTEGER NULL,
	FreeSize INTEGER NULL,
	MountPoint TEXT NULL,
	Ejectable BOOLEAN NULL,
	Removable BOOLEAN NULL,
	ReadOnly BOOLEAN NULL,
	Logical BOOLEAN NULL,
	Raid BOOLEAN NULL,
	PrefetchID INTEGER NULL,
	ItemSummaryID INTEGER NULL,
	FOREIGN KEY (PrefetchID) REFERENCES Prefetch(ID) ON DELETE SET NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL
);
CREATE TABLE Hives
(	
	ID INTEGER NOT NULL PRIMARY KEY,
	HiveName TEXT NULL,
	HiveKey TEXT NULL,
	ItemSummaryID INTEGER NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL
);

CREATE TABLE URLHistory
(	
	ID INTEGER NOT NULL PRIMARY KEY,
	BrowserName TEXT NULL,
	BrowserVersion TEXT NULL,				
	FirstBookmarkDate TIMESTAMP NULL,
	FirstVisitDate TIMESTAMP NULL,
	Hidden BOOLEAN NULL,
	Hostname TEXT NULL,
	IndexedContent TEXT NULL,
	LastVisitDate TIMESTAMP NULL,
	LastVisitDateLocal TIMESTAMP NULL,
	PageTitle TEXT NULL,
	Profile TEXT NULL,
	Thumbnail TEXT NULL,
	Typed BOOLEAN NULL,
	URL TEXT NULL,
	Username TEXT NULL,
	VisitCount INTEGER NULL,
	VisitCountAsDisplayed TEXT NULL,
	VisitFrom TEXT NULL,
	VisitType TEXT NULL,
	ItemSummaryID INTEGER NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL	
);
CREATE TABLE CookieHistory
(	
	ID INTEGER NOT NULL PRIMARY KEY,
	BrowserName TEXT NULL,
	BrowserVersion TEXT NULL,
	CookieFlags TEXT NULL,
	CookieName TEXT NULL,
	CookiePath TEXT NULL,
	CookieValue TEXT NULL,
	CreationDate TIMESTAMP NULL,			
	ExpirationDate TIMESTAMP NULL,
	FileName TEXT NULL,
	FilePath TEXT NULL,
	Hostname TEXT NULL,
	IsHTTPOnly BOOLEAN NULL,
	IsSecure BOOLEAN NULL,
	LastAccessedDate TIMESTAMP NULL,
	LastModifiedDate TIMESTAMP NULL,
	LastVisitDate TIMESTAMP NULL,
	Profile TEXT NULL,
	Username TEXT NULL,
	ItemSummaryID INTEGER NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL		
);
CREATE TABLE FormHistory
(	
	ID INTEGER NOT NULL PRIMARY KEY,
	BrowserName TEXT NULL,
	BrowserVersion TEXT NULL,
	CreationDate TIMESTAMP NULL,				
	EncryptedPassword TEXT NULL,
	EncryptionType TEXT NULL,
	FirstUsedDate TIMESTAMP NULL,
	FormFieldName TEXT NULL,
	FormFieldValue TEXT NULL,
	FormSubmitURL TEXT NULL,
	FormType TEXT NULL,
	EncryptionGUID TEXT NULL,
	Hostname TEXT NULL,
	HTTPRealm TEXT NULL,
	LastUsedDate TIMESTAMP NULL,
	PasswordFieldName TEXT NULL,
	Profile TEXT NULL,
	TimesUsed INTEGER NULL,
	TimesUsedAsDisplayed TEXT NULL,
	Username TEXT NULL,
	UsernameFieldName TEXT NULL,
	UsernameFieldValue TEXT NULL,
	EncryptedUsername TEXT NULL,
	PasswordChangedDate TIMESTAMP NULL,
	ItemSummaryID INTEGER NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL	
);
CREATE TABLE FileDownloadHistory
(	
	ID INTEGER NOT NULL PRIMARY KEY,
	AutoResume BOOLEAN NULL,
	BrowserName TEXT NULL,
	BrowserVersion TEXT NULL,
	BytesDownloaded INTEGER NULL,
	BytesDownloadedAsDisplayed TEXT NULL,
	CacheFlags TEXT NULL,
	CacheHitCount INTEGER NULL,				
	CacheHitCountAsDisplayed TEXT NULL,				
	DownloadType TEXT NULL,
	EndDate TIMESTAMP NULL,	
	FileName TEXT NULL,
	FullHTTPHeader TEXT NULL,
	LastAccessedDate TIMESTAMP NULL,	
	LastCacheSynchDate TIMESTAMP NULL,	
	LastCheckedDate TIMESTAMP NULL,	
	LastModifiedDate TIMESTAMP NULL,	
	MaxBytes INTEGER NULL,
	MaxBytesAsDisplayed TEXT NULL,
	MIMEType TEXT NULL,
	Profile TEXT NULL,
	Referrer TEXT NULL,
	SourceURL TEXT NULL,
	StartDate TIMESTAMP NULL,	
	DownloadState TEXT NULL,
	TargetDirectory TEXT NULL,
	TemporaryPath TEXT NULL,
	Username TEXT NULL,
	ItemSummaryID INTEGER NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL	
);

CREATE TABLE TimelineItems
(
	ID INTEGER NOT NULL PRIMARY KEY,
	EventTimestamp TIMESTAMP NULL,	
	EventType TEXT NULL,
	ItemSummaryID INTEGER NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL
);

CREATE TABLE UniqueProcesses
(
	ID INTEGER NOT NULL PRIMARY KEY,
	PID INTEGER NULL,
	Path TEXT NULL,
	ProcessName TEXT NULL,
	Arguments TEXT NULL
);
CREATE TABLE UniqueUsers
(
	ID INTEGER NOT NULL PRIMARY KEY,
	Username TEXT NULL,
	SID TEXT NULL,
	SIDType TEXT NULL
);

CREATE TABLE IOCReportsHistory
(
	ID INTEGER NOT NULL PRIMARY KEY,
	Title TEXT NULL,
	IOCDirectory TEXT NULL,
	HTMLReportLocation TEXT NULL,
	DocReportLocation TEXT NULL,
	CreationDate TIMESTAMP NULL,
	IocCount INTEGER NULL
);
CREATE TABLE IOCHitSummaries
(
	ID INTEGER NOT NULL PRIMARY KEY,
	IOCLocation TEXT NULL,
	HitCount INTEGER NULL,
	IOCReportId INTEGER NULL,
	FOREIGN KEY(IOCReportId) REFERENCES IOCReportsHistory(ID) ON DELETE SET NULL
);

CREATE TABLE MRIHits
(
	ID INTEGER NOT NULL PRIMARY KEY,
	RuleID TEXT NULL,
	HitType TEXT NULL,
	ScoreModifier FLOAT NULL,
	HitDescription TEXT NULL,
	MRIHitRefinementID INTEGER NULL,
	ProcessID INTEGER NULL,
	FOREIGN KEY(ProcessID) REFERENCES Processes(ID) ON DELETE SET NULL,
	FOREIGN KEY(MRIHitRefinementID) REFERENCES MRIHitRefinement(ID) ON DELETE SET NULL
);
CREATE TABLE MRIHitsRefinement
(
	ID INTEGER NOT NULL PRIMARY KEY,
	RuleID TEXT NULL,
	HitType TEXT NULL,
	ScoreModifier FLOAT NULL,
	Comment TEXT NULL,
	ProcessID INTEGER NULL,
	FOREIGN KEY(ProcessID) REFERENCES Processes(ID) ON DELETE SET NULL
);
CREATE TABLE MRISections
(
	ID INTEGER NOT NULL PRIMARY KEY,
	Occurrence FLOAT NULL,
	OccurrenceAsDisplayed TEXT NULL,
	SectionCount INTEGER NULL,
	SectionCountAsDisplayed TEXT NULL,
	ScoreModifier FLOAT NULL,
	TrustStatus TEXT NULL,
	ProcessSectionID INTEGER NULL,
	ProcessID INTEGER NULL,
	FOREIGN KEY(ProcessSectionID) REFERENCES ProcessSections(ID) ON DELETE SET NULL,
	FOREIGN KEY(ProcessID) REFERENCES Processes(ID) ON DELETE SET NULL
);
CREATE TABLE MRISectionsRefinement
(
	ID INTEGER NOT NULL PRIMARY KEY,
	TrustStatus TEXT NULL,
	ProcessSectionID INTEGER NULL,
	ProcessID INTEGER NULL,
	FOREIGN KEY(ProcessSectionID) REFERENCES ProcessSections(ID) ON DELETE SET NULL,
	FOREIGN KEY(ProcessID) REFERENCES Processes(ID) ON DELETE SET NULL
);
CREATE TABLE MRIScores
( 
	ID INTEGER NOT NULL PRIMARY KEY,
	Score INTEGER NULL,
	ProcessID INTEGER NULL,
	FOREIGN KEY(ProcessID) REFERENCES Processes(ID) ON DELETE SET NULL 
);
CREATE TABLE MRIHandles
( 
	ID INTEGER NOT NULL PRIMARY KEY,
	MRIHandleName TEXT NULL,
	MRIHandleCount INTEGER NULL, 
	MRIHandleCountAsDisplayed TEXT NULL, 
	TrustStatus TEXT NULL 
);

CREATE TABLE Alerts
(
	ID INTEGER PRIMARY KEY,
	RawId TEXT NOT NULL,
	AgentId TEXT,
	ConditionId TEXT,
	ThreatId TEXT,
	Marker TEXT,
	MatchHash TEXT,
	EventAt TIMESTAMP,
	MatchedAt TIMESTAMP,
	ReportedAt TIMESTAMP,
	Type TEXT,
	Deleted BOOLEAN
);

CREATE TABLE IOCAlerts
(
	ID INTEGER PRIMARY KEY,
	AlertEventType TEXT,
	IndicatorId TEXT,
	MatchTimestamp TIMESTAMP,
	ConditionId TEXT, /* This is UUID from AlertConditions table*/
	EventId TEXT,
	IsEventAvailable BOOLEAN,
	FOREIGN KEY(ID) REFERENCES Alerts(ID) 
);

CREATE TABLE IOCData
(
	ID INTEGER PRIMARY KEY,
	AlertID INTEGER,
	DataKey TEXT,
	DataValue TEXT,
	FOREIGN KEY(AlertID) REFERENCES IOCAlerts(ID)
);

CREATE TABLE EXDAlertAgentEvents
(
	ID INTEGER PRIMARY KEY,
	EarliestDetectionTime TIMESTAMP,
    ParentProcessId INTEGER,
	AgentEventID INTEGER,
	ItemSummaryID INTEGER,
	FOREIGN KEY(ID) REFERENCES Alerts(ID),
	FOREIGN KEY(AgentEventID) REFERENCES AgentEvents(ID) ON DELETE SET NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL
);

CREATE TABLE EXDAnalysisDetails
(
	ID INTEGER PRIMARY KEY, /* Generated */
	AlertID INTEGER,
	DetailType TEXT,
	DetailTime TIMESTAMP,
	Json TEXT,
	FOREIGN KEY(AlertID) REFERENCES EXDAlertAgentEvents(ID)
);

CREATE TABLE AlertConditions
(
	ID TEXT PRIMARY KEY,
	UUID TEXT,
	HashVersion TEXT,
	Enabled BOOLEAN,
	EventType TEXT,
	ConditionTimeStamp TIMESTAMP,
	UpdatedBy TEXT
);

CREATE TABLE AlertConditionRelations
(
	ConditionId TEXT NOT NULL,
	AlertId INTEGER NOT NULL,
	PRIMARY KEY (ConditionId, AlertId),
	FOREIGN KEY(ConditionId) REFERENCES AlertConditions(ID),
	FOREIGN KEY(AlertId) REFERENCES Alerts(ID)
);

CREATE TABLE ConditionThreatRelations
(
	ConditionId TEXT NOT NULL,
	ThreatId TEXT NOT NULL,
	Type TEXT,
	PRIMARY KEY (ConditionId, ThreatId),
	FOREIGN KEY(ConditionId) REFERENCES AlertConditions(ID),
	FOREIGN KEY(ThreatId) REFERENCES Threats(ID)
);

CREATE TABLE AlertTests
(
	ID INTEGER PRIMARY KEY, /* Generated */
	ConditionId TEXT,
	Token TEXT,
	Operator TEXT,
	ConditionType TEXT,
	Value TEXT,
	FOREIGN KEY(ConditionId) REFERENCES AlertConditions(ID)
);

CREATE TABLE Threats
(
	ID TEXT PRIMARY KEY,
	UriName TEXT,
	ExternalId TEXT,
	Name TEXT,
	DisplayName TEXT,
	ThreatType TEXT,
	SubType TEXT,
	ThreatSignature TEXT,
	RawSignature TEXT,
	IntelVersion TEXT,
	Meta TEXT,
	InputType TEXT,
	ActiveSince TIMESTAMP,
	UpdateTime TIMESTAMP,
	CreateText TEXT,
	CreateActor TEXT,
	PendingChanges TEXT,
	Revision TEXT,
	Category TEXT,
	UpdateActor TEXT,
	Description TEXT,
	OriginText TEXT,
	OriginActorId TEXT,
	Executed BOOLEAN,
	Detected BOOLEAN,
	Origin TEXT,
	FOREIGN KEY(ID) REFERENCES Alerts(ThreatId)
);

CREATE TABLE ShellHistory
(
	ID INTEGER NOT NULL PRIMARY KEY,
	FileOrder INTEGER NULL,
	Command TEXT NULL,
	Username TEXT NULL,
	Shell TEXT NULL,
	CommandDate TIMESTAMP NULL,
	ItemSummaryID INTEGER NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL
);

CREATE TABLE Groups
(
	ID INTEGER NOT NULL PRIMARY KEY,
	GroupName TEXT NULL, 
	FullName TEXT NULL, 
	GroupGuid TEXT NULL, 
	Usernames TEXT NULL,
	ItemSummaryID INTEGER NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL
);

CREATE TABLE QuarantineEvents
(
	ID INTEGER NOT NULL PRIMARY KEY,
	Username TEXT NULL,
	EventID TEXT NULL,
	EventTimestamp TIMESTAMP NULL,
	AgentBundleID TEXT NULL,
	AgentName TEXT NULL,
	DataUrl TEXT NULL,
	TypeNumber INTEGER NULL,
	OriginUrl TEXT NULL,
	SenderName TEXT NULL,
	SenderAddress TEXT NULL,
	OriginTitle TEXT NULL,
	ItemSummaryID INTEGER NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL
);

CREATE TABLE Syslog
(
	ID INTEGER NOT NULL PRIMARY KEY,
	SyslogID INTEGER NULL,
	Time TIMESTAMP NULL,
	Level TEXT NULL,
	PID INTEGER NULL,
	UID INTEGER NULL,
	GID INTEGER NULL,
	Host TEXT NULL,
	Sender TEXT NULL,
	Facility TEXT NULL,
	Message TEXT NULL,
	ItemSummaryID INTEGER NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL
);

CREATE TABLE Logins
(
	ID INTEGER NOT NULL PRIMARY KEY,
	Path TEXT NULL,
	StartTime TIMESTAMP NULL,
	EndTime TIMESTAMP NULL,
	SessionLength TEXT NULL,
	Hostname TEXT NULL,
	IsRemoteLogin BOOLEAN NULL,
	IPv4Address TEXT NULL,
	IPv6Address TEXT NULL,
	Username TEXT NULL,
	RecordType TEXT NULL,
	PID INTEGER NULL,
	Terminal TEXT NULL,
	IsFailedLogin BOOLEAN NULL,
	ItemSummaryID INTEGER NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL
);

CREATE TABLE KernelModules
(
	ID INTEGER NOT NULL PRIMARY KEY,
	Module TEXT NULL,
	Size INTEGER NULL,
	Status TEXT NULL,
	Address TEXT NULL,
	Filename TEXT NULL,
	License TEXT NULL,
	SrcVersion TEXT NULL,
	Retpoline BOOLEAN NULL,
	Intree BOOLEAN NULL,
	Vermagic TEXT NULL,
	Signat TEXT NULL,
	Signer TEXT NULL,
	SigKey TEXT NULL,
	SigHashAlgorithm TEXT NULL,
	MD5 TEXT NULL,
	SHA1 TEXT NULL,
	SHA256 TEXT NULL,
	ItemSummaryID INTEGER NULL,
	FOREIGN KEY(ItemSummaryID) REFERENCES ItemSummaries(ID) ON DELETE SET NULL
);

CREATE TABLE KernelModuleLists
(
	ID INTEGER NOT NULL PRIMARY KEY,
	Name TEXT NOT NULL,
	ListID INTEGER NOT NULL,
	KernelModuleID INTEGER NULL,
	FOREIGN KEY(KernelModuleID) REFERENCES KernelModules(ID) ON DELETE SET NULL
);

