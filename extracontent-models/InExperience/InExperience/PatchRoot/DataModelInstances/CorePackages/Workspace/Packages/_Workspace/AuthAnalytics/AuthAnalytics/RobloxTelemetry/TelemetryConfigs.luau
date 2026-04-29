local Parent = script:FindFirstAncestor("AuthAnalytics").Parent
local LoggingProtocol = require(Parent.LoggingProtocol)
local v3 = game:DefineFastInt("AuthPageMountThrottlingHundredthsPercent", 0)
local v4 = game:DefineFastInt("ValidCookieForNoCachedUserThrottlingHundredthsPercent", 0)
local v5 = game:DefineFastInt("AuthButtonClickedThrottlingHundredthsPercent", 0)
local v6 = game:DefineFastInt("SilentPasskeyUpgradeThrottlingHundredthsPercent", 0)
local v7 = game:DefineFastInt("DeepLinkNavigationLockThrottlingHundredthsPercent", 0)
local v8 = game:DefineFastInt("UnauthorizedErrorThrottlingHundredthsPercent", 0)
local v9 = game:DefineFastInt("IosAuthServiceLoginThrottlingHundredthsPercent", 0)
local v10 = game:DefineFastInt("LuaLogoutThrottlingHundredthsPercent", 0)
local v11 = game:DefineFastInt("KeystoreTelemetryThrottlingHundredthsPercent", 0)

