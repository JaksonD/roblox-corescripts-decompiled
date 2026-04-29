local CorePackages = game:GetService("CorePackages")
local RunService = game:GetService("RunService")
local v3 = game:DefineFastInt("ReactSchedulingTracker", 0)
local v4 = game:DefineFastInt("ReactSchedulingTrackerPeriodMs", 30000)
local EngineFeature = game:GetEngineFeature("TelemetryServiceMemoryCPUInfoEnabled")
local v6 = game:DefineFastFlag("DisableReactSchedulingTimePctStats", false)
local v7 = game:DefineFastFlag("DisableReactSchedulingAvgMaxMsStats", false)
local FStringReactSchedulingContext = require(CorePackages.Workspace.Packages.SharedFlags).FStringReactSchedulingContext
local v9 = game:DefineFastString("ReactSchedulingPercentiles", "10,50,95,99")
local v10 = game:DefineFastInt("ReactSchedulingKllSketchMaxSize", 200)
local v11 = game:DefineFastFlag("DebugReactSchedulingEnableErrorEvents", false)
local v12 = game:DefineFastFlag("ReactSchedulingTrackerLayoutEffects", false)
local v13 = game:DefineFastFlag("ReactSchedulingTrackerDataModelUpdate", false)
local EngineFeature2 = game:GetEngineFeature("TelemetryServicePlaySessionInfoEnabled")
local v15 = game:DefineFastFlag("EnableCorescriptExecutionTime", false)
local EngineFeature3 = game:GetEngineFeature("ScriptPlusExecutionTimeEnabled")

function applicationId() -- line: 22
	local AppStorageService = game:GetService("AppStorageService")

	if not AppStorageService then
		return nil
	end

	local Item = AppStorageService:GetItem("AppInstallationId")
	local v48 = typeof(Item)

	if v48 == "number" then
		return tonumber(Item) or nil
	end

	if v48 == "string" then
		if string.len(Item) <= 0 then
			return nil
		end

		return (tonumber((string.sub(Item, -string.len((tostring(10000)))))))
	end

	return nil
end

local v17 = v3 > 0
local u18 = true
local u19 = true

if not v17 then
	u19 = false
	u18 = false
end

local v20 = math.random(0, 10000)
local v21 = applicationId()

if v21 ~= nil then
	v20 = (v21 + 1409) % 10000
end

if not (v20 < v3) then
	u19 = false
	u18 = false
end

local TelemetryService = game:GetService("TelemetryService")
local mutedError = require(CorePackages.Workspace.Packages.Loggers).mutedError
local ReactRoblox = require(CorePackages.Packages.ReactRoblox)

require(CorePackages.Packages.ReactReconciler)

local KllSketch = require(CorePackages.Workspace.Packages.InExperiencePerformance).KllSketch
local parts = string.split(v9)
local CorePackages2 = game:GetService("CorePackages")
local DeviceTier = require(CorePackages2.Workspace.Packages.Devices).DeviceTier
local schedulingProfiler = ReactRoblox.schedulingProfiler
local profilerEventTypes = schedulingProfiler.profilerEventTypes
local t1 = {
	Idle = "Idle",
	Render = "Render",
	Commit = "Commit",
	PassiveEffects = "PassiveEffects"
}
local v32 = DeviceTier.GetDeviceMemoryTier()
local t2 = {}

t2.__index = t2

