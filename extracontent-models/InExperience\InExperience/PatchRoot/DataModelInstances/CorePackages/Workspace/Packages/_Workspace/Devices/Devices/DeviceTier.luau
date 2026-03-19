local v0 = game:DefineFastInt("ReactLowEndMemoryCutoff", 3500);
local v1 = game:DefineFastInt("ReactHighEndMemoryCutoff", 7500);
local l_Parent_0 = script:FindFirstAncestor("Devices").Parent;
local l_SystemInfoProtocol_0 = require(l_Parent_0.SystemInfoProtocol).SystemInfoProtocol;
local v4 = {
    LowEnd = "LowEnd", 
    MidTier = "MidTier", 
    HighEnd = "HighEnd"
};
return {
    GetDeviceMemoryTier = function() --[[ Line: 27 ]] --[[ Name: GetDeviceMemoryTier ]]
        -- upvalues: l_SystemInfoProtocol_0 (copy), v0 (copy), v4 (copy), v1 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 28 ]]
            -- upvalues: l_SystemInfoProtocol_0 (ref)
            return l_SystemInfoProtocol_0.default:getSystemInfo({
                l_SystemInfoProtocol_0.InfoNames.MAX_MEMORY
            });
        end);
        if l_status_0 and typeof(l_result_0) == "table" then
            local v7 = tonumber(l_result_0[l_SystemInfoProtocol_0.InfoNames.MAX_MEMORY]);
            if not v7 then
                return nil;
            elseif v7 <= v0 then
                return v4.LowEnd;
            elseif v1 <= v7 then
                return v4.HighEnd;
            else
                return v4.MidTier;
            end;
        else
            return nil;
        end;
    end
};