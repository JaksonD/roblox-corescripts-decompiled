local l_Parent_0 = script:FindFirstAncestor("VoiceChat").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_HttpService_0 = game:GetService("HttpService");
return function(v3, v4) --[[ Line: 11 ]]
    -- upvalues: l_HttpService_0 (copy), l_Url_0 (copy)
    assert(type(v4) == "string", "PostRecordUserSeenGeneralModal request expects modalId to be a string");
    local v5 = l_HttpService_0:JSONEncode({
        modalId = v4
    });
    return v3(string.format("%s/v1/settings/record-user-seen-modal", l_Url_0.VOICE_URL), "POST", v5);
end;