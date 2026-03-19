local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Flags.getFFlagEnableShimmeringIconLegacyChatService);
return function(v2, v3, v4) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    local _ = nil;
    if v1() and v2 == "Connecting" then
        return "icons/controls/voice/" .. v4 .. "_0_dark";
    elseif v2 == "Muted" or v2 == "LOCAL_MUTED" then
        return "icons/controls/voice/" .. v4 .. "_off_light";
    elseif v2 == "Inactive" or v2 == "Connecting" then
        return "icons/controls/voice/" .. v4 .. "_0_light";
    elseif v2 == "Talking" then
        return "icons/controls/voice/" .. v4 .. "_" .. tostring(math.floor(v3 * 5 + 0.5) * 20) .. "_light";
    else
        return "icons/controls/voice/" .. v4 .. "_error_light";
    end;
end;