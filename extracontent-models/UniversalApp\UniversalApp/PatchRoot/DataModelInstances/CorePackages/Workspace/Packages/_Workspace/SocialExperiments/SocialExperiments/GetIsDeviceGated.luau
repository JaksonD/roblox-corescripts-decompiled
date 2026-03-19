local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialExperiments");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_SystemInfoProtocol_0 = require(l_Parent_0.SystemInfoProtocol).SystemInfoProtocol;
local _ = require(l_script_FirstAncestor_0.DeviceGateFeature);
local v4 = {};
local v5 = {};
return function(v6) --[[ Line: 18 ]]
    -- upvalues: v4 (copy), v5 (copy), l_SystemInfoProtocol_0 (copy)
    if v4[v6.featureName] == nil then
        v4[v6.featureName] = v6.enabled;
    end;
    if v4[v6.featureName] then
        if v5[v6.featureName] == nil then
            local _, _ = pcall(function() --[[ Line: 25 ]]
                -- upvalues: l_SystemInfoProtocol_0 (ref), v6 (copy), v5 (ref)
                local v7 = {
                    l_SystemInfoProtocol_0.InfoNames.DEVICE_NAME, 
                    l_SystemInfoProtocol_0.InfoNames.SYSTEM_VERSION, 
                    l_SystemInfoProtocol_0.InfoNames.BASE_OS
                };
                local v8 = l_SystemInfoProtocol_0.default:getSystemInfo(v7);
                local v9 = v8.deviceName or "UnknownDeviceName";
                if typeof(v9) == "string" then
                    for v10 in v6.deviceNameBlackListString:gmatch("([^|]+)") do
                        if v9:lower():find(v10:lower()) then
                            v5[v6.featureName] = true;
                            return v5[v6.featureName];
                        end;
                    end;
                end;
                local v11 = v8.baseOs or "UnknownOS";
                local v12 = v8.systemVersion or "UnknownVersion";
                if typeof(v11) == "string" and typeof(v12) == "string" then
                    local v13 = v11 .. ":" .. v12;
                    for v14 in v6.osVersionBlackListString:gmatch("([^|]+)") do
                        if v13:lower():find(v14:lower()) then
                            v5[v6.featureName] = true;
                            return v5[v6.featureName];
                        end;
                    end;
                end;
                v5[v6.featureName] = false;
                return v5[v6.featureName];
            end);
            if v5[v6.featureName] == nil then
                v5[v6.featureName] = false;
            end;
        end;
    else
        v5[v6.featureName] = false;
    end;
    return v5[v6.featureName];
end;