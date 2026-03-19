local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceControlBar");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.Localization);
local v5 = require(l_script_FirstAncestor_0.Hooks.useSemanticTokens);
local l_useLocalization_0 = v4.Hooks.useLocalization;
local v7 = require(l_script_FirstAncestor_0.Hooks.useHoverBinding);
local l_isBuilderIcon_0 = v3.Utility.isBuilderIcon;
local l_FFlagAXMigrateBuilderIcons_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXMigrateBuilderIcons;
local l_FFlagAXResetAvatarButton_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXResetAvatarButton;
return (v2.forwardRef(function(v11, v12) --[[ Line: 29 ]]
    -- upvalues: v5 (copy), v7 (copy), l_useLocalization_0 (copy), l_FFlagAXMigrateBuilderIcons_0 (copy), l_isBuilderIcon_0 (copy), v2 (copy), v3 (copy), l_FFlagAXResetAvatarButton_0 (copy)
    local v13 = v5();
    local v14, v15 = v7();
    local v16 = if v11.radius then v11.radius else v13.defaultIconTextButtonRadius;
    local v17 = l_useLocalization_0({
        text = v11.localizedTextKey
    });
    local v18 = if v17.text then v17.text else v11.text;
    local v19 = if v11.iconSize then v11.iconSize else v13.defaultIconSize;
    local v20 = l_FFlagAXMigrateBuilderIcons_0 and l_isBuilderIcon_0(v11.icon);
    return v2.createElement(v3.View, {
        onActivated = v11.onActivated, 
        isDisabled = v11.disabled, 
        tag = "auto-xy size-full-0 clip row gap-xsmall items-center", 
        ref = v12, 
        onStateChanged = v15, 
        GroupTransparency = if l_FFlagAXResetAvatarButton_0 then if v11.disabled then v13.contentDisabledTransparency else v13.contentForegroundStyle.Transparency else nil, 
        backgroundStyle = v14:map(function(v21) --[[ Line: 55 ]]
            -- upvalues: v13 (copy)
            return {
                Color3 = v13.hoverIconBackgroundStyle.Color3, 
                Transparency = if v21 then v13.hoverIconBackgroundStyle.Transparency else 1
            };
        end), 
        cornerRadius = UDim.new(0, v16), 
        padding = {
            left = UDim.new(0, v13.textButtonPaddingLeft), 
            right = UDim.new(0, v13.textButtonPaddingRight), 
            top = UDim.new(0, v13.textButtonPaddingY), 
            bottom = UDim.new(0, v13.textButtonPaddingY)
        }, 
        Visible = v11.Visible, 
        LayoutOrder = v11.LayoutOrder
    }, {
        Icon = v2.createElement(v3.View, {
            Size = UDim2.new(0, v13.iconTextButtonIconContainerSize, 0, v13.iconTextButtonIconContainerSize), 
            tag = if l_FFlagAXMigrateBuilderIcons_0 then {
                ["radius-circle"] = true, 
                ["row align-x-center align-y-center"] = v20
            } else "radius-circle"
        }, {
            IconImage = if v20 then v2.createElement(v3.Icon, {
                tag = "position-center-center anchor-center-center", 
                name = v11.icon, 
                size = v19, 
                style = v13.contentForegroundStyle
            }) else v2.createElement(v3.Image, {
                tag = "position-center-center anchor-center-center", 
                Image = v11.icon, 
                Size = UDim2.new(0, v19, 0, v19), 
                imageStyle = v13.contentForegroundStyle
            })
        }), 
        Text = v2.createElement(v3.Text, {
            Text = v18, 
            tag = "auto-xy text-title-medium content-emphasis"
        })
    });
end));