function t2.new(p1: ((...any) -> ...any), p2: ((...any) -> ...any)) -- line: 141
	-- upvalues: t1 (copy), v12 (copy), profilerEventTypes (copy), mutedError (copy), t2 (copy)
	return (setmetatable({
		frameReporter = p1,
		rootReporter = p2,
		currentState = t1.Idle,
		timerStartMs = 0,
		layoutTimerStartMs = if not v12 then nil else 0,
		rootUpdateInProgress = false,
		rootUpdateTime = {
			tag = "RootUpdateTime",
			RenderMs = 0,
			CommitMs = 0,
			LayoutEffectsMs = if not v12 then nil else 0,
			StartTimeMs = 0
		},
		rootPassiveEffectsTime = {
			tag = "RootPassiveEffectsTime",
			PassiveEffectsMs = 0
		},
		renderLevel = 0,
		states = {
			[t1.Idle] = function(p3, n1: number) -- line: 165
				-- upvalues: profilerEventTypes (copy), v12 (copy), t1 (copy)
				if n1 == profilerEventTypes.RenderStart then
					p3.timerStartMs = os.clock() * 1000

					if not p3.rootUpdateInProgress then
						p3.rootUpdateInProgress = true
						p3.rootUpdateTime = {
							tag = "RootUpdateTime",
							RenderMs = 0,
							CommitMs = 0,
							LayoutEffectsMs = if not v12 then nil else 0,
							StartTimeMs = os.clock() * 1000
						}
					end

					return t1.Render
				end

				if n1 == profilerEventTypes.PassiveEffectsStart then
					p3.timerStartMs = os.clock() * 1000
					p3.rootPassiveEffectsTime = {
						tag = "RootPassiveEffectsTime",
						PassiveEffectsMs = 0
					}

					return t1.PassiveEffects
				end

				if n1 == profilerEventTypes.CommitStart then
					p3.timerStartMs = os.clock() * 1000

					return t1.Commit
				end

				return nil
			end,
			[t1.Render] = function(p4, n2: number) -- line: 194
				-- upvalues: profilerEventTypes (copy), t1 (copy), mutedError (copy)
				if n2 == profilerEventTypes.RenderYield or n2 == profilerEventTypes.RenderStop then
					local v148 = os.clock() * 1000 - p4.timerStartMs
					local rootUpdateTime = p4.rootUpdateTime

					rootUpdateTime.RenderMs = rootUpdateTime.RenderMs + v148
					p4.frameReporter(v148)

					return t1.Idle
				end

				mutedError("Invalid event in Render: " .. n2)

				return t1.Idle
			end,
			[t1.Commit] = function(p5, n3: number, p6) -- line: 206
				-- upvalues: profilerEventTypes (copy), v12 (copy), t1 (copy), mutedError (copy)
				if n3 == profilerEventTypes.CommitStop then
					if p5.renderLevel > 0 then
						if v12 and p5.renderLevel == 1 then
							local rootUpdateTime = p5.rootUpdateTime

							rootUpdateTime.LayoutEffectsMs = rootUpdateTime.LayoutEffectsMs + (os.clock() * 1000 - p5.layoutTimerStartMs)
						end

						p5.renderLevel = p5.renderLevel - 1

						return nil
					end

					local v154 = os.clock() * 1000 - p5.timerStartMs
					local rootUpdateTime = p5.rootUpdateTime

					rootUpdateTime.CommitMs = rootUpdateTime.CommitMs + v154
					p5.frameReporter(v154)
					p5.rootReporter(p5.rootUpdateTime, p6)
					p5.rootUpdateInProgress = false

					return t1.Idle
				end

				if n3 == profilerEventTypes.RenderStart then
					p5.renderLevel = p5.renderLevel + 1

					if v12 and p5.renderLevel == 1 then
						p5.layoutTimerStartMs = os.clock() * 1000
					end

					return nil
				end

				if v12 and (n3 == profilerEventTypes.LayoutEffectsStart or n3 == profilerEventTypes.PassiveEffectsStart) then
					if p5.renderLevel == 0 then
						p5.layoutTimerStartMs = os.clock() * 1000
					end

					return nil
				end

				if v12 and (n3 == profilerEventTypes.LayoutEffectsStop or n3 == profilerEventTypes.PassiveEffectsStop) then
					if p5.renderLevel == 0 then
						local rootUpdateTime = p5.rootUpdateTime

						rootUpdateTime.LayoutEffectsMs = rootUpdateTime.LayoutEffectsMs + (os.clock() * 1000 - p5.layoutTimerStartMs)
					end

					return nil
				end

				if n3 ~= profilerEventTypes.RenderYield then
					return nil
				end

				mutedError("Invalid event in Commit: " .. n3)

				return t1.Idle
			end,
			[t1.PassiveEffects] = function(p7, n4: number, p8) -- line: 253
				-- upvalues: profilerEventTypes (copy), t1 (copy), mutedError (copy)
				if n4 == profilerEventTypes.PassiveEffectsStop then
					local v160 = os.clock() * 1000 - p7.timerStartMs
					local rootPassiveEffectsTime = p7.rootPassiveEffectsTime

					rootPassiveEffectsTime.PassiveEffectsMs = rootPassiveEffectsTime.PassiveEffectsMs + v160
					p7.frameReporter(v160)
					p7.rootReporter(p7.rootPassiveEffectsTime, p8)

					return t1.Idle
				end

				mutedError("Invalid event in PassiveEffects: " .. n4)

				return t1.Idle
			end
		}
	}, t2))
end
function t2.transition(t3: {[any]: any}, n5: number, p9) -- line: 276
	local currentState = t3.currentState
	local v55 = t3.states[currentState](t3, n5, p9)

	if v55 then
		t3.currentState = v55
	end
end

local t4 = {
	"addPlaceId",
	"addUniverseId",
	"addSessionId",
	"addOSInfo",
	"addSessionInfo"
}

if EngineFeature then
	t4 = {
		"addPlaceId",
		"addUniverseId",
		"addSessionId",
		"addOSInfo",
		"addSessionInfo",
		"addMemoryInfo",
		"addCPUInfo"
	}
end

if EngineFeature2 then
	table.insert(t4, "addPlaySessionId")
end

local t5 = {
	eventName = "ReactSessionSummary",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("ReactSessionSummaryEventThrottleHunderedthsPercent", 0),
	lastUpdated = {
		2025,
		7,
		10
	},
	description = "Summary of React performance over a game session",
	links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8"
}
local t6 = nil

