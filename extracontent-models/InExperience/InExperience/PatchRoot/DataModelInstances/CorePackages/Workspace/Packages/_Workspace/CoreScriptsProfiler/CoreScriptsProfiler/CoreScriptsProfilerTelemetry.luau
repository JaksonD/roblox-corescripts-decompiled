local v0 = require(script.Parent.CoreScriptsProfiler);
local v1 = require(script.Parent.ProfilerDataParser);
local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_Parent_0 = script:FindFirstAncestor("CoreScriptsProfiler").Parent;
local l_DeviceTier_0 = require(l_Parent_0.Devices).DeviceTier;
game:DefineFastInt("CoreScriptsProfilerSamplingHundredthsPercentv1", 0);
local v5 = game:DefineFastInt("CoreScriptsProfilerDelaySeconds", 5);
local v6 = game:DefineFastInt("CoreScriptsProfilerDurationSeconds", 10);
local v7 = game:DefineFastInt("CoreScriptsProfilerTelemetryLimit", 20);
if not (math.random(0, 10000) <= game:GetFastInt("CoreScriptsProfilerSamplingHundredthsPercentv1")) then
    return nil;
else
    local v8 = {
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
    local v9 = {};
    v9.__index = v9;
    v9.new = function(v10) --[[ Line: 50 ]] --[[ Name: new ]]
        -- upvalues: v9 (copy)
        return (setmetatable({
            profiler = nil, 
            profilingActive = false, 
            context = v10
        }, v9));
    end;
    v9.start = function(v11) --[[ Line: 61 ]] --[[ Name: start ]]
        -- upvalues: v0 (copy), v5 (copy)
        v11.profiler = v0.new(function(_, v13) --[[ Line: 63 ]]
            -- upvalues: v11 (copy)
            v11:reportResults(v13);
            v11:cleanup();
        end);
        task.delay(v5, function() --[[ Line: 69 ]]
            -- upvalues: v11 (copy)
            v11:startProfilingSession();
        end);
    end;
    v9.startProfilingSession = function(v14) --[[ Line: 74 ]] --[[ Name: startProfilingSession ]]
        -- upvalues: v6 (copy)
        if v14.profilingActive then
            return;
        elseif not v14.profiler then
            return;
        else
            v14.profilingActive = true;
            v14.profiler:ClientStart();
            task.delay(v6, function() --[[ Line: 86 ]]
                -- upvalues: v14 (copy)
                v14:stopProfilingSession();
            end);
            return;
        end;
    end;
    v9.stopProfilingSession = function(v15) --[[ Line: 92 ]] --[[ Name: stopProfilingSession ]]
        if not v15.profilingActive then
            return;
        elseif not v15.profiler then
            return;
        else
            v15.profiler:ClientStop();
            v15.profilingActive = false;
            return;
        end;
    end;
    local function v22(v16) --[[ Line: 107 ]] --[[ Name: sortPackageStatsByDuration ]]
        local v17 = {};
        for v18, v19 in v16 do
            table.insert(v17, {
                packageName = v18, 
                count = v19.count, 
                totalDuration = v19.totalDuration
            });
        end;
        table.sort(v17, function(v20, v21) --[[ Line: 120 ]]
            return v20.totalDuration > v21.totalDuration;
        end);
        return v17;
    end;
    v9.reportResults = function(v23, v24) --[[ Line: 128 ]] --[[ Name: reportResults ]]
        -- upvalues: v1 (copy), v22 (copy), v7 (copy), l_DeviceTier_0 (copy), l_TelemetryService_0 (copy), v8 (copy)
        local v25 = v1.new(v24):getPackageStatistics();
        local v26 = v22(v25);
        local v27 = math.min(#v26, v7);
        local v28 = l_DeviceTier_0.GetDeviceMemoryTier();
        for v29 = 1, v27 do
            local v30 = v26[v29];
            local v31 = {
                packageName = v30.packageName, 
                context = v23.context, 
                deviceTier = v28
            };
            l_TelemetryService_0:LogStat(v8, {
                customFields = v31
            }, v30.totalDuration * 1000);
        end;
    end;
    v9.cleanup = function(v32) --[[ Line: 157 ]] --[[ Name: cleanup ]]
        if v32.profiler then
            v32.profiler:Disconnect();
            v32.profiler = nil;
            v32.profilingActive = false;
        end;
    end;
    local v33 = nil;
    return function(v34) --[[ Line: 167 ]]
        -- upvalues: v33 (ref), v9 (copy)
        if not v33 then
            v33 = v9.new(v34);
        end;
        return v33;
    end;
end;