local l_Parent_0 = script:FindFirstAncestor("VoiceChatCore").Parent;
local l_IXPServiceWrapper_0 = require(l_Parent_0.IXPServiceWrapper).IXPServiceWrapper;
game:DefineFastFlag("BatchVoiceParticipantsUpdates", false);
local v2 = game:DefineFastString("ThrottleVoiceParticipantsUpdateLayerName", "Voice.Performance");
local v3 = game:DefineFastString("ThrottleVoiceParticipantsUpdateLayerValue", "BatchVoiceParticipantsUpdates");
local v4 = nil;
local v5 = nil;
if game:GetFastFlag("BatchVoiceParticipantsUpdates") then
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 12 ]]
        -- upvalues: l_IXPServiceWrapper_0 (copy), v2 (copy)
        return l_IXPServiceWrapper_0:GetLayerData(v2);
    end);
    v4 = l_status_0;
    v5 = l_result_0;
end;
return function() --[[ Line: 17 ]]
    -- upvalues: v4 (ref), v5 (ref), v3 (copy)
    return game:GetFastFlag("BatchVoiceParticipantsUpdates") and v4 and v5 and v5[v3];
end;