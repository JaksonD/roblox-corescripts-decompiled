local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.Foundation);
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.SquadsCore);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useStore_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useStore;
local l_AvatarGroup_0 = v4.AvatarGroup;
local l_AvatarGroupType_0 = v4.Enums.AvatarGroupType;
local l_Button_0 = v4.Button;
local l_ButtonVariant_0 = v4.Enums.ButtonVariant;
local l_InputSize_0 = v4.Enums.InputSize;
local l_Loading_0 = v4.Loading;
local l_Sheet_0 = v4.Sheet;
local l_Text_0 = v4.Text;
local l_useTokens_0 = v4.Hooks.useTokens;
local l_View_0 = v4.View;
local l_getSubscribedScheduledSquads_0 = v6.NetworkRequests.getSubscribedScheduledSquads;
local l_SquadExternalContractContext_0 = v6.SquadExternalContractProvider.SquadExternalContractContext;
local l_SquadPromptType_0 = v6.Enums.SquadPromptType;
local l_EventNames_0 = v6.Analytics.EventNames;
local l_subscribeToScheduledSquad_0 = v6.NetworkRequests.subscribeToScheduledSquad;
local l_unsubscribeFromScheduledSquad_0 = v6.NetworkRequests.unsubscribeFromScheduledSquad;
local l_useCurrentSquadId_0 = v6.Hooks.useCurrentSquadId;
local v28 = require(l_script_FirstAncestor_0.Enums.ScheduledSquadActionEnum);
local v29 = require(l_script_FirstAncestor_0.Enums.ScheduledSquadActionSourceEnum);
return function(v30) --[[ Line: 44 ]]
    -- upvalues: l_useLocalUserId_0 (copy), l_useNavigation_0 (copy), l_useTokens_0 (copy), l_useStore_0 (copy), v5 (copy), l_SquadExternalContractContext_0 (copy), l_useCurrentSquadId_0 (copy), l_useLocalization_0 (copy), l_getSubscribedScheduledSquads_0 (copy), l_SquadPromptType_0 (copy), v3 (copy), l_View_0 (copy), l_EventNames_0 (copy), v28 (copy), v29 (copy), l_Text_0 (copy), l_LocalizationService_0 (copy), l_AvatarGroup_0 (copy), l_AvatarGroupType_0 (copy), l_InputSize_0 (copy), l_Button_0 (copy), l_unsubscribeFromScheduledSquad_0 (copy), l_subscribeToScheduledSquad_0 (copy), l_ButtonVariant_0 (copy), l_Sheet_0 (copy), l_Loading_0 (copy)
    local v31 = l_useLocalUserId_0();
    local v32 = l_useNavigation_0();
    local v33 = l_useTokens_0();
    local v34 = l_useStore_0();
    local v35 = v5.useContext(l_SquadExternalContractContext_0);
    local v36 = l_useCurrentSquadId_0();
    local v37 = l_useLocalization_0({
        editText = "Feature.Squads.Action.Edit", 
        goingText = "Feature.Squads.Description.Going", 
        interestedText = "Feature.Squads.Description.Interested", 
        noScheduledSquadsText = "Feature.Squads.Description.YouHaveNoScheduledParties", 
        scheduledPartyText = "Feature.Squads.Label.ScheduledParty", 
        upcomingPartiesText = "Feature.Squads.Label.UpcomingParties"
    });
    local v38, v39 = v5.useState(true);
    local v40, v41 = v5.useState({});
    local v42 = v5.useCallback(function() --[[ Line: 64 ]]
        -- upvalues: v30 (copy)
        if v30.onClose then
            v30.onClose();
        end;
    end, {
        v30.onClose
    });
    v5.useEffect(function() --[[ Line: 71 ]]
        -- upvalues: v30 (copy), l_getSubscribedScheduledSquads_0 (ref), v39 (copy), v41 (copy), v35 (copy), v34 (copy), l_SquadPromptType_0 (ref), v42 (copy)
        if v30.isOpen then
            l_getSubscribedScheduledSquads_0(function(v43) --[[ Line: 73 ]]
                -- upvalues: v39 (ref), v41 (ref)
                v39(false);
                v41(v43.scheduledGroupUps);
            end, function() --[[ Line: 76 ]]
                -- upvalues: v35 (ref), v34 (ref), l_SquadPromptType_0 (ref), v42 (ref)
                v35.setSquadPrompt(v34, {
                    hideCancelButton = true, 
                    promptType = l_SquadPromptType_0.Error
                });
                v42();
            end);
        end;
    end, {
        l_getSubscribedScheduledSquads_0, 
        v30.isOpen, 
        v42, 
        v39, 
        v41, 
        v35.setSquadPrompt, 
        v34
    });
    local v44 = v5.useCallback(function() --[[ Line: 96 ]]
        -- upvalues: v35 (copy), v34 (copy), l_SquadPromptType_0 (ref)
        v35.setSquadPrompt(v34, {
            hideCancelButton = true, 
            promptType = l_SquadPromptType_0.Error
        });
    end, {
        v35.setSquadPrompt, 
        v34
    });
    local v57 = v5.useMemo(function() --[[ Line: 103 ]]
        -- upvalues: v40 (copy), v31 (copy), v3 (ref), v5 (ref), l_View_0 (ref), v42 (copy), v32 (copy), v35 (copy), l_EventNames_0 (ref), v28 (ref), v29 (ref), v36 (copy), l_Text_0 (ref), v37 (copy), l_LocalizationService_0 (ref), l_AvatarGroup_0 (ref), v33 (copy), l_AvatarGroupType_0 (ref), l_InputSize_0 (ref), l_Button_0 (ref), v34 (copy), l_SquadPromptType_0 (ref), l_unsubscribeFromScheduledSquad_0 (ref), v41 (copy), v44 (copy), l_subscribeToScheduledSquad_0 (ref), l_ButtonVariant_0 (ref)
        local v45 = {};
        for v46, v47 in v40 do
            local v48 = tostring(v47.initiatorId) == tostring(v31);
            local v50 = v3.List.map(v47.subscribers, function(v49) --[[ Line: 109 ]]
                return v49.userId;
            end);
            local v52 = v48 or v3.List.findWhere(v50, function(v51) --[[ Line: 114 ]]
                -- upvalues: v31 (ref)
                return tostring(v51) == tostring(v31);
            end) ~= nil;
            local v53 = DateTime.fromIsoDate(v47.startTime);
            table.insert(v45, v5.createElement(l_View_0, {
                LayoutOrder = #v45 + 1, 
                onActivated = function() --[[ Line: 125 ]] --[[ Name: onActivated ]]
                    -- upvalues: v42 (ref), v32 (ref), v47 (copy), v35 (ref), l_EventNames_0 (ref), v28 (ref), v29 (ref), v36 (ref)
                    v42();
                    v32.navigate("ChatConversation", {
                        conversationId = v47.parentChannelId
                    });
                    v35.fireSquadAnalytics(l_EventNames_0.ScheduledSquadAction, {
                        actionType = v28.NavigateToAssociatedChat, 
                        conversationId = v47.parentChannelId, 
                        scheduledSquadId = v47.scheduledGroupUpId, 
                        source = v29.SubscribedScheduledSquadsListSheet, 
                        squadId = v36, 
                        squadLocation = v35.squadLocation
                    });
                end, 
                tag = "size-full-0 auto-y col gap-xsmall radius-large padding-y-small padding-x-medium"
            }, {
                TitleText = v5.createElement(l_Text_0, {
                    LayoutOrder = 1, 
                    tag = "size-full-0 auto-y text-title-large text-align-x-left text-truncate-end", 
                    Text = v37.scheduledPartyText
                }), 
                DateTimeText = v5.createElement(l_Text_0, {
                    LayoutOrder = 2, 
                    tag = "size-full-0 auto-y text-body-medium text-align-x-left text-truncate-end", 
                    Text = if v53 then v53:FormatLocalTime("LLL", l_LocalizationService_0.RobloxLocaleId) else ""
                }), 
                SubscribedContainer = v5.createElement(l_View_0, {
                    LayoutOrder = 3, 
                    tag = "size-full-0 auto-y row gap-small padding-y-xsmall align-y-center align-x-left"
                }, {
                    AvatarGroup = v5.createElement(l_AvatarGroup_0, {
                        avatars = v50, 
                        backplateStyle = {
                            Color3 = v33.Color.Shift.Shift_200.Color3, 
                            Transparency = v33.Color.Shift.Shift_200.Transparency
                        }, 
                        LayoutOrder = 1, 
                        max = 3, 
                        type = l_AvatarGroupType_0.Stacked, 
                        size = l_InputSize_0.XSmall
                    }), 
                    NumberSubscribed = v5.createElement(l_Text_0, {
                        LayoutOrder = 2, 
                        tag = "size-full-0 auto-y text-caption-medium text-align-x-left", 
                        Text = ("%*"):format(v37.goingText)
                    })
                }), 
                ActionButton = v5.createElement(l_Button_0, {
                    LayoutOrder = 4, 
                    onActivated = function() --[[ Line: 175 ]] --[[ Name: onActivated ]]
                        -- upvalues: v48 (copy), v42 (ref), v35 (ref), v34 (ref), v47 (copy), l_SquadPromptType_0 (ref), v52 (copy), l_unsubscribeFromScheduledSquad_0 (ref), v3 (ref), v31 (ref), v41 (ref), v40 (ref), v46 (copy), v44 (ref), l_subscribeToScheduledSquad_0 (ref), l_EventNames_0 (ref), v28 (ref), v29 (ref), v36 (ref)
                        if v48 then
                            v42();
                            v35.setSquadPrompt(v34, {
                                additionalInfo = v47, 
                                conversationId = v47.parentChannelId, 
                                promptType = l_SquadPromptType_0.ScheduleSquad
                            });
                        elseif v52 then
                            l_unsubscribeFromScheduledSquad_0({
                                scheduledGroupUpId = v47.scheduledGroupUpId
                            }, function() --[[ Line: 189 ]]
                                -- upvalues: v3 (ref), v47 (ref), v31 (ref), v41 (ref), v40 (ref), v46 (ref)
                                local v55 = v3.Dictionary.join(v47, {
                                    subscribers = v3.List.filter(v47.subscribers, function(v54) --[[ Line: 193 ]]
                                        -- upvalues: v31 (ref)
                                        return tostring(v54.userId) ~= tostring(v31);
                                    end)
                                });
                                v41(v3.List.replaceIndex(v40, v46, v55));
                            end, v44);
                        else
                            l_subscribeToScheduledSquad_0({
                                scheduledGroupUpId = v47.scheduledGroupUpId
                            }, function() --[[ Line: 207 ]]
                                -- upvalues: v3 (ref), v47 (ref), v31 (ref), v41 (ref), v40 (ref), v46 (ref)
                                local v56 = v3.Dictionary.join(v47, {
                                    subscribers = v3.List.join(v47.subscribers, {
                                        {
                                            userId = v31
                                        }
                                    })
                                });
                                v41(v3.List.replaceIndex(v40, v46, v56));
                            end, v44);
                        end;
                        v35.fireSquadAnalytics(l_EventNames_0.ScheduledSquadAction, {
                            actionType = if v48 then v28.Edit else if v52 then v28.Unsubscribe else v28.Subscribe, 
                            conversationId = v47.parentChannelId, 
                            scheduledSquadId = v47.scheduledGroupUpId, 
                            source = v29.SubscribedScheduledSquadsListSheet, 
                            squadId = v36, 
                            squadLocation = v35.squadLocation
                        });
                    end, 
                    text = if v48 then v37.editText else v37.interestedText, 
                    variant = if not not v48 or v52 then l_ButtonVariant_0.Standard else l_ButtonVariant_0.Emphasis, 
                    width = UDim.new(1, 0)
                })
            }));
        end;
        return v45;
    end, {
        v40, 
        v42, 
        v44
    });
    return v5.createElement(l_Sheet_0.Root, {
        onClose = v42, 
        isOpen = v30.isOpen, 
        preferCenterSheet = true, 
        snapPoints = {
            0.4, 
            0.7
        }
    }, {
        Header = v5.createElement(l_Sheet_0.Header, {}, {
            Title = v5.createElement(l_Text_0, {
                LayoutOrder = 1, 
                Text = v37.upcomingPartiesText, 
                tag = "size-full-0 auto-y text-wrap text-heading-medium text-align-x-left"
            })
        }), 
        Content = v5.createElement(l_Sheet_0.Content, {}, {
            Loading = if v38 then v5.createElement(l_Loading_0, {}) else nil, 
            ScheduledSquadsList = if not v38 and #v3.Dictionary.keys(v40) > 0 then v5.createElement(l_View_0, {
                tag = "auto-y size-full-0 col gap-xsmall"
            }, unpack(v57)) else nil, 
            NoUpcomingScheduledSquads = if not v38 and #v3.Dictionary.keys(v40) == 0 then v5.createElement(l_Text_0, {
                Text = v37.noScheduledSquadsText, 
                tag = "size-full-0 auto-y text-label-medium text-align-x-left"
            }) else nil
        })
    });
end;