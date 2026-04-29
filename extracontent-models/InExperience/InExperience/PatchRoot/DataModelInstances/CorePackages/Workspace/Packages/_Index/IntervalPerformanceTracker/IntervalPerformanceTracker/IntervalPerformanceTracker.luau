local IntervalPerformanceTracker = script:FindFirstAncestor("IntervalPerformanceTracker")
local IntervalPerformanceTrackerParent = IntervalPerformanceTracker.Parent
local default = require(IntervalPerformanceTrackerParent.LoggingProtocol).default
local RunService = require(IntervalPerformanceTrackerParent.MockableProxyServices).RunService
local v5 = require(IntervalPerformanceTracker.Logger):new(script.Name)
local IntervalPerformanceTrackerTelemetryConfig = require(script.Parent.IntervalPerformanceTrackerTelemetryConfig)

game:DefineFastFlag("DebugPrintIntervalPerformanceTrackerResults", false)

local GetFFlagAXFPSEventStreamAndCounters = require(IntervalPerformanceTrackerParent.SharedFlags).GetFFlagAXFPSEventStreamAndCounters
local FFlagLuaAppPerfTrackerUseLogger = require(IntervalPerformanceTrackerParent.SharedFlags).FFlagLuaAppPerfTrackerUseLogger
local sendFPSStat = require(script.Parent.sendFPSStat)
local v10 = game:DefineFastFlag("AXFixAverageFPSCasing", false)
local GetFIntIntervalPerformanceTrackerEventStream = require(IntervalPerformanceTrackerParent.SharedFlags).GetFIntIntervalPerformanceTrackerEventStream
local v12 = math.random(0, 1000) < GetFIntIntervalPerformanceTrackerEventStream()
local t6 = {
	averageFPS = {
		reducer = function(t1: {[any]: any}) --[[ reducer ]] -- line: 56
			return {
				framesCount = if t1.framesCount ~= nil then t1.framesCount + 1 else 0,
				startTime = t1.startTime or tick()
			}
		end,
		getResult = function(t2: {[any]: any}) --[[ getResult ]] -- line: 62
			local timestamp = tick()

			if t2.framesCount == nil or (t2.framesCount == 0 or t2.startTime == nil or timestamp == t2.startTime) then
				return nil
			end

			return t2.framesCount / (timestamp - t2.startTime)
		end
	},
	framesCount = {
		reducer = function(t3: {[any]: any}) --[[ reducer ]] -- line: 77
			return {
				framesCount = if t3.framesCount ~= nil then t3.framesCount + 1 else 0
			}
		end,
		getResult = function(p1) --[[ getResult ]] -- line: 82
			return p1.framesCount
		end
	},
	longestFrameTime = {
		reducer = function(t4: {[any]: any}) --[[ reducer ]] -- line: 87
			return {
				framesCount = if t4.framesCount ~= nil then t4.framesCount + 1 else 0,
				longestFrameTime = if t4.longestFrameTime ~= nil and t4.previousTime ~= nil then math.max(t4.longestFrameTime, tick() - t4.previousTime) else 0,
				previousTime = tick()
			}
		end,
		getResult = function(p2) --[[ getResult ]] -- line: 96
			if p2.framesCount < 1 then
				return nil
			end

			return p2.longestFrameTime
		end
	},
	duration = {
		reducer = function(t5: {[any]: any}) --[[ reducer ]] -- line: 104
			return {
				startTime = t5.startTime or tick()
			}
		end,
		getResult = function(p3) --[[ getResult ]] -- line: 109
			return tick() - p3.startTime
		end
	}
}
local t7 = {}
local t8 = {}

for v16, _ in t6 do
	t7[v16] = v16
	table.insert(t8, v16)
end

local t9 = {}

t9.__index = t9

function t9.new(n1: number?, t10: {[any]: any}?, b1: boolean?, b2: boolean?) -- line: 137
	-- upvalues: GetFFlagAXFPSEventStreamAndCounters (copy), t9 (copy)
	local t11 = {
		_metricsData = {},
		_timeout = n1,
		_startTime = nil,
		_metricsToTrack = t10,
		_countersEnabled = if not GetFFlagAXFPSEventStreamAndCounters() then nil else b1,
		_eventStreamEnabled = if not GetFFlagAXFPSEventStreamAndCounters() then nil else b2
	}

	setmetatable(t11, t9)

	return t11
end
function t9.getMetricsToTrack(p4) -- line: 155
	-- upvalues: t8 (copy)
	if p4._metricsToTrack and #p4._metricsToTrack > 0 then
		return p4._metricsToTrack
	end

	return t8
end
function t9.hasReachedTimeout(p5) -- line: 163
	if p5._timeout ~= nil and p5._startTime ~= nil then
		return tick() - p5._startTime > p5._timeout
	end

	return false
end
function t9.updateMetrics(p6) -- line: 170
	-- upvalues: t6 (copy)
	if p6._startTime == nil then
		p6._startTime = tick()
	end

	for _, v38 in (p6:getMetricsToTrack()) do
		local v39 = t6[v38]

		if v39 then
			if not p6._metricsData[v38] then
				p6._metricsData[v38] = {}
			end

			p6._metricsData[v38] = v39.reducer(p6._metricsData[v38])
		end
	end
end
function t9.getResult(p7) -- line: 190
	-- upvalues: t6 (copy)
	local t12 = {}

	for _, v43 in (p7:getMetricsToTrack()) do
		local v44 = t6[v43]

		if v44 then
			t12[v43] = v44.getResult(p7._metricsData[v43])
		end
	end

	return t12
