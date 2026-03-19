local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.BuilderIcons);
local v3 = require(l_Parent_0.Dash);
local v4 = require(l_Parent_0.React);
local l_IconVariant_0 = v2.IconVariant;
local v6 = require(l_script_FirstAncestor_0.Components.CloseAffordance);
local v7 = require(l_script_FirstAncestor_0.Enums.CloseAffordanceVariant);
local v8 = require(l_script_FirstAncestor_0.Enums.ColorMode);
local v9 = require(l_script_FirstAncestor_0.Components.Icon);
local v10 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v11 = require(l_script_FirstAncestor_0.Providers.Style.PresentationContext);
local v12 = require(l_script_FirstAncestor_0.Enums.StateLayerMode);
local v13 = require(l_script_FirstAncestor_0.Components.Text);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v15 = require(l_script_FirstAncestor_0.Components.View);
local v16 = require(l_script_FirstAncestor_0.Utility.useScaledValue);
local v17 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v18 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v19 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v20 = {
    testId = "--foundation-snackbar"
};
local v21 = {
    colorMode = v8.Inverse
};
return v4.memo(v4.forwardRef(function(v22, v23) --[[ Line: 56 ]] --[[ Name: Snackbar ]]
    -- upvalues: v19 (copy), v20 (copy), v17 (copy), v16 (copy), l_IconVariant_0 (copy), v4 (copy), v15 (copy), v18 (copy), v11 (copy), v21 (copy), v9 (copy), v3 (copy), v13 (copy), v12 (copy), v6 (copy), v10 (copy), v7 (copy)
    local v24 = v19(v22, v20);
    local v25 = v17();
    local v26 = v24.icon and v24.icon ~= "";
    local v27 = false;
    if v24.action ~= nil then
        v27 = v24.action.text ~= "";
    end;
    local v28 = v27 or v24.onClose ~= nil;
    local v29 = v26 or v28;
    local v30 = v16(371);
    local v31 = v16(v26 and 304 or 272);
    local v32 = if typeof(v24.icon) == "string" then {
        name = v24.icon, 
        variant = l_IconVariant_0.Regular
    } else v24.icon;
    local v33 = v25.Typography.CaptionLarge.FontSize * v25.Typography.CaptionLarge.LineHeight * 2;
    local l_action_0 = v24.action;
    return v4.createElement(v15, v18(v24, {
        Size = if v28 then UDim2.fromOffset(v30, 0) else UDim2.fromOffset(0, 0), 
        sizeConstraint = if v28 then nil else {
            MinSize = Vector2.new(0, 0), 
            MaxSize = Vector2.new(v31, 1e999)
        }, 
        tag = {
            ["align-y-center padding-y-xsmall radius-medium row align-y-center gap-large bg-system-contrast"] = true, 
            ["padding-left-large"] = not v29, 
            ["padding-left-medium"] = v29, 
            ["padding-right-large auto-xy"] = not v28, 
            ["padding-right-small auto-y"] = v28
        }, 
        ref = v23
    }), v4.createElement(v11.Provider, {
        value = v21
    }, {
        Content = v4.createElement(v15, {
            LayoutOrder = 1, 
            tag = "auto-xy align-y-center padding-y-small row fill gap-small", 
            testId = ("%*--content"):format(v24.testId)
        }, {
            Icon = if v26 then v4.createElement(v9, v3.join(v32, {
                style = v25.Inverse.Content.Emphasis, 
                LayoutOrder = 1, 
                testId = ("%*--icon"):format(v24.testId)
            })) else nil, 
            Title = v4.createElement(v13, {
                LayoutOrder = 2, 
                Text = v24.title, 
                sizeConstraint = {
                    MinSize = Vector2.new(0, 0), 
                    MaxSize = Vector2.new(1e999, v33)
                }, 
                tag = "auto-xy fill text-align-x-left text-caption-large content-inverse-emphasis text-truncate-split text-wrap", 
                testId = ("%*--title"):format(v24.testId)
            })
        }), 
        Buttons = if v28 then v4.createElement(v15, {
            LayoutOrder = 2, 
            tag = "auto-xy align-y-center row gap-xsmall", 
            testId = ("%*--buttons"):format(v24.testId)
        }, {
            Action = if v27 then v4.createElement(v13, {
                LayoutOrder = 1, 
                onActivated = l_action_0.onActivated, 
                stateLayer = {
                    mode = v12.Inverse
                }, 
                Text = l_action_0.text, 
                tag = "auto-xy padding-small radius-medium text-label-medium content-inverse-link", 
                testId = ("%*--action"):format(v24.testId)
            }) else nil, 
            CloseAffordance = if v24.onClose ~= nil then v4.createElement(v6, {
                LayoutOrder = 2, 
                onActivated = v24.onClose, 
                size = v10.Small, 
                variant = v7.Utility, 
                testId = ("%*--close-affordance"):format(v24.testId)
            }) else nil
        }) else nil
    }));
end));