if v11 then
	t6 = {
		eventName = "ReactSessionErrorEvent",
		backends = { "EventIngest" },
		throttlingPercentage = game:DefineFastInt("DebugReactSessionErrorEventThrottleHunderedthsPercent", 0),
		lastUpdated = {
			2025,
			8,
			7
		},
		description = "Summary of React performance over a game session",
		links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8"
	}
end

local t7 = {
	eventName = "ReactPeriodSummary",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("ReactPeriodSummaryEventThrottleHunderedthsPercent", 0),
	lastUpdated = {
		2025,
		2,
		18
	},
	description = "Summary of React performance over a period",
	links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8"
}
local t8 = {
	eventName = "ReactPeriod",
	backends = { "RobloxTelemetryStat" },
	lastUpdated = {
		2025,
		2,
		18
	},
	description = "Stats for React performance over a period",
	links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8"
}
local t9 = {
	eventName = "ReactFrameCounter",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = {
		2025,
		2,
		18
	},
	description = "Frame counts for React performance over a period",
	links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8"
}
local t10 = {
	eventName = "ReactRootSummary",
	backends = { "EventIngest" },
	lastUpdated = {
		2025,
		2,
		18
	},
	throttlingPercentage = game:DefineFastInt("ReactRootSummaryEventThrottleHunderedthsPercent2", 0),
	description = "Summary of React performance for a root",
	links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8"
}
local t11 = nil

if not v6 then
	t11 = {
		eventName = "ReactRootPeriod",
		backends = { "RobloxTelemetryStat" },
		lastUpdated = {
			2025,
			2,
			18
		},
		description = "Stats for React performance for a root over a period",
		links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8"
	}
end

local t12 = {
	eventName = "ReactRootTaskCount",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = {
		2025,
		2,
		18
	},
	description = "Task counts for React performance for a root over a period",
	links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8"
}
local t13 = nil

if not v7 then
	t13 = {
		eventName = "ReactRootPeriodTask",
		backends = { "RobloxTelemetryStat" },
		lastUpdated = {
			2025,
			2,
			18
		},
		description = "Task stats for React performance for a root over a period",
		links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8"
	}
end

local t14 = {
	eventName = "ReactRootUpdate",
	backends = { "RobloxTelemetryStat" },
	lastUpdated = {
		2025,
		2,
		18
	},
	description = "Task stats for individual React root updates, all in milliseconds",
	links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8"
}
local t15 = {}

t15.__index = t15

function t15.new(s1: string?) -- line: 464
	-- upvalues: KllSketch (copy), v10 (copy), v11 (copy), t15 (copy), t2 (copy), u19 (ref)
	local t16 = {}
	local t17 = {}
	local t18 = {}
	local t19 = {}
	local t20 = {}
	local t21 = {}

	t16.all = KllSketch.new(v10)
	t17.all = KllSketch.new(v10)
	t18.all = KllSketch.new(v10)

	if v11 then
		t19.all = {}
		t20.all = {}
		t21.all = {}
	end

	local v63 = setmetatable({
		started = false,
		periodStartMs = 0,
		reactFrameTimeMs = 0,
		frameMetrics = {
			totalFrameCount = 0,
			reactFrameCount = 0,
			totalReactTimeMs = 0,
			totalCorescriptTimeMs = 0,
			maxReactFrameTimeMs = 0,
			allFrameHistogram = {
				0,
				0,
				0,
				0
			},
			reactFrameHistogram = {
				0,
				0,
				0,
				0
			},
			reactDropChangeHistogram = {
				0,
				0,
				0,
				0
			}
		},
		rootsMetrics = {},
		sessionMetrics = {
			updateTime = {
				sketches = t16,
				allData = if not v11 then {} else t19,
				numRoots = 1
			},
			commitTime = {
				sketches = t17,
				allData = if not v11 then {} else t20,
				numRoots = 1
			},
			timeToUpdate = {
				sketches = t18,
				allData = if not v11 then {} else t21,
				numRoots = 1
			},
			timePerFrame = {
				sketch = KllSketch.new(v10),
				allData = {}
			},
			timePerReactFrame = {
				sketch = KllSketch.new(v10),
				allData = {}
			}
		},
		context = s1
	}, t15)

	v63.schedulerStateMachine = t2.new(function(p10) -- line: 519
		-- upvalues: v63 (copy)
		v63:addToFrame(p10)
	end, function(p11, p12) -- line: 521
		-- upvalues: v63 (copy), u19 (ref)
		v63:trackSessionSketches(p11, p12)

		if u19 then
			v63:reportRoot(p11, p12)
		end
	end)

	return v63
end
function t15.start(p13) -- line: 531
	-- upvalues: schedulingProfiler (copy), RunService (copy), v4 (copy), u18 (ref)
	p13.started = true
	p13:resetState()
	schedulingProfiler.registerProfilerEventCallback(function(n6: number, p14) -- line: 535
		-- upvalues: p13 (copy)
		p13.schedulerStateMachine:transition(n6, p14)
	end)
	RunService.Heartbeat:Connect(function(dt) -- line: 539
		-- upvalues: p13 (copy), v4 (copy), u18 (ref)
		p13:processFrame(dt * 1000)
		p13.reactFrameTimeMs = 0

		if os.clock() * 1000 - p13.periodStartMs > v4 then
			if u18 then
				p13:reportPeriod()
			end

			p13:resetState()
		end
	end)
