local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local v2 = game:DefineFastInt("ReactSchedulingTracker", 0);
local v3 = game:DefineFastInt("ReactSchedulingTrackerPeriodMs", 30000);
local l_game_EngineFeature_0 = game:GetEngineFeature("TelemetryServiceMemoryCPUInfoEnabled");
local v5 = game:DefineFastFlag("DisableReactSchedulingTimePctStats", false);
local v6 = game:DefineFastFlag("DisableReactSchedulingAvgMaxMsStats", false);
local l_FStringReactSchedulingContext_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FStringReactSchedulingContext;
local v8 = game:DefineFastString("ReactSchedulingPercentiles", "10,50,95,99");
local v9 = game:DefineFastInt("ReactSchedulingKllSketchMaxSize", 200);
local v10 = game:DefineFastFlag("DebugReactSchedulingEnableErrorEvents", false);
local v11 = game:DefineFastFlag("ReactSchedulingTrackerLayoutEffects", false);
local v12 = game:DefineFastFlag("ReactSchedulingTrackerDataModelUpdate", false);
local l_game_EngineFeature_1 = game:GetEngineFeature("TelemetryServicePlaySessionInfoEnabled");
local v14 = game:DefineFastFlag("EnableCorescriptExecutionTime", false);
local l_game_EngineFeature_2 = game:GetEngineFeature("ScriptPlusExecutionTimeEnabled");
applicationId = function() --[[ Line: 22 ]] --[[ Name: applicationId ]]
    local l_AppStorageService_0 = game:GetService("AppStorageService");
    if not l_AppStorageService_0 then
        return nil;
    else
        local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem("AppInstallationId");
        local v18 = typeof(l_l_AppStorageService_0_Item_0);
        if v18 == "number" then
            return tonumber(l_l_AppStorageService_0_Item_0) or nil;
        elseif v18 == "string" then
            if string.len(l_l_AppStorageService_0_Item_0) <= 0 then
                return nil;
            else
                return (tonumber((string.sub(l_l_AppStorageService_0_Item_0, -string.len((tostring(10000)))))));
            end;
        else
            return nil;
        end;
    end;
end;
local v19 = v2 > 0;
local v20 = true;
local v21 = true;
if not v19 then
    v21 = false;
    v20 = false;
end;
local v22 = math.random(0, 10000);
local v23 = applicationId();
if v23 ~= nil then
    v22 = (v23 + 1409) % 10000;
end;
if not (v22 < v2) then
    v21 = false;
    v20 = false;
end;
local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_mutedError_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).mutedError;
local v26 = require(l_CorePackages_0.Packages.ReactRoblox);
local _ = require(l_CorePackages_0.Packages.ReactReconciler);
local l_KllSketch_0 = require(l_CorePackages_0.Workspace.Packages.InExperiencePerformance).KllSketch;
local v29 = string.split(v8);
local l_CorePackages_1 = game:GetService("CorePackages");
local l_DeviceTier_0 = require(l_CorePackages_1.Workspace.Packages.Devices).DeviceTier;
local l_schedulingProfiler_0 = v26.schedulingProfiler;
local l_profilerEventTypes_0 = l_schedulingProfiler_0.profilerEventTypes;
local v34 = {
    Idle = "Idle", 
    Render = "Render", 
    Commit = "Commit", 
    PassiveEffects = "PassiveEffects"
};
local function _() --[[ Line: 98 ]] --[[ Name: getCurrentTimeMs ]]
    return os.clock() * 1000;
