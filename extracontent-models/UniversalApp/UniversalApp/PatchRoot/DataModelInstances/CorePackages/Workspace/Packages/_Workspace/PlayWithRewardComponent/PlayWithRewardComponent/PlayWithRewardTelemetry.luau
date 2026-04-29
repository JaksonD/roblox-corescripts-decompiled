local TelemetryService = game:GetService("TelemetryService")
local t1 = {
	"addOSInfo",
	"addSessionInfo",
	"addSessionId"
}
local t2 = { "addOSInfo" }
local t3 = {
	eventName = "PlayWithRewardAdRequested",
	backends = {
		"EventIngest",
		"Points"
	},
	throttlingPercentage = game:DefineFastInt("PlayWithRewardAdRequestedTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = {
		25,
		9,
		24
	},
	description = "        This is fired when a Play with Reward ad is requested.\n    "
}
local t4 = {
	eventName = "PlayWithRewardAdReceived",
	backends = {
		"EventIngest",
		"Points"
	},
	throttlingPercentage = game:DefineFastInt("PlayWithRewardAdReceivedTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = {
		25,
		9,
		24
	},
	description = "        This is fired when a Play with Reward ad is received.\n    "
}
local t5 = {
	eventName = "PlayWithRewardButtonShown",
	backends = {
		"EventIngest",
		"Points"
	},
	throttlingPercentage = game:DefineFastInt("PlayWithRewardButtonShownTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = {
		25,
		9,
		24
	},
	description = "        This is fired when a Play with Reward button is shown on an EDP.\n    "
}
local t6 = {
	eventName = "PlayWithRewardButtonClicked",
	backends = {
		"EventIngest",
		"Points"
	},
	throttlingPercentage = game:DefineFastInt("PlayWithRewardButtonClickedTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = {
		25,
		9,
		24
	},
	description = "        This is fired when a Play with Reward button is clicked on an EDP.\n    "
}
local t7 = {
	eventName = "PlayWithRewardAdPlaybackAttempted",
	backends = {
		"EventIngest",
		"Points"
	},
	throttlingPercentage = game:DefineFastInt("PlayWithRewardAdPlaybackAttemptedTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = {
		25,
		9,
		24
	},
	description = "        This is fired when a Play with Reward ad starts playing.\n    "
}
local t8 = {
	eventName = "PlayWithRewardAdPlaybackStopped",
	backends = {
		"EventIngest",
		"Points"
	},
	throttlingPercentage = game:DefineFastInt("PlayWithRewardAdPlaybackStoppedTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = {
		25,
		9,
		24
	},
	description = "        This is fired when a Play with Reward ad stops playing.\n    "
}
local t9 = {
	eventName = "PlayWithRewardGameJoinInitiated",
	backends = {
		"EventIngest",
		"Points"
	},
	throttlingPercentage = game:DefineFastInt("PlayWithRewardGameJoinInitiatedTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = {
		25,
		9,
		24
	},
	description = "        This is fired when a Play with Reward game join is initiated from an EDP.\n    "
}
local t10 = {
	eventName = "PlayWithRewardBlackoutCurtain",
	backends = {
		"EventIngest",
		"Points"
	},
	throttlingPercentage = game:DefineFastInt("PlayWithRewardBlackoutCurtainTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = {
		26,
		4,
		3
	},
	description = "        This is fired when the Play with Reward blackout curtain state changes (shown, hidden, or cleaned up on unmount).\n    "
}
local t11 = {
	eventName = "PlayWithRewardCoachmark",
	backends = {
		"EventIngest",
		"Points"
	},
	throttlingPercentage = game:DefineFastInt("PlayWithRewardCoachmarkTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = {
		26,
		4,
		21
	},
	description = "        This is fired when a Play with Reward coachmark is shown or dismissed on an EDP.\n    "
}
local t12 = {
	eventName = "PlayWithRewardAdRequestedCounter",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = {
		25,
		9,
		24
	},
	description = "\t        Counter for PlayWithRewardAdRequested events.\n\t    "
}
local t13 = {
	eventName = "PlayWithRewardAdReceivedCounter",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = {
		25,
		9,
		24
	},
	description = "\t        Counter for PlayWithRewardAdReceived events with status.\n\t    "
}
local t14 = {
	eventName = "PlayWithRewardButtonShownCounter",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = {
		25,
		9,
		24
	},
	description = "\t        Counter for PlayWithRewardButtonShown events.\n\t    "
}
local t15 = {
	eventName = "PlayWithRewardButtonClickedCounter",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = {
		25,
		9,
		24
	},
	description = "\t        Counter for PlayWithRewardButtonClicked events.\n\t    "
}
local t16 = {
	eventName = "PlayWithRewardAdPlaybackAttemptedCounter",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = {
		25,
		9,
		24
	},
	description = "\t        Counter for PlayWithRewardAdPlaybackAttempted events.\n\t    "
}
local t17 = {
	eventName = "PlayWithRewardAdPlaybackStoppedCounter",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = {
		25,
		9,
		24
	},
	description = "\t        Counter for PlayWithRewardAdPlaybackStopped events with status.\n\t    "
}
local t18 = {
	eventName = "PlayWithRewardGameJoinInitiatedCounter",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = {
		25,
		9,
		24
	},
	description = "\t        Counter for PlayWithRewardGameJoinInitiated events.\n\t    "
}
local t19 = {
	eventName = "PlayWithRewardCoachmarkCounter",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = {
		26,
		4,
		21
	},
	description = "\t        Counter for PlayWithRewardCoachmark events, split by action.\n\t    "
}
local t20 = {
	eventName = "PlayWithRewardAdReceivedSuccessfully",
	backends = { "RobloxTelemetryStat" },
	lastUpdated = {
		25,
		9,
		24
	},
	description = "\t        Stats for successful PlayWithRewardAdReceived events.\n\t    "
}