end
function t15.resetState(p15) -- line: 554
	p15.periodStartMs = os.clock() * 1000
	p15.frameMetrics = {
		totalFrameCount = 0,
		reactFrameCount = 0,
		totalReactTimeMs = 0,
		totalCorescriptTimeMs = 0,
		maxReactFrameTimeMs = 0,
		allFrameHistogram = {
			0,
			0,
			0,
			0
		},
		reactFrameHistogram = {
			0,
			0,
			0,
			0
		},
		reactDropChangeHistogram = {
			0,
			0,
			0,
			0
		}
	}
	p15.rootsMetrics = {}
end
function t15.getRootName(_, p17) -- line: 571
	if p17 then
		if p17.containerInfo.Name ~= "Folder" then
			return p17.containerInfo.Name
		end

		if p17.current and p17.current.child and p17.current.child.memoizedProps then
			for v68, _ in p17.current.child.memoizedProps do
				if typeof(v68) == "string" then
					return v68
				end
			end
		end
	end

	return "Unknown"
end
function t15.addToFrame(p18, p19) -- line: 588
	p18.reactFrameTimeMs = p18.reactFrameTimeMs + p19
end
function t15.trackSessionSketches(p20, p21, p22) -- line: 592
	-- upvalues: v11 (copy), KllSketch (copy), v10 (copy)
	if not p20.sessionMetrics then
		return
	end

	local v75 = p20:getRootName(p22)

	if p21.tag == "RootUpdateTime" then
		local v76 = os.clock() * 1000 - p21.StartTimeMs

		if v11 then
			table.insert(p20.sessionMetrics.updateTime.allData.all, p21.RenderMs + p21.CommitMs)
			table.insert(p20.sessionMetrics.commitTime.allData.all, p21.CommitMs)
			table.insert(p20.sessionMetrics.timeToUpdate.allData.all, v76)
		end

		p20.sessionMetrics.updateTime.sketches.all:insert(p21.RenderMs + p21.CommitMs)
		p20.sessionMetrics.commitTime.sketches.all:insert(p21.CommitMs)
		p20.sessionMetrics.timeToUpdate.sketches.all:insert(v76)

		if not p20.sessionMetrics.updateTime.sketches[v75] then
			p20.sessionMetrics.updateTime.sketches[v75] = KllSketch.new(v10)

			if v11 then
				p20.sessionMetrics.updateTime.allData[v75] = {}
			end

			local updateTime = p20.sessionMetrics.updateTime

			updateTime.numRoots = updateTime.numRoots + 1
		end

		p20.sessionMetrics.updateTime.sketches[v75]:insert(p21.RenderMs + p21.CommitMs)

		if v11 then
			table.insert(p20.sessionMetrics.updateTime.allData[v75], p21.RenderMs + p21.CommitMs)
		end

		if not p20.sessionMetrics.commitTime.sketches[v75] then
			p20.sessionMetrics.commitTime.sketches[v75] = KllSketch.new(v10)

			if v11 then
				p20.sessionMetrics.commitTime.allData[v75] = {}
			end

			local commitTime = p20.sessionMetrics.commitTime

			commitTime.numRoots = commitTime.numRoots + 1
		end

		p20.sessionMetrics.commitTime.sketches[v75]:insert(p21.CommitMs)

		if v11 then
			table.insert(p20.sessionMetrics.commitTime.allData[v75], p21.CommitMs)
		end

		if not p20.sessionMetrics.timeToUpdate.sketches[v75] then
			p20.sessionMetrics.timeToUpdate.sketches[v75] = KllSketch.new(v10)

			if v11 then
				p20.sessionMetrics.timeToUpdate.allData[v75] = {}
			end

			local timeToUpdate = p20.sessionMetrics.timeToUpdate

			timeToUpdate.numRoots = timeToUpdate.numRoots + 1
		end

		p20.sessionMetrics.timeToUpdate.sketches[v75]:insert(v76)

		if v11 then
			table.insert(p20.sessionMetrics.timeToUpdate.allData[v75], v76)
		end
	end
