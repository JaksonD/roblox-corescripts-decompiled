local l_Parent_0 = script:FindFirstAncestor("VoiceChat").Parent;
local v1 = require(l_Parent_0.VoiceChatCore);
local v2 = require(l_Parent_0.CrossExperienceVoice);
local v3 = require(l_Parent_0.CrossExperience);
local v4 = require(l_Parent_0.SharedFlags);
local l_default_0 = v1.CoreVoiceManager.default;
local l_default_1 = v2.CrossExperienceVoiceManager.default;
local l_AUDIO_FOCUS_MANAGEMENT_0 = v3.Constants.AUDIO_FOCUS_MANAGEMENT;
local v8 = v4.GetFFlagEnableCrossExpVoice();
local v9 = v4.GetFFlagEnableCrossExperienceVoiceCaptureMute();
local v10 = {};
v10.__index = v10;
v10.new = function() --[[ Line: 38 ]] --[[ Name: new ]]
    -- upvalues: v10 (copy)
    local v11 = {};
    setmetatable(v11, v10);
    return v11;
end;
v10.isPublicVoiceFocused = function(_) --[[ Line: 44 ]] --[[ Name: isPublicVoiceFocused ]]
    -- upvalues: v8 (copy), l_default_1 (copy), l_AUDIO_FOCUS_MANAGEMENT_0 (copy)
    return not v8 or l_default_1:getCurrentAudioContext() == l_AUDIO_FOCUS_MANAGEMENT_0.UGC.CONTEXT_ID;
end;
v10.isPrivateVoiceFocused = function(_) --[[ Line: 49 ]] --[[ Name: isPrivateVoiceFocused ]]
    -- upvalues: v8 (copy), l_default_1 (copy), l_AUDIO_FOCUS_MANAGEMENT_0 (copy)
    return v8 and l_default_1:getCurrentAudioContext() == l_AUDIO_FOCUS_MANAGEMENT_0.CEV.CONTEXT_ID;
end;
v10.MuteAll = function(v14, v15) --[[ Line: 54 ]] --[[ Name: MuteAll ]]
    -- upvalues: v9 (copy), l_default_1 (copy), l_default_0 (copy)
    if v14:isPrivateVoiceFocused() and v9 then
        l_default_1:muteAll(v15);
    end;
    if v14:isPublicVoiceFocused() and l_default_0:UserVoiceEnabled() and l_default_0:IsInitialized() then
        l_default_0:MuteAll(true, v15);
    end;
end;
v10.UnmuteAll = function(v16, v17) --[[ Line: 64 ]] --[[ Name: UnmuteAll ]]
    -- upvalues: v9 (copy), l_default_1 (copy), l_default_0 (copy)
    if v16:isPrivateVoiceFocused() and v9 then
        l_default_1:unmuteAll(v17);
    end;
    if v16:isPublicVoiceFocused() and l_default_0:UserVoiceEnabled() and l_default_0:IsInitialized() then
        l_default_0:MuteAll(false, v17);
    end;
end;
v10.default = v10.new();
return v10;