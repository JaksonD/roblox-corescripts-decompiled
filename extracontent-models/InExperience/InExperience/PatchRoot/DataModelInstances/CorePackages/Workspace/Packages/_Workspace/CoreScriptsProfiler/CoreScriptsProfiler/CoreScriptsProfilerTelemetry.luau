local v0 = require(script.Parent.CoreScriptsProfiler);
local v1 = require(script.Parent.ProfilerDataParser);
local l_TelemetryService_0 = game:GetService("TelemetryService");
local v3 = game:DefineFastFlag("CoreScriptsProfilerDeviceTier", false);
local l_Parent_0 = script:FindFirstAncestor("CoreScriptsProfiler").Parent;
local l_DeviceTier_0 = require(l_Parent_0.Devices).DeviceTier;
game:DefineFastInt("CoreScriptsProfilerSamplingHundredthsPercentv1", 0);
local v6 = game:DefineFastInt("CoreScriptsProfilerDelaySeconds", 5);
local v7 = game:DefineFastInt("CoreScriptsProfilerDurationSeconds", 10);
local v8 = game:DefineFastInt("CoreScriptsProfilerTelemetryLimit", 20);
if not (math.random(0, 10000) <= game:GetFastInt("CoreScriptsProfilerSamplingHundredthsPercentv1")) then
    return nil;
else
    local v9 = {
        eventName = "CorescriptPackageStats", 
        backends = {
            "RobloxTelemetryStat"
        }, 
        lastUpdated = {
            2025, 
            11, 
            25
        }, 
        description = "Task stats for each corescript package, all in milliseconds", 
        links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/4084400405/Lua+time+break-down+CoreScriptsProfiler"
    };
    local v10 = {};
    v10.__index = v10;
    v10.new = function(v11) --[[ Line: 52 ]] --[[ Name: new ]]
        -- upvalues: v10 (copy)
        return (setmetatable({
            profiler = nil, 
            profilingActive = false, 
            context = v11
        }, v10));
    end;
    v10.start = function(v12) --[[ Line: 63 ]] --[[ Name: start ]]
        -- upvalues: v0 (copy), v6 (copy)
        v12.profiler = v0.new(function(_, v14) --[[ Line: 65 ]]
            -- upvalues: v12 (copy)
            v12:reportResults(v14);
            v12:cleanup();
        end);
        task.delay(v6, function() --[[ Line: 71 ]]
            -- upvalues: v12 (copy)
            v12:startProfilingSession();
        end);
    end;
    v10.startProfilingSession = function(v15) --[[ Line: 76 ]] --[[ Name: startProfilingSession ]]
        -- upvalues: v7 (copy)
        if v15.profilingActive then
            return;
        elseif not v15.profiler then
            return;
        else
            v15.profilingActive = true;
            v15.profiler:ClientStart();
            task.delay(v7, function() --[[ Line: 88 ]]
                -- upvalues: v15 (copy)
                v15:stopProfilingSession();
            end);
            return;
        end;
    end;
    v10.stopProfilingSession = function(v16) --[[ Line: 94 ]] --[[ Name: stopProfilingSession ]]
        if not v16.profilingActive then
            return;
        elseif not v16.profiler then
            return;
        else
            v16.profiler:ClientStop();
            v16.profilingActive = false;
            return;
        end;
    end;
    local function v23(v17) --[[ Line: 109 ]] --[[ Name: sortPackageStatsByDuration ]]
        local v18 = {};
        for v19, v20 in v17 do
            table.insert(v18, {
                packageName = v19, 
                count = v20.count, 
                totalDuration = v20.totalDuration
            });
        end;
        table.sort(v18, function(v21, v22) --[[ Line: 122 ]]
            return v21.totalDuration > v22.totalDuration;
        end);
        return v18;
    end;
    v10.reportResults = function(v24, v25) --[[ Line: 130 ]] --[[ Name: reportResults ]]
        -- upvalues: v1 (copy), v23 (copy), v8 (copy), v3 (copy), l_DeviceTier_0 (copy), l_TelemetryService_0 (copy), v9 (copy)
        local v26 = v1.new(v25):getPackageStatistics();
        local v27 = v23(v26);
        local v28 = math.min(#v27, v8);
        local v29 = nil;
        if v3 then
            v29 = l_DeviceTier_0.GetDeviceMemoryTier();
        end;
        for v30 = 1, v28 do
            local v31 = v27[v30];
            local v32 = {
                packageName = v31.packageName, 
                context = v24.context
            };
            if v3 then
                v32.deviceTier = v29;
            end;
            l_TelemetryService_0:LogStat(v9, {
                customFields = v32
            }, v31.totalDuration * 1000);
        end;
    end;
    v10.cleanup = function(v33) --[[ Line: 165 ]] --[[ Name: cleanup ]]
        if v33.profiler then
            v33.profiler:Disconnect();
            v33.profiler = nil;
            v33.profilingActive = false;
        end;
    end;
    local v34 = nil;
    return function(v35) --[[ Line: 175 ]]
        -- upvalues: v34 (ref), v10 (copy)
        if not v34 then
            v34 = v10.new(v35);
        end;
        return v34;
    end;
end;