local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local v1 = require(l_Parent_0.Rodux);
local l_GetFFlagExpChatUseVoiceParticipantsStore_0 = require(l_Parent_0.SharedFlags).GetFFlagExpChatUseVoiceParticipantsStore;
local v3 = game:DefineFastFlag("EasierUnmutingVoiceParticipantsMutedReducer", false);
local v4 = game:DefineFastFlag("UseLikelySpeakingReducer", false);
return v1.combineReducers({
    participants = if l_GetFFlagExpChatUseVoiceParticipantsStore_0() then nil else require(script.Parent.participants), 
    participantsMuted = if v3 then require(script.Parent.participantsMuted) else v1.createReducer({}, {}), 
    isEnabled = require(script.Parent.isEnabled), 
    likelySpeakingUsers = if v4 then require(script.Parent.likelySpeakingUsers) else v1.createReducer({}, {}), 
    showLikelySpeakingBubbles = if v4 then require(script.Parent.showLikelySpeakingBubbles) else v1.createReducer(false, {}), 
    isVoiceUIVisible = require(script.Parent.isVoiceUIVisible)
});