end;
local v36 = l_DeviceTier_0.GetDeviceMemoryTier();
local v37 = {};
v37.__index = v37;
v37.new = function(v38, v39) --[[ Line: 141 ]] --[[ Name: new ]]
    -- upvalues: v34 (copy), v11 (copy), l_profilerEventTypes_0 (copy), l_mutedError_0 (copy), v37 (copy)
    return (setmetatable({
        frameReporter = v38, 
        rootReporter = v39, 
        currentState = v34.Idle, 
        timerStartMs = 0, 
        layoutTimerStartMs = v11 and 0 or nil, 
        rootUpdateInProgress = false, 
        rootUpdateTime = {
            tag = "RootUpdateTime", 
            RenderMs = 0, 
            CommitMs = 0, 
            LayoutEffectsMs = v11 and 0 or nil, 
            StartTimeMs = 0
        }, 
        rootPassiveEffectsTime = {
            tag = "RootPassiveEffectsTime", 
            PassiveEffectsMs = 0
        }, 
        renderLevel = 0, 
        states = {
            [v34.Idle] = function(v40, v41) --[[ Line: 165 ]]
                -- upvalues: l_profilerEventTypes_0 (ref), v11 (ref), v34 (ref)
                if v41 == l_profilerEventTypes_0.RenderStart then
                    v40.timerStartMs = os.clock() * 1000;
                    if not v40.rootUpdateInProgress then
                        v40.rootUpdateInProgress = true;
                        v40.rootUpdateTime = {
                            tag = "RootUpdateTime", 
                            RenderMs = 0, 
                            CommitMs = 0, 
                            LayoutEffectsMs = v11 and 0 or nil, 
                            StartTimeMs = os.clock() * 1000
                        };
                    end;
                    return v34.Render;
                elseif v41 == l_profilerEventTypes_0.PassiveEffectsStart then
                    v40.timerStartMs = os.clock() * 1000;
                    v40.rootPassiveEffectsTime = {
                        tag = "RootPassiveEffectsTime", 
                        PassiveEffectsMs = 0
                    };
                    return v34.PassiveEffects;
                elseif v41 == l_profilerEventTypes_0.CommitStart then
                    v40.timerStartMs = os.clock() * 1000;
                    return v34.Commit;
                else
                    return nil;
                end;
            end, 
            [v34.Render] = function(v42, v43) --[[ Line: 194 ]]
                -- upvalues: l_profilerEventTypes_0 (ref), v34 (ref), l_mutedError_0 (ref)
                if v43 == l_profilerEventTypes_0.RenderYield or v43 == l_profilerEventTypes_0.RenderStop then
                    local v44 = os.clock() * 1000 - v42.timerStartMs;
                    local l_rootUpdateTime_0 = v42.rootUpdateTime;
                    l_rootUpdateTime_0.RenderMs = l_rootUpdateTime_0.RenderMs + v44;
                    v42.frameReporter(v44);
                    return v34.Idle;
                else
                    l_mutedError_0("Invalid event in Render: " .. v43);
                    return v34.Idle;
                end;
            end, 
            [v34.Commit] = function(v46, v47, v48) --[[ Line: 206 ]]
                -- upvalues: l_profilerEventTypes_0 (ref), v11 (ref), v34 (ref), l_mutedError_0 (ref)
                if v47 == l_profilerEventTypes_0.CommitStop then
                    if v46.renderLevel > 0 then
                        if v11 and v46.renderLevel == 1 then
                            local l_rootUpdateTime_1 = v46.rootUpdateTime;
                            l_rootUpdateTime_1.LayoutEffectsMs = l_rootUpdateTime_1.LayoutEffectsMs + (os.clock() * 1000 - v46.layoutTimerStartMs);
                        end;
                        v46.renderLevel = v46.renderLevel - 1;
                        return nil;
                    else
                        local v50 = os.clock() * 1000 - v46.timerStartMs;
                        local l_rootUpdateTime_2 = v46.rootUpdateTime;
                        l_rootUpdateTime_2.CommitMs = l_rootUpdateTime_2.CommitMs + v50;
                        v46.frameReporter(v50);
                        v46.rootReporter(v46.rootUpdateTime, v48);
                        v46.rootUpdateInProgress = false;
                        return v34.Idle;
                    end;
                elseif v47 == l_profilerEventTypes_0.RenderStart then
                    v46.renderLevel = v46.renderLevel + 1;
                    if v11 and v46.renderLevel == 1 then
                        v46.layoutTimerStartMs = os.clock() * 1000;
                    end;
                    return nil;
                elseif v11 and (v47 == l_profilerEventTypes_0.LayoutEffectsStart or v47 == l_profilerEventTypes_0.PassiveEffectsStart) then
                    if v46.renderLevel == 0 then
                        v46.layoutTimerStartMs = os.clock() * 1000;
                    end;
                    return nil;
                elseif v11 and (v47 == l_profilerEventTypes_0.LayoutEffectsStop or v47 == l_profilerEventTypes_0.PassiveEffectsStop) then
                    if v46.renderLevel == 0 then
                        local l_rootUpdateTime_3 = v46.rootUpdateTime;
                        l_rootUpdateTime_3.LayoutEffectsMs = l_rootUpdateTime_3.LayoutEffectsMs + (os.clock() * 1000 - v46.layoutTimerStartMs);
                    end;
                    return nil;
                elseif v47 ~= l_profilerEventTypes_0.RenderYield then
                    return nil;
                else
                    l_mutedError_0("Invalid event in Commit: " .. v47);
                    return v34.Idle;
                end;
            end, 
            [v34.PassiveEffects] = function(v53, v54, v55) --[[ Line: 253 ]]
                -- upvalues: l_profilerEventTypes_0 (ref), v34 (ref), l_mutedError_0 (ref)
                if v54 == l_profilerEventTypes_0.PassiveEffectsStop then
                    local v56 = os.clock() * 1000 - v53.timerStartMs;
                    local l_rootPassiveEffectsTime_0 = v53.rootPassiveEffectsTime;
                    l_rootPassiveEffectsTime_0.PassiveEffectsMs = l_rootPassiveEffectsTime_0.PassiveEffectsMs + v56;
                    v53.frameReporter(v56);
                    v53.rootReporter(v53.rootPassiveEffectsTime, v55);
                    return v34.Idle;
                else
                    l_mutedError_0("Invalid event in PassiveEffects: " .. v54);
                    return v34.Idle;
                end;
            end
        }
    }, v37));
end;
v37.transition = function(v58, v59, v60) --[[ Line: 276 ]] --[[ Name: transition ]]
    local l_currentState_0 = v58.currentState;
    local v62 = v58.states[l_currentState_0](v58, v59, v60);
    if v62 then
        v58.currentState = v62;
    end;
end;
local v63 = {
    "addPlaceId", 
    "addUniverseId", 
    "addSessionId", 
    "addOSInfo", 
    "addSessionInfo"
};
if l_game_EngineFeature_0 then
    v63 = {
        "addPlaceId", 
        "addUniverseId", 
        "addSessionId", 
        "addOSInfo", 
        "addSessionInfo", 
        "addMemoryInfo", 
        "addCPUInfo"
    };
end;
if l_game_EngineFeature_1 then
    table.insert(v63, "addPlaySessionId");
end;
local v64 = {
    eventName = "ReactSessionSummary", 
    backends = {
        "EventIngest"
    }, 
    throttlingPercentage = game:DefineFastInt("ReactSessionSummaryEventThrottleHunderedthsPercent", 0), 
    lastUpdated = {
        2025, 
        7, 
        10
    }, 
    description = "Summary of React performance over a game session", 
    links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8"
};
local v65 = nil;
if v10 then
    v65 = {
        eventName = "ReactSessionErrorEvent", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = game:DefineFastInt("DebugReactSessionErrorEventThrottleHunderedthsPercent", 0), 
        lastUpdated = {
            2025, 
            8, 
            7
        }, 
        description = "Summary of React performance over a game session", 
        links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8"
    };
