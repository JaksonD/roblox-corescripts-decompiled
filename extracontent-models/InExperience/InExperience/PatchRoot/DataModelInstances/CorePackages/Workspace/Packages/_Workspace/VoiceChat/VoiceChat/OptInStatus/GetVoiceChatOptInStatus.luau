local l_Parent_0 = script:FindFirstAncestor("VoiceChat").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v2) --[[ Line: 10 ]]
    -- upvalues: l_Url_0 (copy)
    return v2(string.format("%s/v1/settings/user-opt-in", l_Url_0.VOICE_URL), "GET");
end;