end
function t15.reportRoot(p23, p24, p25) -- line: 652
	-- upvalues: v12 (copy), v13 (copy), TelemetryService (copy), t14 (copy), v32 (copy)
	local v83 = p23:getRootName(p25)

	if not p23.rootsMetrics[v83] then
		p23.rootsMetrics[v83] = {
			update_count = 0,
			layout_effects_count = if not v12 then nil else 0,
			render_total_time_ms = 0,
			commit_total_time_ms = 0,
			layout_effects_total_time_ms = if not v12 then nil else 0,
			data_model_update_total_time_ms = if not v12 or not v13 then nil else 0,
			max_render_time_ms = 0,
			max_commit_time_ms = 0,
			max_update_time_ms = 0,
			max_layout_effects_time_ms = if not v12 then nil else 0,
			max_data_model_update_time_ms = if not v12 or not v13 then nil else 0,
			passive_effects_count = 0,
			passive_effects_total_time_ms = 0,
			max_passive_effects_time_ms = 0,
			total_time_to_update_ms = 0,
			max_time_to_update_ms = 0
		}
	end

	local v84 = p23.rootsMetrics[v83]

	if p24.tag == "RootPassiveEffectsTime" then
		TelemetryService:LogStat(t14, {
			customFields = {
				rootName = v83,
				deviceTier = v32,
				updateType = "PassiveEffects",
				context = p23.context
			}
		}, p24.PassiveEffectsMs)
		v84.passive_effects_count = v84.passive_effects_count + 1
		v84.passive_effects_total_time_ms = v84.passive_effects_total_time_ms + p24.PassiveEffectsMs

		if p24.PassiveEffectsMs > v84.max_passive_effects_time_ms then
			v84.max_passive_effects_time_ms = p24.PassiveEffectsMs

			return
		end
	elseif p24.tag == "RootUpdateTime" then
		local v85 = os.clock() * 1000 - p24.StartTimeMs

		TelemetryService:LogStat(t14, {
			customFields = {
				rootName = v83,
				deviceTier = v32,
				updateType = "TimeToComplete",
				context = p23.context
			}
		}, v85)
		v84.total_time_to_update_ms = v84.total_time_to_update_ms + v85

		if v85 > v84.max_time_to_update_ms then
			v84.max_time_to_update_ms = v85
		end

		TelemetryService:LogStat(t14, {
			customFields = {
				rootName = v83,
				deviceTier = v32,
				updateType = "RenderAndCommit",
				context = p23.context
			}
		}, p24.RenderMs + p24.CommitMs)
		TelemetryService:LogStat(t14, {
			customFields = {
				rootName = v83,
				deviceTier = v32,
				updateType = "Commit",
				context = p23.context
			}
		}, p24.CommitMs)

		if v12 then
			if p24.LayoutEffectsMs > 0 then
				TelemetryService:LogStat(t14, {
					customFields = {
						rootName = v83,
						deviceTier = v32,
						updateType = "LayoutEffects",
						context = p23.context
					}
				}, p24.LayoutEffectsMs)
			end

			if v13 then
				TelemetryService:LogStat(t14, {
					customFields = {
						rootName = v83,
						deviceTier = v32,
						updateType = "DataModelUpdate",
						context = p23.context
					}
				}, p24.CommitMs - p24.LayoutEffectsMs)
			end
		end

		v84.update_count = v84.update_count + 1

		if p24.RenderMs + p24.CommitMs > v84.max_update_time_ms then
			v84.max_update_time_ms = p24.RenderMs + p24.CommitMs
		end

		v84.render_total_time_ms = v84.render_total_time_ms + p24.RenderMs
		v84.commit_total_time_ms = v84.commit_total_time_ms + p24.CommitMs

		if p24.RenderMs > v84.max_render_time_ms then
			v84.max_render_time_ms = p24.RenderMs
		end

		if p24.CommitMs > v84.max_commit_time_ms then
			v84.max_commit_time_ms = p24.CommitMs
		end

		if v12 then
			if p24.LayoutEffectsMs > 0 then
				v84.layout_effects_count = v84.layout_effects_count + 1
				v84.layout_effects_total_time_ms = v84.layout_effects_total_time_ms + p24.LayoutEffectsMs

				if p24.LayoutEffectsMs > v84.max_layout_effects_time_ms then
					v84.max_layout_effects_time_ms = p24.LayoutEffectsMs
				end
			end

			if v13 then
				v84.data_model_update_total_time_ms = v84.data_model_update_total_time_ms + (p24.CommitMs - p24.LayoutEffectsMs)

				if p24.CommitMs - p24.LayoutEffectsMs > v84.max_data_model_update_time_ms then
					v84.max_data_model_update_time_ms = p24.CommitMs - p24.LayoutEffectsMs
				end
			end
		end
	end
end
function t15.getFrameBucket(_: {[any]: any}, n7: number) -- line: 791
	return (math.min(4, math.floor(math.max(0, n7 - 2) / 16.666666666666668) + 1))
