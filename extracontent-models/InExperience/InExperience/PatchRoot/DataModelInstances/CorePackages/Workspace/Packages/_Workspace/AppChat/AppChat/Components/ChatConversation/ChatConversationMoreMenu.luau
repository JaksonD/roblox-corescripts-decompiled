local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.FocusNavigationUtils);
local v4 = require(l_Parent_0.InputHandlers);
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.ReactFocusNavigation);
local v7 = require(l_Parent_0.SharedFlags);
local v8 = require(l_Parent_0.Squads);
local v9 = require(l_Parent_0.SquadsCore);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v12 = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatConversationTelemetryLayer);
local v13 = require(l_script_FirstAncestor_0.Analytics.Enums.ConversationActionType);
local v14 = require(l_script_FirstAncestor_0.Telemetry.useTelemetry);
local v15 = require(script.Parent.ChatConversationTelemetryEvents);
local l_leaveSquad_0 = v9.Thunks.leaveSquad;
local l_SquadPromptType_0 = v9.Enums.SquadPromptType;
local l_useCurrentSquadId_0 = v9.Hooks.useCurrentSquadId;
local l_useCurrentSquadParentChannelId_0 = v9.Hooks.useCurrentSquadParentChannelId;
local l_SquadExternalContractContext_0 = v9.SquadExternalContractProvider.SquadExternalContractContext;
local l_EventNames_0 = v9.Analytics.EventNames;
local l_ScheduledSquadSheet_0 = v8.ScheduledSquadSheet;
local l_ScheduledSquadActionEnum_0 = v8.Enums.ScheduledSquadActionEnum;
local l_ScheduledSquadActionSourceEnum_0 = v8.Enums.ScheduledSquadActionSourceEnum;
local l_SquadButtonClickIntentionEnum_0 = v8.Enums.SquadButtonClickIntentionEnum;
local l_SquadButtonSourceEnum_0 = v8.Enums.SquadButtonSourceEnum;
local l_IconName_0 = v2.Enums.IconName;
local l_Menu_0 = v2.Menu;
local l_PopoverAlign_0 = v2.Enums.PopoverAlign;
local l_PopoverSide_0 = v2.Enums.PopoverSide;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v3.FocusNavigableSurfaceIdentifierEnum;
local l_FocusNavigationEventNameEnum_0 = v3.FocusNavigationEventNameEnum;
local l_useFocusNavigableSurfaceRegistryConnection_0 = v3.useFocusNavigableSurfaceRegistryConnection;
local l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 = v7.FFlagPartyDevAPIToRespectThirdPartySettingsEnabled;
local v36 = game:DefineFastFlag("EnableMoreMenuFocusFix", false);
local l_FFlagEnableScheduledSquads_0 = v7.FFlagEnableScheduledSquads;
local v38 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
return v5.memo(function(v39) --[[ Line: 67 ]]
    -- upvalues: v14 (copy), v12 (copy), l_useDispatch_0 (copy), l_useTokens_0 (copy), l_useLocalization_0 (copy), l_useCurrentSquadId_0 (copy), l_useCurrentSquadParentChannelId_0 (copy), v5 (copy), l_SquadExternalContractContext_0 (copy), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (copy), l_FFlagEnableScheduledSquads_0 (copy), v36 (copy), l_useFocusNavigableSurfaceRegistryConnection_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v6 (copy), v38 (copy), l_FocusNavigationEventNameEnum_0 (copy), v4 (copy), l_EventNames_0 (copy), l_ScheduledSquadActionEnum_0 (copy), l_ScheduledSquadActionSourceEnum_0 (copy), l_leaveSquad_0 (copy), l_SquadPromptType_0 (copy), l_SquadButtonSourceEnum_0 (copy), l_SquadButtonClickIntentionEnum_0 (copy), v15 (copy), v13 (copy), l_IconName_0 (copy), v2 (copy), l_ScheduledSquadSheet_0 (copy), l_Menu_0 (copy), l_PopoverSide_0 (copy), l_PopoverAlign_0 (copy)
    local v40 = v14(v12.Context);
    local v41 = l_useDispatch_0();
    local v42 = l_useTokens_0();
    local v43 = l_useLocalization_0({
        joinParty = "Feature.Squads.Label.JoinParty", 
        moreText = "CommonUI.Features.Label.More", 
        scheduleAParty = "Feature.Squads.Action.ScheduleAParty", 
        startParty = "Feature.Squads.Label.StartParty", 
        viewParty = "Feature.Squads.Label.ViewParty"
    });
    local v44 = l_useCurrentSquadId_0();
    local v45 = l_useCurrentSquadParentChannelId_0();
    local v46 = v5.useContext(l_SquadExternalContractContext_0);
    local v47 = not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v46.useIsChatEnabled();
    local v48, v49 = v5.useState(not l_FFlagEnableScheduledSquads_0 and nil);
    local v50, v51 = v5.useState(false);
    local v52, v53 = v5.useState(if l_FFlagEnableScheduledSquads_0 then v39.tooltipText and v39.tooltipText ~= "" else nil);
    local v54 = nil;
    if v36 then
        local v55 = v5.useRef(nil);
        l_useFocusNavigableSurfaceRegistryConnection_0(v55 and v55.current, l_FocusNavigableSurfaceIdentifierEnum_0.ContextualMenu, v50);
        local v56 = v6.useEventMap(v38, v55);
        local v58 = v5.useMemo(function() --[[ Line: 102 ]]
            -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v4 (ref), v51 (copy)
            return {
                [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                    handler = v4.onRelease(function(v57) --[[ Line: 105 ]]
                        -- upvalues: v51 (ref)
                        v57.cancelled = true;
                        v51(false);
                    end)
                }
            };
        end, {
            v51
        });
        v54 = v6.useEventHandlerMap(v58, v56);
        local l_v55_0 = v55 --[[ copy: 16 -> 24 ]];
        v5.useEffect(function() --[[ Line: 114 ]]
            -- upvalues: l_v55_0 (copy)
            if l_v55_0 and l_v55_0.current then
                l_v55_0.current.SelectionBehaviorDown = Enum.SelectionBehavior.Stop;
                l_v55_0.current.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop;
                l_v55_0.current.SelectionBehaviorRight = Enum.SelectionBehavior.Stop;
                l_v55_0.current.SelectionBehaviorUp = Enum.SelectionBehavior.Stop;
                l_v55_0.current.SelectionGroup = true;
            end;
        end, {
            v50
        });
    end;
    local v60 = v5.useCallback(function() --[[ Line: 126 ]]
        -- upvalues: v51 (copy)
        v51(false);
    end, {});
    local v61 = v5.useCallback(function() --[[ Line: 131 ]]
        -- upvalues: l_FFlagEnableScheduledSquads_0 (ref), v49 (copy), v46 (copy), l_EventNames_0 (ref), l_ScheduledSquadActionEnum_0 (ref), v39 (copy), l_ScheduledSquadActionSourceEnum_0 (ref), v44 (copy)
        if l_FFlagEnableScheduledSquads_0 then
            v49(true);
            v46.fireSquadAnalytics(l_EventNames_0.ScheduledSquadAction, {
                actionType = l_ScheduledSquadActionEnum_0.ScheduleParty, 
                conversationId = v39.conversationId, 
                source = l_ScheduledSquadActionSourceEnum_0.ChatConversationMoreMenu, 
                squadId = v44, 
                squadLocation = v46.squadLocation
            });
        end;
    end, if l_FFlagEnableScheduledSquads_0 then {
        v46.setSquadPrompt, 
        v39.conversationId, 
        v44, 
        v46.squadLocation, 
        v46.fireSquadAnalytics
    } else nil);
    local v62 = v5.useCallback(function() --[[ Line: 156 ]]
        -- upvalues: v44 (copy), v39 (copy), v45 (copy), v41 (copy), l_leaveSquad_0 (ref), l_SquadPromptType_0 (ref), v46 (copy), v47 (copy), l_EventNames_0 (ref), l_SquadButtonSourceEnum_0 (ref), l_SquadButtonClickIntentionEnum_0 (ref)
        if v44 and v39.conversationId ~= v45 then
            v41(l_leaveSquad_0(l_SquadPromptType_0.JoinAnotherSquad, v46.setSquadPrompt, function() --[[ Line: 159 ]]
                -- upvalues: v39 (ref)
                v39.navigateToSquadLobby(v39.conversationId);
            end, v46.squadLocation, v47));
        else
            v39.navigateToSquadLobby(v39.conversationId);
        end;
        v46.fireSquadAnalytics(l_EventNames_0.EnterSquadButtonPressed, {
            conversationId = v39.conversationId, 
            squadButtonSource = l_SquadButtonSourceEnum_0.ChatConversationMoreMenu, 
            squadId = v44, 
            squadLocation = v46.squadLocation, 
            userIntention = if v39.conversation and v39.conversation.hasGroupUp and v39.conversationId == v45 then l_SquadButtonClickIntentionEnum_0.View else if v39.conversation and v39.conversation.hasGroupUp then l_SquadButtonClickIntentionEnum_0.Join else l_SquadButtonClickIntentionEnum_0.Create
        });
    end, {
        v39.navigateToSquadLobby, 
        v39.conversationId, 
        v39.conversation and v39.conversation.hasGroupUp, 
        v44, 
        v45, 
        v46, 
        v47
    });
    local v64 = v5.useCallback(function(v63) --[[ Line: 191 ]]
        -- upvalues: v62 (copy), l_FFlagEnableScheduledSquads_0 (ref), v61 (copy), v51 (copy)
        if v63 == "createJoinViewParty" then
            v62();
        elseif l_FFlagEnableScheduledSquads_0 and v63 == "scheduleParty" then
            v61();
        end;
        v51(false);
    end, {
        v62, 
        if l_FFlagEnableScheduledSquads_0 then v61 else nil
    });
    local v65 = v5.useCallback(function() --[[ Line: 206 ]]
        -- upvalues: v40 (copy), v15 (ref), v50 (copy), v13 (ref), v51 (copy)
        v40.emit(v15.ConversationMoreMenuBtnClicked, {
            action = if v50 then v13.CloseMoreMenu else v13.OpenMoreMenu
        });
        v51(not v50);
    end, {
        v50, 
        v40
    });
    local v66 = v5.useCallback(function() --[[ Line: 214 ]]
        -- upvalues: v53 (copy)
        v53(false);
    end, {});
    local v68 = v5.useMemo(function() --[[ Line: 219 ]]
        -- upvalues: v39 (copy), v45 (copy), v43 (copy), l_FFlagEnableScheduledSquads_0 (ref), l_IconName_0 (ref)
        local v67 = {};
        table.insert(v67, {
            icon = "icons/menu/groups", 
            id = "createJoinViewParty", 
            isDisabled = false, 
            isChecked = false, 
            text = if v39.conversation and v39.conversation.hasGroupUp and v39.conversationId == v45 then v43.viewParty else if v39.conversation and v39.conversation.hasGroupUp then v43.joinParty else v43.startParty
        });
        if l_FFlagEnableScheduledSquads_0 then
            table.insert(v67, {
                icon = l_IconName_0.Calendar, 
                id = "scheduleParty", 
                isDisabled = false, 
                isChecked = false, 
                text = v43.scheduleAParty
            });
        end;
        return v67;
    end, {
        v39.conversation and v39.conversation.hasGroupUp, 
        v39.conversationId, 
        v45
    });
    if l_FFlagEnableScheduledSquads_0 then
        local v69 = v5.useRef(nil);
        return v5.createElement(v2.View, {
            tag = "auto-xy align-y-center"
        }, {
            MoreMenuButton = v5.createElement(v2.IconButton, {
                icon = {
                    name = v2.Enums.IconName.PlusLarge, 
                    variant = if v50 then v2.Enums.IconVariant.Filled else v2.Enums.IconVariant.Regular
                }, 
                variant = if v50 then v2.Enums.ButtonVariant.Standard else v2.Enums.ButtonVariant.Utility, 
                isCircular = true, 
                LayoutOrder = v39.layoutOrder, 
                onActivated = v65, 
                size = v2.Enums.InputSize.Medium, 
                testId = "ChatConversationMoreMenuButton", 
                ref = v69
            }), 
            ScheduledSquadSheet = if l_FFlagEnableScheduledSquads_0 then v5.createElement(l_ScheduledSquadSheet_0, {
                conversationId = v39.conversationId, 
                isOpen = v48, 
                onClose = function() --[[ Line: 285 ]] --[[ Name: onClose ]]
                    -- upvalues: v49 (copy)
                    v49(false);
                end
            }) else nil, 
            Menu = v5.createElement(l_Menu_0, {
                anchorRef = v69, 
                items = v68, 
                isOpen = v50, 
                onActivated = v64, 
                onPressedOutside = v60, 
                side = l_PopoverSide_0.Top
            }), 
            Tooltip = v5.createElement(v2.Popover.Root, {
                isOpen = v52
            }, {
                Anchor = v5.createElement(v2.Popover.Anchor, {
                    anchorRef = v69
                }), 
                Content = v5.createElement(v2.Popover.Content, {
                    align = {
                        position = l_PopoverAlign_0.Start, 
                        offset = 0
                    }, 
                    backgroundStyle = v42.Inverse.Surface.Surface_0, 
                    hasArrow = true, 
                    onPressedOutside = v66
                }, {
                    TooltipText = v5.createElement(v2.Text, {
                        Text = v39.tooltipText, 
                        tag = "auto-xy text-wrap padding-small content-inverse-emphasis text-body-small"
                    })
                })
            })
        });
    else
        return (v5.createElement(l_Menu_0, {
            items = v68, 
            isOpen = v50, 
            LayoutOrder = v39.layoutOrder, 
            onActivated = v64, 
            onPressedOutside = v60, 
            ref = if v36 then v54 else nil, 
            side = l_PopoverSide_0.Top
        }, {
            MoreMenuButton = v5.createElement(v2.View, {
                tag = "auto-xy align-y-center"
            }, {
                v5.createElement(v2.IconButton, {
                    icon = {
                        name = v2.Enums.IconName.PlusLarge, 
                        variant = if v50 then v2.Enums.IconVariant.Filled else v2.Enums.IconVariant.Regular
                    }, 
                    variant = if v50 then v2.Enums.ButtonVariant.Standard else v2.Enums.ButtonVariant.Utility, 
                    isCircular = true, 
                    LayoutOrder = v39.layoutOrder, 
                    onActivated = v65, 
                    size = v2.Enums.InputSize.Medium, 
                    testId = "ChatConversationMoreMenuButton"
                })
            })
        }));
    end;
end);