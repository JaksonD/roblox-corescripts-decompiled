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
    local v34 = DateTime.fromIsoDate(v28.scheduledSquad.startTime);
    local v35 = v34 and v34.UnixTimestamp < DateTime.now().UnixTimestamp;
    local v36, v37 = v5.useState(false);
    local v38, v39 = v5.useState(v28.scheduledSquad.subscribers);
    local v41 = v5.useMemo(function() --[[ Line: 59 ]]
        -- upvalues: v3 (ref), v38 (copy)
        return v3.List.map(v38, function(v40) --[[ Line: 60 ]]
            return (tostring(v40.userId));
        end);
    end, {
        v38
    });
    local v42 = tostring(v28.scheduledSquad.initiatorId) == tostring(v30);
    local v44 = v5.useMemo(function() --[[ Line: 66 ]]
        -- upvalues: v42 (copy), v3 (ref), v41 (copy), v30 (copy)
        return v42 or v3.List.findWhere(v41, function(v43) --[[ Line: 68 ]]
            -- upvalues: v30 (ref)
            return v43 == tostring(v30);
        end) ~= nil;
    end, {
        v42, 
        v30, 
        v41
    });
    local v45, v46 = v5.useState({});
    local v47, v48 = v5.useState(true);
    local v49 = v5.useCallback(function() --[[ Line: 77 ]]
        -- upvalues: v37 (copy), v28 (copy)
        v37(false);
        if v28.onClose then
            v28.onClose();
        end;
    end, {
        v28.onClose
    });
    local v50 = v5.useCallback(function() --[[ Line: 84 ]]
        -- upvalues: v31 (copy), v33 (copy), l_SquadPromptType_0 (ref)
        v31.setSquadPrompt(v33, {
            hideCancelButton = true, 
            promptType = l_SquadPromptType_0.Error
        });
    end, {
        v31.setSquadPrompt, 
        v33
    });
    v5.useEffect(function() --[[ Line: 91 ]]
        -- upvalues: v48 (copy), l_UserProfileStore_0 (ref), v41 (copy), v46 (copy), v49 (copy), v50 (copy)
        v48(true);
        l_UserProfileStore_0.get().fetchNamesByUserIds(v41, function(v51) --[[ Line: 93 ]]
            -- upvalues: v46 (ref), v48 (ref), v49 (ref), v50 (ref)
            if v51.status == "success" then
                local v52 = {};
                for _, v54 in v51.data do
                    v52[v54.userId] = v54.names.getCombinedName(false);
                end;
                v46(v52);
                v48(false);
                return;
            else
                if v51.status == "failed" then
                    v49();
                    v50();
                end;
                return;
            end;
        end);
    end, {
        v49, 
        v50, 
        v48, 
        v41, 
        v31.setSquadPrompt, 
        v33
    });
    local v55 = l_useLocalization_0({
        deleteText = "Feature.Squads.Action.Delete", 
        dontJoinText = "Feature.Squads.Action.DontJoin", 
        editText = "Feature.Squads.Action.Edit", 
        goingText = "Feature.Squads.Description.Going", 
        joinText = "Feature.Squads.Action.Join", 
        partyText = "Feature.Squads.Label.Party", 
        usersPartyText = {
            "Feature.Squads.Label.UsersParty"; 
            displayName = v45[tostring(v28.scheduledSquad.initiatorId)]
        }, 
        willYouJoinScheduledPartyText = {
            "Feature.Squads.Label.WillYouJoinScheduledParty"; 
            displayName = v45[tostring(v28.scheduledSquad.initiatorId)]
        }
    });
    local v59 = v5.useMemo(function() --[[ Line: 125 ]]
        -- upvalues: v38 (copy), v5 (ref), l_View_0 (ref), l_Avatar_0 (ref), l_Text_0 (ref), v45 (copy)
        local v56 = {};
        for _, v58 in v38 do
            table.insert(v56, v5.createElement(l_View_0, {
                tag = "size-full-0 auto-y row align-x-left align-y-center gap-small"
            }, {
                Avatar = v5.createElement(l_Avatar_0, {
                    LayoutOrder = 1, 
                    userId = v58.userId
                }), 
                DisplayName = v5.createElement(l_Text_0, {
                    LayoutOrder = 2, 
                    Text = v45[tostring(v58.userId)], 
                    tag = "auto-xy fill text-truncate-end text-title-medium text-align-x-left"
                })
            }));
        end;
        return v56;
    end, {
        v45, 
        v38
    });
    local v60 = v5.useCallback(function() --[[ Line: 151 ]]
        -- upvalues: v49 (copy), v29 (copy), l_deleteScheduledSquad_0 (ref), v28 (copy), v31 (copy), l_EventNames_0 (ref), v26 (ref), v27 (ref), v32 (copy)
        v49();
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
        v49, 
        v28.scheduledSquad.parentChannelId, 
        v28.scheduledSquad.scheduledGroupUpId, 
        v31.fireSquadAnalytics, 
        v31.setSquadPrompt, 
        v31.squadLocation, 
        v33
    });
    local function v62() --[[ Line: 176 ]]
        -- upvalues: v39 (copy), v3 (ref), v38 (copy), v30 (copy)
        v39(v3.List.filter(v38, function(v61) --[[ Line: 177 ]]
            -- upvalues: v30 (ref)
            return tostring(v61.userId) ~= tostring(v30);
        end));
    end;
    local function v63() --[[ Line: 182 ]]
        -- upvalues: v39 (copy), v3 (ref), v38 (copy), v30 (copy)
        v39(v3.List.join(v38, {
            {
                userId = tostring(v30)
            }
        }));
    end;
    local v64 = v5.useCallback(function() --[[ Line: 187 ]]
        -- upvalues: v44 (copy), l_unsubscribeFromScheduledSquad_0 (ref), v28 (copy), v62 (copy), v50 (copy), l_subscribeToScheduledSquad_0 (ref), v63 (copy), v31 (copy), l_EventNames_0 (ref), v26 (ref), v27 (ref), v32 (copy)
        if v44 then
            l_unsubscribeFromScheduledSquad_0({
                scheduledGroupUpId = v28.scheduledSquad.scheduledGroupUpId
            }, v62, v50);
        else
            l_subscribeToScheduledSquad_0({
                scheduledGroupUpId = v28.scheduledSquad.scheduledGroupUpId
            }, v63, v50);
        end;
        v31.fireSquadAnalytics(l_EventNames_0.ScheduledSquadAction, {
            actionType = if v44 then v26.Unsubscribe else v26.Subscribe, 
            conversationId = v28.scheduledSquad.parentChannelId, 
            scheduledSquadId = v28.scheduledSquad.scheduledGroupUpId, 
            source = v27.ScheduledSquadsMoreInfoSheet, 
            squadId = v32, 
            squadLocation = v31.squadLocation
        });
    end, {
        v44, 
        v31.squadLocation, 
        v32, 
        v28.scheduledSquad, 
        v31.fireSquadAnalytics, 
        v50, 
        v62, 
        v63, 
        v32
    });
    local v65 = v5.useCallback(function() --[[ Line: 227 ]]
        -- upvalues: v37 (copy), v31 (copy), l_EventNames_0 (ref), v26 (ref), v28 (copy), v27 (ref), v32 (copy)
        v37(true);
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
    if v36 then
        return v5.createElement(v25, {
            isOpen = v28.isOpen, 
            onClose = v49, 
            scheduledSquad = v28.scheduledSquad, 
            snapPoints = {
                0.4, 
                0.7
            }
        });
    else
        return (v5.createElement(l_Sheet_0.Root, {
            onClose = v49, 
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
                        Text = if not v35 and v44 then v55.usersPartyText else if v35 or v44 then v55.partyText else v55.willYouJoinScheduledPartyText, 
                        tag = "size-full-0 auto-y text-heading-medium text-align-x-left text-truncate-end"
                    }), 
                    DateTime = v5.createElement(l_Text_0, {
                        LayoutOrder = 2, 
                        Text = if v34 then v34:FormatLocalTime("LLL", l_LocalizationService_0.RobloxLocaleId) else "", 
                        tag = "size-full-0 auto-y text-body-medium text-align-x-left"
                    })
                })
            }), 
            Content = v5.createElement(l_Sheet_0.Content, {}, {
                Loading = if v47 then v5.createElement(v4.Loading, {}) else nil, 
                View = if not v47 then v5.createElement(l_View_0, {
                    tag = "size-full-0 auto-y col gap-small padding-bottom-medium"
                }, {
                    SubscribedUsersText = v5.createElement(l_Text_0, {
                        LayoutOrder = 2, 
                        Text = ("%*"):format(v55.goingText), 
                        tag = "size-full-0 auto-y content-emphasis text-align-x-left"
                    }), 
                    SubscribedUsers = v5.createElement(l_View_0, {
                        LayoutOrder = 3, 
                        tag = "size-full-0 auto-y col gap-small"
                    }, unpack(v59))
                }) else nil
            }), 
            Actions = if not v35 then v5.createElement(l_Sheet_0.Actions, {}, {
                v5.createElement(l_View_0, {
                    tag = "size-full-0 auto-y col gap-small"
                }, {
                    JoinButton = if not not v42 or v44 then nil else v5.createElement(l_Button_0, {
                        LayoutOrder = 1, 
                        onActivated = v64, 
                        text = v55.joinText, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        width = UDim.new(1, 0)
                    }), 
                    DontJoinButton = if not v42 and v44 then v5.createElement(l_Button_0, {
                        LayoutOrder = 2, 
                        onActivated = v64, 
                        text = v55.dontJoinText, 
                        variant = l_ButtonVariant_0.Standard, 
                        width = UDim.new(1, 0)
                    }) else nil, 
                    EditButton = if v42 then v5.createElement(l_Button_0, {
                        LayoutOrder = 3, 
                        onActivated = v65, 
                        text = v55.editText, 
                        variant = l_ButtonVariant_0.Standard, 
                        width = UDim.new(1, 0)
                    }) else nil, 
                    DeleteButton = if v42 then v5.createElement(l_Button_0, {
                        LayoutOrder = 4, 
                        onActivated = v60, 
                        text = v55.deleteText, 
                        variant = l_ButtonVariant_0.Alert, 
                        width = UDim.new(1, 0)
                    }) else nil
                })
            }) else nil
        }));
    end;
end;