end;
local v66 = {
    eventName = "ReactPeriodSummary", 
    backends = {
        "EventIngest"
    }, 
    throttlingPercentage = game:DefineFastInt("ReactPeriodSummaryEventThrottleHunderedthsPercent", 0), 
    lastUpdated = {
        2025, 
        2, 
        18
    }, 
    description = "Summary of React performance over a period", 
    links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8"
};
local v67 = {
    eventName = "ReactPeriod", 
    backends = {
        "RobloxTelemetryStat"
    }, 
    throttlingPercentage = game:DefineFastInt("ReactPeriodStatThrottleHunderedthsPercent", 0), 
    lastUpdated = {
        2025, 
        2, 
        18
    }, 
    description = "Stats for React performance over a period", 
    links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8"
};
local v68 = {
    eventName = "ReactFrameCounter", 
    backends = {
        "RobloxTelemetryCounter"
    }, 
    throttlingPercentage = game:DefineFastInt("ReactFrameCountThrottleHunderedthsPercent", 0), 
    lastUpdated = {
        2025, 
        2, 
        18
    }, 
    description = "Frame counts for React performance over a period", 
    links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8"
};
local v69 = {
    eventName = "ReactRootSummary", 
    backends = {
        "EventIngest"
    }, 
    lastUpdated = {
        2025, 
        2, 
        18
    }, 
    throttlingPercentage = game:DefineFastInt("ReactRootSummaryEventThrottleHunderedthsPercent2", 0), 
    description = "Summary of React performance for a root", 
    links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8"
};
local v70 = nil;
if not v5 then
    v70 = {
        eventName = "ReactRootPeriod", 
        backends = {
            "RobloxTelemetryStat"
        }, 
        lastUpdated = {
            2025, 
            2, 
            18
        }, 
        throttlingPercentage = game:DefineFastInt("ReactRootPeriodStatThrottleHunderedthsPercent2", 0), 
        description = "Stats for React performance for a root over a period", 
        links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8"
    };
end;
local v71 = {
    eventName = "ReactRootTaskCount", 
    backends = {
        "RobloxTelemetryCounter"
    }, 
    lastUpdated = {
        2025, 
        2, 
        18
    }, 
    throttlingPercentage = game:DefineFastInt("ReactRootTaskCountThrottleHunderedthsPercent2", 0), 
    description = "Task counts for React performance for a root over a period", 
    links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8"
};
local v72 = nil;
if not v6 then
    v72 = {
        eventName = "ReactRootPeriodTask", 
        backends = {
            "RobloxTelemetryStat"
        }, 
        lastUpdated = {
            2025, 
            2, 
            18
        }, 
        throttlingPercentage = game:DefineFastInt("ReactRootPeriodTaskStatThrottleHunderedthsPercent2", 0), 
        description = "Task stats for React performance for a root over a period", 
        links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8"
    };
end;
local v73 = {
    eventName = "ReactRootUpdate", 
    backends = {
        "RobloxTelemetryStat"
    }, 
    lastUpdated = {
        2025, 
        2, 
        18
    }, 
    throttlingPercentage = game:DefineFastInt("ReactRootUpdateStatThrottleHunderedthsPercent", 0), 
    description = "Task stats for individual React root updates, all in milliseconds", 
    links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8"
};
local v74 = {};
v74.__index = v74;
v74.new = function(v75) --[[ Line: 470 ]] --[[ Name: new ]]
    -- upvalues: l_KllSketch_0 (copy), v9 (copy), v10 (copy), v74 (copy), v37 (copy), v21 (ref)
    local v76 = {};
    local v77 = {};
    local v78 = {};
    local v79 = {};
    local v80 = {};
    local v81 = {};
    v76.all = l_KllSketch_0.new(v9);
    v77.all = l_KllSketch_0.new(v9);
    v78.all = l_KllSketch_0.new(v9);
    if v10 then
        v79.all = {};
        v80.all = {};
        v81.all = {};
    end;
    local v82 = setmetatable({
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
                sketches = v76, 
                allData = if v10 then v79 else {}, 
                numRoots = 1
            }, 
            commitTime = {
                sketches = v77, 
                allData = if v10 then v80 else {}, 
                numRoots = 1
            }, 
            timeToUpdate = {
                sketches = v78, 
                allData = if v10 then v81 else {}, 
                numRoots = 1
            }, 
            timePerFrame = {
                sketch = l_KllSketch_0.new(v9), 
                allData = {}
            }, 
            timePerReactFrame = {
                sketch = l_KllSketch_0.new(v9), 
                allData = {}
            }
        }, 
        context = v75
    }, v74);
    v82.schedulerStateMachine = v37.new(function(v83) --[[ Line: 525 ]]
        -- upvalues: v82 (copy)
        v82:addToFrame(v83);
    end, function(v84, v85) --[[ Line: 527 ]]
        -- upvalues: v82 (copy), v21 (ref)
        v82:trackSessionSketches(v84, v85);
        if v21 then
            v82:reportRoot(v84, v85);
        end;
    end);
    return v82;
