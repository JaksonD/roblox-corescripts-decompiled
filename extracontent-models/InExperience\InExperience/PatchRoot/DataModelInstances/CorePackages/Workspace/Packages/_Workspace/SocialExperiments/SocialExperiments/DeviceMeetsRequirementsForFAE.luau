local l_Parent_0 = script:FindFirstAncestor("SocialExperiments").Parent;
local l_SystemInfoProtocol_0 = require(l_Parent_0.SystemInfoProtocol).SystemInfoProtocol;
local v2 = require(script.Parent.FFlagTestDeviceForFAEUpsell);
local v3 = game:DefineFastString("FAEUpsellDeviceNamePipeDenyList", "");
local v4 = game:DefineFastString("FAEUpsellSystemVersionPipeDenyList", "");
local v5 = nil;
return function() --[[ Line: 9 ]] --[[ Name: deviceMeetsRequirementsForFAE ]]
    -- upvalues: v2 (copy), v5 (ref), l_SystemInfoProtocol_0 (copy), v3 (copy), v4 (copy)
    if not v2 then
        return true;
    elseif v5 ~= nil then
        return v5;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 16 ]]
            -- upvalues: l_SystemInfoProtocol_0 (ref), v3 (ref), v5 (ref), v4 (ref)
            local v6 = {
                l_SystemInfoProtocol_0.InfoNames.DEVICE_NAME, 
                l_SystemInfoProtocol_0.InfoNames.SYSTEM_VERSION, 
                l_SystemInfoProtocol_0.InfoNames.BASE_OS
            };
            local v7 = l_SystemInfoProtocol_0.default:getSystemInfo(v6);
            local v8 = v7.deviceName or "Unknown";
            if typeof(v8) == "string" then
                for v9 in v3:gmatch("([^|]+)") do
                    if v8:lower():find(v9:lower()) then
                        v5 = false;
                        return v5;
                    end;
                end;
            end;
            local v10 = (v7.baseOs or "UnknownOS") .. ":" .. (v7.systemVersion or "UnknownVersion");
            if typeof(v10) == "string" then
                for v11 in v4:gmatch("([^|]+)") do
                    if v10:lower():find(v11:lower()) then
                        v5 = false;
                        return v5;
                    end;
                end;
            end;
            v5 = true;
            return v5;
        end);
        if l_status_0 then
            return l_result_0;
        else
            return true;
        end;
    end;
end;