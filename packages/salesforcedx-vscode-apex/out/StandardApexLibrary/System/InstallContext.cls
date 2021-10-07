global interface InstallContext {
	Id installerId();
	Boolean isPush();
	Boolean isUpgrade();
	Id organizationId();
	System.Version previousVersion();

}