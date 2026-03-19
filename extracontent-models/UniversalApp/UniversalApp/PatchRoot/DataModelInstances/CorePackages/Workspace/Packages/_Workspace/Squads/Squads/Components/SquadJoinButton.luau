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
local v25 = {
    dampingRatio = 1, 
    frequency = 1
};
return function(v26) --[[ Line: 56 ]]
    -- upvalues: l_useLocalization_0 (copy), l_useDispatch_0 (copy), l_usePreferredInput_0 (copy), l_useTokens_0 (copy), l_React_0 (copy), l_SquadExternalContractContext_0 (copy), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (copy), l_useSquadState_0 (copy), v3 (copy), v25 (copy), l_useSelector_0 (copy), l_dependencyArray_0 (copy), v6 (copy), l_EventNames_0 (copy), l_leaveSquad_0 (copy), l_SquadPromptType_0 (copy), l_Foundation_0 (copy), l_SquadState_0 (copy), v7 (copy), l_UserInputService_0 (copy)
    local v27 = l_useLocalization_0({
        joinButtonText = "Feature.Squads.Action.Join", 
        startButtonText = "Feature.Squads.Action.Start", 
        viewButtonText = "Feature.Squads.Action.View"
    });
    local v28 = l_useDispatch_0();
    local v29 = l_usePreferredInput_0();
    local v30 = l_useTokens_0();
    local v31 = l_React_0.useContext(l_SquadExternalContractContext_0);
    local v32 = v31.useParentChannelHasGroupUp(v26.conversationId);
    local v33 = not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v31.useIsChatEnabled();
    local v34 = l_useSquadState_0();
    local v35 = nil;
    local v36 = nil;
    local v38, v39 = v3.useAnimatedBinding(1, function(v37) --[[ Line: 76 ]]
        -- upvalues: v26 (copy), v36 (ref), v3 (ref), v25 (ref)
        if v26.shouldAnimate then
            task.delay(0.5, function() --[[ Line: 78 ]]
                -- upvalues: v36 (ref), v3 (ref), v37 (copy), v25 (ref)
                v36(v3.spring(v37 == 1 and 0 or 1, v25));
            end);
        end;
    end);
    v35 = v38;
    v36 = v39;
    l_React_0.useEffect(function() --[[ Line: 84 ]]
        -- upvalues: v26 (copy), v36 (ref), v3 (ref), v25 (ref)
        if v26.shouldAnimate then
            v36(v3.spring(1, v25));
            return;
        else
            v36(v3.instant(1));
            return;
        end;
    end, {
        v26.shouldAnimate, 
        v36
    });
    v38 = l_React_0.useCallback(function(v40) --[[ Line: 92 ]]
        if v40.Squad and v40.Squad.Squad then
            return v40.Squad.Squad.currentSquad;
        else
            return nil;
        end;
    end, {});
    v39 = l_useSelector_0(v38);
    local v41 = l_React_0.useMemo(function() --[[ Line: 101 ]]
        -- upvalues: v39 (copy), v26 (copy)
        return v39 and v39.parentChannelId == v26.conversationId;
    end, l_dependencyArray_0(v39, v26.conversationId));
    local v42 = l_React_0.useMemo(function() --[[ Line: 105 ]]
        -- upvalues: v41 (copy), v6 (ref), v32 (copy)
        if v41 then
            return v6.View;
        elseif v32 then
            return v6.Join;
        else
            return v6.Create;
        end;
    end, l_dependencyArray_0(v41, v32));
    local v43 = l_React_0.useMemo(function() --[[ Line: 116 ]]
        -- upvalues: v41 (copy), v27 (copy), v32 (copy)
        if v41 then
            return v27.viewButtonText;
        elseif v32 then
            return v27.joinButtonText;
        else
            return v27.startButtonText;
        end;
    end, l_dependencyArray_0(v32, v41, v27.joinButtonText, v27.startButtonText, v27.viewButtonText));
    local v44 = l_React_0.useCallback(function() --[[ Line: 135 ]]
        -- upvalues: v31 (copy), l_EventNames_0 (ref), v26 (copy), v39 (copy), v42 (copy)
        v31.fireSquadAnalytics(l_EventNames_0.EnterSquadButtonPressed, {
            conversationId = v26.conversationId, 
            squadButtonSource = v26.squadButtonSource, 
            squadId = v39 and v39.squadId, 
            squadLocation = v26.squadLocation, 
            userIntention = v42
        });
    end, l_dependencyArray_0(v42, v39, v26.conversationId, v26.squadButtonSource, v26.squadLocation, v31.fireSquadAnalytics));
    local v45 = l_React_0.useCallback(function() --[[ Line: 155 ]]
        -- upvalues: v44 (copy), v41 (copy), v39 (copy), v28 (copy), l_leaveSquad_0 (ref), l_SquadPromptType_0 (ref), v31 (copy), v26 (copy), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), v33 (copy)
        v44();
        if not v41 and v39 then
            v28(l_leaveSquad_0(l_SquadPromptType_0.JoinAnotherSquad, v31.setSquadPrompt, function() --[[ Line: 162 ]]
                -- upvalues: v26 (ref)
                v26.onActivated(v26.conversationId);
            end, v31.squadLocation, not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v33));
            return;
        else
            v26.onActivated(v26.conversationId);
            return;
        end;
    end, l_dependencyArray_0(v39, v41, v26.onActivated, v44, v31.setSquadPrompt, v31.squadLocation, if l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 then v33 else nil));
    local v46 = l_React_0.useMemo(function() --[[ Line: 184 ]]
        -- upvalues: v30 (copy), v26 (copy)
        if v30.Config.ColorMode.IsLight == "true" then
            if v26.isInCard then
                return v30.Color.Extended.Gray.Gray_300;
            else
                return v30.Color.Extended.Gray.Gray_200;
            end;
        elseif v26.isInCard then
            return v30.Color.Extended.Gray.Gray_800;
        else
            return v30.Color.Extended.Gray.Gray_900;
        end;
    end, {
        v26.isInCard, 
        v30.Config.ColorMode.IsLight
    });
    return l_React_0.createElement(l_Foundation_0.View, {
        tag = "row align-x-center align-y-center gap-xsmall stroke-action-standard radius-medium bg-action-standard", 
        AutomaticSize = if v26.isFullWidth then Enum.AutomaticSize.None else Enum.AutomaticSize.XY, 
        Size = UDim2.new(v26.isFullWidth and 1 or 0, 0, 0, v30.Size.Size_800), 
        isDisabled = v34 == l_SquadState_0.Initializing, 
        onActivated = v45, 
        LayoutOrder = v26.layoutOrder, 
        padding = {
            left = UDim.new(0, v30.Padding.Small), 
            right = UDim.new(0, v30.Padding.Small)
        }, 
        selection = {
            Selectable = v26.Selectable
        }
    }, {
        GroupIconContainer = l_React_0.createElement(l_Foundation_0.View, {
            tag = "size-400-400", 
            LayoutOrder = 1
        }, {
            GroupIcon = l_React_0.createElement(l_Foundation_0.Icon, {
                name = l_Foundation_0.Enums.IconName.ThreePeople, 
                size = l_Foundation_0.Enums.IconSize.Small, 
                style = v30.Color.ActionStandard.Foreground, 
                variant = l_Foundation_0.Enums.IconVariant.Regular
            }), 
            GreenDot = if not not v32 or v41 then l_React_0.createElement(l_Foundation_0.View, {
                tag = "radius-circle anchor-top-right", 
                Size = UDim2.fromOffset(v30.Size.Size_200, v30.Size.Size_200), 
                backgroundStyle = v35:map(function(v47) --[[ Line: 229 ]]
                    -- upvalues: v30 (copy)
                    return {
                        Color3 = v30.Color.Extended.Green.Green_500.Color3, 
                        Transparency = 1 + (v30.Color.Extended.Green.Green_500.Transparency - 1) * v47
                    };
                end), 
                Position = UDim2.new(1, v30.Size.Size_50, 0, -v30.Size.Size_50), 
                stroke = {
                    Color = v46.Color3, 
                    Transparency = v35:map(function(v48) --[[ Line: 238 ]]
                        -- upvalues: v46 (copy)
                        return 1 + (v46.Transparency - 1) * v48;
                    end), 
                    Thickness = v30.Stroke.Thicker
                }, 
                ZIndex = 2
            }) else nil
        }), 
        TextLabel = l_React_0.createElement(l_Foundation_0.Text, {
            tag = "auto-xy text-label-small content-action-standard text-truncate-end text-no-wrap", 
            LayoutOrder = 2, 
            Text = v43, 
            padding = {
                right = UDim.new(0, v30.Padding.XXSmall)
            }, 
            sizeConstraint = if v26.isFullWidth then nil else {
                MaxSize = Vector2.new(v30.Size.Size_2800, v30.Size.Size_800)
            }
        }), 
        SignifierImage = if v26.shouldShowSignifier and v29 == v7.Input.Directional then l_React_0.createElement(l_Foundation_0.Icon, {
            LayoutOrder = 3, 
            name = l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonX), 
            size = l_Foundation_0.Enums.IconSize.Small, 
            style = v30.Color.ActionStandard.Foreground
        }) else nil
    });
end;