end;
v74.start = function(v86) --[[ Line: 537 ]] --[[ Name: start ]]
    -- upvalues: l_schedulingProfiler_0 (copy), l_RunService_0 (copy), v3 (copy), v20 (ref)
    v86.started = true;
    v86:resetState();
    l_schedulingProfiler_0.registerProfilerEventCallback(function(v87, v88) --[[ Line: 541 ]]
        -- upvalues: v86 (copy)
        v86.schedulerStateMachine:transition(v87, v88);
    end);
    l_RunService_0.Heartbeat:Connect(function(v89) --[[ Line: 545 ]]
        -- upvalues: v86 (copy), v3 (ref), v20 (ref)
        v86:processFrame(v89 * 1000);
        v86.reactFrameTimeMs = 0;
        if os.clock() * 1000 - v86.periodStartMs > v3 then
            if v20 then
                v86:reportPeriod();
            end;
            v86:resetState();
        end;
    end);
end;
v74.resetState = function(v90) --[[ Line: 560 ]] --[[ Name: resetState ]]
    v90.periodStartMs = os.clock() * 1000;
    v90.frameMetrics = {
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
    };
    v90.rootsMetrics = {};
end;
v74.getRootName = function(_, v92) --[[ Line: 577 ]] --[[ Name: getRootName ]]
    local v93 = "Unknown";
    if v92 then
        if v92.containerInfo.Name ~= "Folder" then
            return v92.containerInfo.Name;
        elseif v92.current and v92.current.child and v92.current.child.memoizedProps then
            for v94, _ in v92.current.child.memoizedProps do
                if typeof(v94) == "string" then
                    return v94;
                end;
            end;
        end;
    end;
    return v93;
end;
v74.addToFrame = function(v96, v97) --[[ Line: 594 ]] --[[ Name: addToFrame ]]
    v96.reactFrameTimeMs = v96.reactFrameTimeMs + v97;
end;
v74.trackSessionSketches = function(v98, v99, v100) --[[ Line: 598 ]] --[[ Name: trackSessionSketches ]]
    -- upvalues: v10 (copy), l_KllSketch_0 (copy), v9 (copy)
    if not v98.sessionMetrics then
        return;
    else
        local v101 = v98:getRootName(v100);
        if v99.tag == "RootUpdateTime" then
            local v102 = os.clock() * 1000 - v99.StartTimeMs;
            if v10 then
                table.insert(v98.sessionMetrics.updateTime.allData.all, v99.RenderMs + v99.CommitMs);
                table.insert(v98.sessionMetrics.commitTime.allData.all, v99.CommitMs);
                table.insert(v98.sessionMetrics.timeToUpdate.allData.all, v102);
            end;
            v98.sessionMetrics.updateTime.sketches.all:insert(v99.RenderMs + v99.CommitMs);
            v98.sessionMetrics.commitTime.sketches.all:insert(v99.CommitMs);
            v98.sessionMetrics.timeToUpdate.sketches.all:insert(v102);
            if not v98.sessionMetrics.updateTime.sketches[v101] then
                v98.sessionMetrics.updateTime.sketches[v101] = l_KllSketch_0.new(v9);
                if v10 then
                    v98.sessionMetrics.updateTime.allData[v101] = {};
                end;
                local l_updateTime_0 = v98.sessionMetrics.updateTime;
                l_updateTime_0.numRoots = l_updateTime_0.numRoots + 1;
            end;
            v98.sessionMetrics.updateTime.sketches[v101]:insert(v99.RenderMs + v99.CommitMs);
            if v10 then
                table.insert(v98.sessionMetrics.updateTime.allData[v101], v99.RenderMs + v99.CommitMs);
            end;
            if not v98.sessionMetrics.commitTime.sketches[v101] then
                v98.sessionMetrics.commitTime.sketches[v101] = l_KllSketch_0.new(v9);
                if v10 then
                    v98.sessionMetrics.commitTime.allData[v101] = {};
                end;
                local l_commitTime_0 = v98.sessionMetrics.commitTime;
                l_commitTime_0.numRoots = l_commitTime_0.numRoots + 1;
            end;
            v98.sessionMetrics.commitTime.sketches[v101]:insert(v99.CommitMs);
            if v10 then
                table.insert(v98.sessionMetrics.commitTime.allData[v101], v99.CommitMs);
            end;
            if not v98.sessionMetrics.timeToUpdate.sketches[v101] then
                v98.sessionMetrics.timeToUpdate.sketches[v101] = l_KllSketch_0.new(v9);
                if v10 then
                    v98.sessionMetrics.timeToUpdate.allData[v101] = {};
                end;
                local l_timeToUpdate_0 = v98.sessionMetrics.timeToUpdate;
                l_timeToUpdate_0.numRoots = l_timeToUpdate_0.numRoots + 1;
            end;
            v98.sessionMetrics.timeToUpdate.sketches[v101]:insert(v102);
            if v10 then
                table.insert(v98.sessionMetrics.timeToUpdate.allData[v101], v102);
            end;
        end;
        return;
    end;