end
function t15.processFrame(t23: {[any]: any}, n8: number) -- line: 798
	-- upvalues: EngineFeature3 (copy), v15 (copy), RunService (copy), v11 (copy)
	local frameMetrics = t23.frameMetrics
	local reactFrameTimeMs = t23.reactFrameTimeMs

	if EngineFeature3 and v15 then
		local TotalScriptPlusExecutionTime = RunService:GetTotalScriptPlusExecutionTime()

		if TotalScriptPlusExecutionTime > 0 then
			frameMetrics.totalCorescriptTimeMs = frameMetrics.totalCorescriptTimeMs + TotalScriptPlusExecutionTime
		end
	end

	frameMetrics.totalFrameCount = frameMetrics.totalFrameCount + 1

	local v93 = t23:getFrameBucket(n8)
	local allFrameHistogram = frameMetrics.allFrameHistogram

	allFrameHistogram[v93] = allFrameHistogram[v93] + 1
	t23.sessionMetrics.timePerFrame.sketch:insert(reactFrameTimeMs)

	if v11 then
		table.insert(t23.sessionMetrics.timePerFrame.allData, reactFrameTimeMs)
	end

	if reactFrameTimeMs > 0 then
		frameMetrics.totalReactTimeMs = frameMetrics.totalReactTimeMs + reactFrameTimeMs

		local reactFrameHistogram = frameMetrics.reactFrameHistogram

		reactFrameHistogram[v93] = reactFrameHistogram[v93] + 1
		t23.sessionMetrics.timePerReactFrame.sketch:insert(reactFrameTimeMs)

		if v11 then
			table.insert(t23.sessionMetrics.timePerReactFrame.allData, reactFrameTimeMs)
		end

		frameMetrics.reactFrameCount = frameMetrics.reactFrameCount + 1

		if reactFrameTimeMs > frameMetrics.maxReactFrameTimeMs then
			frameMetrics.maxReactFrameTimeMs = reactFrameTimeMs
		end

		local v96 = v93 - t23:getFrameBucket(n8 - reactFrameTimeMs)
		local reactDropChangeHistogram = frameMetrics.reactDropChangeHistogram
		local v98 = v96 + 1

		reactDropChangeHistogram[v98] = reactDropChangeHistogram[v98] + 1
	end
