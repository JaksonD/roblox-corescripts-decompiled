local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceControlBar");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.Localization);
local v5 = require(l_script_FirstAncestor_0.Hooks.useSemanticTokens);
local l_useLocalization_0 = v4.Hooks.useLocalization;
local v7 = require(l_script_FirstAncestor_0.Hooks.useHoverBinding);
local v8 = require(l_script_FirstAncestor_0.Components.Items.ColorItem);
return (v2.forwardRef(function(v9, v10) --[[ Line: 27 ]]
    -- upvalues: v5 (copy), v7 (copy), l_useLocalization_0 (copy), v2 (copy), v3 (copy), v8 (copy)
    local v11 = v5();
    local v12, v13 = v7();
    local v14 = if v9.radius then v9.radius else v11.defaultIconTextButtonRadius;
    local v15 = l_useLocalization_0({
        text = v9.localizedTextKey
    });
    local v16 = if v15.text then v15.text else v9.text;
    return v2.createElement(v3.View, {
        onActivated = v9.onActivated, 
        isDisabled = v9.disabled, 
        tag = "auto-xy size-full-0 clip row gap-xsmall items-center", 
        ref = v10, 
        onStateChanged = v13, 
        backgroundStyle = v12:map(function(v17) --[[ Line: 44 ]]
            -- upvalues: v11 (copy)
            return {
                Color3 = v11.hoverIconBackgroundStyle.Color3, 
                Transparency = if v17 then v11.hoverIconBackgroundStyle.Transparency else 1
            };
        end), 
        padding = {
            left = UDim.new(0, v11.textButtonPaddingLeft), 
            right = UDim.new(0, v11.textButtonPaddingRight), 
            top = UDim.new(0, v11.textButtonPaddingY), 
            bottom = UDim.new(0, v11.textButtonPaddingY)
        }, 
        cornerRadius = UDim.new(0, v14), 
        Visible = v9.Visible, 
        LayoutOrder = v9.LayoutOrder
    }, {
        Color = v2.createElement(v8, {
            colors = v9.colors, 
            size = v9.size, 
            colorSize = v9.colorSize, 
            disabled = true, 
            onActivated = v9.onActivated, 
            Selectable = false
        }), 
        Text = v2.createElement(v3.Text, {
            Text = v16, 
            tag = "auto-xy text-title-medium content-emphasis"
        })
    });
end));