end;
v74.reportRoot = function(v106, v107, v108) --[[ Line: 658 ]] --[[ Name: reportRoot ]]
    -- upvalues: v11 (copy), v12 (copy), l_TelemetryService_0 (copy), v73 (copy), v36 (copy)
    local v109 = v106:getRootName(v108);
    if not v106.rootsMetrics[v109] then
        v106.rootsMetrics[v109] = {
            update_count = 0, 
            layout_effects_count = v11 and 0 or nil, 
            render_total_time_ms = 0, 
            commit_total_time_ms = 0, 
            layout_effects_total_time_ms = v11 and 0 or nil, 
            data_model_update_total_time_ms = v11 and v12 and 0 or nil, 
            max_render_time_ms = 0, 
            max_commit_time_ms = 0, 
            max_update_time_ms = 0, 
            max_layout_effects_time_ms = v11 and 0 or nil, 
            max_data_model_update_time_ms = v11 and v12 and 0 or nil, 
            passive_effects_count = 0, 
            passive_effects_total_time_ms = 0, 
            max_passive_effects_time_ms = 0, 
            total_time_to_update_ms = 0, 
            max_time_to_update_ms = 0
        };
    end;
    local v110 = v106.rootsMetrics[v109];
    if v107.tag == "RootPassiveEffectsTime" then
        l_TelemetryService_0:LogStat(v73, {
            customFields = {
                rootName = v109, 
                deviceTier = v36, 
                updateType = "PassiveEffects", 
                context = v106.context
            }
        }, v107.PassiveEffectsMs);
        v110.passive_effects_count = v110.passive_effects_count + 1;
        v110.passive_effects_total_time_ms = v110.passive_effects_total_time_ms + v107.PassiveEffectsMs;
        if v107.PassiveEffectsMs > v110.max_passive_effects_time_ms then
            v110.max_passive_effects_time_ms = v107.PassiveEffectsMs;
            return;
        end;
    elseif v107.tag == "RootUpdateTime" then
        local v111 = os.clock() * 1000 - v107.StartTimeMs;
        l_TelemetryService_0:LogStat(v73, {
            customFields = {
                rootName = v109, 
                deviceTier = v36, 
                updateType = "TimeToComplete", 
                context = v106.context
            }
        }, v111);
        v110.total_time_to_update_ms = v110.total_time_to_update_ms + v111;
        if v110.max_time_to_update_ms < v111 then
            v110.max_time_to_update_ms = v111;
        end;
        l_TelemetryService_0:LogStat(v73, {
            customFields = {
                rootName = v109, 
                deviceTier = v36, 
                updateType = "RenderAndCommit", 
                context = v106.context
            }
        }, v107.RenderMs + v107.CommitMs);
        l_TelemetryService_0:LogStat(v73, {
            customFields = {
                rootName = v109, 
                deviceTier = v36, 
                updateType = "Commit", 
                context = v106.context
            }
        }, v107.CommitMs);
        if v11 then
            if v107.LayoutEffectsMs > 0 then
                l_TelemetryService_0:LogStat(v73, {
                    customFields = {
                        rootName = v109, 
                        deviceTier = v36, 
                        updateType = "LayoutEffects", 
                        context = v106.context
                    }
                }, v107.LayoutEffectsMs);
            end;
            if v12 then
                l_TelemetryService_0:LogStat(v73, {
                    customFields = {
                        rootName = v109, 
                        deviceTier = v36, 
                        updateType = "DataModelUpdate", 
                        context = v106.context
                    }
                }, v107.CommitMs - v107.LayoutEffectsMs);
            end;
        end;
        v110.update_count = v110.update_count + 1;
        if v107.RenderMs + v107.CommitMs > v110.max_update_time_ms then
            v110.max_update_time_ms = v107.RenderMs + v107.CommitMs;
        end;
        v110.render_total_time_ms = v110.render_total_time_ms + v107.RenderMs;
        v110.commit_total_time_ms = v110.commit_total_time_ms + v107.CommitMs;
        if v107.RenderMs > v110.max_render_time_ms then
            v110.max_render_time_ms = v107.RenderMs;
        end;
        if v107.CommitMs > v110.max_commit_time_ms then
            v110.max_commit_time_ms = v107.CommitMs;
        end;
        if v11 then
            if v107.LayoutEffectsMs > 0 then
                v110.layout_effects_count = v110.layout_effects_count + 1;
                v110.layout_effects_total_time_ms = v110.layout_effects_total_time_ms + v107.LayoutEffectsMs;
                if v107.LayoutEffectsMs > v110.max_layout_effects_time_ms then
                    v110.max_layout_effects_time_ms = v107.LayoutEffectsMs;
                end;
            end;
            if v12 then
                v110.data_model_update_total_time_ms = v110.data_model_update_total_time_ms + (v107.CommitMs - v107.LayoutEffectsMs);
                if v107.CommitMs - v107.LayoutEffectsMs > v110.max_data_model_update_time_ms then
                    v110.max_data_model_update_time_ms = v107.CommitMs - v107.LayoutEffectsMs;
                end;
            end;
        end;
    end;
end;
v74.getFrameBucket = function(_, v113) --[[ Line: 797 ]] --[[ Name: getFrameBucket ]]
    return (math.min(4, math.floor(math.max(0, v113 - 2) / 16.666666666666668) + 1));
