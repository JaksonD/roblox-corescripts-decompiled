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
local v45 = game:DefineFastFlag("AppChatGroupOsaNavigateBeforeRecordDecline1", false);
local v46 = game:DefineFastFlag("AppChatGroupOsaPreventBlankDialog1", false);
local v47 = game:DefineFastFlag("AppChatGroupOsaPreventDuplicateSubmit1", false);
local v48 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatAdjustDeclineToUseRemovedConversation);
local v49 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatLoadInNewOSAInfo);
local l_FFlagAppChatLiftPostAPICallActionsUp_0 = require(l_Parent_0.SharedFlags).FFlagAppChatLiftPostAPICallActionsUp;
local v51 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatUpdateConvAfterRecordModalSequence);
local v52 = require(l_script_FirstAncestor_0.Flags.FFlagSupportViewingUserProfileOnOSA);
local v53 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatUpdateOSAStrings);
local v54 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatGroupOsaViewDetailsLink);
local v55 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatHideViewDetailsNoWebview);
local v56 = game:DefineFastString("AppChatGroupOsaViewDetailsUrl", "https://en.help.roblox.com/hc/en-us/articles/360000432483-Party-chat-In-App");
local v57 = require(l_Parent_0.InlineRichText);
local l_Renderer_0 = v57.Renderer;
local l_LinkBehavior_0 = v57.Enums.LinkBehavior;
local v60 = require(l_script_FirstAncestor_0.Hooks.useAppPolicy);
local v61 = game.PlaceId > 0;
local v62 = {
    source = nil, 
    createdAt = nil, 
    title = ""
};
local l_ConversationListOverlay_0 = v5.ModalSequence.ConversationListOverlay;
local l_OsaContextCard_0 = v5.OptInVariant.OsaContextCard;
local l_Accept_0 = v5.ModalAction.Accept;
local l_Decline_0 = v5.ModalAction.Decline;
local v67 = {
    dialogSize = l_DialogSize_0.Medium, 
    disablePortal = false, 
    hasBackdrop = true, 
    onClose = function() --[[ Line: 117 ]] --[[ Name: onClose ]]

    end, 
    onJoin = function() --[[ Line: 118 ]] --[[ Name: onJoin ]]

    end, 
    onDecline = function() --[[ Line: 119 ]] --[[ Name: onDecline ]]

    end
};
local function _(v68, v69) --[[ Line: 122 ]] --[[ Name: resolveModalVariant ]]
    -- upvalues: v41 (copy), v5 (copy), l_OsaContextCard_0 (copy)
    if v68 then
        return v68;
    elseif v41(v69) then
        return v5.OptInVariant.ChatOptInInfoCard;
    else
        return l_OsaContextCard_0;
    end;
