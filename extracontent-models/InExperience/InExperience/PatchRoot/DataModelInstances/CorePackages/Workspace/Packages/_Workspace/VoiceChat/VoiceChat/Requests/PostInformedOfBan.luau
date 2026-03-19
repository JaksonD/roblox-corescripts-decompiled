local l_Parent_0 = script:FindFirstAncestor("VoiceChat").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_HttpService_0 = game:GetService("HttpService");
return function(v3, v4) --[[ Line: 11 ]]
    -- upvalues: l_Url_0 (copy), l_HttpService_0 (copy)
    assert(type(v4) == "boolean", "PostInformedOfBan request expects informedOfBan to be a boolean");
    return v3(string.format("%sv1/moderation/informed-of-ban", l_Url_0.VOICE_URL), "POST", (l_HttpService_0:JSONEncode({
        informedOfBan = v4
    })));
end;