end

local t13 = {}

t13.__index = t13

function t13.new() -- line: 218
	-- upvalues: t6 (copy), t7 (copy), t13 (copy)
	local t14 = {
		_metricsTrackers = t6,
		_intervals = {},
		_renderSteppedConnection = nil,
		availableMetricsEnum = t7
	}

	setmetatable(t14, t13)

	return t14
end
function t13._updateIntervals(p8) -- line: 231
	for v47, v48 in p8._intervals do
		v48:updateMetrics()

		if v48:hasReachedTimeout() then
			p8:stopAndLogTracking(v47)
		end
	end
end
function t13.startTracking(p9, s1: string, n2: number?, t15: {[any]: any}?, b3: boolean?, b4: boolean?) -- line: 241
	-- upvalues: v12 (copy), t9 (copy), GetFFlagAXFPSEventStreamAndCounters (copy), RunService (copy)
	if not v12 then
		return
	end

	if not p9._intervals[s1] then
		local v55 = t9.new(n2, t15, if not GetFFlagAXFPSEventStreamAndCounters() then nil else b3, if not GetFFlagAXFPSEventStreamAndCounters() then nil else b4)

		p9._intervals[s1] = v55
		v55:updateMetrics()
	end

	if not p9._renderSteppedConnection then
		p9._renderSteppedConnection = RunService.RenderStepped:Connect(function() -- line: 267
			-- upvalues: p9 (copy)
			p9:_updateIntervals()
		end)
	end
end
function t13._fireStatsTracking(p10, t16: {[any]: any}) -- line: 281
	-- upvalues: FFlagLuaAppPerfTrackerUseLogger (copy), v5 (copy), v10 (copy), sendFPSStat (copy)
	local averageFPS = t16.averageFPS
	local framesCount = t16.framesCount
	local longestFrameTime = t16.longestFrameTime
	local intervalName = t16.intervalName
	local v62 = p10._intervals[intervalName]

	if not v62 then
		if FFlagLuaAppPerfTrackerUseLogger then
			v5:warning(`Missing interval { intervalName }`)

			return
		end

		warn("Missing interval for interval perfomance trackerstat", intervalName)

		return
	end

	local _countersEnabled = v62._countersEnabled
	local _eventStreamEnabled = v62._eventStreamEnabled

	if not _countersEnabled and not _eventStreamEnabled or not intervalName then
		return
	end

	if averageFPS then
		local v65 = "IntervalPerformanceTracker_" .. "AverageFPS" .. "_" .. intervalName
		local v66 = table.clone(t16)

		v66.duration = averageFPS
		v66.averageFps = if not v10 then nil else averageFPS
		sendFPSStat({
			statName = v65,
			eventStreamName = intervalName,
			metaData = v66,
			interval = averageFPS,
			excludeCounters = not _countersEnabled,
			excludeEventStream = not _eventStreamEnabled
		})
	end

	if framesCount and _countersEnabled then
		local v67 = "IntervalPerformanceTracker_" .. "FramesCount" .. "_" .. intervalName
		local v68 = table.clone(t16)

		v68.duration = framesCount
		sendFPSStat({
			statName = v67,
			metaData = v68,
			interval = framesCount
		})
	end

	if longestFrameTime and v62._countersEnabled then
		local v69 = "IntervalPerformanceTracker_" .. "LongestFrameTime" .. "_" .. intervalName
		local v70 = table.clone(t16)

		v70.duration = longestFrameTime
		sendFPSStat({
			statName = v69,
			metaData = v70,
			interval = longestFrameTime
		})
	end
end
function t13.stopAndLogTracking(p11, s2: string) -- line: 357
	-- upvalues: v12 (copy), default (copy), IntervalPerformanceTrackerTelemetryConfig (copy), GetFFlagAXFPSEventStreamAndCounters (copy)
	if not v12 then
		return
	end

	local v73 = p11._intervals[s2]

	if v73 then
		local v74 = v73:getResult()
		local t17 = {
			intervalName = s2
		}
		local n3 = 0

		for v77, v78 in v74 do
			if v78 ~= nil then
				n3 += 1
			end

			t17[v77] = v78
		end

		if n3 > 0 then
			default:logRobloxTelemetryEvent(IntervalPerformanceTrackerTelemetryConfig, nil, t17)

			if game:GetFastFlag("DebugPrintIntervalPerformanceTrackerResults") then
				print("IntervalPerformanceTracker:" .. tostring(s2) .. " logged with results:")

				for v79, v80 in t17 do
					print("\t" .. tostring(v79) .. " = " .. tostring(v80))
				end
			end
		end

		if GetFFlagAXFPSEventStreamAndCounters() then
			p11:_fireStatsTracking(t17)
		end

		p11._intervals[s2] = nil
	end

	p11:disconnectUnusedRenderStepped()
end
function t13.cancelTracking(p12, s3: string) -- line: 404
	-- upvalues: v12 (copy)
	if not v12 then
		return
	end

	p12._intervals[s3] = nil
	p12:disconnectUnusedRenderStepped()
end
function t13.disconnectUnusedRenderStepped(p13) -- line: 414
	if not next(p13._intervals) and p13._renderSteppedConnection then
		p13._renderSteppedConnection:Disconnect()
		p13._renderSteppedConnection = nil
	end
end

t13.class = t13

return t13.new()
