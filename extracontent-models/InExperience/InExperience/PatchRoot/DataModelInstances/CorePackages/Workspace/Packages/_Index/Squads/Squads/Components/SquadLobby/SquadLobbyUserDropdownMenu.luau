local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.CrossExperienceVoice);
local v4 = require(l_Parent_0.ExperienceService);
local v5 = require(l_Parent_0.FocusNavigationUtils);
local v6 = require(l_Parent_0.InputHandlers);
local v7 = require(l_Parent_0.UIBlox);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v9 = require(l_script_FirstAncestor_0.Enums.SquadPartySheetActionEnum);
local _ = require(l_script_FirstAncestor_0.Common.ModelTypes);
local v11 = require(l_script_FirstAncestor_0.Flags.FFlagRecordVoiceStatusOnPartyAction);
local l_Cryo_0 = v1.Cryo;
local l_PresenceType_0 = v1.RoduxPresence.Enums.PresenceType;
local l_React_0 = v1.React;
local l_SharedFlags_0 = v1.SharedFlags;
local l_Images_0 = v7.App.ImageSet.Images;
local l_ModalBottomSheet_0 = v7.ModalBottomSheet;
local l_dependencyArray_0 = v1.Hooks.dependencyArray;
local l_SquadsCore_0 = v1.SquadsCore;
local l_useDispatch_0 = v1.Hooks.useDispatch;
local l_useLocalization_0 = v1.Hooks.useLocalization;
local l_useStore_0 = v1.Hooks.useStore;
local l_useSelector_0 = v1.Hooks.useSelector;
local l_useBackgroundExperience_0 = v3.Hooks.useBackgroundExperience;
local l_useParticipants_0 = v3.Hooks.useParticipants;
local l_useVoiceStatus_0 = v3.Hooks.useVoiceStatus;
local v27 = require(l_script_FirstAncestor_0.Hooks.useSquadUserDropdownMenuButtons);
local l_GameParams_0 = v4.GameParams;
local l_ExperienceService_0 = v4.ExperienceService;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v5.FocusNavigableSurfaceIdentifierEnum;
local l_FocusNavigableSurfaceWrapper_0 = v5.FocusNavigableSurfaceWrapper;
local l_FocusNavigationEventNameEnum_0 = v5.FocusNavigationEventNameEnum;
local l_EventNames_0 = l_SquadsCore_0.Analytics.EventNames;
local l_SquadExternalContractContext_0 = l_SquadsCore_0.SquadExternalContractProvider.SquadExternalContractContext;
local l_SquadLocationEnum_0 = l_SquadsCore_0.Enums.SquadLocationEnum;
local l_SquadPromptType_0 = l_SquadsCore_0.Enums.SquadPromptType;
local l_Constants_0 = l_SquadsCore_0.Common.Constants;
local l_useIsLocalPlayerPartyVoiceEligible_0 = l_SquadsCore_0.Hooks.useIsLocalPlayerPartyVoiceEligible;
local l_useIsUserPartyVoiceEligible_0 = l_SquadsCore_0.Hooks.useIsUserPartyVoiceEligible;
local l_useIsCurrentSquadPartyVoiceEligible_0 = l_SquadsCore_0.Hooks.useIsCurrentSquadPartyVoiceEligible;
local l_GetFFlagEnableCrossExpVoice_0 = l_SharedFlags_0.GetFFlagEnableCrossExpVoice;
local l_getFFlagEnableCrossExpVoiceAbuseReport_0 = l_SharedFlags_0.getFFlagEnableCrossExpVoiceAbuseReport;
local l_FFlagSplitSquadJoinOriginSources_0 = l_SharedFlags_0.FFlagSplitSquadJoinOriginSources;
local l_FFlagEnableSquadUserCardHoverFix_0 = l_SharedFlags_0.FFlagEnableSquadUserCardHoverFix;
local l_FFlagSquadLaunchExperienceMobileFix_0 = l_SharedFlags_0.FFlagSquadLaunchExperienceMobileFix;
local l_FFlagEnableAppChatFocusableFixes_0 = l_SharedFlags_0.FFlagEnableAppChatFocusableFixes;
local l_FFlagRemoveDependencyArrayAntipattern_0 = l_SharedFlags_0.FFlagRemoveDependencyArrayAntipattern;
local l_useIsParticipantMutedLocally_0 = v3.Hooks.useIsParticipantMutedLocally;
local l_default_0 = v3.CrossExperienceVoiceManager.default;
local v50 = l_Images_0["icons/common/play"];
local v51 = l_Images_0["icons/menu/profile"];
local v52 = l_Images_0["icons/actions/feedback"];
local v53 = l_Images_0["icons/actions/leave"];
local v54 = l_Images_0["icons/controls/headphoneDeafen_small"];
local v55 = l_Images_0["icons/controls/microphoneMute"];
local v56 = l_Images_0["icons/controls/microphone"];
local v57 = {
    isInExperience = false, 
    onDismiss = function() --[[ Line: 107 ]] --[[ Name: onDismiss ]]

    end, 
    openViewProfile = function() --[[ Line: 108 ]] --[[ Name: openViewProfile ]]

    end, 
    openVoiceAbuseReport = function() --[[ Line: 109 ]] --[[ Name: openVoiceAbuseReport ]]

    end, 
    parentChannelId = "", 
    userId = ""
};
return function(v58) --[[ Line: 114 ]]
    -- upvalues: l_Cryo_0 (copy), v57 (copy), l_React_0 (copy), l_SquadExternalContractContext_0 (copy), l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), l_useStore_0 (copy), l_useVoiceStatus_0 (copy), l_FFlagEnableSquadUserCardHoverFix_0 (copy), v27 (copy), l_useIsParticipantMutedLocally_0 (copy), l_useLocalization_0 (copy), l_Constants_0 (copy), l_EventNames_0 (copy), v9 (copy), v11 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_SquadPromptType_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), l_useBackgroundExperience_0 (copy), l_useParticipants_0 (copy), l_useIsLocalPlayerPartyVoiceEligible_0 (copy), l_useIsUserPartyVoiceEligible_0 (copy), l_useIsCurrentSquadPartyVoiceEligible_0 (copy), l_useSelector_0 (copy), l_PresenceType_0 (copy), l_GameParams_0 (copy), l_FFlagSquadLaunchExperienceMobileFix_0 (copy), l_FFlagSplitSquadJoinOriginSources_0 (copy), l_SquadLocationEnum_0 (copy), l_ExperienceService_0 (copy), v54 (copy), v50 (copy), v53 (copy), v51 (copy), v52 (copy), v55 (copy), v56 (copy), l_default_0 (copy), l_getFFlagEnableCrossExpVoiceAbuseReport_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v6 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_ModalBottomSheet_0 (copy)
    local v59 = l_Cryo_0.Dictionary.union(v57, v58);
    local v60 = l_React_0.useContext(l_SquadExternalContractContext_0);
    local v61 = l_useDispatch_0();
    local v62 = l_useLocalUserId_0();
    local v63 = l_useStore_0();
    local v64 = l_useVoiceStatus_0();
    local v65 = if l_FFlagEnableSquadUserCardHoverFix_0 then v27(v59.userId, v59.isInExperience) else nil;
    local v66 = l_useIsParticipantMutedLocally_0(tonumber(v59.userId) or -1);
    local v67 = l_useLocalization_0({
        joinButtonText = "Common.VisitGame.Label.Play", 
        viewProfileText = "Feature.Chat.Label.ViewProfile", 
        reportUserText = "Feature.Chat.Action.ReportUser", 
        removeFromGroupText = "Feature.Chat.Action.RemoveFromGroup", 
        voiceIneligibleText = "Feature.Squads.Label.UserDropdownMenuVoiceErrorUserIneligible", 
        muteVoiceButtonText = "Feature.Chat.Action.MuteVoice", 
        unmuteVoiceButtonText = "Feature.Chat.Action.UnmuteVoice"
    });
    local v68 = v60.useGetConversationFromId(v59.parentChannelId);
    local v69 = l_React_0.useMemo(function() --[[ Line: 139 ]]
        -- upvalues: v68 (copy), l_Constants_0 (ref), v62 (copy)
        return v68 and v68.type == l_Constants_0.CONVERSATION_CHANNEL_GROUP_TYPE and v68.initiator == v62;
    end, {
        v68, 
        v62
    });
    local v70 = l_React_0.useCallback(function() --[[ Line: 146 ]]
        -- upvalues: v60 (copy), l_EventNames_0 (ref), v59 (copy), v9 (ref), v11 (ref), v64 (copy)
        v60.fireSquadAnalytics(l_EventNames_0.PartySheetAction, {
            parentChannelId = v59.parentChannelId, 
            actionType = v9.ViewProfileButtonClicked, 
            voiceStatus = if v11 then v64 else nil
        });
        v59.openViewProfile();
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v59.parentChannelId, 
        v59.openViewProfile, 
        v60.fireSquadAnalytics, 
        if v11 then v64 else nil
    } else l_dependencyArray_0(v59.parentChannelId, v59.openViewProfile, v60.fireSquadAnalytics, if v11 then v64 else nil));
    local v71 = l_React_0.useCallback(function() --[[ Line: 170 ]]
        -- upvalues: v60 (copy), l_EventNames_0 (ref), v59 (copy), v9 (ref), v11 (ref), v64 (copy), v63 (copy), l_SquadPromptType_0 (ref), v61 (copy)
        v60.fireSquadAnalytics(l_EventNames_0.PartySheetAction, {
            parentChannelId = v59.parentChannelId, 
            actionType = v9.RemoveUserDropDownButtonClicked, 
            voiceStatus = if v11 then v64 else nil
        });
        v60.setSquadPrompt(v63, {
            promptType = l_SquadPromptType_0.RemoveFromChat, 
            onConfirm = function() --[[ Line: 179 ]] --[[ Name: onConfirm ]]
                -- upvalues: v59 (ref), v60 (ref), l_EventNames_0 (ref), v9 (ref), v11 (ref), v64 (ref), v61 (ref)
                if v59.userId ~= "" and v59.parentChannelId ~= "" then
                    v60.fireSquadAnalytics(l_EventNames_0.PartySheetAction, {
                        parentChannelId = v59.parentChannelId, 
                        actionType = v9.RemoveUserDialogButtonClicked, 
                        voiceStatus = if v11 then v64 else nil
                    });
                    return v60.removeUserFromParentChannel(v61, v59.parentChannelId, v59.userId);
                else
                    return nil;
                end;
            end
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v61, 
        v59.userId, 
        v59.parentChannelId, 
        v60.fireSquadAnalytics, 
        v60.setSquadPrompt, 
        v60.removeUserFromParentChannel, 
        if v11 then v64 else nil
    } else l_dependencyArray_0(v61, v59.userId, v59.parentChannelId, v60.fireSquadAnalytics, v60.setSquadPrompt, v60.removeUserFromParentChannel, if v11 then v64 else nil));
    local v72 = nil;
    local v73 = nil;
    local v74 = nil;
    local v75 = {};
    local v76 = nil;
    local v77 = nil;
    if l_GetFFlagEnableCrossExpVoice_0() then
        v72 = l_useBackgroundExperience_0();
        v74 = l_useParticipants_0() or {};
        v75 = l_React_0.useMemo(function() --[[ Line: 226 ]]
            -- upvalues: v74 (ref)
            local v78 = {};
            for _, v80 in pairs(v74) do
                table.insert(v78, v80.userId);
            end;
            return v78;
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v74
        } else l_dependencyArray_0(v74));
        v76 = l_React_0.useMemo(function() --[[ Line: 234 ]]
            -- upvalues: v72 (ref)
            if v72 then
                return v72.voiceChannelId;
            else
                return nil;
            end;
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v72
        } else l_dependencyArray_0(v72));
        v77 = l_React_0.useMemo(function() --[[ Line: 242 ]]
            -- upvalues: v72 (ref)
            if v72 then
                return v72.voiceSessionId;
            else
                return nil;
            end;
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v72
        } else l_dependencyArray_0(v72));
        if not l_FFlagEnableSquadUserCardHoverFix_0 then
            local v81 = if v59.userId then tonumber(v59.userId) else nil;
            if v81 then
                local v82 = l_useIsLocalPlayerPartyVoiceEligible_0();
                local v83 = l_useIsUserPartyVoiceEligible_0(v81);
                v73 = l_useIsCurrentSquadPartyVoiceEligible_0() == true and v82 and not v83;
            end;
        end;
    end;
    local v85 = l_React_0.useCallback(function(v84) --[[ Line: 263 ]]
        -- upvalues: v59 (copy)
        return v84.Squad.Presence.byUserId[v59.userId];
    end, {
        v59.userId
    });
    local v86 = l_useSelector_0(v85);
    local v88 = l_React_0.useMemo(function() --[[ Line: 269 ]]
        -- upvalues: l_FFlagEnableSquadUserCardHoverFix_0 (ref), v65 (copy), v86 (copy), l_PresenceType_0 (ref)
        if l_FFlagEnableSquadUserCardHoverFix_0 then
            local v87 = false;
            if table.find(v65, "JoinButton") ~= nil then
                v87 = v86 and v86.userPresenceType == l_PresenceType_0.InGame and v86.placeId;
            end;
            return v87;
        else
            return v86 and v86.userPresenceType == l_PresenceType_0.InGame and v86.placeId;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v86, 
        v65
    } else l_dependencyArray_0(v86, v65));
    local v91 = l_React_0.useCallback(function() --[[ Line: 287 ]]
        -- upvalues: v88 (copy), l_GameParams_0 (ref), v59 (copy), v86 (copy), l_FFlagSquadLaunchExperienceMobileFix_0 (ref), l_FFlagSplitSquadJoinOriginSources_0 (ref), v60 (copy), l_SquadLocationEnum_0 (ref), l_ExperienceService_0 (ref)
        if v88 then
            local v89 = l_GameParams_0.fromUserId(v59.userId, v86.placeId);
            if v59.isInExperience and l_FFlagSquadLaunchExperienceMobileFix_0 then
                game:Shutdown();
            end;
            local v90 = "SquadLobby";
            if l_FFlagSplitSquadJoinOriginSources_0 then
                if v60.squadLocation == l_SquadLocationEnum_0.UniversalApp then
                    v90 = "SquadLobbyFromUA";
                elseif v60.squadLocation == l_SquadLocationEnum_0.InExperience then
                    v90 = "SquadLobbyFromInExp";
                end;
            end;
            l_ExperienceService_0:LaunchExperience(v89, v90, nil);
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v88, 
        v60.squadLocation, 
        v59.isInExperience, 
        v59.userId, 
        v86
    } else l_dependencyArray_0(v88, v60.squadLocation, v59.isInExperience, v59.userId, v86));
    local v92 = nil;
    v92 = if l_FFlagEnableSquadUserCardHoverFix_0 then l_React_0.useMemo(function() --[[ Line: 326 ]]
        -- upvalues: v54 (ref), v67 (copy), v50 (ref), v91 (copy), v53 (ref), v71 (copy), v51 (ref), v70 (copy), v52 (ref), v62 (copy), v59 (copy), v76 (ref), v77 (ref), v75 (ref), v66 (copy), v55 (ref), v56 (ref), l_default_0 (ref), v65 (copy)
        local v95 = {
            VoiceIneligibleButton = {
                icon = v54, 
                text = v67.voiceIneligibleText, 
                stayOnActivated = true
            }, 
            JoinButton = {
                icon = v50, 
                text = v67.joinButtonText, 
                onActivated = v91
            }, 
            RemoveUserButton = {
                icon = v53, 
                text = v67.removeFromGroupText, 
                onActivated = v71
            }, 
            ViewProfileButton = {
                icon = v51, 
                text = v67.viewProfileText, 
                onActivated = v70
            }, 
            ReportButton = {
                icon = v52, 
                text = v67.reportUserText, 
                onActivated = function() --[[ Line: 351 ]] --[[ Name: onActivated ]]
                    -- upvalues: v62 (ref), v59 (ref), v76 (ref), v77 (ref), v75 (ref)
                    local v93 = {
                        submitterUserId = tostring(v62), 
                        abuserUserId = v59.userId, 
                        reportBeginTimestampMs = workspace:GetServerTimeNow() * 1000, 
                        voiceChannelId = v76, 
                        voiceSessionId = v77, 
                        voiceUserIds = v75, 
                        voiceUserCount = #v75
                    };
                    v59.openSquadVoiceAbuseReport(v93);
                end
            }, 
            MuteVoiceButton = {
                icon = if v66 then v55 else v56, 
                text = if v66 then v67.unmuteVoiceButtonText else v67.muteVoiceButtonText, 
                onActivated = function() --[[ Line: 369 ]] --[[ Name: onActivated ]]
                    -- upvalues: v59 (ref), v66 (ref), l_default_0 (ref)
                    local v94 = tonumber(v59.userId);
                    if v94 then
                        if v66 then
                            l_default_0:unmuteVoiceParticipant(v94);
                            return;
                        else
                            l_default_0:muteVoiceParticipant(v94);
                            return;
                        end;
                    else
                        warn("Invalid userId: " .. tostring(v59.userId));
                        return;
                    end;
                end
            }
        };
        local v96 = {};
        for _, v98 in v65 do
            local v99 = v95[v98];
            if v99 then
                table.insert(v96, v99);
            end;
        end;
        return v96;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v59.userId, 
        v59.openSquadVoiceAbuseReport, 
        v67.joinButtonText, 
        v67.removeFromGroupText, 
        v67.reportUserText, 
        v67.viewProfileText, 
        v67.voiceIneligibleText, 
        v67.muteVoiceButtonText, 
        v67.unmuteVoiceButtonText, 
        v62, 
        v76, 
        v77, 
        v75, 
        v71, 
        v65, 
        v91, 
        v70, 
        v66
    } else l_dependencyArray_0(v59.userId, v59.openSquadVoiceAbuseReport, v67.joinButtonText, v67.removeFromGroupText, v67.reportUserText, v67.viewProfileText, v67.voiceIneligibleText, v67.muteVoiceButtonText, v67.unmuteVoiceButtonText, v62, v76, v77, v75, v71, v65, v91, v70, v66)) else l_React_0.useMemo(function() --[[ Line: 440 ]]
        -- upvalues: v62 (copy), v59 (copy), l_getFFlagEnableCrossExpVoiceAbuseReport_0 (ref), v76 (ref), v73 (ref), v54 (ref), v67 (copy), v88 (copy), v50 (ref), v91 (copy), v51 (ref), v70 (copy), v52 (ref), v77 (ref), v75 (ref), v69 (copy), v53 (ref), v71 (copy)
        local v100 = tostring(v62) == v59.userId;
        local v101 = not v59.isInExperience;
        local v102 = l_getFFlagEnableCrossExpVoiceAbuseReport_0() and not not v76 and not v100;
        local v103 = {};
        if v73 then
            table.insert(v103, {
                icon = v54, 
                text = v67.voiceIneligibleText, 
                stayOnActivated = true
            });
        end;
        if v88 then
            table.insert(v103, {
                icon = v50, 
                text = v67.joinButtonText, 
                onActivated = v91
            });
        end;
        if v101 then
            table.insert(v103, {
                icon = v51, 
                text = v67.viewProfileText, 
                onActivated = v70
            });
        end;
        if v102 then
            table.insert(v103, {
                icon = v52, 
                text = v67.reportUserText, 
                onActivated = function() --[[ Line: 477 ]] --[[ Name: onActivated ]]
                    -- upvalues: v62 (ref), v59 (ref), v76 (ref), v77 (ref), v75 (ref)
                    local v104 = {
                        submitterUserId = tostring(v62), 
                        abuserUserId = v59.userId, 
                        reportBeginTimestampMs = workspace:GetServerTimeNow() * 1000, 
                        voiceChannelId = v76, 
                        voiceSessionId = v77, 
                        voiceUserIds = v75, 
                        voiceUserCount = #v75
                    };
                    v59.openSquadVoiceAbuseReport(v104);
                end
            });
        end;
        if v69 then
            table.insert(v103, {
                icon = v53, 
                text = v67.removeFromGroupText, 
                onActivated = v71
            });
        end;
        return v103;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v59.isInExperience, 
        v59.userId, 
        v59.openSquadVoiceAbuseReport, 
        v67.joinButtonText, 
        v67.removeFromGroupText, 
        v67.reportUserText, 
        v67.viewProfileText, 
        v67.voiceIneligibleText, 
        v73, 
        v62, 
        v76, 
        v77, 
        v75, 
        v71, 
        v88, 
        v69, 
        v91, 
        v70
    } else l_dependencyArray_0(v59.isInExperience, v59.userId, v59.openSquadVoiceAbuseReport, v67.joinButtonText, v67.removeFromGroupText, v67.reportUserText, v67.viewProfileText, v67.voiceIneligibleText, v73, v62, v76, v77, v75, v71, v88, v69, v91, v70));
    if #v92 > 0 then
        return if l_FFlagEnableAppChatFocusableFixes_0 then l_React_0.createElement(l_FocusNavigableSurfaceWrapper_0, {
            customEventHandlers = {
                [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                    handler = v6.onRelease(function(v105) --[[ Line: 550 ]]
                        -- upvalues: v59 (copy)
                        v59.onDismiss();
                        v105:cancel();
                    end)
                }
            }, 
            isAutoFocusRoot = true, 
            isFocusable = true, 
            isIsolated = true, 
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp
        }, {
            l_React_0.createElement(l_ModalBottomSheet_0, {
                bottomGap = 20, 
                buttonModels = v92, 
                onDismiss = function() --[[ Line: 564 ]] --[[ Name: onDismiss ]]
                    -- upvalues: v59 (copy)
                    v59.onDismiss();
                end, 
                screenWidth = 400, 
                showImages = true
            })
        }) else l_React_0.createElement(l_ModalBottomSheet_0, {
            bottomGap = 20, 
            onDismiss = function() --[[ Line: 573 ]] --[[ Name: onDismiss ]]
                -- upvalues: v59 (copy)
                v59.onDismiss();
            end, 
            buttonModels = v92, 
            screenWidth = 400, 
            showImages = true
        });
    else
        v59.onDismiss();
        return nil;
    end;
end;