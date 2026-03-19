local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local l_DateTime_0 = require(l_Parent_0.Time).DateTime;
local v5 = require(l_script_FirstAncestor_0.Constants);
local v6 = require(l_script_FirstAncestor_0.Models.Conversation);
local v7 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local v8 = require(l_script_FirstAncestor_0.Hooks.useGetConversationFromId);
local v9 = require(l_script_FirstAncestor_0.Utils.getDeepValue2);
local v10 = require(l_script_FirstAncestor_0.Hooks.useRecordModalSequenceResponseForConversation);
local v11 = require(l_Parent_0.Foundation);
local l_Dialog_0 = v11.Dialog;
local l_DialogSize_0 = v11.Enums.DialogSize;
local l_ButtonVariant_0 = v11.Enums.ButtonVariant;
local l_BadgeVariant_0 = v11.Enums.BadgeVariant;
local l_Orientation_0 = v11.Enums.Orientation;
local l_Skeleton_0 = v11.Skeleton;
local l_Radius_0 = v11.Enums.Radius;
local l_useTokens_0 = v11.Hooks.useTokens;
local l_UserRow_0 = require(l_Parent_0.UserList).UserRow;
local v21 = require(l_Parent_0.UserProfiles);
local l_useUserProfilesFetch_0 = v21.Hooks.useUserProfilesFetch;
local l_getCombinedNameFromId_0 = v21.Selectors.getCombinedNameFromId;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useStore_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useStore;
local l_useEffect_0 = v2.useEffect;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v29 = require(l_Parent_0.AppChatNetworking);
local l_API_0 = v29.rodux.GetConversationDetails.API;
local l_API_1 = v29.rodux.RemoveUserFromConversation.API;
local v32 = require(l_script_FirstAncestor_0.Conversations.Actions.RemovedConversation);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v34 = require(l_script_FirstAncestor_0.Telemetry.useTelemetry);
local v35 = require(l_script_FirstAncestor_0.Telemetry.Layers.AppTelemetryLayer);
local v36 = require(l_script_FirstAncestor_0.Components.OSA.ConversationListOverlayTelemetry);
local v37 = require(l_script_FirstAncestor_0.Components.ModalTelemetry);
local v38 = require(l_Parent_0.SquadsCore);
local l_SquadExternalContractContext_0 = v38.SquadExternalContractProvider.SquadExternalContractContext;
local l_SquadPromptType_0 = v38.Enums.SquadPromptType;
local v41 = require(l_script_FirstAncestor_0.Utils.shouldShowU13ChatOptInForConversation);
local l_FFlagAppChatEnableU13ChatOptIn_0 = require(l_Parent_0.SharedFlags).FFlagAppChatEnableU13ChatOptIn;
local l_FFlagGroupOSAGetConversationParticipants_0 = require(l_script_FirstAncestor_0.Flags).FFlagGroupOSAGetConversationParticipants;
local v44 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatGroupOsaAnalytics);
local v45 = game:DefineFastFlag("AppChatGroupOsaNavigateBeforeRecordDecline", false);
local v46 = game:DefineFastFlag("AppChatGroupOsaPreventBlankDialog", false);
local v47 = game:DefineFastFlag("AppChatGroupOsaPreventDuplicateSubmit", false);
local v48 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatAdjustDeclineToUseRemovedConversation);
local v49 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatLoadInNewOSAInfo);
local l_FFlagAppChatLiftPostAPICallActionsUp_0 = require(l_Parent_0.SharedFlags).FFlagAppChatLiftPostAPICallActionsUp;
local v51 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatUpdateConvAfterRecordModalSequence);
local v52 = require(l_script_FirstAncestor_0.Flags.FFlagSupportViewingUserProfileOnOSA);
local v53 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatUpdateOSAStrings);
local v54 = {
    source = nil, 
    createdAt = nil, 
    title = ""
};
local l_ConversationListOverlay_0 = v5.ModalSequence.ConversationListOverlay;
local l_OsaContextCard_0 = v5.OptInVariant.OsaContextCard;
local l_Accept_0 = v5.ModalAction.Accept;
local l_Decline_0 = v5.ModalAction.Decline;
local v59 = {
    dialogSize = l_DialogSize_0.Medium, 
    disablePortal = false, 
    hasBackdrop = true, 
    onClose = function() --[[ Line: 104 ]] --[[ Name: onClose ]]

    end, 
    onJoin = function() --[[ Line: 105 ]] --[[ Name: onJoin ]]

    end, 
    onDecline = function() --[[ Line: 106 ]] --[[ Name: onDecline ]]

    end
};
local function _(v60, v61) --[[ Line: 109 ]] --[[ Name: resolveModalVariant ]]
    -- upvalues: v41 (copy), v5 (copy), l_OsaContextCard_0 (copy)
    if v60 then
        return v60;
    elseif v41(v61) then
        return v5.OptInVariant.ChatOptInInfoCard;
    else
        return l_OsaContextCard_0;
    end;
