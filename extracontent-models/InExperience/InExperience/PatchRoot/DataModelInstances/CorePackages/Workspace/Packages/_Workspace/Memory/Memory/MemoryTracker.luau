local v0 = game:DefineFastInt("CorescriptMemoryPeriodSeconds", 30);
local v1 = require(script.Parent.Flags.FFlagEnableCorescriptMemoryTracker);
local v2 = game:DefineFastFlag("EnableCorescriptAvgMemoryTracking", false);
local l_Stats_0 = game:GetService("Stats");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_Parent_0 = script:FindFirstAncestor("Memory").Parent;
local l_DeviceTier_0 = require(l_Parent_0.Devices).DeviceTier;
local v7 = {
    ACTIVE = 1, 
    PAUSED = 2, 
    STOPPED = 3
};
local function _() --[[ Line: 22 ]] --[[ Name: GetMemoryPerformanceStatsItem ]]
    -- upvalues: l_Stats_0 (copy)
    local v8 = l_Stats_0 and l_Stats_0:FindFirstChild("PerformanceStats");
    if not v8 then
        return nil;
    else
        return (v8:FindFirstChild("Memory"));
    end;
end;
local function v14() --[[ Line: 31 ]] --[[ Name: GetCorescriptMemory ]]
    -- upvalues: l_Stats_0 (copy)
    local v10 = l_Stats_0 and l_Stats_0:FindFirstChild("PerformanceStats");
    local v11 = if not v10 then nil else v10:FindFirstChild("Memory");
    if v11 then
        for _, v13 in v11:GetChildren() do
            if v13:IsA("StatsItem") and v13.DisplayName == "CoreScriptMemory" then
                return v13:GetValue();
            end;
        end;
    end;
    return nil;
end;
local v15 = {
    eventName = "CorescriptMemory", 
    backends = {
        "RobloxTelemetryStat"
    }, 
    lastUpdated = {
        2025, 
        7, 
        16
    }, 
    throttlingPercentage = 10000, 
    description = "Memory consumption for corescript, in MB", 
    links = "https://docs.google.com/document/d/1BEOgxPzSelCLEHdrHdD_8Kh4ssIcGLlndDXrLmIBNmk"
};
local v16 = {
    eventName = "CorescriptSessionMaxMemory", 
    backends = {
        "RobloxTelemetryStat"
    }, 
    lastUpdated = {
        2025, 
        7, 
        16
    }, 
    throttlingPercentage = 10000, 
    description = "Maximum memory consumption for corescript in the session, in MB", 
    links = "https://docs.google.com/document/d/1BEOgxPzSelCLEHdrHdD_8Kh4ssIcGLlndDXrLmIBNmk"
};
local v17 = {
    eventName = "CorescriptSessionAvgMemory", 
    backends = {
        "RobloxTelemetryStat"
    }, 
    lastUpdated = {
        2026, 
        3, 
        4
    }, 
    throttlingPercentage = 10000, 
    description = "Average memory consumption for corescript in the session, in MB", 
    links = "https://docs.google.com/document/d/1BEOgxPzSelCLEHdrHdD_8Kh4ssIcGLlndDXrLmIBNmk"
};
local v18 = {};
v18.__index = v18;
v18.new = function(v19) --[[ Line: 88 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy), v18 (copy)
    return (setmetatable({
        memoryMb = 0, 
        maxMemoryMb = 0, 
        avgMemoryMb = 0, 
        sampleCount = 0, 
        context = v19, 
        status = v7.PAUSED, 
        loggingTask = nil
    }, v18));
end;
v18.start = function(v20) --[[ Line: 102 ]] --[[ Name: start ]]
    -- upvalues: v7 (copy), v0 (copy), v14 (copy), v2 (copy)
    v20.status = v7.ACTIVE;
    v20.loggingTask = task.delay(v0, function() --[[ Line: 104 ]]
        -- upvalues: v14 (ref), v20 (copy), v2 (ref), v7 (ref)
        local v21 = v14();
        if v21 then
            v20.maxMemoryMb = math.max(v21, v20.maxMemoryMb);
            if v2 then
                v20.sampleCount = v20.sampleCount + 1;
                v20.avgMemoryMb = v20.avgMemoryMb + (v21 - v20.avgMemoryMb) / v20.sampleCount;
            end;
            v20:report(v20.context, v21);
        end;
        if v20.status == v7.ACTIVE then
            v20:start();
        end;
    end);
end;
v18.pause = function(v22) --[[ Line: 120 ]] --[[ Name: pause ]]
    -- upvalues: v7 (copy)
    if v22.loggingTask then
        task.cancel(v22.loggingTask);
        v22.loggingTask = nil;
    end;
    v22.status = v7.PAUSED;
end;
v18.resume = function(v23) --[[ Line: 128 ]] --[[ Name: resume ]]
    -- upvalues: v7 (copy)
    if v23.status == v7.PAUSED then
        v23:start();
    end;
end;
v18.destroy = function(v24) --[[ Line: 134 ]] --[[ Name: destroy ]]
    -- upvalues: v7 (copy), v2 (copy)
    if v24.loggingTask then
        task.cancel(v24.loggingTask);
        v24.loggingTask = nil;
    end;
    v24.status = v7.STOPPED;
    if v24.maxMemoryMb > 0 then
        v24:reportMaxMemoryUsed(v24.context, v24.maxMemoryMb);
    end;
    if v2 and v24.sampleCount > 0 then
        v24:reportAvgMemoryUsed(v24.context, v24.avgMemoryMb);
    end;
end;
v18.report = function(_, v26, v27) --[[ Line: 148 ]] --[[ Name: report ]]
    -- upvalues: l_TelemetryService_0 (copy), v15 (copy), l_DeviceTier_0 (copy)
    l_TelemetryService_0:LogStat(v15, {
        customFields = {
            deviceTier = l_DeviceTier_0.GetDeviceMemoryTier(), 
            context = v26
        }
    }, v27);
end;
v18.reportMaxMemoryUsed = function(_, v29, v30) --[[ Line: 159 ]] --[[ Name: reportMaxMemoryUsed ]]
    -- upvalues: l_TelemetryService_0 (copy), v16 (copy), l_DeviceTier_0 (copy)
    l_TelemetryService_0:LogStat(v16, {
        customFields = {
            deviceTier = l_DeviceTier_0.GetDeviceMemoryTier(), 
            context = v29
        }
    }, v30);
end;
v18.reportAvgMemoryUsed = function(_, v32, v33) --[[ Line: 170 ]] --[[ Name: reportAvgMemoryUsed ]]
    -- upvalues: l_TelemetryService_0 (copy), v17 (copy), l_DeviceTier_0 (copy)
    l_TelemetryService_0:LogStat(v17, {
        customFields = {
            deviceTier = l_DeviceTier_0.GetDeviceMemoryTier(), 
            context = v32
        }
    }, v33);
end;
local v34 = nil;
return function(v35) --[[ Line: 183 ]]
    -- upvalues: v1 (copy), v34 (ref), v18 (copy)
    if not v1 then
        return nil;
    else
        if not v34 then
            v34 = v18.new(v35);
        end;
        return v34;
    end;
end;