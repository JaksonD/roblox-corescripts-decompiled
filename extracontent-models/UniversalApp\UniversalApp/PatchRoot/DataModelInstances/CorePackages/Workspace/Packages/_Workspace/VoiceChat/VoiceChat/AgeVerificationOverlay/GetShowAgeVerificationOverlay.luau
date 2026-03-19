local l_Parent_0 = script:FindFirstAncestor("VoiceChat").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v2, v3, v4) --[[ Line: 10 ]]
    -- upvalues: l_Url_0 (copy)
    assert(type(v4) == "string", "GetShowAgeVerificationOverlay request expects placeId to be a string");
    assert(type(v3) == "string", "GetShowAgeVerificationOverlay request expects universeId to be a string");
    return v2(string.format("%s/v1/settings/verify/show-age-verification-overlay/%s", l_Url_0.VOICE_URL, if v4 ~= "" and v4 ~= nil then v3 .. "?placeId=" .. v4 else v3), "GET");
end;