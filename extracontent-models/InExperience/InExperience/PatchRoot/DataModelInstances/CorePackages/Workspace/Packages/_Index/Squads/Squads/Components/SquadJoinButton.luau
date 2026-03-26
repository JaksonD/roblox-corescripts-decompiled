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
local l_FFlagAppChatEnableDomLocators_0 = v4.FFlagAppChatEnableDomLocators;
local v26 = {
    dampingRatio = 1, 
    frequency = 1
};
return function(v27) --[[ Line: 58 ]]
    -- upvalues: l_useLocalization_0 (copy), l_useDispatch_0 (copy), l_usePreferredInput_0 (copy), l_useTokens_0 (copy), l_React_0 (copy), l_SquadExternalContractContext_0 (copy), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (copy), l_useSquadState_0 (copy), v3 (copy), v26 (copy), l_useSelector_0 (copy), l_dependencyArray_0 (copy), v6 (copy), l_EventNames_0 (copy), l_leaveSquad_0 (copy), l_SquadPromptType_0 (copy), l_Foundation_0 (copy), l_SquadState_0 (copy), l_FFlagAppChatEnableDomLocators_0 (copy), v7 (copy), l_UserInputService_0 (copy)
    local v28 = l_useLocalization_0({
        joinButtonText = "Feature.Squads.Action.Join", 
        startButtonText = "Feature.Squads.Action.Start", 
        viewButtonText = "Feature.Squads.Action.View"
    });
    local v29 = l_useDispatch_0();
    local v30 = l_usePreferredInput_0();
    local v31 = l_useTokens_0();
    local v32 = l_React_0.useContext(l_SquadExternalContractContext_0);
    local v33 = v32.useParentChannelHasGroupUp(v27.conversationId);
    local v34 = not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v32.useIsChatEnabled();
    local v35 = l_useSquadState_0();
    local v36 = nil;
    local v37 = nil;
    local v39, v40 = v3.useAnimatedBinding(1, function(v38) --[[ Line: 78 ]]
        -- upvalues: v27 (copy), v37 (ref), v3 (ref), v26 (ref)
        if v27.shouldAnimate then
            task.delay(0.5, function() --[[ Line: 80 ]]
                -- upvalues: v37 (ref), v3 (ref), v38 (copy), v26 (ref)
                v37(v3.spring(v38 == 1 and 0 or 1, v26));
            end);
        end;
    end);
    v36 = v39;
    v37 = v40;
    l_React_0.useEffect(function() --[[ Line: 86 ]]
        -- upvalues: v27 (copy), v37 (ref), v3 (ref), v26 (ref)
        if v27.shouldAnimate then
            v37(v3.spring(1, v26));
            return;
        else
            v37(v3.instant(1));
            return;
        end;
    end, {
        v27.shouldAnimate, 
        v37
    });
    v39 = l_React_0.useCallback(function(v41) --[[ Line: 94 ]]
        if v41.Squad and v41.Squad.Squad then
            return v41.Squad.Squad.currentSquad;
        else
            return nil;
        end;
    end, {});
    v40 = l_useSelector_0(v39);
    local v42 = l_React_0.useMemo(function() --[[ Line: 103 ]]
        -- upvalues: v40 (copy), v27 (copy)
        return v40 and v40.parentChannelId == v27.conversationId;
    end, l_dependencyArray_0(v40, v27.conversationId));
    local v43 = l_React_0.useMemo(function() --[[ Line: 107 ]]
        -- upvalues: v42 (copy), v6 (ref), v33 (copy)
        if v42 then
            return v6.View;
        elseif v33 then
            return v6.Join;
        else
            return v6.Create;
        end;
    end, l_dependencyArray_0(v42, v33));
    local v44 = l_React_0.useMemo(function() --[[ Line: 118 ]]
        -- upvalues: v42 (copy), v28 (copy), v33 (copy)
        if v42 then
            return v28.viewButtonText;
        elseif v33 then
            return v28.joinButtonText;
        else
            return v28.startButtonText;
        end;
    end, l_dependencyArray_0(v33, v42, v28.joinButtonText, v28.startButtonText, v28.viewButtonText));
    local v45 = l_React_0.useCallback(function() --[[ Line: 137 ]]
        -- upvalues: v32 (copy), l_EventNames_0 (ref), v27 (copy), v40 (copy), v43 (copy)
        v32.fireSquadAnalytics(l_EventNames_0.EnterSquadButtonPressed, {
            conversationId = v27.conversationId, 
            squadButtonSource = v27.squadButtonSource, 
            squadId = v40 and v40.squadId, 
            squadLocation = v27.squadLocation, 
            userIntention = v43
        });
    end, l_dependencyArray_0(v43, v40, v27.conversationId, v27.squadButtonSource, v27.squadLocation, v32.fireSquadAnalytics));
    local v46 = l_React_0.useCallback(function() --[[ Line: 157 ]]
        -- upvalues: v45 (copy), v42 (copy), v40 (copy), v29 (copy), l_leaveSquad_0 (ref), l_SquadPromptType_0 (ref), v32 (copy), v27 (copy), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), v34 (copy)
        v45();
        if not v42 and v40 then
            v29(l_leaveSquad_0(l_SquadPromptType_0.JoinAnotherSquad, v32.setSquadPrompt, function() --[[ Line: 164 ]]
                -- upvalues: v27 (ref)
                v27.onActivated(v27.conversationId);
            end, v32.squadLocation, not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v34));
            return;
        else
            v27.onActivated(v27.conversationId);
            return;
        end;
    end, l_dependencyArray_0(v40, v42, v27.onActivated, v45, v32.setSquadPrompt, v32.squadLocation, if l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 then v34 else nil));
    local v47 = l_React_0.useMemo(function() --[[ Line: 186 ]]
        -- upvalues: v31 (copy), v27 (copy)
        if v31.Config.ColorMode.IsLight == "true" then
            if v27.isInCard then
                return v31.Color.Extended.Gray.Gray_300;
            else
                return v31.Color.Extended.Gray.Gray_200;
            end;
        elseif v27.isInCard then
            return v31.Color.Extended.Gray.Gray_800;
        else
            return v31.Color.Extended.Gray.Gray_900;
        end;
    end, {
        v27.isInCard, 
        v31.Config.ColorMode.IsLight
    });
    return l_React_0.createElement(l_Foundation_0.View, {
        tag = "row align-x-center align-y-center gap-xsmall stroke-action-standard radius-medium bg-action-standard", 
        AutomaticSize = if v27.isFullWidth then Enum.AutomaticSize.None else Enum.AutomaticSize.XY, 
        Size = UDim2.new(v27.isFullWidth and 1 or 0, 0, 0, v31.Size.Size_800), 
        isDisabled = v35 == l_SquadState_0.Initializing, 
        onActivated = v46, 
        LayoutOrder = v27.layoutOrder, 
        padding = {
            left = UDim.new(0, v31.Padding.Small), 
            right = UDim.new(0, v31.Padding.Small)
        }, 
        selection = {
            Selectable = v27.Selectable
        }, 
        testId = if l_FFlagAppChatEnableDomLocators_0 then ("%*%*"):format(v27.testId, v43) else nil
    }, {
        GroupIconContainer = l_React_0.createElement(l_Foundation_0.View, {
            tag = "size-400-400", 
            LayoutOrder = 1
        }, {
            GroupIcon = l_React_0.createElement(l_Foundation_0.Icon, {
                name = l_Foundation_0.Enums.IconName.ThreePeople, 
                size = l_Foundation_0.Enums.IconSize.Small, 
                style = v31.Color.ActionStandard.Foreground, 
                variant = l_Foundation_0.Enums.IconVariant.Regular
            }), 
            GreenDot = if not not v33 or v42 then l_React_0.createElement(l_Foundation_0.View, {
                tag = "radius-circle anchor-top-right", 
                Size = UDim2.fromOffset(v31.Size.Size_200, v31.Size.Size_200), 
                backgroundStyle = v36:map(function(v48) --[[ Line: 232 ]]
                    -- upvalues: v31 (copy)
                    return {
                        Color3 = v31.Color.Extended.Green.Green_500.Color3, 
                        Transparency = 1 + (v31.Color.Extended.Green.Green_500.Transparency - 1) * v48
                    };
                end), 
                Position = UDim2.new(1, v31.Size.Size_50, 0, -v31.Size.Size_50), 
                stroke = {
                    Color = v47.Color3, 
                    Transparency = v36:map(function(v49) --[[ Line: 241 ]]
                        -- upvalues: v47 (copy)
                        return 1 + (v47.Transparency - 1) * v49;
                    end), 
                    Thickness = v31.Stroke.Thicker
                }, 
                ZIndex = 2
            }) else nil
        }), 
        TextLabel = l_React_0.createElement(l_Foundation_0.Text, {
            tag = "auto-xy text-label-small content-action-standard text-truncate-end text-no-wrap", 
            LayoutOrder = 2, 
            Text = v44, 
            padding = {
                right = UDim.new(0, v31.Padding.XXSmall)
            }, 
            sizeConstraint = if v27.isFullWidth then nil else {
                MaxSize = Vector2.new(v31.Size.Size_2800, v31.Size.Size_800)
            }
        }), 
        SignifierImage = if v27.shouldShowSignifier and v30 == v7.Input.Directional then l_React_0.createElement(l_Foundation_0.Icon, {
            LayoutOrder = 3, 
            name = l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonX), 
            size = l_Foundation_0.Enums.IconSize.Small, 
            style = v31.Color.ActionStandard.Foreground
        }) else nil
    });
end;