end
function t15.reportPeriod(p26) -- line: 837
	-- upvalues: TelemetryService (copy), t7 (copy), t4 (ref), t8 (copy), v32 (copy), EngineFeature3 (copy), v15 (copy), t9 (copy), v12 (copy), v13 (copy), t10 (copy), v6 (copy), t11 (ref), t12 (copy), v7 (copy), t13 (ref)
	local frameMetrics = p26.frameMetrics
	local v101 = os.clock() * 1000 - p26.periodStartMs
	local t24 = {
		period_length_ms = v101,
		react_total_time_ms = frameMetrics.totalReactTimeMs,
		react_total_time_pct = frameMetrics.totalReactTimeMs / v101,
		react_frame_count = frameMetrics.reactFrameCount,
		total_frame_count = frameMetrics.totalFrameCount,
		corescript_total_time_ms = frameMetrics.totalCorescriptTimeMs,
		corescript_total_time_pct = frameMetrics.totalCorescriptTimeMs / v101,
		average_react_all_frame_ms = frameMetrics.totalReactTimeMs / frameMetrics.totalFrameCount,
		average_react_only_frame_ms = not (frameMetrics.reactFrameCount > 0) and 0 or frameMetrics.totalReactTimeMs / frameMetrics.reactFrameCount,
		max_react_frame_ms = frameMetrics.maxReactFrameTimeMs,
		all_frame_drop0 = frameMetrics.allFrameHistogram[1],
		all_frame_drop1 = frameMetrics.allFrameHistogram[2],
		all_frame_drop2 = frameMetrics.allFrameHistogram[3],
		all_frame_drop3 = frameMetrics.allFrameHistogram[4],
		react_frame_drop0 = frameMetrics.reactFrameHistogram[1],
		react_frame_drop1 = frameMetrics.reactFrameHistogram[2],
		react_frame_drop2 = frameMetrics.reactFrameHistogram[3],
		react_frame_drop3 = frameMetrics.reactFrameHistogram[4],
		react_drop_change0 = frameMetrics.reactDropChangeHistogram[1],
		react_drop_change1 = frameMetrics.reactDropChangeHistogram[2],
		react_drop_change2 = frameMetrics.reactDropChangeHistogram[3],
		react_drop_change3 = frameMetrics.reactDropChangeHistogram[4]
	}

	TelemetryService:LogEvent(t7, {
		standardizedFields = t4,
		customFields = t24
	})
	TelemetryService:LogStat(t8, {
		customFields = {
			stat = "ReactTotalTimePct",
			context = p26.context,
			deviceTier = v32
		}
	}, t24.react_total_time_pct)

	if EngineFeature3 and v15 then
		TelemetryService:LogStat(t8, {
			customFields = {
				stat = "TotalCorescriptTimePct",
				context = p26.context,
				deviceTier = v32
			}
		}, t24.corescript_total_time_pct)
	end

	TelemetryService:LogStat(t8, {
		customFields = {
			stat = "AverageReactAllFrameMs",
			context = p26.context,
			deviceTier = v32
		}
	}, t24.average_react_all_frame_ms)
	TelemetryService:LogStat(t8, {
		customFields = {
			stat = "AverageReactOnlyFrameMs",
			context = p26.context,
			deviceTier = v32
		}
	}, t24.average_react_only_frame_ms)
	TelemetryService:LogStat(t8, {
		customFields = {
			stat = "MaxReactFrameMs",
			context = p26.context,
			deviceTier = v32
		}
	}, t24.max_react_frame_ms)

	for i = 1, 4 do
		local v104 = i - 1

		TelemetryService:LogCounter(t9, {
			customFields = {
				category = "AllFrame",
				bucket = v104,
				context = p26.context,
				deviceTier = v32
			}
		}, frameMetrics.allFrameHistogram[i])
		TelemetryService:LogCounter(t9, {
			customFields = {
				category = "ReactFrame",
				bucket = v104,
				context = p26.context,
				deviceTier = v32
			}
		}, frameMetrics.reactFrameHistogram[i])
		TelemetryService:LogCounter(t9, {
			customFields = {
				category = "ReactDropChange",
				bucket = v104,
				context = p26.context,
				deviceTier = v32
			}
		}, frameMetrics.reactDropChangeHistogram[i])
	end

	for v105, v106 in p26.rootsMetrics do
		v106.root_name = v105
		v106.update_total_time_ms = v106.render_total_time_ms + v106.commit_total_time_ms
		v106.total_time_ms = v106.update_total_time_ms + v106.passive_effects_total_time_ms
		v106.avg_render_time_ms = v106.render_total_time_ms / v106.update_count
		v106.context = p26.context
		v106.total_time_pct = (v106.update_total_time_ms + v106.passive_effects_total_time_ms) / t24.react_total_time_ms
		v106.avg_update_time_ms = v106.update_total_time_ms / v106.update_count
		v106.avg_commit_time_ms = v106.commit_total_time_ms / v106.update_count

		if v12 then
			v106.avg_layout_effects_time_ms = v106.layout_effects_total_time_ms / v106.layout_effects_count

			if v13 then
				v106.avg_data_model_update_time_ms = v106.data_model_update_total_time_ms / v106.update_count
			end
		end

		v106.avg_passive_effects_time_ms = v106.passive_effects_total_time_ms / v106.passive_effects_count
		v106.avg_time_to_update_ms = v106.total_time_to_update_ms / v106.update_count
		TelemetryService:LogEvent(t10, {
			standardizedFields = t4,
			customFields = v106
		})

		if not v6 then
			TelemetryService:LogStat(t11, {
				customFields = {
					rootName = v106.root_name,
					deviceTier = v32,
					stat = "TotalTimePct",
					context = p26.context
				}
			}, v106.total_time_pct)
		end

		TelemetryService:LogCounter(t12, {
			customFields = {
				rootName = v106.root_name,
				deviceTier = v32,
				task = "RenderAndCommit",
				context = p26.context
			}
		}, v106.update_count)

		if v12 then
			TelemetryService:LogCounter(t12, {
				customFields = {
					rootName = v106.root_name,
					deviceTier = v32,
					task = "LayoutEffects",
					context = p26.context
				}
			}, v106.layout_effects_count)
		end

		TelemetryService:LogCounter(t12, {
			customFields = {
				rootName = v106.root_name,
				deviceTier = v32,
				task = "PassiveEffects",
				context = p26.context
			}
		}, v106.passive_effects_count)

		if not v7 then
			TelemetryService:LogStat(t13, {
				customFields = {
					rootName = v106.root_name,
					deviceTier = v32,
					task = "RenderAndCommit",
					stat = "AvgMs",
					context = p26.context
				}
			}, v106.avg_update_time_ms)
			TelemetryService:LogStat(t13, {
				customFields = {
					rootName = v106.root_name,
					deviceTier = v32,
					task = "Commit",
					stat = "AvgMs",
					context = p26.context
				}
			}, v106.avg_commit_time_ms)

			if v12 then
				TelemetryService:LogStat(t13, {
					customFields = {
						rootName = v106.root_name,
						deviceTier = v32,
						task = "LayoutEffects",
						stat = "AvgMs",
						context = p26.context
					}
				}, v106.avg_layout_effects_time_ms)

				if v13 then
					TelemetryService:LogStat(t13, {
						customFields = {
							rootName = v106.root_name,
							deviceTier = v32,
							task = "DataModelUpdate",
							stat = "AvgMs",
							context = p26.context
						}
					}, v106.avg_data_model_update_time_ms)
				end
			end

			TelemetryService:LogStat(t13, {
				customFields = {
					rootName = v106.root_name,
					deviceTier = v32,
					task = "TimeToUpdateMs",
					stat = "AvgMs",
					context = p26.context
				}
			}, v106.avg_time_to_update_ms)
			TelemetryService:LogStat(t13, {
				customFields = {
					rootName = v106.root_name,
					deviceTier = v32,
					task = "PassiveEffects",
					stat = "AvgMs",
					context = p26.context
				}
			}, v106.avg_passive_effects_time_ms)
			TelemetryService:LogStat(t13, {
				customFields = {
					rootName = v106.root_name,
					deviceTier = v32,
					task = "RenderAndCommit",
					stat = "MaxMs",
					context = p26.context
				}
			}, v106.max_update_time_ms)
			TelemetryService:LogStat(t13, {
				customFields = {
					rootName = v106.root_name,
					deviceTier = v32,
					task = "Commit",
					stat = "MaxMs",
					context = p26.context
				}
			}, v106.max_commit_time_ms)

			if v12 then
				TelemetryService:LogStat(t13, {
					customFields = {
						rootName = v106.root_name,
						deviceTier = v32,
						task = "LayoutEffects",
						stat = "MaxMs",
						context = p26.context
					}
				}, v106.max_layout_effects_time_ms)

				if v13 then
					TelemetryService:LogStat(t13, {
						customFields = {
							rootName = v106.root_name,
							deviceTier = v32,
							task = "DataModelUpdate",
							stat = "MaxMs",
							context = p26.context
						}
					}, v106.max_data_model_update_time_ms)
				end
			end

			TelemetryService:LogStat(t13, {
				customFields = {
					rootName = v106.root_name,
					deviceTier = v32,
					task = "TimeToUpdateMs",
					stat = "MaxMs",
					context = p26.context
				}
			}, v106.max_time_to_update_ms)
			TelemetryService:LogStat(t13, {
				customFields = {
					rootName = v106.root_name,
					deviceTier = v32,
					task = "PassiveEffects",
					stat = "MaxMs",
					context = p26.context
				}
			}, v106.max_passive_effects_time_ms)
		end
	end
