local l_Parent_0 = script:FindFirstAncestor("VoiceChat").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1, v2, v3, v4, v5, v6, v7) --[[ Line: 7 ]]
    return {
        universeId = v1, 
        isPlaceEnabledForVoice = v2, 
        isUniverseEnabledForVoice = v3, 
        isVoiceEnabled = v4, 
        isUniverseEnabledForAvatarVideo = v6, 
        showVoiceOptInOverlay = v5, 
        elegibleToSeeVoiceUpsell = v7
    };
end);