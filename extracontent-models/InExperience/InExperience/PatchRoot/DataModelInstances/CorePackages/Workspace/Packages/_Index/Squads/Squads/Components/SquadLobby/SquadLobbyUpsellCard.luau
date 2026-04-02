local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Responsive);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v4 = require(l_script_FirstAncestor_0.dependencies);
local l_Foundation_0 = v4.Foundation;
local l_React_0 = v4.React;
local l_dependencyArray_0 = v4.Hooks.dependencyArray;
local l_NetworkingSquads_0 = v4.NetworkingSquads;
local l_NetworkStatus_0 = v4.RoduxNetworking.Enum.NetworkStatus;
local l_SquadsCore_0 = v4.SquadsCore;
local l_useEffectOnce_0 = v4.Hooks.useEffectOnce;
local l_useDispatch_0 = v4.Hooks.useDispatch;
local l_useSelector_0 = v4.Hooks.useSelector;
local l_useTokens_0 = l_Foundation_0.Hooks.useTokens;
local l_useCurrentSquadSelector_0 = v4.Hooks.useCurrentSquadSelector;
local l_useLocalization_0 = v4.Hooks.useLocalization;
local l_reinviteToSquad_0 = l_SquadsCore_0.Thunks.reinviteToSquad;
local l_EventNames_0 = l_SquadsCore_0.Analytics.EventNames;
local l_SquadExternalContractContext_0 = l_SquadsCore_0.SquadExternalContractProvider.SquadExternalContractContext;
local l_useCurrentSquadId_0 = l_SquadsCore_0.Hooks.useCurrentSquadId;
local l_AvatarGroup_0 = l_Foundation_0.AvatarGroup;
local l_AvatarGroupType_0 = l_Foundation_0.Enums.AvatarGroupType;
local l_InputSize_0 = l_Foundation_0.Enums.InputSize;
local v24 = require(l_script_FirstAncestor_0.Enums.NoResponseInviteAgainOrAddOthersEnum);
local v25 = require(l_script_FirstAncestor_0.Enums.SquadInvitePageNavSourceEnum);
local l_FFlagRemoveDependencyArrayAntipattern_0 = v4.SharedFlags.FFlagRemoveDependencyArrayAntipattern;
return function(v27) --[[ Line: 45 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useTokens_0 (copy), v2 (copy), l_useLocalUserId_0 (copy), l_useLocalization_0 (copy), l_useCurrentSquadSelector_0 (copy), l_useCurrentSquadId_0 (copy), l_React_0 (copy), l_NetworkingSquads_0 (copy), l_useSelector_0 (copy), l_SquadExternalContractContext_0 (copy), l_Foundation_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_AvatarGroup_0 (copy), l_InputSize_0 (copy), l_AvatarGroupType_0 (copy), l_useEffectOnce_0 (copy), l_EventNames_0 (copy), v24 (copy), l_reinviteToSquad_0 (copy), v25 (copy), l_NetworkStatus_0 (copy)
    local v28 = l_useDispatch_0();
    local v29 = l_useTokens_0();
    local v30 = v2.useBreakpointXOrSmaller(v2.Keys.XSmall);
    local v31 = v2.useBreakpointYOrSmaller(v2.Keys.XSmall);
    local v32 = l_useLocalUserId_0();
    local v33 = l_useLocalization_0({
        addOthers = "Feature.Squads.Action.AddOthers", 
        upsellText = "Feature.Squads.Description.upsellInviteText", 
        inviteText = "Feature.Squads.Action.Invite", 
        inviteAgain = "Feature.Squads.Action.InviteAgain"
    });
    local v34 = l_useCurrentSquadSelector_0();
    local v35 = if v34 and v34.parentChannelId then v34.parentChannelId else nil;
    local v36 = l_useCurrentSquadId_0();
    local v38 = l_React_0.useCallback(function(v37) --[[ Line: 65 ]]
        -- upvalues: l_NetworkingSquads_0 (ref), v36 (copy)
        return l_NetworkingSquads_0.ReinviteToSquad.getStatus(v37, {
            squadId = v36
        });
    end, {
        v36
    });
    local v39 = l_useSelector_0(v38);
    local v40 = l_React_0.useContext(l_SquadExternalContractContext_0);
    local v41 = v40.useGetConversationFromId(v35 or "");
    local v42 = l_React_0.useMemo(function() --[[ Line: 74 ]]
        -- upvalues: l_React_0 (ref), l_Foundation_0 (ref), v29 (copy), v33 (copy)
        return l_React_0.createElement(l_Foundation_0.Text, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            fontStyle = v29.Typography.BodyLarge, 
            LayoutOrder = 1, 
            Text = v33.upsellText, 
            textStyle = v29.Color.Content.Default, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextWrapped = true
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v29, 
        v33.upsellText
    } else l_dependencyArray_0(v29, v33.upsellText));
    local v46 = l_React_0.useMemo(function() --[[ Line: 92 ]]
        -- upvalues: v41 (copy), v32 (copy), v31 (copy), v30 (copy), l_React_0 (ref), l_AvatarGroup_0 (ref), l_InputSize_0 (ref), l_AvatarGroupType_0 (ref), v29 (copy)
        local v43 = {};
        if v41 and v41.participants then
            for _, v45 in ipairs(v41.participants) do
                if v45 ~= v32 then
                    table.insert(v43, v45);
                end;
            end;
        end;
        if v31 or v30 then
            return nil;
        else
            return (l_React_0.createElement(l_AvatarGroup_0, {
                avatars = v43, 
                size = l_InputSize_0.Medium, 
                type = l_AvatarGroupType_0.Stacked, 
                max = 4, 
                imageBackgroundStyle = {
                    Color3 = v29.Color.OverMedia.OverMedia_300.Color3, 
                    Transparency = v29.Color.OverMedia.OverMedia_300.Transparency
                }, 
                imageBorderStyle = {
                    Color = v29.Color.Surface.Surface_0.Color3, 
                    Transparency = v29.Color.Surface.Surface_0.Transparency
                }, 
                layoutOrder = 0
            }));
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v41 and v41.participants, 
        v32, 
        v31, 
        v30
    } else l_dependencyArray_0(v41 and v41.participants, v32, v31, v30));
    l_useEffectOnce_0(function() --[[ Line: 125 ]]
        -- upvalues: v40 (copy), l_EventNames_0 (ref), v24 (ref), v35 (copy)
        v40.fireSquadAnalytics(l_EventNames_0.NoResponseInviteAgainOrAddOthers, {
            actionType = v24.Impression, 
            button = v24.InviteAgain, 
            conversationId = v35
        });
        v40.fireSquadAnalytics(l_EventNames_0.NoResponseInviteAgainOrAddOthers, {
            actionType = v24.Impression, 
            button = v24.AddOthers, 
            conversationId = v35
        });
    end, v35);
    local v47 = l_React_0.useCallback(function() --[[ Line: 138 ]]
        -- upvalues: v28 (copy), l_reinviteToSquad_0 (ref), v36 (copy), v40 (copy), l_EventNames_0 (ref), v24 (ref), v35 (copy)
        v28(l_reinviteToSquad_0(v36, v40.setSquadPrompt));
        v40.fireSquadAnalytics(l_EventNames_0.NoResponseInviteAgainOrAddOthers, {
            actionType = v24.Click, 
            button = v24.InviteAgain, 
            conversationId = v35
        });
    end, {
        v40.fireSquadAnalytics, 
        v35
    });
    local v48 = l_React_0.useCallback(function() --[[ Line: 149 ]]
        -- upvalues: v40 (copy), l_EventNames_0 (ref), v24 (ref), v35 (copy), v25 (ref), v27 (copy)
        v40.fireSquadAnalytics(l_EventNames_0.NoResponseInviteAgainOrAddOthers, {
            actionType = v24.Click, 
            button = v24.AddOthers, 
            conversationId = v35
        });
        v40.fireSquadAnalytics(l_EventNames_0.SquadInvitePageNavSource, {
            inviteNavSource = v25.SquadLobbyUpsellCardClicked, 
            parentChannelId = v35
        });
        v27.navigateToSquadInviteFriends();
    end, {
        v35, 
        v40.fireSquadAnalytics, 
        v27.navigateToSquadInviteFriends
    });
    local v49 = l_React_0.useMemo(function() --[[ Line: 168 ]]
        -- upvalues: l_React_0 (ref), l_Foundation_0 (ref), v39 (copy), l_NetworkStatus_0 (ref), v47 (copy), v33 (copy)
        return l_React_0.createElement(l_Foundation_0.Button, {
            fillBehavior = l_Foundation_0.Enums.FillBehavior.Fill, 
            isDisabled = v39 == l_NetworkStatus_0.Fetching, 
            LayoutOrder = 1, 
            onActivated = v47, 
            text = v33.inviteAgain, 
            size = l_Foundation_0.Enums.InputSize.Medium, 
            variant = l_Foundation_0.Enums.ButtonVariant.Standard
        });
    end, {
        v47, 
        v33.inviteAgain, 
        v39
    });
    local v50 = l_React_0.useMemo(function() --[[ Line: 184 ]]
        -- upvalues: l_React_0 (ref), l_Foundation_0 (ref), v48 (copy), v33 (copy)
        return l_React_0.createElement(l_Foundation_0.Button, {
            fillBehavior = l_Foundation_0.Enums.FillBehavior.Fill, 
            LayoutOrder = 2, 
            onActivated = v48, 
            text = v33.addOthers, 
            size = l_Foundation_0.Enums.ButtonSize.Medium, 
            variant = l_Foundation_0.Enums.ButtonVariant.Standard
        });
    end, {
        v48, 
        v33.addOthers
    });
    return l_React_0.createElement("Frame", {
        Size = v27.size, 
        BackgroundTransparency = 1, 
        LayoutOrder = v27.layoutOrder
    }, {
        l_React_0.createElement(l_Foundation_0.View, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.new(1, -2 * v29.Stroke.Standard, 1, -2 * v29.Stroke.Standard), 
            cornerRadius = UDim.new(0, v29.Radius.Medium), 
            padding = v29.Padding.XXLarge, 
            layout = {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, if not not v31 or v30 then v29.Padding.Medium else v29.Padding.XXLarge), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }, 
            stroke = {
                Color = v29.Color.Stroke.Default.Color3, 
                Transparency = v29.Color.Stroke.Default.Transparency, 
                Thickness = v29.Stroke.Standard
            }
        }, {
            UpsellInformation = l_React_0.createElement(l_Foundation_0.View, {
                LayoutOrder = 1, 
                tag = "size-full-0 gap-medium align-x-center auto-y col"
            }, {
                UpsellFacepile = v46, 
                UpsellLabel = v42
            }), 
            Buttons = l_React_0.createElement(l_Foundation_0.View, {
                LayoutOrder = 2, 
                tag = {
                    ["size-full-0 gap-small align-x-center flex-fill align-y-center auto-y"] = true, 
                    col = v30, 
                    row = not v30
                }
            }, {
                InviteAgainButton = v49, 
                AddOthersButton = v50
            })
        })
    });
end;