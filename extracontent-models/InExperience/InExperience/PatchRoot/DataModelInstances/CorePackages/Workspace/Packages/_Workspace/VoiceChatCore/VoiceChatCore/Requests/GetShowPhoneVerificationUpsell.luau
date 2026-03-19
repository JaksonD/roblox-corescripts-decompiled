local l_script_FirstAncestor_0 = script:FindFirstAncestor("VoiceChatCore");
local v1 = require(l_script_FirstAncestor_0.Constants);
return function(v2, v3, v4, v5) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    assert(type(v3) == "string", "GetShowPhoneVerificationUpsell request expects universeId to be a string");
    local v6 = string.format("%s/v1/phone-verification/configuration?layerName=%s&experienceId=%s", v1.UPSELL_CARD_URL, v4, v3);
    if v5 and v5 > 0 then
        v6 = v6 .. "&sessionStartTime=" .. v5;
    end;
    return v2(v6, "GET");
end;