local l_Parent_0 = script:FindFirstAncestor("VoiceChat").Parent;
return {
    SharedFlags = require(l_Parent_0.SharedFlags), 
    LinkingProtocol = require(l_Parent_0.LinkingProtocol), 
    Promise = require(l_Parent_0.Promise), 
    VoiceChatCore = require(l_Parent_0.VoiceChatCore), 
    CrossExperienceVoice = require(l_Parent_0.CrossExperienceVoice)
};