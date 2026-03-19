local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.Foundation);
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.SquadsCore);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useStore_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useStore;
local l_UserProfileStore_0 = require(l_Parent_0.UserProfiles).Stores.UserProfileStore;
local l_Avatar_0 = v4.Avatar;
local l_Button_0 = v4.Button;
local l_ButtonVariant_0 = v4.Enums.ButtonVariant;
local l_Sheet_0 = v4.Sheet;
local l_Text_0 = v4.Text;
local l_View_0 = v4.View;
local l_deleteScheduledSquad_0 = v6.Thunks.deleteScheduledSquad;
local l_EventNames_0 = v6.Analytics.EventNames;
local l_SquadExternalContractContext_0 = v6.SquadExternalContractProvider.SquadExternalContractContext;
local l_SquadPromptType_0 = v6.Enums.SquadPromptType;
local l_subscribeToScheduledSquad_0 = v6.NetworkRequests.subscribeToScheduledSquad;
local l_unsubscribeFromScheduledSquad_0 = v6.NetworkRequests.unsubscribeFromScheduledSquad;
local l_useCurrentSquadId_0 = v6.Hooks.useCurrentSquadId;
local v25 = require(l_script_FirstAncestor_0.Components.ScheduledSquads.ScheduledSquadSheet);
local v26 = require(l_script_FirstAncestor_0.Enums.ScheduledSquadActionEnum);
local v27 = require(l_script_FirstAncestor_0.Enums.ScheduledSquadActionSourceEnum);
return function(v28) --[[ Line: 46 ]] --[[ Name: ScheduledSquadsMoreInfoSheet ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), v5 (copy), l_SquadExternalContractContext_0 (copy), l_useCurrentSquadId_0 (copy), l_useStore_0 (copy), v3 (copy), l_SquadPromptType_0 (copy), l_UserProfileStore_0 (copy), l_useLocalization_0 (copy), l_View_0 (copy), l_Avatar_0 (copy), l_Text_0 (copy), l_deleteScheduledSquad_0 (copy), l_EventNames_0 (copy), v26 (copy), v27 (copy), l_unsubscribeFromScheduledSquad_0 (copy), l_subscribeToScheduledSquad_0 (copy), v25 (copy), l_Sheet_0 (copy), l_LocalizationService_0 (copy), v4 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy)
    local v29 = l_useDispatch_0();
    local v30 = l_useLocalUserId_0();
    local v31 = v5.useContext(l_SquadExternalContractContext_0);
    local v32 = l_useCurrentSquadId_0();
    local v33 = l_useStore_0();
    local v34 = v31.useGetConversationFromId(v28.scheduledSquad.parentChannelId);
    local v35 = DateTime.fromIsoDate(v28.scheduledSquad.startTime);
    local v36 = v35 and v35.UnixTimestamp < DateTime.now().UnixTimestamp;
    local v37, v38 = v5.useState(false);
    local v39, v40 = v5.useState(v28.scheduledSquad.subscribers);
    local v42 = v5.useMemo(function() --[[ Line: 60 ]]
        -- upvalues: v3 (ref), v39 (copy)
        return v3.List.map(v39, function(v41) --[[ Line: 61 ]]
            return (tostring(v41.userId));
        end);
    end, {
        v39
    });
    v5.useEffect(function() --[[ Line: 66 ]]
        -- upvalues: v40 (copy), v28 (copy)
        v40(v28.scheduledSquad.subscribers);
    end, {
        v28.scheduledSquad.subscribers
    });
    local v43 = tostring(v28.scheduledSquad.initiatorId) == tostring(v30);
    local v45 = v5.useMemo(function() --[[ Line: 71 ]]
        -- upvalues: v43 (copy), v3 (ref), v42 (copy), v30 (copy)
        return v43 or v3.List.findWhere(v42, function(v44) --[[ Line: 73 ]]
            -- upvalues: v30 (ref)
            return v44 == tostring(v30);
        end) ~= nil;
    end, {
        v43, 
        v30, 
        v42
    });
    local v46, v47 = v5.useState({});
    local v48, v49 = v5.useState(true);
    local v50 = v5.useCallback(function() --[[ Line: 82 ]]
        -- upvalues: v38 (copy), v28 (copy)
        v38(false);
        if v28.onClose then
            v28.onClose();
        end;
    end, {
        v28.onClose
    });
    local v51 = v5.useCallback(function() --[[ Line: 89 ]]
        -- upvalues: v31 (copy), v33 (copy), l_SquadPromptType_0 (ref)
        v31.setSquadPrompt(v33, {
            hideCancelButton = true, 
            promptType = l_SquadPromptType_0.Error
        });
    end, {
        v31.setSquadPrompt, 
        v33
    });
    v5.useEffect(function() --[[ Line: 97 ]]
        -- upvalues: v49 (copy), l_UserProfileStore_0 (ref), v3 (ref), v42 (copy), v34 (copy), v47 (copy), v50 (copy), v51 (copy)
        v49(true);
        l_UserProfileStore_0.get().fetchNamesByUserIds(v3.List.join(v42, v34 and v34.participants or {}), function(v52) --[[ Line: 100 ]]
            -- upvalues: v47 (ref), v49 (ref), v50 (ref), v51 (ref)
            if v52.status == "success" then
                local v53 = {};
                for _, v55 in v52.data do
                    v53[v55.userId] = v55.names.getCombinedName(false);
                end;
                v47(v53);
                v49(false);
                return;
            else
                if v52.status == "failed" then
                    v49(false);
                    v50();
                    v51();
                end;
                return;
            end;
        end);
    end, {
        v50, 
        v51, 
        v49, 
        v42, 
        v31.setSquadPrompt, 
        v33, 
        v34 and v34.participants or nil
    });
    local v56 = l_useLocalization_0({
        deleteText = "Feature.Squads.Action.Delete", 
        dontJoinText = "Feature.Squads.Action.DontJoin", 
        editText = "Feature.Squads.Action.Edit", 
        goingText = "Feature.Squads.Description.Going", 
        joinText = "Feature.Squads.Action.Join", 
        notGoingText = "Feature.Squads.Description.NotGoing", 
        partyText = "Feature.Squads.Label.Party", 
        usersPartyText = {
            "Feature.Squads.Label.UsersParty"; 
            displayName = v46[tostring(v28.scheduledSquad.initiatorId)]
        }, 
        willYouJoinScheduledPartyText = {
            "Feature.Squads.Label.WillYouJoinScheduledParty"; 
            displayName = v46[tostring(v28.scheduledSquad.initiatorId)]
        }
    });
    local v60 = v5.useMemo(function() --[[ Line: 144 ]]
        -- upvalues: v39 (copy), v5 (ref), l_View_0 (ref), l_Avatar_0 (ref), l_Text_0 (ref), v46 (copy)
        local v57 = {};
        for _, v59 in v39 do
            table.insert(v57, v5.createElement(l_View_0, {
                tag = "size-full-0 auto-y row align-x-left align-y-center gap-small"
            }, {
                Avatar = v5.createElement(l_Avatar_0, {
                    LayoutOrder = 1, 
                    userId = v59.userId
                }), 
                DisplayName = v5.createElement(l_Text_0, {
                    LayoutOrder = 2, 
                    Text = v46[tostring(v59.userId)], 
                    tag = "auto-xy fill text-truncate-end text-title-medium text-align-x-left"
                })
            }));
        end;
        return v57;
    end, {
        v46, 
        v39
    });
    local v65 = v5.useMemo(function() --[[ Line: 169 ]]
        -- upvalues: v34 (copy), v3 (ref), v42 (copy), v5 (ref), l_View_0 (ref), l_Avatar_0 (ref), l_Text_0 (ref), v46 (copy)
        local v61 = {};
        if v34 and v34.participants then
            local v62 = v3.List.toSet(v42);
            for _, v64 in v34.participants do
                if not v62[tostring(v64)] then
                    table.insert(v61, v5.createElement(l_View_0, {
                        tag = "size-full-0 auto-y row align-x-left align-y-center gap-small padding-y-small"
                    }, {
                        Avatar = v5.createElement(l_Avatar_0, {
                            LayoutOrder = 1, 
                            userId = v64
                        }), 
                        DisplayName = v5.createElement(l_Text_0, {
                            LayoutOrder = 2, 
                            Text = v46[tostring(v64)], 
                            tag = "auto-xy fill text-truncate-end text-title-medium text-align-x-left"
                        })
                    }));
                end;
            end;
        end;
        return v61;
    end, {
        v46, 
        v42, 
        v34 and v34.participants
    });
    local v66 = v5.useCallback(function() --[[ Line: 201 ]]
        -- upvalues: v50 (copy), v29 (copy), l_deleteScheduledSquad_0 (ref), v28 (copy), v31 (copy), l_EventNames_0 (ref), v26 (ref), v27 (ref), v32 (copy)
        v50();
        v29(l_deleteScheduledSquad_0(v28.scheduledSquad.scheduledGroupUpId, v31.setSquadPrompt));
        v31.fireSquadAnalytics(l_EventNames_0.ScheduledSquadAction, {
            actionType = v26.Delete, 
            conversationId = v28.scheduledSquad.parentChannelId, 
            scheduledSquadId = v28.scheduledSquad.scheduledGroupUpId, 
            source = v27.ScheduledSquadsMoreInfoSheet, 
            squadId = v32, 
            squadLocation = v31.squadLocation
        });
    end, {
        v32, 
        v50, 
        v28.scheduledSquad.parentChannelId, 
        v28.scheduledSquad.scheduledGroupUpId, 
        v31.fireSquadAnalytics, 
        v31.setSquadPrompt, 
        v31.squadLocation, 
        v33
    });
    local function v68() --[[ Line: 226 ]]
        -- upvalues: v40 (copy), v3 (ref), v39 (copy), v30 (copy)
        v40(v3.List.filter(v39, function(v67) --[[ Line: 227 ]]
            -- upvalues: v30 (ref)
            return tostring(v67.userId) ~= tostring(v30);
        end));
    end;
    local function v69() --[[ Line: 232 ]]
        -- upvalues: v40 (copy), v3 (ref), v39 (copy), v30 (copy)
        v40(v3.List.join(v39, {
            {
                userId = tostring(v30)
            }
        }));
    end;
    local v70 = v5.useCallback(function() --[[ Line: 237 ]]
        -- upvalues: v45 (copy), l_unsubscribeFromScheduledSquad_0 (ref), v28 (copy), v68 (copy), v51 (copy), l_subscribeToScheduledSquad_0 (ref), v69 (copy), v31 (copy), l_EventNames_0 (ref), v26 (ref), v27 (ref), v32 (copy)
        if v45 then
            l_unsubscribeFromScheduledSquad_0({
                scheduledGroupUpId = v28.scheduledSquad.scheduledGroupUpId
            }, v68, v51);
        else
            l_subscribeToScheduledSquad_0({
                scheduledGroupUpId = v28.scheduledSquad.scheduledGroupUpId
            }, v69, v51);
        end;
        v31.fireSquadAnalytics(l_EventNames_0.ScheduledSquadAction, {
            actionType = if v45 then v26.Unsubscribe else v26.Subscribe, 
            conversationId = v28.scheduledSquad.parentChannelId, 
            scheduledSquadId = v28.scheduledSquad.scheduledGroupUpId, 
            source = v27.ScheduledSquadsMoreInfoSheet, 
            squadId = v32, 
            squadLocation = v31.squadLocation
        });
    end, {
        v45, 
        v31.squadLocation, 
        v32, 
        v28.scheduledSquad, 
        v31.fireSquadAnalytics, 
        v51, 
        v68, 
        v69, 
        v32
    });
    local v71 = v5.useCallback(function() --[[ Line: 277 ]]
        -- upvalues: v38 (copy), v31 (copy), l_EventNames_0 (ref), v26 (ref), v28 (copy), v27 (ref), v32 (copy)
        v38(true);
        v31.fireSquadAnalytics(l_EventNames_0.ScheduledSquadAction, {
            actionType = v26.Edit, 
            conversationId = v28.scheduledSquad.parentChannelId, 
            scheduledSquadId = v28.scheduledSquad.scheduledGroupUpId, 
            source = v27.ScheduledSquadsMoreInfoSheet, 
            squadId = v32, 
            squadLocation = v31.squadLocation
        });
    end, {
        v32, 
        v28.scheduledSquad, 
        v31.fireSquadAnalytics, 
        v31.squadLocation
    });
    if v37 then
        return v5.createElement(v25, {
            isOpen = v28.isOpen, 
            onClose = v50, 
            scheduledSquad = v28.scheduledSquad, 
            snapPoints = {
                0.4, 
                0.7
            }
        });
    else
        return (v5.createElement(l_Sheet_0.Root, {
            onClose = v50, 
            isOpen = v28.isOpen, 
            preferCenterSheet = true, 
            snapPoints = {
                0.4, 
                0.7
            }
        }, {
            Header = v5.createElement(l_Sheet_0.Header, {}, {
                View = v5.createElement(l_View_0, {
                    tag = "size-full-0 auto-y col"
                }, {
                    ScheduledSquadTitle = v5.createElement(l_Text_0, {
                        LayoutOrder = 1, 
                        Text = if not v36 and v45 then v56.usersPartyText else if v36 or v45 then v56.partyText else v56.willYouJoinScheduledPartyText, 
                        tag = "size-full-0 auto-y text-heading-medium text-align-x-left text-truncate-end"
                    }), 
                    DateTime = v5.createElement(l_Text_0, {
                        LayoutOrder = 2, 
                        Text = if v35 then v35:FormatLocalTime("LLL", l_LocalizationService_0.RobloxLocaleId) else "", 
                        tag = "size-full-0 auto-y text-body-medium text-align-x-left"
                    })
                })
            }), 
            Content = v5.createElement(l_Sheet_0.Content, {}, {
                Loading = if v48 then v5.createElement(v4.Loading, {}) else nil, 
                View = if not v48 then v5.createElement(l_View_0, {
                    tag = "size-full-0 auto-y col gap-small padding-y-small"
                }, {
                    SubscribedUsersText = v5.createElement(l_Text_0, {
                        LayoutOrder = 1, 
                        Text = ("%*"):format(v56.goingText), 
                        tag = "size-full-0 auto-y content-emphasis text-align-x-left"
                    }), 
                    SubscribedUsers = v5.createElement(l_View_0, {
                        LayoutOrder = 2, 
                        tag = "size-full-0 auto-y col gap-small"
                    }, unpack(v60)), 
                    NotSubscribedUsersText = v5.createElement(l_Text_0, {
                        LayoutOrder = 3, 
                        Text = ("%*"):format(v56.notGoingText), 
                        tag = "size-full-0 auto-y content-emphasis text-align-x-left"
                    }), 
                    NotSubscribedUsers = v5.createElement(l_View_0, {
                        LayoutOrder = 4, 
                        tag = "size-full-0 auto-y col gap-small"
                    }, unpack(v65))
                }) else nil
            }), 
            Actions = if not v36 then v5.createElement(l_Sheet_0.Actions, {}, {
                v5.createElement(l_View_0, {
                    tag = "size-full-0 auto-y col gap-small"
                }, {
                    JoinButton = if not not v43 or v45 then nil else v5.createElement(l_Button_0, {
                        LayoutOrder = 1, 
                        onActivated = v70, 
                        text = v56.joinText, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        width = UDim.new(1, 0)
                    }), 
                    DontJoinButton = if not v43 and v45 then v5.createElement(l_Button_0, {
                        LayoutOrder = 2, 
                        onActivated = v70, 
                        text = v56.dontJoinText, 
                        variant = l_ButtonVariant_0.Standard, 
                        width = UDim.new(1, 0)
                    }) else nil, 
                    EditButton = if v43 then v5.createElement(l_Button_0, {
                        LayoutOrder = 3, 
                        onActivated = v71, 
                        text = v56.editText, 
                        variant = l_ButtonVariant_0.Standard, 
                        width = UDim.new(1, 0)
                    }) else nil, 
                    DeleteButton = if v43 then v5.createElement(l_Button_0, {
                        LayoutOrder = 4, 
                        onActivated = v66, 
                        text = v56.deleteText, 
                        variant = l_ButtonVariant_0.Alert, 
                        width = UDim.new(1, 0)
                    }) else nil
                })
            }) else nil
        }));
    end;
end;