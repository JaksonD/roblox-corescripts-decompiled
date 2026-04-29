local ParentParent = script.Parent.Parent
local ParentParentParent = ParentParent.Parent
local TelemetryService = require(ParentParentParent.MockableProxyServices).TelemetryService

require(ParentParent.Enum.Placement)

local DeviceTier = require(ParentParentParent.Devices).DeviceTier
local v5 = game:DefineFastFlag("AppNavDeviceTier", false)
local t1 = {
	"addOSInfo",
	"addSessionId",
	"addSessionInfo"
}
local v7 = if not v5 then nil else DeviceTier.GetDeviceMemoryTier()
local t2 = {
	eventName = "AppNav_SwitchTab",
	backends = { "RobloxTelemetryStat" },
	throttlingPercentage = 10000,
	lastUpdated = {
		2026,
		3,
		12
	},
	description = "App Nav switch tab",
	links = "https://roblox.atlassian.net/wiki/x/1ACaAQE"
}
local t3 = {
	eventName = "AppNav_SwitchTab",
	backends = { "EventIngest" },
	throttlingPercentage = 10000,
	lastUpdated = {
		2026,
		3,
		12
	},
	description = "App Nav switch tab",
	links = "https://roblox.atlassian.net/wiki/x/1ACaAQE"
}
local t4 = {
	eventName = "AppNav_IsVisibleChanged",
	backends = { "RobloxTelemetryStat" },
	throttlingPercentage = 10000,
	lastUpdated = {
		26,
		3,
		17
	},
	description = "App Nav isVisible prop changed",
	links = "https://roblox.atlassian.net/wiki/x/1ACaAQE"
}
local t5 = {
	eventName = "AppNav_IsVisibleChanged",
	backends = { "EventIngest" },
	throttlingPercentage = 10000,
	lastUpdated = {
		26,
		3,
		17
	},
	description = "App Nav isVisible prop changed",
	links = "https://roblox.atlassian.net/wiki/x/1ACaAQE"
}
local t6 = {
	eventName = "AppNav_PlacementChanged",
	backends = { "RobloxTelemetryCounter" },
	throttlingPercentage = 10000,
	lastUpdated = {
		26,
		3,
		17
	},
	description = "App Nav placement prop changed",
	links = "https://roblox.atlassian.net/wiki/x/1ACaAQE"
}
local t7 = nil

local function reportSwitchTab(s1: string, s2: string, n1: number) -- line: 82
	-- upvalues: TelemetryService (copy), t2 (copy), v5 (copy), v7 (copy), t3 (copy), t1 (copy)
	TelemetryService:LogStat(t2, {
		customFields = {
			previous_page = s1,
			current_page = s2,
			device_tier = if not v5 then nil else v7
		}
	}, n1)
	TelemetryService:LogEvent(t3, {
		customFields = {
			previous_page = s1,
			current_page = s2,
			duration = n1
		},
		standardizedFields = t1
	})
end

local t8 = nil

local function reportVisibility(b1: boolean, n2: number) -- line: 126
	-- upvalues: TelemetryService (copy), t4 (copy), v5 (copy), v7 (copy), t5 (copy), t1 (copy)
	TelemetryService:LogStat(t4, {
		customFields = {
			is_visible = b1,
			device_tier = if not v5 then nil else v7
		}
	}, n2)
	TelemetryService:LogEvent(t5, {
		customFields = {
			is_visible = b1,
			duration = n2
		},
		standardizedFields = t1
	})
end

local u17 = nil

return {
	logSwitchTabStart = function(s3: string, s4: string) --[[ logSwitchTabStart ]] -- line: 74
		-- upvalues: t7 (ref)
		t7 = {
			previousPage = s3,
			nextPage = s4,
			startTime = os.clock()
		}
	end,
	logSwitchTabEnd = function(s5: string) --[[ logSwitchTabEnd ]] -- line: 100
		-- upvalues: t7 (ref), reportSwitchTab (copy)
		if not t7 then
			return
		end

		if s5 ~= t7.nextPage then
			t7 = nil

			return
		end

		local previousPage = t7.previousPage
		local v25 = (os.clock() - t7.startTime) * 1000

		t7 = nil
		reportSwitchTab(previousPage, s5, v25)
	end,
	logVisibilityStart = function(b2: boolean) --[[ logVisibilityStart ]] -- line: 119
		-- upvalues: t8 (ref)
		t8 = {
			nextValue = b2,
			startTime = os.clock()
		}
	end,
	logVisibilityEnd = function(b3: boolean) --[[ logVisibilityEnd ]] -- line: 142
		-- upvalues: t8 (ref), reportVisibility (copy)
		if not t8 then
			return
		end

		if b3 ~= t8.nextValue then
			t8 = nil

			return
		end

		local v30 = (os.clock() - t8.startTime) * 1000

		t8 = nil
		reportVisibility(b3, v30)
	end,
	logPlacement = function(p1) --[[ logPlacement ]] -- line: 160
		-- upvalues: u17 (ref), TelemetryService (copy), t6 (copy)
		if p1 == u17 then
			return
		end

		TelemetryService:LogCounter(t6, {
			customFields = {
				previous_placement = u17,
				current_placement = p1
			}
		})
		u17 = p1
	end,
	reset = function() --[[ reset ]] -- line: 175
		-- upvalues: t7 (ref), t8 (ref), u17 (ref)
		t7 = nil
		t8 = nil
		u17 = nil
	end
}