end;
v74.processFrame = function(v114, v115) --[[ Line: 804 ]] --[[ Name: processFrame ]]
    -- upvalues: l_game_EngineFeature_2 (copy), v14 (copy), l_RunService_0 (copy), v10 (copy)
    local l_frameMetrics_0 = v114.frameMetrics;
    local l_reactFrameTimeMs_0 = v114.reactFrameTimeMs;
    if l_game_EngineFeature_2 and v14 then
        local l_l_RunService_0_TotalScriptPlusExecutionTime_0 = l_RunService_0:GetTotalScriptPlusExecutionTime();
        if l_l_RunService_0_TotalScriptPlusExecutionTime_0 > 0 then
            l_frameMetrics_0.totalCorescriptTimeMs = l_frameMetrics_0.totalCorescriptTimeMs + l_l_RunService_0_TotalScriptPlusExecutionTime_0;
        end;
    end;
    l_frameMetrics_0.totalFrameCount = l_frameMetrics_0.totalFrameCount + 1;
    local v119 = v114:getFrameBucket(v115);
    local l_allFrameHistogram_0 = l_frameMetrics_0.allFrameHistogram;
    l_allFrameHistogram_0[v119] = l_allFrameHistogram_0[v119] + 1;
    v114.sessionMetrics.timePerFrame.sketch:insert(l_reactFrameTimeMs_0);
    if v10 then
        table.insert(v114.sessionMetrics.timePerFrame.allData, l_reactFrameTimeMs_0);
    end;
    if l_reactFrameTimeMs_0 > 0 then
        l_frameMetrics_0.totalReactTimeMs = l_frameMetrics_0.totalReactTimeMs + l_reactFrameTimeMs_0;
        l_allFrameHistogram_0 = l_frameMetrics_0.reactFrameHistogram;
        l_allFrameHistogram_0[v119] = l_allFrameHistogram_0[v119] + 1;
        v114.sessionMetrics.timePerReactFrame.sketch:insert(l_reactFrameTimeMs_0);
        if v10 then
            table.insert(v114.sessionMetrics.timePerReactFrame.allData, l_reactFrameTimeMs_0);
        end;
        l_frameMetrics_0.reactFrameCount = l_frameMetrics_0.reactFrameCount + 1;
        if l_frameMetrics_0.maxReactFrameTimeMs < l_reactFrameTimeMs_0 then
            l_frameMetrics_0.maxReactFrameTimeMs = l_reactFrameTimeMs_0;
        end;
        local v121 = v119 - v114:getFrameBucket(v115 - l_reactFrameTimeMs_0);
        local l_reactDropChangeHistogram_0 = l_frameMetrics_0.reactDropChangeHistogram;
        local v123 = v121 + 1;
        l_reactDropChangeHistogram_0[v123] = l_reactDropChangeHistogram_0[v123] + 1;
    end;
