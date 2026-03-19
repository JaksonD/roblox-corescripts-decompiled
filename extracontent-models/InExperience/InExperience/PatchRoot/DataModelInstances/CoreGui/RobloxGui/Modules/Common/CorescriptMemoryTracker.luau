local v0 = game:DefineFastInt("CorescriptMemoryPeriodSeconds", 30);
local v1 = game:DefineFastFlag("EnableCorescriptMemoryTracker", false);
local l_Stats_0 = game:GetService("Stats");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_DeviceTier_0 = require(l_CorePackages_0.Workspace.Packages.Devices).DeviceTier;
local v6 = {
    ACTIVE = 1, 
    PAUSED = 2, 
    STOPPED = 3
};
local function _() --[[ Line: 20 ]] --[[ Name: GetMemoryPerformanceStatsItem ]]
    -- upvalues: l_Stats_0 (copy)
    local v7 = l_Stats_0 and l_Stats_0:FindFirstChild("PerformanceStats");
    if not v7 then
        return nil;
    else
        return (v7:FindFirstChild("Memory"));
    end;
end;
local function v13() --[[ Line: 29 ]] --[[ Name: GetCorescriptMemory ]]
    -- upvalues: l_Stats_0 (copy)
    local v9 = l_Stats_0 and l_Stats_0:FindFirstChild("PerformanceStats");
    local v10 = if not v9 then nil else v9:FindFirstChild("Memory");
    if v10 then
        for _, v12 in v10:GetChildren() do
            if v12:IsA("StatsItem") and v12.DisplayName == "CoreScriptMemory" then
                return v12:GetValue();
            end;
        end;
    end;
    return nil;
end;
local v14 = {
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
local v15 = {
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
local v16 = {};
v16.__index = v16;
v16.new = function(v17) --[[ Line: 75 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy), v16 (copy)
    return (setmetatable({
        memoryMb = 0, 
        maxMemoryMb = 0, 
        context = v17, 
        status = v6.PAUSED, 
        loggingTask = nil
    }, v16));
end;
v16.start = function(v18) --[[ Line: 87 ]] --[[ Name: start ]]
    -- upvalues: v6 (copy), v0 (copy), v13 (copy)
    v18.status = v6.ACTIVE;
    v18.loggingTask = task.delay(v0, function() --[[ Line: 89 ]]
        -- upvalues: v13 (ref), v18 (copy), v6 (ref)
        local v19 = v13();
        if v19 then
            v18.maxMemoryMb = math.max(v19, v18.maxMemoryMb);
            v18:report(v18.context, v19);
        end;
        if v18.status == v6.ACTIVE then
            v18:start();
        end;
    end);
end;
v16.pause = function(v20) --[[ Line: 101 ]] --[[ Name: pause ]]
    -- upvalues: v6 (copy)
    if v20.loggingTask then
        task.cancel(v20.loggingTask);
        v20.loggingTask = nil;
    end;
    v20.status = v6.PAUSED;
end;
v16.resume = function(v21) --[[ Line: 109 ]] --[[ Name: resume ]]
    -- upvalues: v6 (copy)
    if v21.status == v6.PAUSED then
        v21:start();
    end;
end;
v16.destroy = function(v22) --[[ Line: 115 ]] --[[ Name: destroy ]]
    -- upvalues: v6 (copy)
    if v22.loggingTask then
        task.cancel(v22.loggingTask);
        v22.loggingTask = nil;
    end;
    v22.status = v6.STOPPED;
    if v22.maxMemoryMb > 0 then
        v22:reportMaxMemoryUsed(v22.context, v22.maxMemoryMb);
    end;
end;
v16.report = function(_, v24, v25) --[[ Line: 126 ]] --[[ Name: report ]]
    -- upvalues: l_TelemetryService_0 (copy), v14 (copy), l_DeviceTier_0 (copy)
    l_TelemetryService_0:LogStat(v14, {
        customFields = {
            deviceTier = l_DeviceTier_0.GetDeviceMemoryTier(), 
            context = v24
        }
    }, v25);
end;
v16.reportMaxMemoryUsed = function(_, v27, v28) --[[ Line: 137 ]] --[[ Name: reportMaxMemoryUsed ]]
    -- upvalues: l_TelemetryService_0 (copy), v15 (copy), l_DeviceTier_0 (copy)
    l_TelemetryService_0:LogStat(v15, {
        customFields = {
            deviceTier = l_DeviceTier_0.GetDeviceMemoryTier(), 
            context = v27
        }
    }, v28);
end;
local v29 = nil;
return function(v30) --[[ Line: 150 ]]
    -- upvalues: v1 (copy), v29 (ref), v16 (copy)
    if not v1 then
        return nil;
    else
        if not v29 then
            v29 = v16.new(v30);
        end;
        return v29;
    end;
end;