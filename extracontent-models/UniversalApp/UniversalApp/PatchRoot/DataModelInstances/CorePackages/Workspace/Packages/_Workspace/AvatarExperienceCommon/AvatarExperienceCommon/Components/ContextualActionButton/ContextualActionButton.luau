local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.IXPUtils);
local l_useTokens_0 = v3.Hooks.useTokens;
local v6 = require(l_script_FirstAncestor_0.Hooks.usePulseAnimationBinding);
local l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 = require(l_Parent_0.AvatarExperienceExperiments).AXEnableAccessoryAdjustmentDuringTryOnIXP;
local v8 = {
    affordance = v3.Enums.StateLayerAffordance.None
};
local function v10(v9) --[[ Line: 18 ]] --[[ Name: getHoverTransparency ]]
    if v9 then
        return 0;
    else
        return 0.2;
    end;
end;
local function v14() --[[ Line: 22 ]] --[[ Name: useHoverBinding ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v11, v12 = v2.useBinding(false);
    return v11, (v2.useCallback(function(v13) --[[ Line: 26 ]]
        -- upvalues: v3 (ref), v12 (copy)
        if v13 == v3.Enums.ControlState.Default then
            v12(false);
            return;
        else
            if v13 == v3.Enums.ControlState.Hover then
                v12(true);
            end;
            return;
        end;
    end, {}));
end;
return v2.forwardRef(function(v15, v16) --[[ Line: 51 ]] --[[ Name: ContextualActionButton ]]
    -- upvalues: l_useTokens_0 (copy), l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 (copy), v4 (copy), v6 (copy), v14 (copy), v2 (copy), v3 (copy), v8 (copy), v10 (copy)
    local v17 = l_useTokens_0();
    local v18 = if l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.isEnabled() then v4.readTestVariable(l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.EnabledForUser) else nil;
    local v19 = if l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.isEnabled() then v6(v15.enableFocusAnimation) else nil;
    local v20, v21 = v14();
    local v23 = v2.useCallback(function(v22) --[[ Line: 64 ]]
        -- upvalues: v17 (copy), v15 (copy)
        if v22 then
            return v17.Color.Shift.Shift_200;
        elseif v15.isActive then
            return v17.Color.Shift.Shift_400;
        else
            return {
                Color3 = v17.Color.Shift.Shift_200.Color3, 
                Transparency = 1
            };
        end;
    end, {
        v15.isActive, 
        v17
    });
    return v2.createElement(v3.View, {
        ref = v16, 
        backgroundStyle = v17.Color.OverMedia.OverMedia_0, 
        LayoutOrder = v15.LayoutOrder, 
        stateLayer = v8, 
        onStateChanged = if v15.disabled then nil else v21, 
        onActivated = v15.onActivated, 
        disabled = v15.disabled, 
        selection = {
            Selectable = v15.Selectable or false
        }, 
        tag = "radius-circle clip auto-xy"
    }, {
        HoverHandler = v2.createElement(v3.View, {
            Size = if v15.size then UDim2.new(v15.size, v15.size) else UDim2.fromScale(1, 1), 
            GroupTransparency = v15.GroupTransparencyOverwrite or v20:map(v10), 
            backgroundStyle = v20:map(v23), 
            tag = "padding-small radius-circle clip auto-xy"
        }, {
            Children = v2.createElement(v2.Fragment, nil, v15.children)
        }), 
        UIStroke = if v18 and v15.enableFocusAnimation then v2.createElement("UIStroke", {
            Color = v17.Color.ActionEmphasis.Background.Color3, 
            Thickness = v19 and v19:map(function(v24) --[[ Line: 98 ]]
                return v24.thickness;
            end), 
            Transparency = v19 and v19:map(function(v25) --[[ Line: 101 ]]
                return v25.transparency;
            end)
        }) else nil
    });
end);