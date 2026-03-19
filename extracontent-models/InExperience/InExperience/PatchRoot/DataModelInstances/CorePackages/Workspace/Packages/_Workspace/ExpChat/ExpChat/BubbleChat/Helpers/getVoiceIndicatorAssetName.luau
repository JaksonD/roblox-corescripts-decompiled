local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v1 = require(l_script_FirstAncestor_0.Flags.GetFFlagExpChatEnableVoiceReverseNudge);
return function(v2, v3, v4, v5) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    local v6 = nil;
    if v2 == "Connecting" then
        return "icons/controls/voice/" .. v4 .. "_0_dark";
    elseif v2 == "Muted" or v2 == "LOCAL_MUTED" then
        return "icons/controls/voice/" .. v4 .. "_off_light";
    elseif v2 == "Inactive" or v2 == "Connecting" then
        return "icons/controls/voice/" .. v4 .. "_0_light";
    else
        if v2 == "Talking" then
            local v7 = math.floor(v3 * 5 + 0.5) * 20;
            v6 = "icons/controls/voice/" .. v4 .. "_" .. tostring(v7) .. "_light";
            if v1() then
                return "icons/controls/voice/" .. (v5 and "red_" or "") .. v4 .. "_" .. tostring(v7) .. "_light";
            end;
        else
            v6 = "icons/controls/voice/" .. v4 .. "_error_light";
        end;
        return v6;
    end;
end;