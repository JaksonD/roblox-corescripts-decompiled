local _ = require(script.Parent.VoiceChatServiceManager);
local v1 = {
    voice = "voice", 
    text = "text", 
    other = "other"
};
GetDefaultMethodOfAbuse = function(v2, v3) --[[ Line: 14 ]] --[[ Name: GetDefaultMethodOfAbuse ]]
    -- upvalues: v1 (copy)
    if v2 then
        if v3:getRecentUsersInteractionData()[tostring(v2.UserId)] then
            return v1.voice;
        else
            return v1.text;
        end;
    elseif v3:GetMutedAnyone() then
        return v1.voice;
    else
        return v1.text;
    end;
end;
return {
    MethodsOfAbuse = v1, 
    GetDefaultMethodOfAbuse = GetDefaultMethodOfAbuse
};