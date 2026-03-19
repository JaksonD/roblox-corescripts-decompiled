local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_Parent_0 = script:FindFirstAncestor("VideoUtils").Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.LoggingProtocol);
local l_reportWarning_0 = require(l_Parent_0.DiscoveryAnalytics).Points.reportWarning;
local l_SystemInfoProtocol_0 = require(l_Parent_0.SystemInfoProtocol).SystemInfoProtocol;
local v6 = {
    eventName = "EdpVideoPreviewBlockingStatus", 
    backends = {
        "Points", 
        "EventIngest"
    }, 
    lastUpdated = {
        26, 
        1, 
        19
    }, 
    description = "Telemetry about whether or not the video is blocked by manufacturer/device/max memory", 
    throttlingPercentage = game:DefineFastInt("VideoBlockingTelemetryThrottleHundredthsPercent", 10000)
};
local v7 = nil;
local function v12() --[[ Line: 31 ]] --[[ Name: getSystemInfoLazy ]]
    -- upvalues: v7 (ref), l_SystemInfoProtocol_0 (copy), l_reportWarning_0 (copy), v3 (copy)
    if v7 then
        return v7;
    else
        local v8 = {
            manufacturer = nil, 
            deviceName = nil, 
            maxMemory = nil
        };
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_SystemInfoProtocol_0 (ref)
            local v9 = l_SystemInfoProtocol_0.default:getSystemInfo({
                l_SystemInfoProtocol_0.InfoNames.MANUFACTURER, 
                l_SystemInfoProtocol_0.InfoNames.DEVICE_NAME, 
                l_SystemInfoProtocol_0.InfoNames.MAX_MEMORY
            });
            return {
                manufacturer = v9.manufacturer, 
                deviceName = v9.deviceName, 
                maxMemory = v9.maxMemory
            };
        end);
        if l_status_0 then
            v8 = l_result_0;
        else
            l_reportWarning_0(v3.default, "EdpVideoPreviewBlocking", (("Error retrieving device info for video preview blocking check: %*"):format(l_result_0)));
        end;
        v7 = v8;
        return v8;
    end;
end;
return function(v13, v14, v15) --[[ Line: 84 ]] --[[ Name: useCanDevicePlayVideoPreview ]]
    -- upvalues: v2 (copy), v12 (copy), l_SystemInfoProtocol_0 (copy), l_reportWarning_0 (copy), v3 (copy), l_TelemetryService_0 (copy), v6 (copy)
    local v16 = v2.useMemo(function() --[[ Line: 90 ]]
        -- upvalues: v12 (ref)
        return (v12());
    end, {});
    local v18 = v2.useMemo(function() --[[ Line: 94 ]]
        -- upvalues: v13 (copy), v16 (copy)
        if not v13.enableManufacturerDeny or not v13.manufacturerDenyList then
            return false;
        else
            if typeof(v16.manufacturer) == "string" then
                for v17 in v13.manufacturerDenyList:gmatch("([^|]+)") do
                    if typeof(v17) == "string" and string.lower(v17) == string.lower(v16.manufacturer) then
                        return true;
                    end;
                end;
            end;
            return false;
        end;
    end, {
        v13.enableManufacturerDeny, 
        v13.manufacturerDenyList, 
        v16.manufacturer
    });
    local v20 = v2.useMemo(function() --[[ Line: 110 ]]
        -- upvalues: v13 (copy), v16 (copy)
        if not v13.enableDeviceDeny or not v13.deviceDenyList then
            return false;
        else
            if typeof(v16.deviceName) == "string" then
                for v19 in v13.deviceDenyList:gmatch("([^|]+)") do
                    if typeof(v19) == "string" and string.lower(v19) == string.lower(v16.deviceName) then
                        return true;
                    end;
                end;
            end;
            return false;
        end;
    end, {
        v13.enableDeviceDeny, 
        v13.deviceDenyList, 
        v16.deviceName
    });
    local v23 = v2.useMemo(function() --[[ Line: 126 ]]
        -- upvalues: v13 (copy), v16 (copy)
        if not v13.enableMaxMemoryDeny then
            return false;
        else
            local v21 = v13.maxMemoryThresholdMb or -1;
            if v21 > 0 and typeof(v16.maxMemory) == "string" then
                local v22 = tonumber(v16.maxMemory:match("(%d+)"));
                if v22 and v22 < v21 then
                    return true;
                end;
            end;
            return false;
        end;
    end, {
        v13.enableMaxMemoryDeny, 
        v13.maxMemoryThresholdMb, 
        v16.maxMemory
    });
    return (v2.useCallback(function() --[[ Line: 143 ]]
        -- upvalues: v13 (copy), l_SystemInfoProtocol_0 (ref), l_reportWarning_0 (ref), v3 (ref), l_TelemetryService_0 (ref), v6 (ref), v15 (copy), v14 (copy), v18 (copy), v20 (copy), v23 (copy)
        local v24 = false;
        local v25 = nil;
        if v13.enableAvailableRamDeny and v13.availableRamThresholdMb and v13.availableRamThresholdMb > 0 then
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 152 ]]
                -- upvalues: l_SystemInfoProtocol_0 (ref), v25 (ref), v13 (ref)
                local v26 = l_SystemInfoProtocol_0.default:getSystemInfo({
                    l_SystemInfoProtocol_0.InfoNames.AVAIL_RAM
                });
                if typeof(v26.availRAM) == "string" then
                    v25 = tonumber(v26.availRAM);
                    if v25 and v25 < v13.availableRamThresholdMb then
                        return true;
                    end;
                end;
                return false;
            end);
            if l_status_1 then
                v24 = l_result_1;
            else
                l_reportWarning_0(v3.default, "EdpVideoPreviewBlocking", (("Error retrieving available RAM for video preview blocking check: %*"):format(l_result_1)));
            end;
        end;
        l_TelemetryService_0:LogEvent(v6, {
            standardizedFields = {
                "addOSInfo", 
                "addSessionInfo"
            }, 
            customFields = {
                pageContext = v15, 
                universeId = v14, 
                isBlockedByManufacturer = if v13.enableManufacturerDeny then v18 else nil, 
                isBlockedByDevice = if v13.enableDeviceDeny then v20 else nil, 
                isBlockedByMaxMemory = if v13.enableMaxMemoryDeny then v23 else nil, 
                isBlockedByAvailableRam = if v13.enableAvailableRamDeny then v24 else nil, 
                availableRam = if v13.enableAvailableRamDeny then v25 else nil
            }
        });
        return not (v13.enableManufacturerDeny and v18 or v13.enableDeviceDeny and v20 or v13.enableMaxMemoryDeny and v23 or v13.enableAvailableRamDeny and v24);
    end, {
        v13.enableManufacturerDeny, 
        v13.enableDeviceDeny, 
        v13.enableMaxMemoryDeny, 
        v13.enableAvailableRamDeny, 
        v13.availableRamThresholdMb, 
        v18, 
        v20, 
        v23, 
        v14, 
        v15
    }));
end;