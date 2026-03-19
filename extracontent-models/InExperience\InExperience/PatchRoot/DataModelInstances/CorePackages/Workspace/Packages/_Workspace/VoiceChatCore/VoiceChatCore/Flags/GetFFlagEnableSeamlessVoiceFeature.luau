local l_script_FirstAncestor_0 = script:FindFirstAncestor("VoiceChatCore");
local v1 = require(l_script_FirstAncestor_0.Constants);
game:DefineFastFlag("EnableSeamlessVoiceFeature", false);
game:DefineFastFlag("EnableConnectDisconnect", false);
game:DefineFastFlag("EnableHearingWithoutMicPermissions", false);
game:DefineFastFlag("EnableDeferVoiceConnection", false);
game:DefineFastFlag("EnableLikelySpeakingBubblesRemoved", false);
game:DefineFastFlag("EnableJoinVoiceIsMutedMic", false);
game:DefineFastFlag("EnableReducedCooldownLikelySpeakingBubbles", false);
game:DefineFastFlag("EnableJoinVoiceTooltip", false);
game:DefineFastFlag("EnableInitialJoinVoiceButton", false);
game:DefineFastFlag("EnableHideJoinToastSubtitle", false);
local v2 = {
    [v1.SeamlessVoiceFeatures.ConnectDisconnect] = function() --[[ Line: 24 ]]
        return game:GetFastFlag("EnableConnectDisconnect");
    end, 
    [v1.SeamlessVoiceFeatures.HearingWithoutMicPermissions] = function() --[[ Line: 27 ]]
        return game:GetFastFlag("EnableHearingWithoutMicPermissions");
    end, 
    [v1.SeamlessVoiceFeatures.LikelySpeakingBubblesRemoved] = function() --[[ Line: 30 ]]
        return game:GetFastFlag("EnableLikelySpeakingBubblesRemoved");
    end, 
    [v1.SeamlessVoiceFeatures.JoinVoiceIsMutedMic] = function() --[[ Line: 33 ]]
        return game:GetFastFlag("EnableJoinVoiceIsMutedMic");
    end, 
    [v1.SeamlessVoiceFeatures.ReducedCooldownLikelySpeakingBubbles] = function() --[[ Line: 36 ]]
        return game:GetFastFlag("EnableReducedCooldownLikelySpeakingBubbles");
    end, 
    [v1.SeamlessVoiceFeatures.JoinVoiceTooltip] = function() --[[ Line: 39 ]]
        return game:GetFastFlag("EnableJoinVoiceTooltip");
    end, 
    [v1.SeamlessVoiceFeatures.InitialJoinVoice] = function() --[[ Line: 42 ]]
        return game:GetFastFlag("EnableInitialJoinVoiceButton");
    end, 
    [v1.SeamlessVoiceFeatures.DeferConnection] = function() --[[ Line: 45 ]]
        return game:GetFastFlag("EnableDeferVoiceConnection");
    end, 
    [v1.SeamlessVoiceFeatures.HideJoinToastSubtitle] = function() --[[ Line: 48 ]]
        return game:GetFastFlag("EnableHideJoinToastSubtitle");
    end
};
return function(v3) --[[ Line: 53 ]]
    -- upvalues: v2 (copy)
    if type(v3) == "string" then
        v3 = {
            v3
        };
    end;
    if v3 == nil or #v3 == 0 or not game:GetFastFlag("EnableSeamlessVoiceFeature") then
        return game:GetFastFlag("EnableSeamlessVoiceFeature");
    else
        for _, v5 in pairs(v3) do
            local v6 = v2[v5];
            if not v6 or not v6() then
                return false;
            end;
        end;
        return true;
    end;
end;