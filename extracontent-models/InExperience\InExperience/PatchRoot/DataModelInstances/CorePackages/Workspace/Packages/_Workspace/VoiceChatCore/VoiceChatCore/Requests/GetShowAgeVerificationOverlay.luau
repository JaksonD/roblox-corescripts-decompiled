local l_script_FirstAncestor_0 = script:FindFirstAncestor("VoiceChatCore");
local v1 = require(l_script_FirstAncestor_0.Constants);
local function v7(v2) --[[ Line: 9 ]] --[[ Name: createQueryParams ]]
    local v3 = "";
    local v4 = 0;
    for v5, v6 in v2 do
        v3 = v3 .. (v4 > 0 and "&" or "") .. v5 .. "=" .. v6;
        v4 = v4 + 1;
    end;
    if v4 == 0 then
        return "";
    else
        return "?" .. v3;
    end;
end;
return function(v8, v9, v10, v11) --[[ Line: 19 ]]
    -- upvalues: v1 (copy), v7 (copy)
    assert(type(v10) == "string", "GetShowAgeVerificationOverlay request expects placeId to be a string");
    assert(type(v9) == "string", "GetShowAgeVerificationOverlay request expects universeId to be a string");
    local v12 = true;
    if type(v11) ~= "boolean" then
        v12 = type(v11) == "nil";
    end;
    assert(v12, "GetShowAgeVerificationOverlay request expects hasMicPermissions to be a boolean or nil");
    local v13 = {};
    if v11 ~= nil then
        v13.userHasDisabledMicDevicePermissions = tostring(not v11);
    end;
    if v10 ~= "" and v10 ~= nil then
        v13.placeId = v10;
    end;
    return v8(string.format("%s/v1/settings/verify/show-age-verification-overlay/%s%s", v1.VOICE_URL, v9, (v7(v13))), "GET");
end;