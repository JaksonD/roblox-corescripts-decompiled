local _ = require(script.Parent.ErrorReport);
local _ = script:FindFirstAncestor("ErrorReporters").Parent;
local v2 = {};
local function _(v3) --[[ Line: 124 ]] --[[ Name: toUnsignedInt ]]
    if v3 == nil then
        return nil;
    else
        local v4 = tonumber(v3);
        if v4 == nil then
            return nil;
        elseif v4 < 0 then
            return 0;
        else
            return (math.floor(v4));
        end;
    end;
end;
local function v8(v6) --[[ Line: 184 ]] --[[ Name: convertErrorStackToSentryFrame ]]
    local v7 = {
        lineno = tonumber(v6.line) or 0
    };
    if v6.funcName then
        v7["function"] = v6.funcName;
    end;
    if v6.sourceCode then
        v7.filename = v6.sourceCode;
    end;
    if v6.column then
        v7.colno = tonumber(v6.column);
    end;
    if v6.library then
        v7.module = v6.library;
    end;
    if v6.address then
        v7.instruction_addr = v6.address;
    end;
    if v6.guessed_frame == false then
        v7.in_app = true;
    end;
    return v7;
end;
v2.parseThreadsToSentry = function(v9) --[[ Line: 285 ]] --[[ Name: parseThreadsToSentry ]]
    -- upvalues: v8 (copy)
    if not v9 then
        return nil;
    else
        local v10 = {};
        local v11 = 1;
        for v12, v13 in pairs(v9) do
            local v14 = {
                id = v11, 
                name = v13.name or v12
            };
            if v12 == "main" or v13.name == "main" then
                v14.main = true;
            end;
            if v13.fault == true then
                v14.crashed = true;
            end;
            if v13.stack and #v13.stack > 0 then
                local v15 = {};
                for _, v17 in ipairs(v13.stack) do
                    table.insert(v15, (v8(v17)));
                end;
                local v18 = {};
                for v19 = #v15, 1, -1 do
                    table.insert(v18, v15[v19]);
                end;
                v14.stacktrace = {
                    frames = v18
                };
            end;
            table.insert(v10, v14);
            v11 = v11 + 1;
        end;
        if #v10 == 0 then
            return nil;
        else
            return {
                values = v10
            };
        end;
    end;
end;
local function v23(v20) --[[ Line: 370 ]] --[[ Name: parseAppContext ]]
    local v21 = {};
    local l_attributes_0 = v20.attributes;
    if l_attributes_0.appVersion ~= nil then
        v21.app_version = l_attributes_0.appVersion;
    end;
    if l_attributes_0.AppInstallationId ~= nil then
        v21.device_app_hash = l_attributes_0.AppInstallationId;
    end;
    if l_attributes_0.CoreScriptVersion ~= nil then
        v21.core_script_version = l_attributes_0.CoreScriptVersion;
    end;
    if l_attributes_0.DiscoveryScriptVersion ~= nil then
        v21.discovery_script_version = l_attributes_0.DiscoveryScriptVersion;
    end;
    if l_attributes_0.RobloxChannel ~= nil then
        v21.roblox_channel = l_attributes_0.RobloxChannel;
    end;
    if l_attributes_0.AppRunningTime ~= nil then
        v21.app_running_time = l_attributes_0.AppRunningTime;
    end;
    if l_attributes_0.UserAgent ~= nil then
        v21.user_agent = l_attributes_0.UserAgent;
    end;
    if l_attributes_0.BaseUrl ~= nil then
        v21.base_url = l_attributes_0.BaseUrl;
    end;
    if l_attributes_0.WindowsLaunchType ~= nil then
        v21.windows_launch_type = l_attributes_0.WindowsLaunchType;
    end;
    return v21;
end;
local function _(v24) --[[ Line: 435 ]] --[[ Name: parseNetworkContext ]]
    local v25 = {};
    if v24.attributes.networkType ~= nil then
        v25.network_type = v24.attributes.networkType;
    end;
    return v25;
end;
local function _(v27) --[[ Line: 469 ]] --[[ Name: parseOSContext ]]
    local v28 = {};
    local l_attributes_1 = v27.attributes;
    if l_attributes_1.baseOs ~= nil then
        v28.name = l_attributes_1.baseOs;
    end;
    if l_attributes_1.systemVersion ~= nil then
        v28.version = l_attributes_1.systemVersion;
    end;
    if l_attributes_1.systemVersion ~= nil then
        v28.version = l_attributes_1.systemVersion;
    end;
    return v28;
