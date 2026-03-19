local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local l_DateTime_0 = require(l_Parent_0.Time).DateTime;
local v5 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local v6 = require(l_script_FirstAncestor_0.Hooks.useGetConversationFromId);
local v7 = require(l_script_FirstAncestor_0.Utils.getDeepValue2);
local v8 = require(l_script_FirstAncestor_0.Hooks.useRecordModalSequenceResponseForConversation);
local v9 = require(l_Parent_0.Foundation);
local l_Dialog_0 = v9.Dialog;
local l_DialogSize_0 = v9.Enums.DialogSize;
local l_ButtonVariant_0 = v9.Enums.ButtonVariant;
local l_BadgeVariant_0 = v9.Enums.BadgeVariant;
local l_Orientation_0 = v9.Enums.Orientation;
local l_Skeleton_0 = v9.Skeleton;
local l_Radius_0 = v9.Enums.Radius;
local l_useTokens_0 = v9.Hooks.useTokens;
local l_UserRow_0 = require(l_Parent_0.UserList).UserRow;
local v19 = require(l_Parent_0.UserProfiles);
local l_useUserProfilesFetch_0 = v19.Hooks.useUserProfilesFetch;
local l_getCombinedNameFromId_0 = v19.Selectors.getCombinedNameFromId;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useStore_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useStore;
local l_useEffect_0 = v2.useEffect;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v27 = require(l_Parent_0.AppChatNetworking);
local l_API_0 = v27.rodux.GetConversationDetails.API;
local v29 = require(l_script_FirstAncestor_0.Conversations.Actions.RemovedConversation);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v31 = require(l_script_FirstAncestor_0.Telemetry.useTelemetry);
local v32 = require(l_script_FirstAncestor_0.Telemetry.Layers.AppTelemetryLayer);
local v33 = require(l_script_FirstAncestor_0.Components.OSA.ConversationListOverlayTelemetry);
local v34 = require(l_script_FirstAncestor_0.Components.ModalTelemetry);
local v35 = require(l_Parent_0.SquadsCore);
local l_SquadExternalContractContext_0 = v35.SquadExternalContractProvider.SquadExternalContractContext;
local l_SquadPromptType_0 = v35.Enums.SquadPromptType;
local l_FFlagGroupOSAGetConversationParticipants_0 = require(l_script_FirstAncestor_0.Flags).FFlagGroupOSAGetConversationParticipants;
local v39 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatGroupOsaAnalytics);
local v40 = game:DefineFastFlag("AppChatGroupOsaNavigateBeforeRecordDecline", false);
local v41 = game:DefineFastFlag("AppChatGroupOsaPreventBlankDialog", false);
local v42 = game:DefineFastFlag("AppChatGroupOsaPreventDuplicateSubmit", false);
local v43 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatLoadInNewOSAInfo);
local v44 = require(l_script_FirstAncestor_0.Flags.FFlagSupportViewingUserProfileOnOSA);
local v45 = {
    source = nil, 
    createdAt = nil, 
    title = ""
};
local v46 = {
    dialogSize = l_DialogSize_0.Medium, 
    disablePortal = false, 
    hasBackdrop = true, 
    onClose = function() --[[ Line: 91 ]] --[[ Name: onClose ]]

    end, 
    onJoin = function() --[[ Line: 92 ]] --[[ Name: onJoin ]]

    end, 
    onDecline = function() --[[ Line: 93 ]] --[[ Name: onDecline ]]

    end
};
return function(v47) --[[ Line: 96 ]] --[[ Name: GroupOSADialog ]]
    -- upvalues: v3 (copy), v46 (copy), l_useDispatch_0 (copy), l_useStore_0 (copy), l_useLocalUserId_0 (copy), v43 (copy), l_useTokens_0 (copy), v2 (copy), v42 (copy), l_useEffect_0 (copy), v39 (copy), v31 (copy), v32 (copy), v33 (copy), l_SquadExternalContractContext_0 (copy), v6 (copy), v45 (copy), l_API_0 (copy), v5 (copy), l_FFlagGroupOSAGetConversationParticipants_0 (copy), l_useSelector_0 (copy), v7 (copy), v27 (copy), l_useUserProfilesFetch_0 (copy), v19 (copy), l_DateTime_0 (copy), l_getCombinedNameFromId_0 (copy), l_useLocalization_0 (copy), l_UserRow_0 (copy), v9 (copy), l_BadgeVariant_0 (copy), v44 (copy), v34 (copy), l_SquadPromptType_0 (copy), v8 (copy), v40 (copy), v29 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), l_Dialog_0 (copy), v41 (copy), l_Orientation_0 (copy), l_ButtonVariant_0 (copy)
    local v48 = v3.Dictionary.union(v46, v47);
    local v49 = l_useDispatch_0();
    local v50 = l_useStore_0();
    local v51 = l_useLocalUserId_0();
    local v52 = if v43 then l_useTokens_0() else nil;
    local v53, v54 = v2.useState(false);
    if v42 then
        l_useEffect_0(function() --[[ Line: 108 ]]
            -- upvalues: v54 (copy)
            return function() --[[ Line: 109 ]]
                -- upvalues: v54 (ref)
                v54(false);
            end;
        end, {});
    end;
    local v55 = nil;
    if v39 then
        v55 = v31(v32.Context);
        l_useEffect_0(function() --[[ Line: 118 ]]
            -- upvalues: v55 (ref), v33 (ref), v48 (copy)
            v55.emit(v33.Events.ModalRendered, {
                modalVariant = "OsaContextCard", 
                conversationId = v48.conversationId, 
                impressionId = v48.impressionId
            });
        end, {
            v48.impressionId, 
            v48.conversationId
        });
    end;
    local v56 = v2.useContext(l_SquadExternalContractContext_0);
    local v57 = v6(v48.conversationId);
    local v58 = v57 or v45;
    if v43 then
        l_useEffect_0(function() --[[ Line: 134 ]]
            -- upvalues: v48 (copy), v57 (copy), v49 (copy), l_API_0 (ref), v5 (ref)
            if v48.conversationId and not v57 then
                v49(l_API_0(v48.conversationId)):catch(function(v59) --[[ Line: 136 ]]
                    -- upvalues: v5 (ref), v48 (ref)
                    v5:warning("Error fetching conversation in GroupOSADialog: " .. tostring(v59));
                    v48.onClose();
                end);
            end;
        end, {
            v49, 
            v48.conversationId
        });
    end;
    local v60 = nil;
    if l_FFlagGroupOSAGetConversationParticipants_0 then
        local l_source_0 = v58.source;
        v60 = l_useSelector_0(function(v62) --[[ Line: 148 ]]
            -- upvalues: v7 (ref), v48 (copy)
            return v7(v62, (("ChatAppReducer.ParticipantMetadata.%*"):format(v48.conversationId or "")));
        end);
        local l_l_source_0_0 = l_source_0 --[[ copy: 13 -> 35 ]];
        l_useEffect_0(function() --[[ Line: 152 ]]
            -- upvalues: l_l_source_0_0 (copy), v48 (copy), v49 (copy), v27 (ref), v5 (ref)
            if l_l_source_0_0 ~= "channels" or v48.conversationId == nil then
                return;
            else
                v49(v27.rodux.GetConversationsParticipantsMetadata.API({
                    v48.conversationId
                })):catch(function() --[[ Line: 158 ]]
                    -- upvalues: v5 (ref)
                    v5:warning("Error in GroupOSADialog -> GetConversationsParticipantsMetadata");
                end);
                return;
            end;
        end, {
            v49, 
            v48.conversationId, 
            l_source_0
        });
    end;
    local v66 = if v43 then v2.useMemo(function() --[[ Line: 165 ]]
        -- upvalues: v60 (ref)
        if not v60 then
            return nil;
        else
            for v64, v65 in v60 do
                if v65.isInviter then
                    return v64;
                end;
            end;
            return nil;
        end;
    end, {
        v60
    }) else nil;
    local v67 = if v43 then l_useUserProfilesFetch_0({
        userIds = if v66 then {
            v66
        } else {}, 
        query = v19.Queries.userProfilesCombinedNameAndUsernameByUserIds
    }) else nil;
    local v69 = v2.useMemo(function() --[[ Line: 187 ]]
        -- upvalues: v58 (copy), v3 (ref), v51 (copy)
        if not v58 or not v58.participants then
            return {};
        else
            return v3.List.filter(v58.participants, function(v68) --[[ Line: 191 ]]
                -- upvalues: v51 (ref)
                return tostring(v68) ~= v51;
            end);
        end;
    end, {
        v58, 
        v51
    });
    local v70 = v2.useMemo(function() --[[ Line: 197 ]]
        -- upvalues: v58 (copy), l_DateTime_0 (ref), v5 (ref), v48 (copy)
        if v58.createdAt then
            return l_DateTime_0.fromIsoDate(v58.createdAt):Format("MMM DD, YYYY");
        else
            v5:warning("Conversation createdAt not found for conversationId: " .. tostring(v48.conversationId));
            return " - ";
        end;
    end, {
        v58, 
        v48.conversationId
    });
    local v71 = v58.title or "";
    local v72 = if v67 then v67.data else nil;
    local v73 = if v67 then v67.loading else false;
    local v74 = if v43 then v2.useMemo(function() --[[ Line: 210 ]]
        -- upvalues: v66 (copy), v72 (copy), l_getCombinedNameFromId_0 (ref)
        if not v66 or not v72 then
            return nil;
        else
            return l_getCombinedNameFromId_0(v72, v66);
        end;
    end, {
        v66, 
        v72
    }) else nil;
    local v75 = l_useLocalization_0({
        titleText = "Feature.Chat.Heading.YouWereInvitedToGroup", 
        inviterTitleText = {
            "Feature.Chat.Heading.UserInvitedYouToJoinAGroup"; 
            combinedName = v74 or ""
        }, 
        groupCreatedOnText = {
            "Feature.Chat.Description.OSAGroupCreatedOnVariant1"; 
            group_name = v71, 
            creation_date = v70
        }, 
        footerText = "Feature.Chat.Description.OSAGroupDescription", 
        joinButtonText = "Feature.Chat.Action.GroupOSAJoin", 
        declineButtonText = "Feature.Chat.Action.GroupOSADoNotJoin", 
        blockedText = "Feature.Chat.Label.Blocked"
    });
    local v83 = v2.useMemo(function() --[[ Line: 236 ]]
        -- upvalues: v69 (copy), v60 (ref), v5 (ref), v2 (ref), l_UserRow_0 (ref), v48 (copy), v9 (ref), v75 (copy), l_BadgeVariant_0 (ref)
        local v76 = {};
        for v77, v78 in v69 do
            local v79 = tostring(v78);
            local v80 = v60 and v60[v79];
            if not v80 then
                v5:debug("Metadata not found for participant: " .. v79);
            end;
            local v81 = v80 and v80.isBlocked;
            local v82 = v2.createElement(l_UserRow_0, {
                entityId = v79, 
                layoutMode = "wide", 
                onActivated = v48.onViewUserProfile ~= nil and function() --[[ Line: 254 ]]
                    -- upvalues: v48 (ref), v79 (copy)
                    v48.onClose();
                    v48.onViewUserProfile(v79, {});
                end or nil
            });
            v76["Participant_" .. v79] = v2.createElement(v9.View, {
                tag = "size-full-0 auto-y", 
                LayoutOrder = v77
            }, {
                Row = v82, 
                Badge = v81 and v2.createElement(v9.View, {
                    tag = "auto-xy position-center-right anchor-center-right", 
                    ZIndex = 2
                }, {
                    BadgeContent = v2.createElement(v9.Badge, {
                        text = v75.blockedText, 
                        variant = l_BadgeVariant_0.Warning
                    })
                }) or nil
            });
        end;
        return v76;
    end, {
        v69, 
        v60, 
        v75.blockedText, 
        if v44 then v48.onViewUserProfile else nil, 
        if v44 then v48.onClose else nil
    });
    local v84 = if v39 then v2.useCallback(function() --[[ Line: 289 ]]
        -- upvalues: v55 (ref), v33 (ref), v34 (ref), v48 (copy)
        v55.emit(v33.Events.ModalAction, {
            modalVariant = "OsaContextCard", 
            action = v34.Enums.ModalActions.Dismiss, 
            conversationId = v48.conversationId, 
            impressionId = v48.impressionId
        });
        v48.onClose();
    end, {
        v48.onClose, 
        v55, 
        v48.impressionId, 
        v48.conversationId
    }) else v48.onClose;
    local v85 = v2.useCallback(function() --[[ Line: 299 ]]
        -- upvalues: v56 (copy), v50 (copy), l_SquadPromptType_0 (ref)
        v56.setSquadPrompt(v50, {
            hideCancelButton = true, 
            promptType = l_SquadPromptType_0.Error
        });
    end, {
        v56.setSquadPrompt, 
        v50
    });
    local v86 = v8(v48.conversationId);
    local v89 = v2.useCallback(function() --[[ Line: 308 ]]
        -- upvalues: v42 (ref), v53 (copy), v54 (copy), v39 (ref), v34 (ref), v48 (copy), v55 (ref), v33 (ref), v86 (copy), v49 (copy), l_API_0 (ref), v3 (ref), v5 (ref), v85 (copy)
        if v42 then
            if v53 then
                return;
            else
                v54(true);
            end;
        end;
        local v87 = nil;
        if v39 then
            v87 = {
                modalVariant = "OsaContextCard", 
                action = v34.Enums.ModalActions.PrimaryCta, 
                conversationId = v48.conversationId, 
                impressionId = v48.impressionId
            };
            v55.emit(v33.Events.ModalAction, v87);
        end;
        v86("record_has_accepted", "conversation_list_overlay", nil, "OsaContextCard"):andThen(function() --[[ Line: 327 ]]
            -- upvalues: v48 (ref), v49 (ref), l_API_0 (ref), v39 (ref), v55 (ref), v33 (ref), v3 (ref), v87 (ref), v34 (ref)
            if v48.conversationId then
                v49(l_API_0(v48.conversationId));
            end;
            if v39 then
                v55.emit(v33.Events.ModalActionResult, v3.Dictionary.union(v87, {
                    actionResult = v34.Enums.ModalActionResults.Success
                }));
            end;
            v48.onJoin();
        end):catch(function(v88) --[[ Line: 341 ]]
            -- upvalues: v39 (ref), v55 (ref), v33 (ref), v3 (ref), v87 (ref), v34 (ref), v5 (ref), v85 (ref), v48 (ref)
            if v39 then
                v55.emit(v33.Events.ModalActionResult, v3.Dictionary.union(v87, {
                    actionResult = v34.Enums.ModalActionResults.Failure
                }));
            end;
            v5:warning((("Error in GroupOSADialog Join-> RecordModalSequenceResponse: %*"):format((tostring(v88)))));
            v85();
            v48.onClose();
        end);
    end, {
        v48.onJoin, 
        v48.onClose, 
        v85, 
        v86, 
        v49, 
        v48.conversationId, 
        if v39 then v55 else nil, 
        if v39 then v48.impressionId else nil, 
        if v42 then v53 else nil
    });
    local v92 = v2.useCallback(function() --[[ Line: 368 ]]
        -- upvalues: v42 (ref), v53 (copy), v54 (copy), v40 (ref), v48 (copy), v39 (ref), v34 (ref), v55 (ref), v33 (ref), v86 (copy), v3 (ref), v49 (copy), v29 (ref), v5 (ref), v85 (copy)
        if v42 then
            if v53 then
                return;
            else
                v54(true);
            end;
        end;
        if v40 then
            v48.onDecline();
        end;
        local v90 = nil;
        if v39 then
            v90 = {
                modalVariant = "OsaContextCard", 
                action = v34.Enums.ModalActions.SecondaryCta, 
                conversationId = v48.conversationId, 
                impressionId = v48.impressionId
            };
            v55.emit(v33.Events.ModalAction, v90);
        end;
        v86("record_dont_show_again", "conversation_list_overlay", nil, "OsaContextCard"):andThen(function() --[[ Line: 390 ]]
            -- upvalues: v39 (ref), v55 (ref), v33 (ref), v3 (ref), v90 (ref), v34 (ref), v48 (ref), v49 (ref), v29 (ref), v40 (ref)
            if v39 then
                v55.emit(v33.Events.ModalActionResult, v3.Dictionary.union(v90, {
                    actionResult = v34.Enums.ModalActionResults.Success
                }));
            end;
            if v48.conversationId then
                v49(v29(v48.conversationId));
            end;
            if not v40 then
                v48.onDecline();
            end;
        end):catch(function(v91) --[[ Line: 406 ]]
            -- upvalues: v39 (ref), v55 (ref), v33 (ref), v3 (ref), v90 (ref), v34 (ref), v5 (ref), v85 (ref), v48 (ref)
            if v39 then
                v55.emit(v33.Events.ModalActionResult, v3.Dictionary.union(v90, {
                    actionResult = v34.Enums.ModalActionResults.Failure
                }));
            end;
            v5:warning((("Error in GroupOSADialog Decline -> RecordModalSequenceResponse: %*"):format((tostring(v91)))));
            v85();
            v48.onClose();
        end);
    end, {
        v48.onDecline, 
        v48.onClose, 
        v85, 
        v86, 
        v49, 
        v48.conversationId, 
        if v39 then v55 else nil, 
        if v39 then v48.impressionId else nil, 
        if v42 then v53 else nil
    });
    local v93 = not v57;
    local v94 = false;
    if v58.source == "channels" then
        v94 = v60 == nil;
    end;
    local v95 = false;
    if v66 ~= nil then
        v95 = v73;
    end;
    local v96 = v43 and (v93 or v94 or v95);
    local v97 = if v74 then v75.inviterTitleText else v75.titleText;
    local v98 = if v43 then v2.useMemo(function() --[[ Line: 442 ]]
        -- upvalues: v2 (ref), v9 (ref), l_Skeleton_0 (ref), v52 (copy), l_Radius_0 (ref)
        return v2.createElement(v9.View, {
            tag = "size-full-0 auto-y col gap-medium margin-top-small"
        }, {
            Heading = v2.createElement(l_Skeleton_0, {
                Size = UDim2.new(0.6, 0, 0, v52.Size.Size_1100), 
                radius = l_Radius_0.Medium, 
                LayoutOrder = 1
            }), 
            Row1 = v2.createElement(l_Skeleton_0, {
                Size = UDim2.new(1, 0, 0, v52.Size.Size_1200), 
                radius = l_Radius_0.Medium, 
                LayoutOrder = 2
            }), 
            Row2 = v2.createElement(l_Skeleton_0, {
                Size = UDim2.new(1, 0, 0, v52.Size.Size_1200), 
                radius = l_Radius_0.Medium, 
                LayoutOrder = 3
            }), 
            Row3 = v2.createElement(l_Skeleton_0, {
                Size = UDim2.new(1, 0, 0, v52.Size.Size_1200), 
                radius = l_Radius_0.Medium, 
                LayoutOrder = 4
            }), 
            Footer = v2.createElement(l_Skeleton_0, {
                Size = UDim2.new(1, 0, 0, v52.Size.Size_800), 
                radius = l_Radius_0.Medium, 
                LayoutOrder = 5
            })
        });
    end, {
        v52
    }) else nil;
    local v99 = v2.useMemo(function() --[[ Line: 475 ]]
        -- upvalues: v2 (ref), v9 (ref), l_Dialog_0 (ref), v75 (copy), v83 (copy)
        return v2.createElement(v9.View, {
            tag = "auto-y size-full-0 col gap-medium"
        }, {
            DialogContentHeader = v2.createElement(l_Dialog_0.Text, {
                Text = v75.groupCreatedOnText, 
                LayoutOrder = 1
            }), 
            GroupMemberList = v2.createElement(v9.View, {
                tag = "size-full-0 auto-y col", 
                LayoutOrder = 2
            }, v83), 
            DialogContentFooter = v2.createElement(l_Dialog_0.Text, {
                Text = v75.footerText, 
                LayoutOrder = 3
            })
        });
    end, {
        v75.groupCreatedOnText, 
        v75.footerText, 
        v83
    });
    if v41 and not v57 then
        return nil;
    else
        return v2.createElement(l_Dialog_0.Root, {
            size = v48.dialogSize, 
            onClose = v84, 
            hasBackdrop = v48.hasBackdrop, 
            disablePortal = v48.disablePortal
        }, {
            DialogTitle = not v96 and v2.createElement(l_Dialog_0.Title, {
                text = v97, 
                LayoutOrder = 1
            }), 
            DialogContent = v2.createElement(l_Dialog_0.Content, {
                LayoutOrder = 2
            }, if v96 then v98 else v99), 
            DialogActions = not v96 and v2.createElement(l_Dialog_0.Actions, {
                LayoutOrder = 3, 
                orientation = l_Orientation_0.Vertical, 
                actions = {
                    {
                        text = v75.joinButtonText, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        onActivated = v89, 
                        isDisabled = if v42 then v53 else nil
                    }, 
                    {
                        text = v75.declineButtonText, 
                        variant = l_ButtonVariant_0.Standard, 
                        onActivated = v92, 
                        isDisabled = if v42 then v53 else nil
                    }
                }
            })
        });
    end;
end;