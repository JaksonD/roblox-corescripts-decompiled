local l_UserInputService_0 = game:GetService("UserInputService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.ReactOtter);
local v4 = require(l_Parent_0.SharedFlags);
local _ = require(l_script_FirstAncestor_0.Enums.SquadButtonSourceEnum);
local v6 = require(l_script_FirstAncestor_0.Enums.SquadButtonClickIntentionEnum);
local v7 = require(l_Parent_0.Responsive);
local l_usePreferredInput_0 = v7.usePreferredInput;
local v9 = require(l_script_FirstAncestor_0.dependencies);
local l_Foundation_0 = v9.Foundation;
local l_React_0 = v9.React;
local l_SquadsCore_0 = v9.SquadsCore;
local l_dependencyArray_0 = v9.Hooks.dependencyArray;
local l_SquadExternalContractContext_0 = v9.SquadsCore.SquadExternalContractProvider.SquadExternalContractContext;
local l_SquadState_0 = v9.SquadsCore.Enums.SquadState;
local l_leaveSquad_0 = v9.SquadsCore.Thunks.leaveSquad;
local l_useDispatch_0 = v9.Hooks.useDispatch;
local l_useLocalization_0 = v9.Hooks.useLocalization;
local l_useSelector_0 = v9.Hooks.useSelector;
local l_EventNames_0 = l_SquadsCore_0.Analytics.EventNames;
local l_SquadPromptType_0 = v9.SquadsCore.Enums.SquadPromptType;
local l_useSquadState_0 = l_SquadsCore_0.Hooks.useSquadState;
local l_useTokens_0 = l_Foundation_0.Hooks.useTokens;
local l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 = v4.FFlagPartyDevAPIToRespectThirdPartySettingsEnabled;
local l_FFlagDebugAppChatEnableDomLocators_0 = v4.FFlagDebugAppChatEnableDomLocators;
local l_FFlagRemoveDependencyArrayAntipattern_0 = v4.FFlagRemoveDependencyArrayAntipattern;
local v27 = {
    dampingRatio = 1, 
    frequency = 1
};
return function(v28) --[[ Line: 60 ]]
    -- upvalues: l_useLocalization_0 (copy), l_useDispatch_0 (copy), l_usePreferredInput_0 (copy), l_useTokens_0 (copy), l_React_0 (copy), l_SquadExternalContractContext_0 (copy), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (copy), l_useSquadState_0 (copy), v3 (copy), v27 (copy), l_useSelector_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v6 (copy), l_EventNames_0 (copy), l_leaveSquad_0 (copy), l_SquadPromptType_0 (copy), l_Foundation_0 (copy), l_SquadState_0 (copy), l_FFlagDebugAppChatEnableDomLocators_0 (copy), v7 (copy), l_UserInputService_0 (copy)
    local v29 = l_useLocalization_0({
        joinButtonText = "Feature.Squads.Action.Join", 
        startButtonText = "Feature.Squads.Action.Start", 
        viewButtonText = "Feature.Squads.Action.View"
    });
    local v30 = l_useDispatch_0();
    local v31 = l_usePreferredInput_0();
    local v32 = l_useTokens_0();
    local v33 = l_React_0.useContext(l_SquadExternalContractContext_0);
    local v34 = v33.useParentChannelHasGroupUp(v28.conversationId);
    local v35 = not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v33.useIsChatEnabled();
    local v36 = l_useSquadState_0();
    local v37 = nil;
    local v38 = nil;
    local v40, v41 = v3.useAnimatedBinding(1, function(v39) --[[ Line: 80 ]]
        -- upvalues: v28 (copy), v38 (ref), v3 (ref), v27 (ref)
        if v28.shouldAnimate then
            task.delay(0.5, function() --[[ Line: 82 ]]
                -- upvalues: v38 (ref), v3 (ref), v39 (copy), v27 (ref)
                v38(v3.spring(v39 == 1 and 0 or 1, v27));
            end);
        end;
    end);
    v37 = v40;
    v38 = v41;
    l_React_0.useEffect(function() --[[ Line: 88 ]]
        -- upvalues: v28 (copy), v38 (ref), v3 (ref), v27 (ref)
        if v28.shouldAnimate then
            v38(v3.spring(1, v27));
            return;
        else
            v38(v3.instant(1));
            return;
        end;
    end, {
        v28.shouldAnimate, 
        v38
    });
    v40 = l_React_0.useCallback(function(v42) --[[ Line: 96 ]]
        if v42.Squad and v42.Squad.Squad then
            return v42.Squad.Squad.currentSquad;
        else
            return nil;
        end;
    end, {});
    v41 = l_useSelector_0(v40);
    local v43 = l_React_0.useMemo(function() --[[ Line: 106 ]]
        -- upvalues: v41 (copy), v28 (copy)
        return v41 and v41.parentChannelId == v28.conversationId;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v41, 
        v28.conversationId
    } else l_dependencyArray_0(v41, v28.conversationId));
    local v44 = l_React_0.useMemo(function() --[[ Line: 115 ]]
        -- upvalues: v43 (copy), v6 (ref), v34 (copy)
        if v43 then
            return v6.View;
        elseif v34 then
            return v6.Join;
        else
            return v6.Create;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v43, 
        v34
    } else l_dependencyArray_0(v43, v34));
    local v45 = l_React_0.useMemo(function() --[[ Line: 130 ]]
        -- upvalues: v43 (copy), v29 (copy), v34 (copy)
        if v43 then
            return v29.viewButtonText;
        elseif v34 then
            return v29.joinButtonText;
        else
            return v29.startButtonText;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v34, 
        v43, 
        v29.joinButtonText, 
        v29.startButtonText, 
        v29.viewButtonText
    } else l_dependencyArray_0(v34, v43, v29.joinButtonText, v29.startButtonText, v29.viewButtonText));
    local v46 = l_React_0.useCallback(function() --[[ Line: 157 ]]
        -- upvalues: v33 (copy), l_EventNames_0 (ref), v28 (copy), v41 (copy), v44 (copy)
        v33.fireSquadAnalytics(l_EventNames_0.EnterSquadButtonPressed, {
            conversationId = v28.conversationId, 
            squadButtonSource = v28.squadButtonSource, 
            squadId = v41 and v41.squadId, 
            squadLocation = v28.squadLocation, 
            userIntention = v44
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v44, 
        v41, 
        v28.conversationId, 
        v28.squadButtonSource, 
        v28.squadLocation, 
        v33.fireSquadAnalytics
    } else l_dependencyArray_0(v44, v41, v28.conversationId, v28.squadButtonSource, v28.squadLocation, v33.fireSquadAnalytics));
    local v47 = l_React_0.useCallback(function() --[[ Line: 186 ]]
        -- upvalues: v46 (copy), v43 (copy), v41 (copy), v30 (copy), l_leaveSquad_0 (ref), l_SquadPromptType_0 (ref), v33 (copy), v28 (copy), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), v35 (copy)
        v46();
        if not v43 and v41 then
            v30(l_leaveSquad_0(l_SquadPromptType_0.JoinAnotherSquad, v33.setSquadPrompt, function() --[[ Line: 193 ]]
                -- upvalues: v28 (ref)
                v28.onActivated(v28.conversationId);
            end, v33.squadLocation, not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v35));
            return;
        else
            v28.onActivated(v28.conversationId);
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v41, 
        v43, 
        v28.onActivated, 
        v46, 
        v33.setSquadPrompt, 
        v33.squadLocation, 
        if l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 then v35 else nil
    } else l_dependencyArray_0(v41, v43, v28.onActivated, v46, v33.setSquadPrompt, v33.squadLocation, if l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 then v35 else nil));
    local v48 = l_React_0.useMemo(function() --[[ Line: 225 ]]
        -- upvalues: v32 (copy), v28 (copy)
        if v32.Config.ColorMode.IsLight == "true" then
            if v28.isInCard then
                return v32.Color.Extended.Gray.Gray_300;
            else
                return v32.Color.Extended.Gray.Gray_200;
            end;
        elseif v28.isInCard then
            return v32.Color.Extended.Gray.Gray_800;
        else
            return v32.Color.Extended.Gray.Gray_900;
        end;
    end, {
        v28.isInCard, 
        v32.Config.ColorMode.IsLight
    });
    return l_React_0.createElement(l_Foundation_0.View, {
        tag = "row align-x-center align-y-center gap-xsmall stroke-action-standard radius-medium bg-action-standard", 
        AutomaticSize = if v28.isFullWidth then Enum.AutomaticSize.None else Enum.AutomaticSize.XY, 
        Size = UDim2.new(v28.isFullWidth and 1 or 0, 0, 0, v32.Size.Size_800), 
        isDisabled = v36 == l_SquadState_0.Initializing, 
        onActivated = v47, 
        LayoutOrder = v28.layoutOrder, 
        padding = {
            left = UDim.new(0, v32.Padding.Small), 
            right = UDim.new(0, v32.Padding.Small)
        }, 
        selection = {
            Selectable = v28.Selectable
        }, 
        testId = if l_FFlagDebugAppChatEnableDomLocators_0 then ("%*%*"):format(v28.testId, v44) else nil
    }, {
        GroupIconContainer = l_React_0.createElement(l_Foundation_0.View, {
            tag = "size-400-400", 
            LayoutOrder = 1
        }, {
            GroupIcon = l_React_0.createElement(l_Foundation_0.Icon, {
                name = l_Foundation_0.Enums.IconName.ThreePeople, 
                size = l_Foundation_0.Enums.IconSize.Small, 
                style = v32.Color.ActionStandard.Foreground, 
                variant = l_Foundation_0.Enums.IconVariant.Regular
            }), 
            GreenDot = if not not v34 or v43 then l_React_0.createElement(l_Foundation_0.View, {
                tag = "radius-circle anchor-top-right", 
                Size = UDim2.fromOffset(v32.Size.Size_200, v32.Size.Size_200), 
                backgroundStyle = v37:map(function(v49) --[[ Line: 271 ]]
                    -- upvalues: v32 (copy)
                    return {
                        Color3 = v32.Color.Extended.Green.Green_500.Color3, 
                        Transparency = 1 + (v32.Color.Extended.Green.Green_500.Transparency - 1) * v49
                    };
                end), 
                Position = UDim2.new(1, v32.Size.Size_50, 0, -v32.Size.Size_50), 
                stroke = {
                    Color = v48.Color3, 
                    Transparency = v37:map(function(v50) --[[ Line: 280 ]]
                        -- upvalues: v48 (copy)
                        return 1 + (v48.Transparency - 1) * v50;
                    end), 
                    Thickness = v32.Stroke.Thicker
                }, 
                ZIndex = 2
            }) else nil
        }), 
        TextLabel = l_React_0.createElement(l_Foundation_0.Text, {
            tag = "auto-xy text-label-small content-action-standard text-truncate-end text-no-wrap", 
            LayoutOrder = 2, 
            Text = v45, 
            padding = {
                right = UDim.new(0, v32.Padding.XXSmall)
            }, 
            sizeConstraint = if v28.isFullWidth then nil else {
                MaxSize = Vector2.new(v32.Size.Size_2800, v32.Size.Size_800)
            }
        }), 
        SignifierImage = if v28.shouldShowSignifier and v31 == v7.Input.Directional then l_React_0.createElement(l_Foundation_0.Icon, {
            LayoutOrder = 3, 
            name = l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonX), 
            size = l_Foundation_0.Enums.IconSize.Small, 
            style = v32.Color.ActionStandard.Foreground
        }) else nil
    });
end;