end;
v74.reportPeriod = function(v124) --[[ Line: 843 ]] --[[ Name: reportPeriod ]]
    -- upvalues: l_TelemetryService_0 (copy), v66 (copy), v63 (ref), v67 (copy), v36 (copy), l_game_EngineFeature_2 (copy), v14 (copy), v68 (copy), v11 (copy), v12 (copy), v69 (copy), v5 (copy), v70 (ref), v71 (copy), v6 (copy), v72 (ref)
    local l_frameMetrics_1 = v124.frameMetrics;
    local v126 = os.clock() * 1000 - v124.periodStartMs;
    local v127 = {
        period_length_ms = v126, 
        react_total_time_ms = l_frameMetrics_1.totalReactTimeMs, 
        react_total_time_pct = l_frameMetrics_1.totalReactTimeMs / v126, 
        react_frame_count = l_frameMetrics_1.reactFrameCount, 
        total_frame_count = l_frameMetrics_1.totalFrameCount, 
        corescript_total_time_ms = l_frameMetrics_1.totalCorescriptTimeMs, 
        corescript_total_time_pct = l_frameMetrics_1.totalCorescriptTimeMs / v126, 
        average_react_all_frame_ms = l_frameMetrics_1.totalReactTimeMs / l_frameMetrics_1.totalFrameCount, 
        average_react_only_frame_ms = if l_frameMetrics_1.reactFrameCount > 0 then l_frameMetrics_1.totalReactTimeMs / l_frameMetrics_1.reactFrameCount else 0, 
        max_react_frame_ms = l_frameMetrics_1.maxReactFrameTimeMs, 
        all_frame_drop0 = l_frameMetrics_1.allFrameHistogram[1], 
        all_frame_drop1 = l_frameMetrics_1.allFrameHistogram[2], 
        all_frame_drop2 = l_frameMetrics_1.allFrameHistogram[3], 
        all_frame_drop3 = l_frameMetrics_1.allFrameHistogram[4], 
        react_frame_drop0 = l_frameMetrics_1.reactFrameHistogram[1], 
        react_frame_drop1 = l_frameMetrics_1.reactFrameHistogram[2], 
        react_frame_drop2 = l_frameMetrics_1.reactFrameHistogram[3], 
        react_frame_drop3 = l_frameMetrics_1.reactFrameHistogram[4], 
        react_drop_change0 = l_frameMetrics_1.reactDropChangeHistogram[1], 
        react_drop_change1 = l_frameMetrics_1.reactDropChangeHistogram[2], 
        react_drop_change2 = l_frameMetrics_1.reactDropChangeHistogram[3], 
        react_drop_change3 = l_frameMetrics_1.reactDropChangeHistogram[4]
    };
    l_TelemetryService_0:LogEvent(v66, {
        standardizedFields = v63, 
        customFields = v127
    });
    l_TelemetryService_0:LogStat(v67, {
        customFields = {
            stat = "ReactTotalTimePct", 
            context = v124.context, 
            deviceTier = v36
        }
    }, v127.react_total_time_pct);
    if l_game_EngineFeature_2 and v14 then
        l_TelemetryService_0:LogStat(v67, {
            customFields = {
                stat = "TotalCorescriptTimePct", 
                context = v124.context, 
                deviceTier = v36
            }
        }, v127.corescript_total_time_pct);
    end;
    l_TelemetryService_0:LogStat(v67, {
        customFields = {
            stat = "AverageReactAllFrameMs", 
            context = v124.context, 
            deviceTier = v36
        }
    }, v127.average_react_all_frame_ms);
    l_TelemetryService_0:LogStat(v67, {
        customFields = {
            stat = "AverageReactOnlyFrameMs", 
            context = v124.context, 
            deviceTier = v36
        }
    }, v127.average_react_only_frame_ms);
    l_TelemetryService_0:LogStat(v67, {
        customFields = {
            stat = "MaxReactFrameMs", 
            context = v124.context, 
            deviceTier = v36
        }
    }, v127.max_react_frame_ms);
    for v128 = 1, 4 do
        local v129 = v128 - 1;
        l_TelemetryService_0:LogCounter(v68, {
            customFields = {
                category = "AllFrame", 
                bucket = v129, 
                context = v124.context, 
                deviceTier = v36
            }
        }, l_frameMetrics_1.allFrameHistogram[v128]);
        l_TelemetryService_0:LogCounter(v68, {
            customFields = {
                category = "ReactFrame", 
                bucket = v129, 
                context = v124.context, 
                deviceTier = v36
            }
        }, l_frameMetrics_1.reactFrameHistogram[v128]);
        l_TelemetryService_0:LogCounter(v68, {
            customFields = {
                category = "ReactDropChange", 
                bucket = v129, 
                context = v124.context, 
                deviceTier = v36
            }
        }, l_frameMetrics_1.reactDropChangeHistogram[v128]);
    end;
    for v130, v131 in v124.rootsMetrics do
        v131.root_name = v130;
        v131.update_total_time_ms = v131.render_total_time_ms + v131.commit_total_time_ms;
        v131.total_time_ms = v131.update_total_time_ms + v131.passive_effects_total_time_ms;
        v131.avg_render_time_ms = v131.render_total_time_ms / v131.update_count;
        v131.context = v124.context;
        v131.total_time_pct = (v131.update_total_time_ms + v131.passive_effects_total_time_ms) / v127.react_total_time_ms;
        v131.avg_update_time_ms = v131.update_total_time_ms / v131.update_count;
        v131.avg_commit_time_ms = v131.commit_total_time_ms / v131.update_count;
        if v11 then
            v131.avg_layout_effects_time_ms = v131.layout_effects_total_time_ms / v131.layout_effects_count;
            if v12 then
                v131.avg_data_model_update_time_ms = v131.data_model_update_total_time_ms / v131.update_count;
            end;
        end;
        v131.avg_passive_effects_time_ms = v131.passive_effects_total_time_ms / v131.passive_effects_count;
        v131.avg_time_to_update_ms = v131.total_time_to_update_ms / v131.update_count;
        l_TelemetryService_0:LogEvent(v69, {
            standardizedFields = v63, 
            customFields = v131
        });
        if not v5 then
            l_TelemetryService_0:LogStat(v70, {
                customFields = {
                    rootName = v131.root_name, 
                    deviceTier = v36, 
                    stat = "TotalTimePct", 
                    context = v124.context
                }
            }, v131.total_time_pct);
        end;
        l_TelemetryService_0:LogCounter(v71, {
            customFields = {
                rootName = v131.root_name, 
                deviceTier = v36, 
                task = "RenderAndCommit", 
                context = v124.context
            }
        }, v131.update_count);
        if v11 then
            l_TelemetryService_0:LogCounter(v71, {
                customFields = {
                    rootName = v131.root_name, 
                    deviceTier = v36, 
                    task = "LayoutEffects", 
                    context = v124.context
                }
            }, v131.layout_effects_count);
        end;
        l_TelemetryService_0:LogCounter(v71, {
            customFields = {
                rootName = v131.root_name, 
                deviceTier = v36, 
                task = "PassiveEffects", 
                context = v124.context
            }
        }, v131.passive_effects_count);
        if not v6 then
            l_TelemetryService_0:LogStat(v72, {
                customFields = {
                    rootName = v131.root_name, 
                    deviceTier = v36, 
                    task = "RenderAndCommit", 
                    stat = "AvgMs", 
                    context = v124.context
                }
            }, v131.avg_update_time_ms);
            l_TelemetryService_0:LogStat(v72, {
                customFields = {
                    rootName = v131.root_name, 
                    deviceTier = v36, 
                    task = "Commit", 
                    stat = "AvgMs", 
                    context = v124.context
                }
            }, v131.avg_commit_time_ms);
            if v11 then
                l_TelemetryService_0:LogStat(v72, {
                    customFields = {
                        rootName = v131.root_name, 
                        deviceTier = v36, 
                        task = "LayoutEffects", 
                        stat = "AvgMs", 
                        context = v124.context
                    }
                }, v131.avg_layout_effects_time_ms);
                if v12 then
                    l_TelemetryService_0:LogStat(v72, {
                        customFields = {
                            rootName = v131.root_name, 
                            deviceTier = v36, 
                            task = "DataModelUpdate", 
                            stat = "AvgMs", 
                            context = v124.context
                        }
                    }, v131.avg_data_model_update_time_ms);
                end;
            end;
            l_TelemetryService_0:LogStat(v72, {
                customFields = {
                    rootName = v131.root_name, 
                    deviceTier = v36, 
                    task = "TimeToUpdateMs", 
                    stat = "AvgMs", 
                    context = v124.context
                }
            }, v131.avg_time_to_update_ms);
            l_TelemetryService_0:LogStat(v72, {
                customFields = {
                    rootName = v131.root_name, 
                    deviceTier = v36, 
                    task = "PassiveEffects", 
                    stat = "AvgMs", 
                    context = v124.context
                }
            }, v131.avg_passive_effects_time_ms);
            l_TelemetryService_0:LogStat(v72, {
                customFields = {
                    rootName = v131.root_name, 
                    deviceTier = v36, 
                    task = "RenderAndCommit", 
                    stat = "MaxMs", 
                    context = v124.context
                }
            }, v131.max_update_time_ms);
            l_TelemetryService_0:LogStat(v72, {
                customFields = {
                    rootName = v131.root_name, 
                    deviceTier = v36, 
                    task = "Commit", 
                    stat = "MaxMs", 
                    context = v124.context
                }
            }, v131.max_commit_time_ms);
            if v11 then
                l_TelemetryService_0:LogStat(v72, {
                    customFields = {
                        rootName = v131.root_name, 
                        deviceTier = v36, 
                        task = "LayoutEffects", 
                        stat = "MaxMs", 
                        context = v124.context
                    }
                }, v131.max_layout_effects_time_ms);
                if v12 then
                    l_TelemetryService_0:LogStat(v72, {
                        customFields = {
                            rootName = v131.root_name, 
                            deviceTier = v36, 
                            task = "DataModelUpdate", 
                            stat = "MaxMs", 
                            context = v124.context
                        }
                    }, v131.max_data_model_update_time_ms);
                end;
            end;
            l_TelemetryService_0:LogStat(v72, {
                customFields = {
                    rootName = v131.root_name, 
                    deviceTier = v36, 
                    task = "TimeToUpdateMs", 
                    stat = "MaxMs", 
                    context = v124.context
                }
            }, v131.max_time_to_update_ms);
            l_TelemetryService_0:LogStat(v72, {
                customFields = {
                    rootName = v131.root_name, 
                    deviceTier = v36, 
                    task = "PassiveEffects", 
                    stat = "MaxMs", 
                    context = v124.context
                }
            }, v131.max_passive_effects_time_ms);
        end;
    end;
