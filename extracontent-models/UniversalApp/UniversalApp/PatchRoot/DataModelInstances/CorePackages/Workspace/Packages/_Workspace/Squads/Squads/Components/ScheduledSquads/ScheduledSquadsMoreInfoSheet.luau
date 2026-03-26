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
local v28 = game:DefineFastFlag("EnableScheduledSquadsOnCloseFix", false);
return function(v29) --[[ Line: 48 ]] --[[ Name: ScheduledSquadsMoreInfoSheet ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), v5 (copy), l_SquadExternalContractContext_0 (copy), l_useCurrentSquadId_0 (copy), l_useStore_0 (copy), v3 (copy), v28 (copy), l_SquadPromptType_0 (copy), l_UserProfileStore_0 (copy), l_useLocalization_0 (copy), l_View_0 (copy), l_Avatar_0 (copy), l_Text_0 (copy), l_deleteScheduledSquad_0 (copy), l_EventNames_0 (copy), v26 (copy), v27 (copy), l_unsubscribeFromScheduledSquad_0 (copy), l_subscribeToScheduledSquad_0 (copy), v25 (copy), l_Sheet_0 (copy), l_LocalizationService_0 (copy), v4 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy)
    local v30 = l_useDispatch_0();
    local v31 = l_useLocalUserId_0();
    local v32 = v5.useContext(l_SquadExternalContractContext_0);
    local v33 = l_useCurrentSquadId_0();
    local v34 = l_useStore_0();
    local v35 = v32.useGetConversationFromId(v29.scheduledSquad.parentChannelId);
    local v36 = DateTime.fromIsoDate(v29.scheduledSquad.startTime);
    local v37 = v36 and v36.UnixTimestamp < DateTime.now().UnixTimestamp;
    local v38, v39 = v5.useState(false);
    local v40, v41 = v5.useState(v29.scheduledSquad.subscribers);
    local v43 = v5.useMemo(function() --[[ Line: 62 ]]
        -- upvalues: v3 (ref), v40 (copy)
        return v3.List.map(v40, function(v42) --[[ Line: 63 ]]
            return (tostring(v42.userId));
        end);
    end, {
        v40
    });
    v5.useEffect(function() --[[ Line: 68 ]]
        -- upvalues: v41 (copy), v29 (copy)
        v41(v29.scheduledSquad.subscribers);
    end, {
        v29.scheduledSquad.subscribers
    });
    local v44 = tostring(v29.scheduledSquad.initiatorId) == tostring(v31);
    local v46 = v5.useMemo(function() --[[ Line: 73 ]]
        -- upvalues: v44 (copy), v3 (ref), v43 (copy), v31 (copy)
        return v44 or v3.List.findWhere(v43, function(v45) --[[ Line: 75 ]]
            -- upvalues: v31 (ref)
            return v45 == tostring(v31);
        end) ~= nil;
    end, {
        v44, 
        v31, 
        v43
    });
    local v47, v48 = v5.useState({});
    local v49, v50 = v5.useState(true);
    local v51 = v5.useCallback(function() --[[ Line: 84 ]]
        -- upvalues: v39 (copy), v29 (copy)
        v39(false);
        if v29.onClose then
            v29.onClose();
        end;
    end, {
        v29.onClose
    });
    local v52 = v5.useCallback(function() --[[ Line: 92 ]]
        -- upvalues: v28 (ref), v51 (copy), v32 (copy), v34 (copy), l_SquadPromptType_0 (ref)
        if v28 then
            v51();
        end;
        v32.setSquadPrompt(v34, {
            hideCancelButton = true, 
            promptType = l_SquadPromptType_0.Error
        });
    end, {
        if v28 then v51 else nil, 
        v32.setSquadPrompt, 
        v34
    });
    v5.useEffect(function() --[[ Line: 105 ]]
        -- upvalues: v50 (copy), l_UserProfileStore_0 (ref), v3 (ref), v43 (copy), v35 (copy), v48 (copy), v51 (copy), v52 (copy)
        v50(true);
        l_UserProfileStore_0.get().fetchNamesByUserIds(v3.List.join(v43, v35 and v35.participants or {}), function(v53) --[[ Line: 108 ]]
            -- upvalues: v48 (ref), v50 (ref), v51 (ref), v52 (ref)
            if v53.status == "success" then
                local v54 = {};
                for _, v56 in v53.data do
                    v54[v56.userId] = v56.names.getCombinedName(false);
                end;
                v48(v54);
                v50(false);
                return;
            else
                if v53.status == "failed" then
                    v50(false);
                    v51();
                    v52();
                end;
                return;
            end;
        end);
    end, {
        v51, 
        v52, 
        v50, 
        v43, 
        v32.setSquadPrompt, 
        v34, 
        v35 and v35.participants or nil
    });
    local v57 = l_useLocalization_0({
        deleteText = "Feature.Squads.Action.Delete", 
        dontJoinText = "Feature.Squads.Action.DontJoin", 
        editText = "Feature.Squads.Action.Edit", 
        goingText = "Feature.Squads.Description.Going", 
        joinText = "Feature.Squads.Action.Join", 
        notGoingText = "Feature.Squads.Description.NotGoing", 
        partyText = "Feature.Squads.Label.Party", 
        usersPartyText = {
            "Feature.Squads.Label.UsersParty"; 
            displayName = v47[tostring(v29.scheduledSquad.initiatorId)]
        }, 
        willYouJoinScheduledPartyText = {
            "Feature.Squads.Label.WillYouJoinScheduledParty"; 
            displayName = v47[tostring(v29.scheduledSquad.initiatorId)]
        }
    });
    local v61 = v5.useMemo(function() --[[ Line: 152 ]]
        -- upvalues: v40 (copy), v5 (ref), l_View_0 (ref), l_Avatar_0 (ref), l_Text_0 (ref), v47 (copy)
        local v58 = {};
        for _, v60 in v40 do
            table.insert(v58, v5.createElement(l_View_0, {
                tag = "size-full-0 auto-y row align-x-left align-y-center gap-small"
            }, {
                Avatar = v5.createElement(l_Avatar_0, {
                    LayoutOrder = 1, 
                    userId = v60.userId
                }), 
                DisplayName = v5.createElement(l_Text_0, {
                    LayoutOrder = 2, 
                    Text = v47[tostring(v60.userId)], 
                    tag = "auto-xy fill text-truncate-end text-title-medium text-align-x-left"
                })
            }));
        end;
        return v58;
    end, {
        v47, 
        v40
    });
    local v66 = v5.useMemo(function() --[[ Line: 177 ]]
        -- upvalues: v35 (copy), v3 (ref), v43 (copy), v5 (ref), l_View_0 (ref), l_Avatar_0 (ref), l_Text_0 (ref), v47 (copy)
        local v62 = {};
        if v35 and v35.participants then
            local v63 = v3.List.toSet(v43);
            for _, v65 in v35.participants do
                if not v63[tostring(v65)] then
                    table.insert(v62, v5.createElement(l_View_0, {
                        tag = "size-full-0 auto-y row align-x-left align-y-center gap-small padding-y-small"
                    }, {
                        Avatar = v5.createElement(l_Avatar_0, {
                            LayoutOrder = 1, 
                            userId = v65
                        }), 
                        DisplayName = v5.createElement(l_Text_0, {
                            LayoutOrder = 2, 
                            Text = v47[tostring(v65)], 
                            tag = "auto-xy fill text-truncate-end text-title-medium text-align-x-left"
                        })
                    }));
                end;
            end;
        end;
        return v62;
    end, {
        v47, 
        v43, 
        v35 and v35.participants
    });
    local v67 = v5.useCallback(function() --[[ Line: 209 ]]
        -- upvalues: v51 (copy), v30 (copy), l_deleteScheduledSquad_0 (ref), v29 (copy), v32 (copy), l_EventNames_0 (ref), v26 (ref), v27 (ref), v33 (copy)
        v51();
        v30(l_deleteScheduledSquad_0(v29.scheduledSquad.scheduledGroupUpId, v32.setSquadPrompt));
        v32.fireSquadAnalytics(l_EventNames_0.ScheduledSquadAction, {
            actionType = v26.Delete, 
            conversationId = v29.scheduledSquad.parentChannelId, 
            scheduledSquadId = v29.scheduledSquad.scheduledGroupUpId, 
            source = v27.ScheduledSquadsMoreInfoSheet, 
            squadId = v33, 
            squadLocation = v32.squadLocation
        });
    end, {
        v33, 
        v51, 
        v29.scheduledSquad.parentChannelId, 
        v29.scheduledSquad.scheduledGroupUpId, 
        v32.fireSquadAnalytics, 
        v32.setSquadPrompt, 
        v32.squadLocation, 
        v34
    });
    local function v69() --[[ Line: 234 ]]
        -- upvalues: v41 (copy), v3 (ref), v40 (copy), v31 (copy)
        v41(v3.List.filter(v40, function(v68) --[[ Line: 235 ]]
            -- upvalues: v31 (ref)
            return tostring(v68.userId) ~= tostring(v31);
        end));
    end;
    local function v70() --[[ Line: 240 ]]
        -- upvalues: v41 (copy), v3 (ref), v40 (copy), v31 (copy)
        v41(v3.List.join(v40, {
            {
                userId = tostring(v31)
            }
        }));
    end;
    local v71 = v5.useCallback(function() --[[ Line: 245 ]]
        -- upvalues: v46 (copy), l_unsubscribeFromScheduledSquad_0 (ref), v29 (copy), v69 (copy), v52 (copy), l_subscribeToScheduledSquad_0 (ref), v70 (copy), v32 (copy), l_EventNames_0 (ref), v26 (ref), v27 (ref), v33 (copy)
        if v46 then
            l_unsubscribeFromScheduledSquad_0({
                scheduledGroupUpId = v29.scheduledSquad.scheduledGroupUpId
            }, v69, v52);
        else
            l_subscribeToScheduledSquad_0({
                scheduledGroupUpId = v29.scheduledSquad.scheduledGroupUpId
            }, v70, v52);
        end;
        v32.fireSquadAnalytics(l_EventNames_0.ScheduledSquadAction, {
            actionType = if v46 then v26.Unsubscribe else v26.Subscribe, 
            conversationId = v29.scheduledSquad.parentChannelId, 
            scheduledSquadId = v29.scheduledSquad.scheduledGroupUpId, 
            source = v27.ScheduledSquadsMoreInfoSheet, 
            squadId = v33, 
            squadLocation = v32.squadLocation
        });
    end, {
        v46, 
        v32.squadLocation, 
        v33, 
        v29.scheduledSquad, 
        v32.fireSquadAnalytics, 
        v52, 
        v69, 
        v70, 
        v33
    });
    local v72 = v5.useCallback(function() --[[ Line: 285 ]]
        -- upvalues: v39 (copy), v32 (copy), l_EventNames_0 (ref), v26 (ref), v29 (copy), v27 (ref), v33 (copy)
        v39(true);
        v32.fireSquadAnalytics(l_EventNames_0.ScheduledSquadAction, {
            actionType = v26.Edit, 
            conversationId = v29.scheduledSquad.parentChannelId, 
            scheduledSquadId = v29.scheduledSquad.scheduledGroupUpId, 
            source = v27.ScheduledSquadsMoreInfoSheet, 
            squadId = v33, 
            squadLocation = v32.squadLocation
        });
    end, {
        v33, 
        v29.scheduledSquad, 
        v32.fireSquadAnalytics, 
        v32.squadLocation
    });
    if v38 then
        return v5.createElement(v25, {
            isOpen = v29.isOpen, 
            onClose = v51, 
            scheduledSquad = v29.scheduledSquad, 
            snapPoints = {
                0.4, 
                0.7
            }
        });
    else
        return (v5.createElement(l_Sheet_0.Root, {
            onClose = v51, 
            isOpen = v29.isOpen, 
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
                        Text = if not v37 and v46 then v57.usersPartyText else if v37 or v46 then v57.partyText else v57.willYouJoinScheduledPartyText, 
                        tag = "size-full-0 auto-y text-heading-medium text-align-x-left text-truncate-end"
                    }), 
                    DateTime = v5.createElement(l_Text_0, {
                        LayoutOrder = 2, 
                        Text = if v36 then v36:FormatLocalTime("LLL", l_LocalizationService_0.RobloxLocaleId) else "", 
                        tag = "size-full-0 auto-y text-body-medium text-align-x-left"
                    })
                })
            }), 
            Content = v5.createElement(l_Sheet_0.Content, {}, {
                Loading = if v49 then v5.createElement(v4.Loading, {}) else nil, 
                View = if not v49 then v5.createElement(l_View_0, {
                    tag = "size-full-0 auto-y col gap-small padding-y-small"
                }, {
                    SubscribedUsersText = v5.createElement(l_Text_0, {
                        LayoutOrder = 1, 
                        Text = ("%*"):format(v57.goingText), 
                        tag = "size-full-0 auto-y content-emphasis text-align-x-left"
                    }), 
                    SubscribedUsers = v5.createElement(l_View_0, {
                        LayoutOrder = 2, 
                        tag = "size-full-0 auto-y col gap-small"
                    }, unpack(v61)), 
                    NotSubscribedUsersText = v5.createElement(l_Text_0, {
                        LayoutOrder = 3, 
                        Text = ("%*"):format(v57.notGoingText), 
                        tag = "size-full-0 auto-y content-emphasis text-align-x-left"
                    }), 
                    NotSubscribedUsers = v5.createElement(l_View_0, {
                        LayoutOrder = 4, 
                        tag = "size-full-0 auto-y col gap-small"
                    }, unpack(v66))
                }) else nil
            }), 
            Actions = if not v37 then v5.createElement(l_Sheet_0.Actions, {}, {
                v5.createElement(l_View_0, {
                    tag = "size-full-0 auto-y col gap-small"
                }, {
                    JoinButton = if not not v44 or v46 then nil else v5.createElement(l_Button_0, {
                        LayoutOrder = 1, 
                        onActivated = v71, 
                        text = v57.joinText, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        width = UDim.new(1, 0)
                    }), 
                    DontJoinButton = if not v44 and v46 then v5.createElement(l_Button_0, {
                        LayoutOrder = 2, 
                        onActivated = v71, 
                        text = v57.dontJoinText, 
                        variant = l_ButtonVariant_0.Standard, 
                        width = UDim.new(1, 0)
                    }) else nil, 
                    EditButton = if v44 then v5.createElement(l_Button_0, {
                        LayoutOrder = 3, 
                        onActivated = v72, 
                        text = v57.editText, 
                        variant = l_ButtonVariant_0.Standard, 
                        width = UDim.new(1, 0)
                    }) else nil, 
                    DeleteButton = if v44 then v5.createElement(l_Button_0, {
                        LayoutOrder = 4, 
                        onActivated = v67, 
                        text = v57.deleteText, 
                        variant = l_ButtonVariant_0.Alert, 
                        width = UDim.new(1, 0)
                    }) else nil
                })
            }) else nil
        }));
    end;
end;