end;
return function(v63) --[[ Line: 122 ]] --[[ Name: GroupOSADialog ]]
    -- upvalues: v3 (copy), v59 (copy), l_FFlagAppChatEnableU13ChatOptIn_0 (copy), l_OsaContextCard_0 (copy), l_useDispatch_0 (copy), l_useStore_0 (copy), l_useLocalUserId_0 (copy), v49 (copy), l_useTokens_0 (copy), v2 (copy), v47 (copy), l_useEffect_0 (copy), v44 (copy), v34 (copy), v35 (copy), v36 (copy), l_SquadExternalContractContext_0 (copy), v8 (copy), v54 (copy), v41 (copy), v5 (copy), l_API_0 (copy), v7 (copy), l_FFlagGroupOSAGetConversationParticipants_0 (copy), l_useSelector_0 (copy), v9 (copy), v29 (copy), l_useUserProfilesFetch_0 (copy), v21 (copy), l_DateTime_0 (copy), l_getCombinedNameFromId_0 (copy), v6 (copy), l_useLocalization_0 (copy), v53 (copy), l_UserRow_0 (copy), v11 (copy), l_BadgeVariant_0 (copy), v52 (copy), v37 (copy), l_SquadPromptType_0 (copy), v10 (copy), l_Accept_0 (copy), l_ConversationListOverlay_0 (copy), l_FFlagAppChatLiftPostAPICallActionsUp_0 (copy), v51 (copy), v48 (copy), l_API_1 (copy), v45 (copy), l_Decline_0 (copy), v32 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), l_Dialog_0 (copy), v46 (copy), l_Orientation_0 (copy), l_ButtonVariant_0 (copy)
    local v64 = v3.Dictionary.union(v59, v63);
    local v65 = if l_FFlagAppChatEnableU13ChatOptIn_0 then v64.modalVariant else l_OsaContextCard_0;
    local v66 = l_useDispatch_0();
    local v67 = l_useStore_0();
    local v68 = l_useLocalUserId_0();
    local v69 = if v49 then l_useTokens_0() else nil;
    local v70, v71 = v2.useState(false);
    if v47 then
        l_useEffect_0(function() --[[ Line: 138 ]]
            -- upvalues: v71 (copy)
            return function() --[[ Line: 139 ]]
                -- upvalues: v71 (ref)
                v71(false);
            end;
        end, {});
    end;
    local v72 = nil;
    if v44 then
        v72 = v34(v35.Context);
        l_useEffect_0(function() --[[ Line: 148 ]]
            -- upvalues: v72 (ref), v36 (ref), v65 (ref), v64 (copy)
            v72.emit(v36.Events.ModalRendered, {
                modalVariant = v65, 
                conversationId = v64.conversationId, 
                impressionId = v64.impressionId
            });
        end, {
            v64.impressionId, 
            v64.conversationId, 
            v65
        });
    end;
    local v73 = v2.useContext(l_SquadExternalContractContext_0);
    local v74 = v8(v64.conversationId);
    local v75 = v74 or v54;
    if l_FFlagAppChatEnableU13ChatOptIn_0 then
        local l_v65_0 = v65;
        v65 = if l_v65_0 then l_v65_0 else if v41(v75) then v5.OptInVariant.ChatOptInInfoCard else l_OsaContextCard_0;
    end;
    if v49 then
        l_useEffect_0(function() --[[ Line: 167 ]]
            -- upvalues: v64 (copy), v74 (copy), v66 (copy), l_API_0 (ref), v7 (ref)
            if v64.conversationId and not v74 then
                v66(l_API_0(v64.conversationId)):catch(function(v77) --[[ Line: 169 ]]
                    -- upvalues: v7 (ref), v64 (ref)
                    v7:warning("Error fetching conversation in GroupOSADialog: " .. tostring(v77));
                    v64.onClose();
                end);
            end;
        end, {
            v66, 
            v64.conversationId
        });
    end;
    local v78 = nil;
    if l_FFlagGroupOSAGetConversationParticipants_0 then
        local l_source_0 = v75.source;
        v78 = l_useSelector_0(function(v80) --[[ Line: 181 ]]
            -- upvalues: v9 (ref), v64 (copy)
            return v9(v80, (("ChatAppReducer.ParticipantMetadata.%*"):format(v64.conversationId or "")));
        end);
        local l_l_source_0_0 = l_source_0 --[[ copy: 14 -> 37 ]];
        l_useEffect_0(function() --[[ Line: 185 ]]
            -- upvalues: l_l_source_0_0 (copy), v64 (copy), v66 (copy), v29 (ref), v7 (ref)
            if l_l_source_0_0 ~= "channels" or v64.conversationId == nil then
                return;
            else
                v66(v29.rodux.GetConversationsParticipantsMetadata.API({
                    v64.conversationId
                })):catch(function() --[[ Line: 191 ]]
                    -- upvalues: v7 (ref)
                    v7:warning("Error in GroupOSADialog -> GetConversationsParticipantsMetadata");
                end);
                return;
            end;
        end, {
            v66, 
            v64.conversationId, 
            l_source_0
        });
    end;
    local v84 = if v49 then v2.useMemo(function() --[[ Line: 198 ]]
        -- upvalues: v78 (ref)
        if not v78 then
            return nil;
        else
            for v82, v83 in v78 do
                if v83.isInviter then
                    return v82;
                end;
            end;
            return nil;
        end;
    end, {
        v78
    }) else nil;
    local v85 = if v49 then l_useUserProfilesFetch_0({
        userIds = if v84 then {
            v84
        } else {}, 
        query = v21.Queries.userProfilesCombinedNameAndUsernameByUserIds
    }) else nil;
    local v87 = v2.useMemo(function() --[[ Line: 220 ]]
        -- upvalues: v75 (copy), v3 (ref), v68 (copy)
        if not v75 or not v75.participants then
            return {};
        else
            return v3.List.filter(v75.participants, function(v86) --[[ Line: 224 ]]
                -- upvalues: v68 (ref)
                return tostring(v86) ~= v68;
            end);
        end;
    end, {
        v75, 
        v68
    });
    local v88 = v2.useMemo(function() --[[ Line: 230 ]]
        -- upvalues: v75 (copy), l_DateTime_0 (ref), v7 (ref), v64 (copy)
        if v75.createdAt then
            return l_DateTime_0.fromIsoDate(v75.createdAt):Format("MMM DD, YYYY");
        else
            v7:warning("Conversation createdAt not found for conversationId: " .. tostring(v64.conversationId));
            return " - ";
        end;
    end, {
        v75, 
        v64.conversationId
    });
    local v89 = v75.title or "";
    local v90 = if v85 then v85.data else nil;
    local v91 = if v85 then v85.loading else false;
    local v92 = if v49 then v2.useMemo(function() --[[ Line: 243 ]]
        -- upvalues: v84 (copy), v90 (copy), l_getCombinedNameFromId_0 (ref)
        if not v84 or not v90 then
            return nil;
        else
            return l_getCombinedNameFromId_0(v90, v84);
        end;
    end, {
        v84, 
        v90
    }) else nil;
    local v93 = v75.conversationType == v6.Type.MULTI_USER_CONVERSATION;
    local v94 = l_useLocalization_0({
        titleText = "Feature.Chat.Heading.YouWereInvitedToGroup", 
        inviterTitleText = {
            "Feature.Chat.Heading.UserInvitedYouToJoinAGroup"; 
            combinedName = v92 or ""
        }, 
        inviterTitleTextOneToOne = if v53 then {
            "Feature.Chat.Heading.UserInvitedYouToJoin"; 
            combinedName = v92 or ""
        } else nil, 
        groupCreatedOnText = {
            "Feature.Chat.Description.OSAGroupCreatedOnVariant1"; 
            group_name = v89, 
            creation_date = v88
        }, 
        subtitleText = if v53 then {
            "Feature.Chat.Description.ConversationInviteGroupCreatedOn"; 
            creation_date = v88
        } else nil, 
        footerText = "Feature.Chat.Description.OSAGroupDescription", 
        joinButtonText = "Feature.Chat.Action.GroupOSAJoin", 
        declineButtonText = "Feature.Chat.Action.GroupOSADoNotJoin", 
        blockedText = "Feature.Chat.Label.Blocked"
    });
    local v102 = v2.useMemo(function() --[[ Line: 283 ]]
        -- upvalues: v87 (copy), v78 (ref), v7 (ref), v2 (ref), l_UserRow_0 (ref), v64 (copy), v11 (ref), v94 (copy), l_BadgeVariant_0 (ref)
        local v95 = {};
        for v96, v97 in v87 do
            local v98 = tostring(v97);
            local v99 = v78 and v78[v98];
            if not v99 then
                v7:debug("Metadata not found for participant: " .. v98);
            end;
            local v100 = v99 and v99.isBlocked;
            local v101 = v2.createElement(l_UserRow_0, {
                entityId = v98, 
                layoutMode = "wide", 
                onActivated = v64.onViewUserProfile ~= nil and function() --[[ Line: 301 ]]
                    -- upvalues: v64 (ref), v98 (copy)
                    v64.onClose();
                    v64.onViewUserProfile(v98, {});
                end or nil
            });
            v95["Participant_" .. v98] = v2.createElement(v11.View, {
                tag = "size-full-0 auto-y", 
                LayoutOrder = v96
            }, {
                Row = v101, 
                Badge = v100 and v2.createElement(v11.View, {
                    tag = "auto-xy position-center-right anchor-center-right", 
                    ZIndex = 2
                }, {
                    BadgeContent = v2.createElement(v11.Badge, {
                        text = v94.blockedText, 
                        variant = l_BadgeVariant_0.Warning
                    })
                }) or nil
            });
        end;
        return v95;
    end, {
        v87, 
        v78, 
        v94.blockedText, 
        if v52 then v64.onViewUserProfile else nil, 
        if v52 then v64.onClose else nil
    });
    local v103 = if v44 then v2.useCallback(function() --[[ Line: 336 ]]
        -- upvalues: v72 (ref), v36 (ref), v65 (ref), v37 (ref), v64 (copy)
        v72.emit(v36.Events.ModalAction, {
            modalVariant = v65, 
            action = v37.Enums.ModalActions.Dismiss, 
            conversationId = v64.conversationId, 
            impressionId = v64.impressionId
        });
        v64.onClose();
    end, {
        v64.onClose, 
        v72, 
        v64.impressionId, 
        v64.conversationId, 
        v65
    }) else v64.onClose;
    local v104 = v2.useCallback(function() --[[ Line: 346 ]]
        -- upvalues: v73 (copy), v67 (copy), l_SquadPromptType_0 (ref)
        v73.setSquadPrompt(v67, {
            hideCancelButton = true, 
            promptType = l_SquadPromptType_0.Error
        });
    end, {
        v73.setSquadPrompt, 
        v67
    });
    local v105 = v10(v64.conversationId);
    local v108 = v2.useCallback(function() --[[ Line: 355 ]]
        -- upvalues: v47 (ref), v70 (copy), v71 (copy), v44 (ref), v65 (ref), v37 (ref), v64 (copy), v72 (ref), v36 (ref), v105 (copy), l_Accept_0 (ref), l_ConversationListOverlay_0 (ref), l_FFlagAppChatLiftPostAPICallActionsUp_0 (ref), v51 (ref), v66 (copy), l_API_0 (ref), v3 (ref), v7 (ref), v104 (copy)
        if v47 then
            if v70 then
                return;
            else
                v71(true);
            end;
        end;
        local v106 = nil;
        if v44 then
            v106 = {
                modalVariant = v65, 
                action = v37.Enums.ModalActions.PrimaryCta, 
                conversationId = v64.conversationId, 
                impressionId = v64.impressionId
            };
            v72.emit(v36.Events.ModalAction, v106);
        end;
        v105(l_Accept_0, l_ConversationListOverlay_0, nil, v65):andThen(function() --[[ Line: 374 ]]
            -- upvalues: l_FFlagAppChatLiftPostAPICallActionsUp_0 (ref), v51 (ref), v64 (ref), v66 (ref), l_API_0 (ref), v44 (ref), v72 (ref), v36 (ref), v3 (ref), v106 (ref), v37 (ref)
            if not l_FFlagAppChatLiftPostAPICallActionsUp_0 and not v51 and v64.conversationId then
                v66(l_API_0(v64.conversationId));
            end;
            if v44 then
                v72.emit(v36.Events.ModalActionResult, v3.Dictionary.union(v106, {
                    actionResult = v37.Enums.ModalActionResults.Success
                }));
            end;
            v64.onJoin();
        end):catch(function(v107) --[[ Line: 392 ]]
            -- upvalues: v44 (ref), v72 (ref), v36 (ref), v3 (ref), v106 (ref), v37 (ref), v7 (ref), v104 (ref), v64 (ref)
            if v44 then
                v72.emit(v36.Events.ModalActionResult, v3.Dictionary.union(v106, {
                    actionResult = v37.Enums.ModalActionResults.Failure
                }));
            end;
            v7:warning((("Error in GroupOSADialog Join-> RecordModalSequenceResponse: %*"):format((tostring(v107)))));
            v104();
            v64.onClose();
        end);
    end, {
        v64.onJoin, 
        v64.onClose, 
        v104, 
        v105, 
        v66, 
        v64.conversationId, 
        v65, 
        if v44 then v72 else nil, 
        if v44 then v64.impressionId else nil, 
        if v47 then v70 else nil
    });
    local v112 = v2.useCallback(function() --[[ Line: 420 ]]
        -- upvalues: v47 (ref), v70 (copy), v71 (copy), v44 (ref), v65 (ref), v37 (ref), v64 (copy), v72 (ref), v36 (ref), v48 (ref), v75 (copy), v6 (ref), v66 (copy), l_API_1 (ref), v68 (copy), v3 (ref), v7 (ref), v104 (copy), v45 (ref), v105 (copy), l_Decline_0 (ref), l_ConversationListOverlay_0 (ref), l_OsaContextCard_0 (ref), l_FFlagAppChatLiftPostAPICallActionsUp_0 (ref), v32 (ref)
        if v47 then
            if v70 then
                return;
            else
                v71(true);
            end;
        end;
        local v109 = nil;
        if v44 then
            v109 = {
                modalVariant = v65, 
                action = v37.Enums.ModalActions.SecondaryCta, 
                conversationId = v64.conversationId, 
                impressionId = v64.impressionId
            };
            v72.emit(v36.Events.ModalAction, v109);
        end;
        if v48 then
            if v64.conversationId then
                if v75.conversationType == v6.Type.MULTI_USER_CONVERSATION then
                    v66(l_API_1(v64.conversationId, v68)):andThen(function() --[[ Line: 445 ]]
                        -- upvalues: v44 (ref), v72 (ref), v36 (ref), v3 (ref), v109 (ref), v37 (ref), v64 (ref)
                        if v44 then
                            v72.emit(v36.Events.ModalActionResult, v3.Dictionary.union(v109, {
                                actionResult = v37.Enums.ModalActionResults.Success
                            }));
                        end;
                        v64.onDecline();
                    end):catch(function(v110) --[[ Line: 456 ]]
                        -- upvalues: v44 (ref), v72 (ref), v36 (ref), v3 (ref), v109 (ref), v37 (ref), v7 (ref), v104 (ref), v64 (ref)
                        if v44 then
                            v72.emit(v36.Events.ModalActionResult, v3.Dictionary.union(v109, {
                                actionResult = v37.Enums.ModalActionResults.Failure
                            }));
                        end;
                        v7:warning((("Error in GroupOSADialog Decline -> RemoveUserFromConversation: %*"):format((tostring(v110)))));
                        v104();
                        v64.onClose();
                    end);
                else
                    if v44 then
                        v72.emit(v36.Events.ModalActionResult, v3.Dictionary.union(v109, {
                            actionResult = v37.Enums.ModalActionResults.Success
                        }));
                    end;
                    v64.onDecline();
                end;
            end;
        else
            if v45 then
                v64.onDecline();
            end;
            v105(l_Decline_0, l_ConversationListOverlay_0, nil, l_OsaContextCard_0):andThen(function() --[[ Line: 488 ]]
                -- upvalues: v44 (ref), v72 (ref), v36 (ref), v3 (ref), v109 (ref), v37 (ref), l_FFlagAppChatLiftPostAPICallActionsUp_0 (ref), v64 (ref), v66 (ref), v32 (ref), v45 (ref)
                if v44 then
                    v72.emit(v36.Events.ModalActionResult, v3.Dictionary.union(v109, {
                        actionResult = v37.Enums.ModalActionResults.Success
                    }));
                end;
                if not l_FFlagAppChatLiftPostAPICallActionsUp_0 and v64.conversationId then
                    v66(v32(v64.conversationId));
                end;
                if not v45 then
                    v64.onDecline();
                end;
            end):catch(function(v111) --[[ Line: 504 ]]
                -- upvalues: v44 (ref), v72 (ref), v36 (ref), v3 (ref), v109 (ref), v37 (ref), v7 (ref), v104 (ref), v64 (ref)
                if v44 then
                    v72.emit(v36.Events.ModalActionResult, v3.Dictionary.union(v109, {
                        actionResult = v37.Enums.ModalActionResults.Failure
                    }));
                end;
                v7:warning((("Error in GroupOSADialog Decline -> RecordModalSequenceResponse: %*"):format((tostring(v111)))));
                v104();
                v64.onClose();
            end);
        end;
    end, {
        v64.onDecline, 
        v64.onClose, 
        v104, 
        if not v48 then v105 else nil, 
        v66, 
        v64.conversationId, 
        v65, 
        v75, 
        v68, 
        if v44 then v72 else nil, 
        if v44 then v64.impressionId else nil, 
        if v47 then v70 else nil, 
        if v48 then v68 else nil
    });
    local v113 = not v74;
    local v114 = false;
    if v75.source == "channels" then
        v114 = v78 == nil;
    end;
    local v115 = false;
    if v84 ~= nil then
        v115 = v91;
    end;
    local v116 = v49 and (v113 or v114 or v115);
    local v117 = nil;
    v117 = if v53 and v92 then if v93 then v94.inviterTitleText else v94.inviterTitleTextOneToOne else if v92 then v94.inviterTitleText else v94.titleText;
    local v118 = if v49 then v2.useMemo(function() --[[ Line: 556 ]]
        -- upvalues: v2 (ref), v11 (ref), l_Skeleton_0 (ref), v69 (copy), l_Radius_0 (ref)
        return v2.createElement(v11.View, {
            tag = "size-full-0 auto-y col gap-medium margin-top-small"
        }, {
            Heading = v2.createElement(l_Skeleton_0, {
                Size = UDim2.new(0.6, 0, 0, v69.Size.Size_1100), 
                radius = l_Radius_0.Medium, 
                LayoutOrder = 1
            }), 
            Row1 = v2.createElement(l_Skeleton_0, {
                Size = UDim2.new(1, 0, 0, v69.Size.Size_1200), 
                radius = l_Radius_0.Medium, 
                LayoutOrder = 2
            }), 
            Row2 = v2.createElement(l_Skeleton_0, {
                Size = UDim2.new(1, 0, 0, v69.Size.Size_1200), 
                radius = l_Radius_0.Medium, 
                LayoutOrder = 3
            }), 
            Row3 = v2.createElement(l_Skeleton_0, {
                Size = UDim2.new(1, 0, 0, v69.Size.Size_1200), 
                radius = l_Radius_0.Medium, 
                LayoutOrder = 4
            }), 
            Footer = v2.createElement(l_Skeleton_0, {
                Size = UDim2.new(1, 0, 0, v69.Size.Size_800), 
                radius = l_Radius_0.Medium, 
                LayoutOrder = 5
            })
        });
    end, {
        v69
    }) else nil;
    local v119 = v2.useMemo(function() --[[ Line: 590 ]]
        -- upvalues: v2 (ref), v11 (ref), l_Dialog_0 (ref), v53 (ref), v94 (copy), v102 (copy)
        return v2.createElement(v11.View, {
            tag = "auto-y size-full-0 col gap-medium"
        }, {
            DialogContentHeader = v2.createElement(l_Dialog_0.Text, {
                Text = if v53 then v94.subtitleText else v94.groupCreatedOnText, 
                LayoutOrder = 1
            }), 
            GroupMemberList = v2.createElement(v11.View, {
                tag = "size-full-0 auto-y col", 
                LayoutOrder = 2
            }, v102), 
            DialogContentFooter = v2.createElement(l_Dialog_0.Text, {
                Text = v94.footerText, 
                LayoutOrder = 3
            })
        });
    end, {
        v94.groupCreatedOnText, 
        v94.footerText, 
        v102, 
        if v53 then v94.subtitleText else nil
    });
    if v46 and not v74 then
        return nil;
    else
        return v2.createElement(l_Dialog_0.Root, {
            size = v64.dialogSize, 
            onClose = v103, 
            hasBackdrop = v64.hasBackdrop, 
            disablePortal = v64.disablePortal
        }, {
            DialogTitle = not v116 and v2.createElement(l_Dialog_0.Title, {
                text = v117, 
                LayoutOrder = 1
            }), 
            DialogContent = v2.createElement(l_Dialog_0.Content, {
                LayoutOrder = 2
            }, if v116 then v118 else v119), 
            DialogActions = not v116 and v2.createElement(l_Dialog_0.Actions, {
                LayoutOrder = 3, 
                orientation = l_Orientation_0.Vertical, 
                actions = {
                    {
                        text = v94.joinButtonText, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        onActivated = v108, 
                        isDisabled = if v47 then v70 else nil
                    }, 
                    {
                        text = v94.declineButtonText, 
                        variant = l_ButtonVariant_0.Standard, 
                        onActivated = v112, 
                        isDisabled = if v47 then v70 else nil
                    }
                }
            })
        });
    end;
end;