return {
	logPlayWithRewardAdRequested = function(s1: string, s2: string) --[[ logPlayWithRewardAdRequested ]] -- line: 233
		-- upvalues: TelemetryService (copy), t3 (copy), t1 (copy), t12 (copy)
		local t21 = {
			playWithRewardFlowId = s1,
			universeId = s2
		}

		TelemetryService:LogEvent(t3, {
			standardizedFields = t1,
			customFields = t21
		})
		TelemetryService:LogCounter(t12, {
			standardizedFields = t1,
			customFields = {}
		}, 1)
	end,
	logPlayWithRewardAdReceived = function(s3: string, s4: string, b1: boolean, s5: string?, n1: number) --[[ logPlayWithRewardAdReceived ]] -- line: 253
		-- upvalues: TelemetryService (copy), t4 (copy), t1 (copy), t13 (copy), t20 (copy)
		local t22 = {
			playWithRewardFlowId = s3,
			universeId = s4,
			isSuccessful = b1,
			adAvailabilityResult = s5,
			fetchLatencyMs = n1
		}

		TelemetryService:LogEvent(t4, {
			standardizedFields = t1,
			customFields = t22
		})
		TelemetryService:LogCounter(t13, {
			standardizedFields = t1,
			customFields = {
				isSuccessful = b1,
				adAvailabilityResult = s5
			}
		}, 1)

		if b1 then
			TelemetryService:LogStat(t20, {
				standardizedFields = t1,
				customFields = {
					adAvailabilityResult = s5
				}
			}, n1)
		end
	end,
	logPlayWithRewardButtonShown = function(s6: string, s7: string, s8: string) --[[ logPlayWithRewardButtonShown ]] -- line: 294
		-- upvalues: TelemetryService (copy), t5 (copy), t1 (copy), t14 (copy)
		local t23 = {
			playWithRewardFlowId = s6,
			universeId = s7,
			showState = s8
		}

		TelemetryService:LogEvent(t5, {
			standardizedFields = t1,
			customFields = t23
		})
		TelemetryService:LogCounter(t14, {
			standardizedFields = t1,
			customFields = {}
		}, 1)
	end,
	logPlayWithRewardButtonClicked = function(s9: string, s10: string) --[[ logPlayWithRewardButtonClicked ]] -- line: 315
		-- upvalues: TelemetryService (copy), t6 (copy), t1 (copy), t15 (copy)
		local t24 = {
			playWithRewardFlowId = s9,
			universeId = s10
		}

		TelemetryService:LogEvent(t6, {
			standardizedFields = t1,
			customFields = t24
		})
		TelemetryService:LogCounter(t15, {
			standardizedFields = t1,
			customFields = {}
		}, 1)
	end,
	logPlayWithRewardAdPlaybackAttempted = function(s11: string, s12: string) --[[ logPlayWithRewardAdPlaybackAttempted ]] -- line: 335
		-- upvalues: TelemetryService (copy), t7 (copy), t1 (copy), t16 (copy)
		local t25 = {
			playWithRewardFlowId = s11,
			universeId = s12
		}

		TelemetryService:LogEvent(t7, {
			standardizedFields = t1,
			customFields = t25
		})
		TelemetryService:LogCounter(t16, {
			standardizedFields = t1,
			customFields = {}
		}, 1)
	end,
	logPlayWithRewardAdPlaybackStopped = function(s13: string, s14: string, s15: string) --[[ logPlayWithRewardAdPlaybackStopped ]] -- line: 355
		-- upvalues: TelemetryService (copy), t8 (copy), t1 (copy), t17 (copy)
		local t26 = {
			playWithRewardFlowId = s13,
			universeId = s14,
			adPlaybackStatus = s15
		}

		TelemetryService:LogEvent(t8, {
			standardizedFields = t1,
			customFields = t26
		})
		TelemetryService:LogCounter(t17, {
			standardizedFields = t1,
			customFields = {
				adPlaybackStatus = s15
			}
		}, 1)
	end,
	logPlayWithRewardGameJoinInitiated = function(s16: string, s17: string) --[[ logPlayWithRewardGameJoinInitiated ]] -- line: 376
		-- upvalues: TelemetryService (copy), t9 (copy), t1 (copy), t18 (copy)
		local t27 = {
			playWithRewardFlowId = s16,
			universeId = s17
		}

		TelemetryService:LogEvent(t9, {
			standardizedFields = t1,
			customFields = t27
		})
		TelemetryService:LogCounter(t18, {
			standardizedFields = t1,
			customFields = {}
		}, 1)
	end,
	logPlayWithRewardBlackoutCurtainAction = function(s18: string, s19: string, s20: string) --[[ logPlayWithRewardBlackoutCurtainAction ]] -- line: 396
		-- upvalues: TelemetryService (copy), t10 (copy), t1 (copy)
		local t28 = {
			playWithRewardFlowId = s18,
			universeId = s19,
			blackoutCurtainAction = s20
		}

		TelemetryService:LogEvent(t10, {
			standardizedFields = t1,
			customFields = t28
		})
	end,
	logPlayWithRewardCoachmark = function(s21: string, s22: string, s23: string, n2: number) --[[ logPlayWithRewardCoachmark ]] -- line: 413
		-- upvalues: TelemetryService (copy), t11 (copy), t1 (copy), t19 (copy), t2 (copy)
		local t29 = {
			action = s21,
			playWithRewardFlowId = s22,
			universeId = s23,
			productId = n2
		}

		TelemetryService:LogEvent(t11, {
			standardizedFields = t1,
			customFields = t29
		})
		TelemetryService:LogCounter(t19, {
			standardizedFields = t2,
			customFields = {
				action = s21
			}
		}, 1)
	end
}