end;
return function(v71) --[[ Line: 136 ]] --[[ Name: GroupOSADialog ]]
    -- upvalues: v3 (copy), v67 (copy), l_FFlagAppChatEnableU13ChatOptIn_0 (copy), l_OsaContextCard_0 (copy), l_useDispatch_0 (copy), l_useStore_0 (copy), l_useLocalUserId_0 (copy), v49 (copy), l_useTokens_0 (copy), v54 (copy), v60 (copy), v2 (copy), v61 (copy), l_LinkBehavior_0 (copy), v55 (copy), v47 (copy), l_useEffect_0 (copy), v44 (copy), v34 (copy), v35 (copy), v36 (copy), l_SquadExternalContractContext_0 (copy), v8 (copy), v62 (copy), v41 (copy), v5 (copy), l_API_0 (copy), v7 (copy), l_FFlagGroupOSAGetConversationParticipants_0 (copy), l_useSelector_0 (copy), v9 (copy), v29 (copy), l_useUserProfilesFetch_0 (copy), v21 (copy), l_DateTime_0 (copy), l_getCombinedNameFromId_0 (copy), v6 (copy), l_useLocalization_0 (copy), v53 (copy), v56 (copy), l_UserRow_0 (copy), v11 (copy), l_BadgeVariant_0 (copy), v52 (copy), v37 (copy), l_SquadPromptType_0 (copy), v10 (copy), l_Accept_0 (copy), l_ConversationListOverlay_0 (copy), l_FFlagAppChatLiftPostAPICallActionsUp_0 (copy), v51 (copy), v48 (copy), l_API_1 (copy), v45 (copy), l_Decline_0 (copy), v32 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), l_Dialog_0 (copy), l_Renderer_0 (copy), v46 (copy), l_Orientation_0 (copy), l_ButtonVariant_0 (copy)
    local v72 = v3.Dictionary.union(v67, v71);
    local v73 = if l_FFlagAppChatEnableU13ChatOptIn_0 then v72.modalVariant else l_OsaContextCard_0;
    local v74 = l_useDispatch_0();
    local v75 = l_useStore_0();
    local v76 = l_useLocalUserId_0();
    local v77 = if v49 then l_useTokens_0() else nil;
    local v79 = if v54 then v60(function(v78) --[[ Line: 148 ]]
        return v78.getWebViewSupport();
    end) else nil;
    local v82 = if v54 then v2.useMemo(function() --[[ Line: 153 ]]
        -- upvalues: v79 (copy), v61 (ref), l_LinkBehavior_0 (ref), v55 (ref)
        return {
            evaluateLinkBehavior = function(_, _) --[[ Line: 155 ]] --[[ Name: evaluateLinkBehavior ]]
                -- upvalues: v79 (ref), v61 (ref), l_LinkBehavior_0 (ref), v55 (ref)
                if v79 and not v61 then
                    return l_LinkBehavior_0.Webview;
                elseif v55 then
                    return l_LinkBehavior_0.Hide;
                else
                    return l_LinkBehavior_0.LinkingProtocol;
                end;
            end
        };
    end, {
        v79
    }) else nil;
    local v83, v84 = v2.useState(false);
    if v47 then
        l_useEffect_0(function() --[[ Line: 173 ]]
            -- upvalues: v84 (copy)
            return function() --[[ Line: 174 ]]
                -- upvalues: v84 (ref)
                v84(false);
            end;
        end, {});
    end;
    local v85 = nil;
    if v44 then
        v85 = v34(v35.Context);
        l_useEffect_0(function() --[[ Line: 183 ]]
            -- upvalues: v85 (ref), v36 (ref), v73 (ref), v72 (copy)
            v85.emit(v36.Events.ModalRendered, {
                modalVariant = v73, 
                conversationId = v72.conversationId, 
                impressionId = v72.impressionId
            });
        end, {
            v72.impressionId, 
            v72.conversationId, 
            v73
        });
    end;
    local v86 = v2.useContext(l_SquadExternalContractContext_0);
    local v87 = v8(v72.conversationId);
    local v88 = v87 or v62;
    if l_FFlagAppChatEnableU13ChatOptIn_0 then
        local l_v73_0 = v73;
        v73 = if l_v73_0 then l_v73_0 else if v41(v88) then v5.OptInVariant.ChatOptInInfoCard else l_OsaContextCard_0;
    end;
    if v49 then
        l_useEffect_0(function() --[[ Line: 202 ]]
            -- upvalues: v72 (copy), v87 (copy), v74 (copy), l_API_0 (ref), v7 (ref)
            if v72.conversationId and not v87 then
                v74(l_API_0(v72.conversationId)):catch(function(v90) --[[ Line: 204 ]]
                    -- upvalues: v7 (ref), v72 (ref)
                    v7:warning("Error fetching conversation in GroupOSADialog: " .. tostring(v90));
                    v72.onClose();
                end);
            end;
        end, {
            v74, 
            v72.conversationId
        });
    end;
    local v91 = nil;
    if l_FFlagGroupOSAGetConversationParticipants_0 then
        local l_source_0 = v88.source;
        v91 = l_useSelector_0(function(v93) --[[ Line: 216 ]]
            -- upvalues: v9 (ref), v72 (copy)
            return v9(v93, (("ChatAppReducer.ParticipantMetadata.%*"):format(v72.conversationId or "")));
        end);
        local l_l_source_0_0 = l_source_0 --[[ copy: 16 -> 39 ]];
        l_useEffect_0(function() --[[ Line: 220 ]]
            -- upvalues: l_l_source_0_0 (copy), v72 (copy), v74 (copy), v29 (ref), v7 (ref)
            if l_l_source_0_0 ~= "channels" or v72.conversationId == nil then
                return;
            else
                v74(v29.rodux.GetConversationsParticipantsMetadata.API({
                    v72.conversationId
                })):catch(function() --[[ Line: 226 ]]
                    -- upvalues: v7 (ref)
                    v7:warning("Error in GroupOSADialog -> GetConversationsParticipantsMetadata");
                end);
                return;
            end;
        end, {
            v74, 
            v72.conversationId, 
            l_source_0
        });
    end;
    local v97 = if v49 then v2.useMemo(function() --[[ Line: 233 ]]
        -- upvalues: v91 (ref)
        if not v91 then
            return nil;
        else
            for v95, v96 in v91 do
                if v96.isInviter then
                    return v95;
                end;
            end;
            return nil;
        end;
    end, {
        v91
    }) else nil;
    local v98 = if v49 then l_useUserProfilesFetch_0({
        userIds = if v97 then {
            v97
        } else {}, 
        query = v21.Queries.userProfilesCombinedNameAndUsernameByUserIds
    }) else nil;
    local v100 = v2.useMemo(function() --[[ Line: 255 ]]
        -- upvalues: v88 (copy), v3 (ref), v76 (copy)
        if not v88 or not v88.participants then
            return {};
        else
            return v3.List.filter(v88.participants, function(v99) --[[ Line: 259 ]]
                -- upvalues: v76 (ref)
                return tostring(v99) ~= v76;
            end);
        end;
    end, {
        v88, 
        v76
    });
    local v101 = v2.useMemo(function() --[[ Line: 265 ]]
        -- upvalues: v88 (copy), l_DateTime_0 (ref), v7 (ref), v72 (copy)
        if v88.createdAt then
            return l_DateTime_0.fromIsoDate(v88.createdAt):Format("MMM DD, YYYY");
        else
            v7:warning("Conversation createdAt not found for conversationId: " .. tostring(v72.conversationId));
            return " - ";
        end;
    end, {
        v88, 
        v72.conversationId
    });
    local v102 = v88.title or "";
    local v103 = if v98 then v98.data else nil;
    local v104 = if v98 then v98.loading else false;
    local v105 = if v49 then v2.useMemo(function() --[[ Line: 278 ]]
        -- upvalues: v97 (copy), v103 (copy), l_getCombinedNameFromId_0 (ref)
        if not v97 or not v103 then
            return nil;
        else
            return l_getCombinedNameFromId_0(v103, v97);
        end;
    end, {
        v97, 
        v103
    }) else nil;
    local v106 = v88.conversationType == v6.Type.MULTI_USER_CONVERSATION;
    local v107 = l_useLocalization_0({
        titleText = "Feature.Chat.Heading.YouWereInvitedToGroup", 
        inviterTitleText = {
            "Feature.Chat.Heading.UserInvitedYouToJoinAGroup"; 
            combinedName = v105 or ""
        }, 
        inviterTitleTextOneToOne = if v53 then {
            "Feature.Chat.Heading.UserInvitedYouToJoin"; 
            combinedName = v105 or ""
        } else nil, 
        groupCreatedOnText = {
            "Feature.Chat.Description.OSAGroupCreatedOnVariant1"; 
            group_name = v102, 
            creation_date = v101
        }, 
        subtitleText = if v53 then {
            "Feature.Chat.Description.ConversationInviteGroupCreatedOn"; 
            creation_date = v101
        } else nil, 
        footerText = if v54 then {
            "Feature.Chat.Description.OSAGroupDescriptionWithLinker"; 
            osaViewDetailsUrl = v56
        } else "Feature.Chat.Description.OSAGroupDescription", 
        joinButtonText = "Feature.Chat.Action.GroupOSAJoin", 
        declineButtonText = "Feature.Chat.Action.GroupOSADoNotJoin", 
        blockedText = "Feature.Chat.Label.Blocked"
    });
    local v115 = v2.useMemo(function() --[[ Line: 323 ]]
        -- upvalues: v100 (copy), v91 (ref), v7 (ref), v2 (ref), l_UserRow_0 (ref), v72 (copy), v11 (ref), v107 (copy), l_BadgeVariant_0 (ref)
        local v108 = {};
        for v109, v110 in v100 do
            local v111 = tostring(v110);
            local v112 = v91 and v91[v111];
            if not v112 then
                v7:debug("Metadata not found for participant: " .. v111);
            end;
            local v113 = v112 and v112.isBlocked;
            local v114 = v2.createElement(l_UserRow_0, {
                entityId = v111, 
                layoutMode = "wide", 
                onActivated = v72.onViewUserProfile ~= nil and function() --[[ Line: 341 ]]
                    -- upvalues: v72 (ref), v111 (copy)
                    v72.onClose();
                    v72.onViewUserProfile(v111, {});
                end or nil
            });
            v108["Participant_" .. v111] = v2.createElement(v11.View, {
                tag = "size-full-0 auto-y", 
                LayoutOrder = v109
            }, {
                Row = v114, 
                Badge = v113 and v2.createElement(v11.View, {
                    tag = "auto-xy position-center-right anchor-center-right", 
                    ZIndex = 2
                }, {
                    BadgeContent = v2.createElement(v11.Badge, {
                        text = v107.blockedText, 
                        variant = l_BadgeVariant_0.Warning
                    })
                }) or nil
            });
        end;
        return v108;
    end, {
        v100, 
        v91, 
        v107.blockedText, 
        if v52 then v72.onViewUserProfile else nil, 
        if v52 then v72.onClose else nil
    });
    local v116 = if v44 then v2.useCallback(function() --[[ Line: 376 ]]
        -- upvalues: v85 (ref), v36 (ref), v73 (ref), v37 (ref), v72 (copy)
        v85.emit(v36.Events.ModalAction, {
            modalVariant = v73, 
            action = v37.Enums.ModalActions.Dismiss, 
            conversationId = v72.conversationId, 
            impressionId = v72.impressionId
        });
        v72.onClose();
    end, {
        v72.onClose, 
        v85, 
        v72.impressionId, 
        v72.conversationId, 
        v73
    }) else v72.onClose;
    local v117 = v2.useCallback(function() --[[ Line: 386 ]]
        -- upvalues: v86 (copy), v75 (copy), l_SquadPromptType_0 (ref)
        v86.setSquadPrompt(v75, {
            hideCancelButton = true, 
            promptType = l_SquadPromptType_0.Error
        });
    end, {
        v86.setSquadPrompt, 
        v75
    });
    local v118 = v10(v72.conversationId);
    local v121 = v2.useCallback(function() --[[ Line: 395 ]]
        -- upvalues: v47 (ref), v83 (copy), v84 (copy), v44 (ref), v73 (ref), v37 (ref), v72 (copy), v85 (ref), v36 (ref), v118 (copy), l_Accept_0 (ref), l_ConversationListOverlay_0 (ref), l_FFlagAppChatLiftPostAPICallActionsUp_0 (ref), v51 (ref), v74 (copy), l_API_0 (ref), v3 (ref), v7 (ref), v117 (copy)
        if v47 then
            if v83 then
                return;
            else
                v84(true);
            end;
        end;
        local v119 = nil;
        if v44 then
            v119 = {
                modalVariant = v73, 
                action = v37.Enums.ModalActions.PrimaryCta, 
                conversationId = v72.conversationId, 
                impressionId = v72.impressionId
            };
            v85.emit(v36.Events.ModalAction, v119);
        end;
        v118(l_Accept_0, l_ConversationListOverlay_0, nil, v73):andThen(function() --[[ Line: 414 ]]
            -- upvalues: l_FFlagAppChatLiftPostAPICallActionsUp_0 (ref), v51 (ref), v72 (ref), v74 (ref), l_API_0 (ref), v44 (ref), v85 (ref), v36 (ref), v3 (ref), v119 (ref), v37 (ref)
            if not l_FFlagAppChatLiftPostAPICallActionsUp_0 and not v51 and v72.conversationId then
                v74(l_API_0(v72.conversationId));
            end;
            if v44 then
                v85.emit(v36.Events.ModalActionResult, v3.Dictionary.union(v119, {
                    actionResult = v37.Enums.ModalActionResults.Success
                }));
            end;
            v72.onJoin();
        end):catch(function(v120) --[[ Line: 432 ]]
            -- upvalues: v44 (ref), v85 (ref), v36 (ref), v3 (ref), v119 (ref), v37 (ref), v7 (ref), v117 (ref), v72 (ref)
            if v44 then
                v85.emit(v36.Events.ModalActionResult, v3.Dictionary.union(v119, {
                    actionResult = v37.Enums.ModalActionResults.Failure
                }));
            end;
            v7:warning((("Error in GroupOSADialog Join-> RecordModalSequenceResponse: %*"):format((tostring(v120)))));
            v117();
            v72.onClose();
        end);
    end, {
        v72.onJoin, 
        v72.onClose, 
        v117, 
        v118, 
        v74, 
        v72.conversationId, 
        v73, 
        if v44 then v85 else nil, 
        if v44 then v72.impressionId else nil, 
        if v47 then v83 else nil
    });
    local v125 = v2.useCallback(function() --[[ Line: 460 ]]
        -- upvalues: v47 (ref), v83 (copy), v84 (copy), v44 (ref), v73 (ref), v37 (ref), v72 (copy), v85 (ref), v36 (ref), v48 (ref), v88 (copy), v6 (ref), v74 (copy), l_API_1 (ref), v76 (copy), v3 (ref), v7 (ref), v117 (copy), v45 (ref), v118 (copy), l_Decline_0 (ref), l_ConversationListOverlay_0 (ref), l_OsaContextCard_0 (ref), l_FFlagAppChatLiftPostAPICallActionsUp_0 (ref), v32 (ref)
        if v47 then
            if v83 then
                return;
            else
                v84(true);
            end;
        end;
        local v122 = nil;
        if v44 then
            v122 = {
                modalVariant = v73, 
                action = v37.Enums.ModalActions.SecondaryCta, 
                conversationId = v72.conversationId, 
                impressionId = v72.impressionId
            };
            v85.emit(v36.Events.ModalAction, v122);
        end;
        if v48 then
            if v72.conversationId then
                if v88.conversationType == v6.Type.MULTI_USER_CONVERSATION then
                    v74(l_API_1(v72.conversationId, v76)):andThen(function() --[[ Line: 485 ]]
                        -- upvalues: v44 (ref), v85 (ref), v36 (ref), v3 (ref), v122 (ref), v37 (ref), v72 (ref)
                        if v44 then
                            v85.emit(v36.Events.ModalActionResult, v3.Dictionary.union(v122, {
                                actionResult = v37.Enums.ModalActionResults.Success
                            }));
                        end;
                        v72.onDecline();
                    end):catch(function(v123) --[[ Line: 496 ]]
                        -- upvalues: v44 (ref), v85 (ref), v36 (ref), v3 (ref), v122 (ref), v37 (ref), v7 (ref), v117 (ref), v72 (ref)
                        if v44 then
                            v85.emit(v36.Events.ModalActionResult, v3.Dictionary.union(v122, {
                                actionResult = v37.Enums.ModalActionResults.Failure
                            }));
                        end;
                        v7:warning((("Error in GroupOSADialog Decline -> RemoveUserFromConversation: %*"):format((tostring(v123)))));
                        v117();
                        v72.onClose();
                    end);
                else
                    if v44 then
                        v85.emit(v36.Events.ModalActionResult, v3.Dictionary.union(v122, {
                            actionResult = v37.Enums.ModalActionResults.Success
                        }));
                    end;
                    v72.onDecline();
                end;
            end;
        else
            if v45 then
                v72.onDecline();
            end;
            v118(l_Decline_0, l_ConversationListOverlay_0, nil, l_OsaContextCard_0):andThen(function() --[[ Line: 528 ]]
                -- upvalues: v44 (ref), v85 (ref), v36 (ref), v3 (ref), v122 (ref), v37 (ref), l_FFlagAppChatLiftPostAPICallActionsUp_0 (ref), v72 (ref), v74 (ref), v32 (ref), v45 (ref)
                if v44 then
                    v85.emit(v36.Events.ModalActionResult, v3.Dictionary.union(v122, {
                        actionResult = v37.Enums.ModalActionResults.Success
                    }));
                end;
                if not l_FFlagAppChatLiftPostAPICallActionsUp_0 and v72.conversationId then
                    v74(v32(v72.conversationId));
                end;
                if not v45 then
                    v72.onDecline();
                end;
            end):catch(function(v124) --[[ Line: 544 ]]
                -- upvalues: v44 (ref), v85 (ref), v36 (ref), v3 (ref), v122 (ref), v37 (ref), v7 (ref), v117 (ref), v72 (ref)
                if v44 then
                    v85.emit(v36.Events.ModalActionResult, v3.Dictionary.union(v122, {
                        actionResult = v37.Enums.ModalActionResults.Failure
                    }));
                end;
                v7:warning((("Error in GroupOSADialog Decline -> RecordModalSequenceResponse: %*"):format((tostring(v124)))));
                v117();
                v72.onClose();
            end);
        end;
    end, {
        v72.onDecline, 
        v72.onClose, 
        v117, 
        if not v48 then v118 else nil, 
        v74, 
        v72.conversationId, 
        v73, 
        v88, 
        v76, 
        if v44 then v85 else nil, 
        if v44 then v72.impressionId else nil, 
        if v47 then v83 else nil, 
        if v48 then v76 else nil
    });
    local v126 = not v87;
    local v127 = false;
    if v88.source == "channels" then
        v127 = v91 == nil;
    end;
    local v128 = false;
    if v97 ~= nil then
        v128 = v104;
    end;
    local v129 = v49 and (v126 or v127 or v128);
    local v130 = nil;
    v130 = if v53 and v105 then if v106 then v107.inviterTitleText else v107.inviterTitleTextOneToOne else if v105 then v107.inviterTitleText else v107.titleText;
    local v131 = if v49 then v2.useMemo(function() --[[ Line: 596 ]]
        -- upvalues: v2 (ref), v11 (ref), l_Skeleton_0 (ref), v77 (copy), l_Radius_0 (ref)
        return v2.createElement(v11.View, {
            tag = "size-full-0 auto-y col gap-medium margin-top-small"
        }, {
            Heading = v2.createElement(l_Skeleton_0, {
                Size = UDim2.new(0.6, 0, 0, v77.Size.Size_1100), 
                radius = l_Radius_0.Medium, 
                LayoutOrder = 1
            }), 
            Row1 = v2.createElement(l_Skeleton_0, {
                Size = UDim2.new(1, 0, 0, v77.Size.Size_1200), 
                radius = l_Radius_0.Medium, 
                LayoutOrder = 2
            }), 
            Row2 = v2.createElement(l_Skeleton_0, {
                Size = UDim2.new(1, 0, 0, v77.Size.Size_1200), 
                radius = l_Radius_0.Medium, 
                LayoutOrder = 3
            }), 
            Row3 = v2.createElement(l_Skeleton_0, {
                Size = UDim2.new(1, 0, 0, v77.Size.Size_1200), 
                radius = l_Radius_0.Medium, 
                LayoutOrder = 4
            }), 
            Footer = v2.createElement(l_Skeleton_0, {
                Size = UDim2.new(1, 0, 0, v77.Size.Size_800), 
                radius = l_Radius_0.Medium, 
                LayoutOrder = 5
            })
        });
    end, {
        v77
    }) else nil;
    local v132 = v2.useMemo(function() --[[ Line: 630 ]]
        -- upvalues: v2 (ref), v11 (ref), l_Dialog_0 (ref), v53 (ref), v107 (copy), v115 (copy), v54 (ref), l_Renderer_0 (ref), v77 (copy), v82 (copy)
        return v2.createElement(v11.View, {
            tag = "auto-y size-full-0 col gap-medium"
        }, {
            DialogContentHeader = v2.createElement(l_Dialog_0.Text, {
                Text = if v53 then v107.subtitleText else v107.groupCreatedOnText, 
                LayoutOrder = 1
            }), 
            GroupMemberList = v2.createElement(v11.View, {
                tag = "size-full-0 auto-y col", 
                LayoutOrder = 2
            }, v115), 
            DialogContentFooter = if v54 then v2.createElement(l_Renderer_0, {
                text = v107.footerText, 
                textStyle = v77.Color.Content.Default, 
                fontStyle = v77.Typography.BodyMedium, 
                linkerOptions = v82, 
                wrapperProps = {
                    tag = "size-full-0 auto-y", 
                    LayoutOrder = 3
                }
            }) else v2.createElement(l_Dialog_0.Text, {
                Text = v107.footerText, 
                LayoutOrder = 3
            })
        });
    end, {
        v107.groupCreatedOnText, 
        v107.footerText, 
        v115, 
        if v53 then v107.subtitleText else nil
    });
    if v46 and not v87 then
        return nil;
    else
        return v2.createElement(l_Dialog_0.Root, {
            size = v72.dialogSize, 
            onClose = v116, 
            hasBackdrop = v72.hasBackdrop, 
            disablePortal = v72.disablePortal
        }, {
            DialogTitle = not v129 and v2.createElement(l_Dialog_0.Title, {
                text = v130, 
                LayoutOrder = 1
            }), 
            DialogContent = v2.createElement(l_Dialog_0.Content, {
                LayoutOrder = 2
            }, if v129 then v131 else v132), 
            DialogActions = not v129 and v2.createElement(l_Dialog_0.Actions, {
                LayoutOrder = 3, 
                orientation = l_Orientation_0.Vertical, 
                actions = {
                    {
                        text = v107.joinButtonText, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        onActivated = v121, 
                        isDisabled = if v47 then v83 else nil
                    }, 
                    {
                        text = v107.declineButtonText, 
                        variant = l_ButtonVariant_0.Standard, 
                        onActivated = v125, 
                        isDisabled = if v47 then v83 else nil
                    }
                }
            })
        });
    end;
end;