return {
	LandingPageMountTelemetryConfig = {
		eventName = "luaLandingPageMount",
		backends = { LoggingProtocol.TelemetryBackends.Counter },
		throttlingPercentage = v3,
		lastUpdated = {
			25,
			4,
			7
		},
		description = "Report when landing page is mounted.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	LoginPageMountTelemetryConfig = {
		eventName = "luaLoginPageMount",
		backends = { LoggingProtocol.TelemetryBackends.Counter },
		throttlingPercentage = v3,
		lastUpdated = {
			25,
			4,
			14
		},
		description = "Report when login page is mounted.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	SignupPageMountTelemetryConfig = {
		eventName = "luaSignupPageMount",
		backends = { LoggingProtocol.TelemetryBackends.Counter },
		throttlingPercentage = v3,
		lastUpdated = {
			25,
			4,
			14
		},
		description = "Report when signup page is mounted.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	AddAuthMethodPageMountTelemetryConfig = {
		eventName = "luaAddAuthMethodPageMount",
		backends = { LoggingProtocol.TelemetryBackends.Counter },
		throttlingPercentage = v3,
		lastUpdated = {
			25,
			4,
			14
		},
		description = "Report when add auth method page is mounted.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	EngagementScreenMountTelemetryConfig = {
		eventName = "luaEngagementScreenMount",
		backends = { LoggingProtocol.TelemetryBackends.Counter },
		throttlingPercentage = v3,
		lastUpdated = {
			25,
			4,
			17
		},
		description = "Report when the engagement screen is mounted.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	ConsoleSSOAttemptedTelemetryConfig = {
		eventName = "luaConsoleSSOAttempted",
		backends = { LoggingProtocol.TelemetryBackends.Counter },
		throttlingPercentage = v3,
		lastUpdated = {
			25,
			4,
			17
		},
		description = "Report when a console SSO attempt is made.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	SingleSignOnErrorMountTelemetryConfig = {
		eventName = "luaSingleSignOnErrorMount",
		backends = { LoggingProtocol.TelemetryBackends.Counter },
		throttlingPercentage = v3,
		lastUpdated = {
			26,
			1,
			28
		},
		description = "Report when the single sign on error is mounted.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	ValidCookieForNoCachedUserTelemetryConfig = {
		eventName = "luaValidCookieForNoCachedUser",
		backends = { LoggingProtocol.TelemetryBackends.Counter },
		throttlingPercentage = v4,
		lastUpdated = {
			25,
			4,
			11
		},
		description = "Report when a valid cookie is found for a user that is not cached.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	NoCookieForCachedUserTelemetryConfig = {
		eventName = "luaNoCookieForCachedUser",
		backends = { LoggingProtocol.TelemetryBackends.Counter },
		throttlingPercentage = v4,
		lastUpdated = {
			25,
			4,
			11
		},
		description = "Report when a user with a cached user does not have a valid cookie.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	LaunchAppThunkInitiatedConfig = {
		eventName = "luaLaunchAppThunkInitiated",
		backends = { LoggingProtocol.TelemetryBackends.Counter },
		throttlingPercentage = v4,
		lastUpdated = {
			25,
			4,
			14
		},
		description = "Report when the launch app thunk is initiated.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	LandingLoginButtonClickedConfig = {
		eventName = "luaLandingLoginButtonClicked",
		backends = { LoggingProtocol.TelemetryBackends.Counter },
		throttlingPercentage = v5,
		lastUpdated = {
			25,
			4,
			14
		},
		description = "Report when the landing login button is clicked.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	LandingSignupButtonClickedConfig = {
		eventName = "luaLandingSignupButtonClicked",
		backends = { LoggingProtocol.TelemetryBackends.Counter },
		throttlingPercentage = v5,
		lastUpdated = {
			25,
			4,
			14
		},
		description = "Report when the landing signup button is clicked.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	LogoutButtonClickedConfig = {
		eventName = "luaLogoutButtonClicked",
		backends = { LoggingProtocol.TelemetryBackends.Counter },
		throttlingPercentage = v5,
		lastUpdated = {
			25,
			4,
			14
		},
		description = "Report when the logout button is clicked.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	EngagementScreenContinueButtonClickedConfig = {
		eventName = "luaEngagementScreenContinueButtonClicked",
		backends = { LoggingProtocol.TelemetryBackends.Counter },
		throttlingPercentage = v5,
		lastUpdated = {
			25,
			4,
			17
		},
		description = "Report when the continue button is clicked.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	SilentPasskeyUpgradeAvailableConfig = {
		eventName = "luaSilentPasskeyUpgradeAvailable",
		backends = { LoggingProtocol.TelemetryBackends.Counter },
		throttlingPercentage = v6,
		lastUpdated = {
			25,
			10,
			22
		},
		description = "Report when a device is eligible for a silent passkey upgrade.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	SilentPasskeyUpgradeAttemptedConfig = {
		eventName = "luaSilentPasskeyUpgradeAttempted",
		backends = { LoggingProtocol.TelemetryBackends.Counter },
		throttlingPercentage = v6,
		lastUpdated = {
			25,
			10,
			22
		},
		description = "Report when a silent passkey upgrade is attempted.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	SilentPasskeyUpgradeSuccessConfig = {
		eventName = "luaSilentPasskeyUpgradeSuccess",
		backends = { LoggingProtocol.TelemetryBackends.Counter },
		throttlingPercentage = v6,
		lastUpdated = {
			25,
			10,
			22
		},
		description = "Report when a silent passkey upgrade attempt succeeds.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	SilentPasskeyUpgradeFailureConfig = {
		eventName = "luaSilentPasskeyUpgradeFailure",
		backends = { LoggingProtocol.TelemetryBackends.Counter },
		throttlingPercentage = v6,
		lastUpdated = {
			25,
			10,
			22
		},
		description = "Report when a silent passkey upgrade attempt fails.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	SilentPasskeyUpgradeNoPasskeyConfig = {
		eventName = "luaSilentPasskeyUpgradeNoPasskey",
		backends = { LoggingProtocol.TelemetryBackends.Counter },
		throttlingPercentage = v6,
		lastUpdated = {
			26,
			1,
			12
		},
		description = "Report when a silent passkey upgrade proceeds because the user does not have a passkey.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	DeepLinkPendingDueToNavigationLockConfig = {
		eventName = "luaDeepLinkPendingDueToNavigationLock",
		backends = { LoggingProtocol.TelemetryBackends.Counter },
		throttlingPercentage = v7,
		lastUpdated = {
			25,
			10,
			24
		},
		description = "Report when a deeplink is queued because navigation is locked.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	DeepLinkProcessedAfterNavigationUnlockConfig = {
		eventName = "luaDeepLinkProcessedAfterNavigationUnlock",
		backends = { LoggingProtocol.TelemetryBackends.Counter },
		throttlingPercentage = v7,
		lastUpdated = {
			25,
			10,
			24
		},
		description = "Report when a queued deeplink is processed after navigation unlocks.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	SingleSignOnErrorRetryButtonClickedConfig = {
		eventName = "luaSingleSignOnErrorRetryButtonClicked",
		backends = { LoggingProtocol.TelemetryBackends.Counter },
		throttlingPercentage = v5,
		lastUpdated = {
			26,
			1,
			28
		},
		description = "Report when the SSO error screen retry button is clicked.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	LuaLogoutTelemetryConfig = {
		eventName = "LuaLogout",
		backends = { "RobloxTelemetryCounter" },
		throttlingPercentage = v10,
		lastUpdated = {
			26,
			1,
			21
		},
		description = "Counting logouts by reason.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	UnauthorizedErrorTelemetryConfig = {
		eventName = "luaUnauthorizedError",
		backends = { LoggingProtocol.TelemetryBackends.Counter },
		throttlingPercentage = v8,
		lastUpdated = {
			26,
			1,
			21
		},
		description = "Report when a unauthorized error is encountered.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	IosAuthServiceLoginPasswordSaveAttemptedConfig = {
		eventName = "iosAuthServiceLoginPasswordSaveAttempted",
		backends = { LoggingProtocol.TelemetryBackends.Counter },
		throttlingPercentage = v9,
		lastUpdated = {
			26,
			2,
			11
		},
		description = "Report when save password to iOS Keychain is attempted after login.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	IosAuthServiceLoginPasswordSaveSuccessConfig = {
		eventName = "iosAuthServiceLoginPasswordSaveSuccess",
		backends = { LoggingProtocol.TelemetryBackends.Counter },
		throttlingPercentage = v9,
		lastUpdated = {
			26,
			2,
			11
		},
		description = "Report when save password to iOS Keychain succeeds after login.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	IosAuthServiceLoginPasswordSaveFailureConfig = {
		eventName = "iosAuthServiceLoginPasswordSaveFailure",
		backends = { LoggingProtocol.TelemetryBackends.Counter },
		throttlingPercentage = v9,
		lastUpdated = {
			26,
			2,
			11
		},
		description = "Report when save password to iOS Keychain fails after login.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	IosAuthServiceLoginPasswordSaveSkippedConfig = {
		eventName = "iosAuthServiceLoginPasswordSaveSkipped",
		backends = { LoggingProtocol.TelemetryBackends.Counter },
		throttlingPercentage = v9,
		lastUpdated = {
			26,
			2,
			11
		},
		description = "Report when save password to iOS Keychain is skipped after login.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	IosAuthServiceLoginCredentialSheetShownConfig = {
		eventName = "iosAuthServiceLoginCredentialSheetShown",
		backends = {
			LoggingProtocol.TelemetryBackends.Counter,
			LoggingProtocol.TelemetryBackends.EventIngest
		},
		throttlingPercentage = v9,
		lastUpdated = {
			26,
			2,
			11
		},
		description = "Report when the iOS credential sheet is shown during login.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	IosAuthServiceLoginCredentialSheetPasswordSelectedConfig = {
		eventName = "iosAuthServiceLoginCredentialSheetPasswordSelected",
		backends = {
			LoggingProtocol.TelemetryBackends.Counter,
			LoggingProtocol.TelemetryBackends.EventIngest
		},
		throttlingPercentage = v9,
		lastUpdated = {
			26,
			2,
			11
		},
		description = "Report when a user selects a password from the iOS credential sheet during login.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	IosAuthServiceLoginCredentialSheetPasskeySelectedConfig = {
		eventName = "iosAuthServiceLoginCredentialSheetPasskeySelected",
		backends = {
			LoggingProtocol.TelemetryBackends.Counter,
			LoggingProtocol.TelemetryBackends.EventIngest
		},
		throttlingPercentage = v9,
		lastUpdated = {
			26,
			2,
			11
		},
		description = "Report when a user selects a passkey from the iOS credential sheet during login.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	IosAuthServiceLoginCredentialSheetErrorConfig = {
		eventName = "iosAuthServiceLoginCredentialSheetError",
		backends = {
			LoggingProtocol.TelemetryBackends.Counter,
			LoggingProtocol.TelemetryBackends.EventIngest
		},
		throttlingPercentage = v9,
		lastUpdated = {
			26,
			2,
			11
		},
		description = "Report when the iOS credential sheet returns an error during login.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	IosAuthServiceLoginCredentialSheetDismissedConfig = {
		eventName = "iosAuthServiceLoginCredentialSheetDismissed",
		backends = {
			LoggingProtocol.TelemetryBackends.Counter,
			LoggingProtocol.TelemetryBackends.EventIngest
		},
		throttlingPercentage = v9,
		lastUpdated = {
			26,
			2,
			11
		},
		description = "Report when the iOS credential sheet is dismissed without selection during login.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	KeystoreGetCredentialsTelemetryConfig = {
		eventName = "keystoreGetCredentials",
		backends = { LoggingProtocol.TelemetryBackends.Counter },
		throttlingPercentage = v11,
		lastUpdated = {
			26,
			4,
			21
		},
		description = "Counter for keystore get-credentials operations by result.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	KeystoreAutoLoginTelemetryConfig = {
		eventName = "keystoreAutoLogin",
		backends = { LoggingProtocol.TelemetryBackends.Counter },
		throttlingPercentage = v11,
		lastUpdated = {
			26,
			4,
			21
		},
		description = "Counter for keystore auto-login outcomes by result.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	KeystoreSaveCredentialsTelemetryConfig = {
		eventName = "keystoreSaveCredentials",
		backends = { LoggingProtocol.TelemetryBackends.Counter },
		throttlingPercentage = v11,
		lastUpdated = {
			26,
			4,
			21
		},
		description = "Counter for keystore save-credentials operations by result.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	KeystoreDeleteCredentialsTelemetryConfig = {
		eventName = "keystoreDeleteCredentials",
		backends = { LoggingProtocol.TelemetryBackends.Counter },
		throttlingPercentage = v11,
		lastUpdated = {
			26,
			4,
			21
		},
		description = "Counter for keystore delete-credentials operations by reason.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	},
	KeystoreRedirectTelemetryConfig = {
		eventName = "keystoreRedirect",
		backends = { LoggingProtocol.TelemetryBackends.Counter },
		throttlingPercentage = v11,
		lastUpdated = {
			26,
			4,
			21
		},
		description = "Counter for keystore redirect operations by destination.",
		links = "https://roblox.atlassian.net/wiki/spaces/AUTH/pages/3475702046/Lua+Client-Side+Telemetry+Planning"
	}
}