end
function generatePercentilesFromSingleSketch(p27) -- line: 1141
	-- upvalues: parts (copy)
	local s2 = "{"

	for v109, v110 in parts do
		s2 = (s2 .. "\"p" .. v110 .. "\":") .. p27:getPercentile(tonumber(v110) or 0)

		if v109 < #parts then
			s2 ..= ","
		end
	end

	return s2 .. "}"
end
function generatePercentilesFromSketches(t25: {[any]: any}, n9: number) -- line: 1155
	-- upvalues: parts (copy)
	local s3 = "{"

	for v114, v115 in parts do
		local v116 = s3 .. "\"p" .. v115 .. "\":{"
		local v117 = tonumber(v115) or 0
		local n10 = 0

		for v119, v120 in t25 do
			n10 += 1
			v116 ..= "\"" .. v119 .. "\":" .. v120:getPercentile(v117)

			if n10 < n9 then
				v116 ..= ","
			end
		end

		s3 = v116 .. (not (v114 < #parts) and "}" or "},")
	end

	return s3 .. "}"
end
function t15.reportPercentError(p28, p29, p30, p31, p32) -- line: 1175
	-- upvalues: parts (copy), TelemetryService (copy), t6 (ref), t4 (ref)
	table.sort(p29)

	local v126 = #p29

	if v126 < 1 then
		return
	end

	for _, v128 in parts do
		local v129 = p29[math.ceil((tonumber(v128) or 0) / 100 * v126)]
		local v130 = if not p30.sketches then p30.sketch:getPercentile(v128) else p30.sketches[p32]:getPercentile(v128)
		local n11 = 0

		if v129 ~= 0 or v130 == 0 then
			if v129 ~= 0 then
				n11 = (v130 - v129) * 100 / v129
			end

			local t26 = {
				rootName = p32,
				percentile = v128,
				metric = p31,
				numDatapoints = v126,
				context = p28.context,
				approxError = n11
			}

			TelemetryService:LogEvent(t6, {
				standardizedFields = t4,
				customFields = t26
			})
		end
	end
end
function t15.reportSession(p33) -- line: 1215
	-- upvalues: v11 (copy), TelemetryService (copy), t5 (copy), t4 (ref)
	if not p33.started then
		return
	end

	local v134 = generatePercentilesFromSketches(p33.sessionMetrics.updateTime.sketches, p33.sessionMetrics.updateTime.numRoots)
	local v135 = generatePercentilesFromSketches(p33.sessionMetrics.commitTime.sketches, p33.sessionMetrics.commitTime.numRoots)
	local v136 = generatePercentilesFromSketches(p33.sessionMetrics.timeToUpdate.sketches, p33.sessionMetrics.timeToUpdate.numRoots)
	local v137 = generatePercentilesFromSingleSketch(p33.sessionMetrics.timePerFrame.sketch)
	local v138 = generatePercentilesFromSingleSketch(p33.sessionMetrics.timePerReactFrame.sketch)
	local t27 = {
		reactUpdateTime = v134,
		reactCommitTime = v135,
		reactTimeToUpdate = v136,
		timePerFrame = v137,
		timePerReactFrame = v138
	}

	if v11 then
		for v140, v141 in p33.sessionMetrics do
			if v141.sketches then
				for v142, v143 in v141.allData do
					p33:reportPercentError(v143, v141, v140, v142)
				end
			else
				p33:reportPercentError(v141.allData, v141, v140, "all")
			end
		end
	end

	TelemetryService:LogEvent(t5, {
		standardizedFields = t4,
		customFields = t27
	})
end

return (t15.new(FStringReactSchedulingContext))
