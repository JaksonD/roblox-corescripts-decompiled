local l_script_FirstAncestor_0 = script:FindFirstAncestor("VoiceChat");
local v1 = require(l_script_FirstAncestor_0.OptInStatus.SetVoiceChatOptInStatus);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Cryo);
return function(v4, v5) --[[ Line: 6 ]]
    -- upvalues: v1 (copy), v3 (copy)
    v4 = v4 or {};
    if v5.type == v1.name then
        v4 = v3.Dictionary.join(v4, {
            isUserOptIn = v5.isUserOptIn
        });
    end;
    return v4;
end;