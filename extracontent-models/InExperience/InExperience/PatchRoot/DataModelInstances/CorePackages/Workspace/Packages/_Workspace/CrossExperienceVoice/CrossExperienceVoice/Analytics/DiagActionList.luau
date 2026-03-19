local l_Parent_0 = script:FindFirstAncestor("CrossExperienceVoice").Parent;
local v1 = require(script.Parent.EventNames);
local l_DiagEventTypes_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.DiagEventTypes;
return {
    [v1.PartyVoiceConnectedParticipantsOnJoin] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("PartyVoiceConnectedParticipantsOnJoinCounter", "PartyVoiceConnectedParticipantsOnJoin")
    }
};