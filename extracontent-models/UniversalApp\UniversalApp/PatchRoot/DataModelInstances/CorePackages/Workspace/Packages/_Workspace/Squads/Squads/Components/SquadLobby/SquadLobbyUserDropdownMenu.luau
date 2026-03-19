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
local l_useIsParticipantMutedLocally_0 = v3.Hooks.useIsParticipantMutedLocally;
local l_default_0 = v3.CrossExperienceVoiceManager.default;
local v49 = l_Images_0["icons/common/play"];
local v50 = l_Images_0["icons/menu/profile"];
local v51 = l_Images_0["icons/actions/feedback"];
local v52 = l_Images_0["icons/actions/leave"];
local v53 = l_Images_0["icons/controls/headphoneDeafen_small"];
local v54 = l_Images_0["icons/controls/microphoneMute"];
local v55 = l_Images_0["icons/controls/microphone"];
local v56 = {
    isInExperience = false, 
    onDismiss = function() --[[ Line: 106 ]] --[[ Name: onDismiss ]]

    end, 
    openViewProfile = function() --[[ Line: 107 ]] --[[ Name: openViewProfile ]]

    end, 
    openVoiceAbuseReport = function() --[[ Line: 108 ]] --[[ Name: openVoiceAbuseReport ]]

    end, 
    parentChannelId = "", 
    userId = ""
};
return function(v57) --[[ Line: 113 ]]
    -- upvalues: l_Cryo_0 (copy), v56 (copy), l_React_0 (copy), l_SquadExternalContractContext_0 (copy), l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), l_useStore_0 (copy), l_useVoiceStatus_0 (copy), l_FFlagEnableSquadUserCardHoverFix_0 (copy), v27 (copy), l_useIsParticipantMutedLocally_0 (copy), l_useLocalization_0 (copy), l_Constants_0 (copy), l_EventNames_0 (copy), v9 (copy), v11 (copy), l_dependencyArray_0 (copy), l_SquadPromptType_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), l_useBackgroundExperience_0 (copy), l_useParticipants_0 (copy), l_useIsLocalPlayerPartyVoiceEligible_0 (copy), l_useIsUserPartyVoiceEligible_0 (copy), l_useIsCurrentSquadPartyVoiceEligible_0 (copy), l_useSelector_0 (copy), l_PresenceType_0 (copy), l_GameParams_0 (copy), l_FFlagSquadLaunchExperienceMobileFix_0 (copy), l_FFlagSplitSquadJoinOriginSources_0 (copy), l_SquadLocationEnum_0 (copy), l_ExperienceService_0 (copy), v53 (copy), v49 (copy), v52 (copy), v50 (copy), v51 (copy), v54 (copy), v55 (copy), l_default_0 (copy), l_getFFlagEnableCrossExpVoiceAbuseReport_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v6 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_ModalBottomSheet_0 (copy)
    local v58 = l_Cryo_0.Dictionary.union(v56, v57);
    local v59 = l_React_0.useContext(l_SquadExternalContractContext_0);
    local v60 = l_useDispatch_0();
    local v61 = l_useLocalUserId_0();
    local v62 = l_useStore_0();
    local v63 = l_useVoiceStatus_0();
    local v64 = if l_FFlagEnableSquadUserCardHoverFix_0 then v27(v58.userId, v58.isInExperience) else nil;
    local v65 = l_useIsParticipantMutedLocally_0(tonumber(v58.userId) or -1);
    local v66 = l_useLocalization_0({
        joinButtonText = "Common.VisitGame.Label.Play", 
        viewProfileText = "Feature.Chat.Label.ViewProfile", 
        reportUserText = "Feature.Chat.Action.ReportUser", 
        removeFromGroupText = "Feature.Chat.Action.RemoveFromGroup", 
        voiceIneligibleText = "Feature.Squads.Label.UserDropdownMenuVoiceErrorUserIneligible", 
        muteVoiceButtonText = "Feature.Chat.Action.MuteVoice", 
        unmuteVoiceButtonText = "Feature.Chat.Action.UnmuteVoice"
    });
    local v67 = v59.useGetConversationFromId(v58.parentChannelId);
    local v68 = l_React_0.useMemo(function() --[[ Line: 138 ]]
        -- upvalues: v67 (copy), l_Constants_0 (ref), v61 (copy)
        return v67 and v67.type == l_Constants_0.CONVERSATION_CHANNEL_GROUP_TYPE and v67.initiator == v61;
    end, {
        v67, 
        v61
    });
    local v69 = l_React_0.useCallback(function() --[[ Line: 145 ]]
        -- upvalues: v59 (copy), l_EventNames_0 (ref), v58 (copy), v9 (ref), v11 (ref), v63 (copy)
        v59.fireSquadAnalytics(l_EventNames_0.PartySheetAction, {
            parentChannelId = v58.parentChannelId, 
            actionType = v9.ViewProfileButtonClicked, 
            voiceStatus = if v11 then v63 else nil
        });
        v58.openViewProfile();
    end, l_dependencyArray_0(v58.parentChannelId, v58.openViewProfile, v59.fireSquadAnalytics, if v11 then v63 else nil));
    local v70 = l_React_0.useCallback(function() --[[ Line: 162 ]]
        -- upvalues: v59 (copy), l_EventNames_0 (ref), v58 (copy), v9 (ref), v11 (ref), v63 (copy), v62 (copy), l_SquadPromptType_0 (ref), v60 (copy)
        v59.fireSquadAnalytics(l_EventNames_0.PartySheetAction, {
            parentChannelId = v58.parentChannelId, 
            actionType = v9.RemoveUserDropDownButtonClicked, 
            voiceStatus = if v11 then v63 else nil
        });
        v59.setSquadPrompt(v62, {
            promptType = l_SquadPromptType_0.RemoveFromChat, 
            onConfirm = function() --[[ Line: 171 ]] --[[ Name: onConfirm ]]
                -- upvalues: v58 (ref), v59 (ref), l_EventNames_0 (ref), v9 (ref), v11 (ref), v63 (ref), v60 (ref)
                if v58.userId ~= "" and v58.parentChannelId ~= "" then
                    v59.fireSquadAnalytics(l_EventNames_0.PartySheetAction, {
                        parentChannelId = v58.parentChannelId, 
                        actionType = v9.RemoveUserDialogButtonClicked, 
                        voiceStatus = if v11 then v63 else nil
                    });
                    return v59.removeUserFromParentChannel(v60, v58.parentChannelId, v58.userId);
                else
                    return nil;
                end;
            end
        });
    end, l_dependencyArray_0(v60, v58.userId, v58.parentChannelId, v59.fireSquadAnalytics, v59.setSquadPrompt, v59.removeUserFromParentChannel, if v11 then v63 else nil));
    local v71 = nil;
    local v72 = nil;
    local v73 = nil;
    local v74 = {};
    local v75 = nil;
    local v76 = nil;
    if l_GetFFlagEnableCrossExpVoice_0() then
        v71 = l_useBackgroundExperience_0();
        v73 = l_useParticipants_0() or {};
        v74 = l_React_0.useMemo(function() --[[ Line: 208 ]]
            -- upvalues: v73 (ref)
            local v77 = {};
            for _, v79 in pairs(v73) do
                table.insert(v77, v79.userId);
            end;
            return v77;
        end, l_dependencyArray_0(v73));
        v75 = l_React_0.useMemo(function() --[[ Line: 215 ]]
            -- upvalues: v71 (ref)
            if v71 then
                return v71.voiceChannelId;
            else
                return nil;
            end;
        end, l_dependencyArray_0(v71));
        v76 = l_React_0.useMemo(function() --[[ Line: 218 ]]
            -- upvalues: v71 (ref)
            if v71 then
                return v71.voiceSessionId;
            else
                return nil;
            end;
        end, l_dependencyArray_0(v71));
        if not l_FFlagEnableSquadUserCardHoverFix_0 then
            local v80 = if v58.userId then tonumber(v58.userId) else nil;
            if v80 then
                local v81 = l_useIsLocalPlayerPartyVoiceEligible_0();
                local v82 = l_useIsUserPartyVoiceEligible_0(v80);
                v72 = l_useIsCurrentSquadPartyVoiceEligible_0() == true and v81 and not v82;
            end;
        end;
    end;
    local v84 = l_React_0.useCallback(function(v83) --[[ Line: 235 ]]
        -- upvalues: v58 (copy)
        return v83.Squad.Presence.byUserId[v58.userId];
    end, {
        v58.userId
    });
    local v85 = l_useSelector_0(v84);
    local v87 = l_React_0.useMemo(function() --[[ Line: 240 ]]
        -- upvalues: l_FFlagEnableSquadUserCardHoverFix_0 (ref), v64 (copy), v85 (copy), l_PresenceType_0 (ref)
        if l_FFlagEnableSquadUserCardHoverFix_0 then
            local v86 = false;
            if table.find(v64, "JoinButton") ~= nil then
                v86 = v85 and v85.userPresenceType == l_PresenceType_0.InGame and v85.placeId;
            end;
            return v86;
        else
            return v85 and v85.userPresenceType == l_PresenceType_0.InGame and v85.placeId;
        end;
    end, l_dependencyArray_0(v85, v64));
    local v90 = l_React_0.useCallback(function() --[[ Line: 252 ]]
        -- upvalues: v87 (copy), l_GameParams_0 (ref), v58 (copy), v85 (copy), l_FFlagSquadLaunchExperienceMobileFix_0 (ref), l_FFlagSplitSquadJoinOriginSources_0 (ref), v59 (copy), l_SquadLocationEnum_0 (ref), l_ExperienceService_0 (ref)
        if v87 then
            local v88 = l_GameParams_0.fromUserId(v58.userId, v85.placeId);
            if v58.isInExperience and l_FFlagSquadLaunchExperienceMobileFix_0 then
                game:Shutdown();
            end;
            local v89 = "SquadLobby";
            if l_FFlagSplitSquadJoinOriginSources_0 then
                if v59.squadLocation == l_SquadLocationEnum_0.UniversalApp then
                    v89 = "SquadLobbyFromUA";
                elseif v59.squadLocation == l_SquadLocationEnum_0.InExperience then
                    v89 = "SquadLobbyFromInExp";
                end;
            end;
            l_ExperienceService_0:LaunchExperience(v88, v89, nil);
        end;
    end, l_dependencyArray_0(v87, v59.squadLocation, v58.isInExperience, v58.userId, v85));
    local v91 = nil;
    v91 = if l_FFlagEnableSquadUserCardHoverFix_0 then l_React_0.useMemo(function() --[[ Line: 283 ]]
        -- upvalues: v53 (ref), v66 (copy), v49 (ref), v90 (copy), v52 (ref), v70 (copy), v50 (ref), v69 (copy), v51 (ref), v61 (copy), v58 (copy), v75 (ref), v76 (ref), v74 (ref), v65 (copy), v54 (ref), v55 (ref), l_default_0 (ref), v64 (copy)
        local v94 = {
            VoiceIneligibleButton = {
                icon = v53, 
                text = v66.voiceIneligibleText, 
                stayOnActivated = true
            }, 
            JoinButton = {
                icon = v49, 
                text = v66.joinButtonText, 
                onActivated = v90
            }, 
            RemoveUserButton = {
                icon = v52, 
                text = v66.removeFromGroupText, 
                onActivated = v70
            }, 
            ViewProfileButton = {
                icon = v50, 
                text = v66.viewProfileText, 
                onActivated = v69
            }, 
            ReportButton = {
                icon = v51, 
                text = v66.reportUserText, 
                onActivated = function() --[[ Line: 308 ]] --[[ Name: onActivated ]]
                    -- upvalues: v61 (ref), v58 (ref), v75 (ref), v76 (ref), v74 (ref)
                    local v92 = {
                        submitterUserId = tostring(v61), 
                        abuserUserId = v58.userId, 
                        reportBeginTimestampMs = workspace:GetServerTimeNow() * 1000, 
                        voiceChannelId = v75, 
                        voiceSessionId = v76, 
                        voiceUserIds = v74, 
                        voiceUserCount = #v74
                    };
                    v58.openSquadVoiceAbuseReport(v92);
                end
            }, 
            MuteVoiceButton = {
                icon = if v65 then v54 else v55, 
                text = if v65 then v66.unmuteVoiceButtonText else v66.muteVoiceButtonText, 
                onActivated = function() --[[ Line: 326 ]] --[[ Name: onActivated ]]
                    -- upvalues: v58 (ref), v65 (ref), l_default_0 (ref)
                    local v93 = tonumber(v58.userId);
                    if v93 then
                        if v65 then
                            l_default_0:unmuteVoiceParticipant(v93);
                            return;
                        else
                            l_default_0:muteVoiceParticipant(v93);
                            return;
                        end;
                    else
                        warn("Invalid userId: " .. tostring(v58.userId));
                        return;
                    end;
                end
            }
        };
        local v95 = {};
        for _, v97 in v64 do
            local v98 = v94[v97];
            if v98 then
                table.insert(v95, v98);
            end;
        end;
        return v95;
    end, l_dependencyArray_0(v58.userId, v58.openSquadVoiceAbuseReport, v66.joinButtonText, v66.removeFromGroupText, v66.reportUserText, v66.viewProfileText, v66.voiceIneligibleText, v66.muteVoiceButtonText, v66.unmuteVoiceButtonText, v61, v75, v76, v74, v70, v64, v90, v69, v65)) else l_React_0.useMemo(function() --[[ Line: 376 ]]
        -- upvalues: v61 (copy), v58 (copy), l_getFFlagEnableCrossExpVoiceAbuseReport_0 (ref), v75 (ref), v72 (ref), v53 (ref), v66 (copy), v87 (copy), v49 (ref), v90 (copy), v50 (ref), v69 (copy), v51 (ref), v76 (ref), v74 (ref), v68 (copy), v52 (ref), v70 (copy)
        local v99 = tostring(v61) == v58.userId;
        local v100 = not v58.isInExperience;
        local v101 = l_getFFlagEnableCrossExpVoiceAbuseReport_0() and not not v75 and not v99;
        local v102 = {};
        if v72 then
            table.insert(v102, {
                icon = v53, 
                text = v66.voiceIneligibleText, 
                stayOnActivated = true
            });
        end;
        if v87 then
            table.insert(v102, {
                icon = v49, 
                text = v66.joinButtonText, 
                onActivated = v90
            });
        end;
        if v100 then
            table.insert(v102, {
                icon = v50, 
                text = v66.viewProfileText, 
                onActivated = v69
            });
        end;
        if v101 then
            table.insert(v102, {
                icon = v51, 
                text = v66.reportUserText, 
                onActivated = function() --[[ Line: 413 ]] --[[ Name: onActivated ]]
                    -- upvalues: v61 (ref), v58 (ref), v75 (ref), v76 (ref), v74 (ref)
                    local v103 = {
                        submitterUserId = tostring(v61), 
                        abuserUserId = v58.userId, 
                        reportBeginTimestampMs = workspace:GetServerTimeNow() * 1000, 
                        voiceChannelId = v75, 
                        voiceSessionId = v76, 
                        voiceUserIds = v74, 
                        voiceUserCount = #v74
                    };
                    v58.openSquadVoiceAbuseReport(v103);
                end
            });
        end;
        if v68 then
            table.insert(v102, {
                icon = v52, 
                text = v66.removeFromGroupText, 
                onActivated = v70
            });
        end;
        return v102;
    end, l_dependencyArray_0(v58.isInExperience, v58.userId, v58.openSquadVoiceAbuseReport, v66.joinButtonText, v66.removeFromGroupText, v66.reportUserText, v66.viewProfileText, v66.voiceIneligibleText, v72, v61, v75, v76, v74, v70, v87, v68, v90, v69));
    if #v91 > 0 then
        return if l_FFlagEnableAppChatFocusableFixes_0 then l_React_0.createElement(l_FocusNavigableSurfaceWrapper_0, {
            customEventHandlers = {
                [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                    handler = v6.onRelease(function(v104) --[[ Line: 465 ]]
                        -- upvalues: v58 (copy)
                        v58.onDismiss();
                        v104:cancel();
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
                buttonModels = v91, 
                onDismiss = function() --[[ Line: 479 ]] --[[ Name: onDismiss ]]
                    -- upvalues: v58 (copy)
                    v58.onDismiss();
                end, 
                screenWidth = 400, 
                showImages = true
            })
        }) else l_React_0.createElement(l_ModalBottomSheet_0, {
            bottomGap = 20, 
            onDismiss = function() --[[ Line: 488 ]] --[[ Name: onDismiss ]]
                -- upvalues: v58 (copy)
                v58.onDismiss();
            end, 
            buttonModels = v91, 
            screenWidth = 400, 
            showImages = true
        });
    else
        v58.onDismiss();
        return nil;
    end;
end;