end;
local function v53(v31) --[[ Line: 540 ]] --[[ Name: parseDeviceContext ]]
    local v32 = {};
    local l_attributes_2 = v31.attributes;
    if l_attributes_2.deviceName ~= nil then
        v32.name = l_attributes_2.deviceName;
    end;
    if l_attributes_2.batteryLevel ~= nil then
        local v34 = tonumber(l_attributes_2.batteryLevel);
        if v34 ~= nil then
            v32.battery_level = v34;
        end;
    end;
    if l_attributes_2.manufacturer ~= nil then
        v32.manufacturer = l_attributes_2.manufacturer;
    end;
    if l_attributes_2.maxMemory ~= nil then
        local l_maxMemory_0 = l_attributes_2.maxMemory;
        local v36;
        if l_maxMemory_0 == nil then
            v36 = nil;
        else
            local v37 = tonumber(l_maxMemory_0);
            v36 = if v37 == nil then nil else v37 < 0 and 0 or math.floor(v37);
        end;
        if v36 ~= nil then
            v32.memory_size = v36;
        end;
    end;
    if l_attributes_2.availRAM ~= nil then
        local l_availRAM_0 = l_attributes_2.availRAM;
        local v39;
        if l_availRAM_0 == nil then
            v39 = nil;
        else
            local v40 = tonumber(l_availRAM_0);
            v39 = if v40 == nil then nil else v40 < 0 and 0 or math.floor(v40);
        end;
        if v39 ~= nil then
            v32.free_memory = v39;
        end;
    end;
    if l_attributes_2.maxResolution ~= nil then
        v32.screen_resolution = l_attributes_2.maxResolution;
    end;
    if l_attributes_2.thermalStatus ~= nil then
        v32.thermal_status = l_attributes_2.thermalStatus;
    end;
    if l_attributes_2.cpuLogicalCount ~= nil then
        local l_cpuLogicalCount_0 = l_attributes_2.cpuLogicalCount;
        local v42;
        if l_cpuLogicalCount_0 == nil then
            v42 = nil;
        else
            local v43 = tonumber(l_cpuLogicalCount_0);
            v42 = if v43 == nil then nil else v43 < 0 and 0 or math.floor(v43);
        end;
        if v42 ~= nil then
            v32.processor_count = v42;
        end;
    end;
    if l_attributes_2.cpuCoreCount ~= nil then
        local l_cpuCoreCount_0 = l_attributes_2.cpuCoreCount;
        local v45;
        if l_cpuCoreCount_0 == nil then
            v45 = nil;
        else
            local v46 = tonumber(l_cpuCoreCount_0);
            v45 = if v46 == nil then nil else v46 < 0 and 0 or math.floor(v46);
        end;
        if v45 ~= nil then
            v32.cpu_core_count = v45;
        end;
    end;
    if l_attributes_2.cpuMake ~= nil then
        v32.cpu_description = l_attributes_2.cpuMake;
    end;
    if l_attributes_2.cpuPhysCount ~= nil then
        local l_cpuPhysCount_0 = l_attributes_2.cpuPhysCount;
        local v48;
        if l_cpuPhysCount_0 == nil then
            v48 = nil;
        else
            local v49 = tonumber(l_cpuPhysCount_0);
            v48 = if v49 == nil then nil else v49 < 0 and 0 or math.floor(v49);
        end;
        if v48 ~= nil then
            v32.cpu_physical_count = v48;
        end;
    end;
    if l_attributes_2.cpuSpeed ~= nil then
        local l_cpuSpeed_0 = l_attributes_2.cpuSpeed;
        local v51;
        if l_cpuSpeed_0 == nil then
            v51 = nil;
        else
            local v52 = tonumber(l_cpuSpeed_0);
            v51 = if v52 == nil then nil else v52 < 0 and 0 or math.floor(v52);
        end;
        if v51 ~= nil then
            v32.cpu_speed = v51;
        end;
    end;
    return v32;
end;
v2.parseErrorToContext = function(v54) --[[ Line: 654 ]] --[[ Name: parseErrorToContext ]]
    -- upvalues: v23 (copy), v53 (copy)
    local v55 = {
        app = v23(v54)
    };
    local v56 = {};
    if v54.attributes.networkType ~= nil then
        v56.network_type = v54.attributes.networkType;
    end;
    v55.network = v56;
    v56 = {};
    local l_attributes_3 = v54.attributes;
    if l_attributes_3.baseOs ~= nil then
        v56.name = l_attributes_3.baseOs;
    end;
    if l_attributes_3.systemVersion ~= nil then
        v56.version = l_attributes_3.systemVersion;
    end;
    if l_attributes_3.systemVersion ~= nil then
        v56.version = l_attributes_3.systemVersion;
    end;
    v55.os = v56;
    v55.device = v53(v54);
    return v55;
end;
return v2;