end;
generatePercentilesFromSingleSketch = function(v132) --[[ Line: 1147 ]] --[[ Name: generatePercentilesFromSingleSketch ]]
    -- upvalues: v29 (copy)
    local v133 = "{";
    for v134, v135 in v29 do
        v133 = (v133 .. "\"p" .. v135 .. "\":") .. v132:getPercentile(tonumber(v135) or 0);
        if v134 < #v29 then
            v133 = v133 .. ",";
        end;
    end;
    return v133 .. "}";
end;
generatePercentilesFromSketches = function(v136, v137) --[[ Line: 1161 ]] --[[ Name: generatePercentilesFromSketches ]]
    -- upvalues: v29 (copy)
    local v138 = "{";
    for v139, v140 in v29 do
        v138 = v138 .. "\"p" .. v140 .. "\":{";
        local v141 = tonumber(v140) or 0;
        local v142 = 0;
        for v143, v144 in v136 do
            v142 = v142 + 1;
            v138 = v138 .. "\"" .. v143 .. "\":" .. v144:getPercentile(v141);
            if v142 < v137 then
                v138 = v138 .. ",";
            end;
        end;
        v138 = v138 .. (v139 < #v29 and "}," or "}");
    end;
    return v138 .. "}";
end;
v74.reportPercentError = function(v145, v146, v147, v148, v149) --[[ Line: 1181 ]] --[[ Name: reportPercentError ]]
    -- upvalues: v29 (copy), l_TelemetryService_0 (copy), v65 (ref), v63 (ref)
    table.sort(v146);
    local v150 = #v146;
    if v150 < 1 then
        return;
    else
        for _, v152 in v29 do
            local v153 = v146[math.ceil((tonumber(v152) or 0) / 100 * v150)];
            local v154 = nil;
            v154 = if v147.sketches then v147.sketches[v149]:getPercentile(v152) else v147.sketch:getPercentile(v152);
            local v155 = 0;
            if v153 ~= 0 or v154 == 0 then
                if v153 ~= 0 then
                    v155 = (v154 - v153) * 100 / v153;
                end;
                local v156 = {
                    rootName = v149, 
                    percentile = v152, 
                    metric = v148, 
                    numDatapoints = v150, 
                    context = v145.context, 
                    approxError = v155
                };
                l_TelemetryService_0:LogEvent(v65, {
                    standardizedFields = v63, 
                    customFields = v156
                });
            end;
        end;
        return;
    end;
end;
v74.reportSession = function(v157) --[[ Line: 1221 ]] --[[ Name: reportSession ]]
    -- upvalues: v10 (copy), l_TelemetryService_0 (copy), v64 (copy), v63 (ref)
    if not v157.started then
        return;
    else
        local v158 = generatePercentilesFromSketches(v157.sessionMetrics.updateTime.sketches, v157.sessionMetrics.updateTime.numRoots);
        local v159 = generatePercentilesFromSketches(v157.sessionMetrics.commitTime.sketches, v157.sessionMetrics.commitTime.numRoots);
        local v160 = generatePercentilesFromSketches(v157.sessionMetrics.timeToUpdate.sketches, v157.sessionMetrics.timeToUpdate.numRoots);
        local v161 = generatePercentilesFromSingleSketch(v157.sessionMetrics.timePerFrame.sketch);
        local v162 = generatePercentilesFromSingleSketch(v157.sessionMetrics.timePerReactFrame.sketch);
        local v163 = {
            reactUpdateTime = v158, 
            reactCommitTime = v159, 
            reactTimeToUpdate = v160, 
            timePerFrame = v161, 
            timePerReactFrame = v162
        };
        if v10 then
            for v164, v165 in v157.sessionMetrics do
                if v165.sketches then
                    for v166, v167 in v165.allData do
                        v157:reportPercentError(v167, v165, v164, v166);
                    end;
                else
                    v157:reportPercentError(v165.allData, v165, v164, "all");
                end;
            end;
        end;
        l_TelemetryService_0:LogEvent(v64, {
            standardizedFields = v63, 
            customFields = v163
        });
        return;
    end;
end;
return (v74.new(l_FStringReactSchedulingContext_0));