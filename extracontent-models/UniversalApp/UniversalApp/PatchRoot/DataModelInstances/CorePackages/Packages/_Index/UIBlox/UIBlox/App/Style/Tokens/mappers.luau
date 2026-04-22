local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Cryo);
local v4 = require(l_Parent_1.UIBloxConfig);
local _ = require(script.Parent.Types);
local _ = require(l_Parent_0.StyleTypes);
local function v9(v7, v8) --[[ Line: 20 ]] --[[ Name: mapColorTokensToFoundation ]]
    -- upvalues: v3 (copy)
    v7.Semantic.Color = v3.Dictionary.join(v7.Semantic.Color, v8.Semantic.Color);
    v7.Global.Color = v3.Dictionary.join(v7.Global.Color, v8.Global.Color);
    v7.Component = v3.Dictionary.join(v7.Component, v8.Component);
    return v7;
end;
local function v14(v10, v11, v12) --[[ Line: 31 ]] --[[ Name: getOnHoverColor ]]
    local v13 = if v12 then v11.Color.State.Hover else v11.Component.StateLayer.Standard.Hover.Color;
    if v13.Transparency == 1 then
        return {
            Color3 = v10.Color3, 
            Transparency = v10.Transparency
        };
    elseif v10.Color3 == nil or v10.Transparency == 1 then
        return {
            Color3 = v13.Color3, 
            Transparency = v13.Transparency
        };
    else
        return {
            Color3 = v10.Color3:Lerp(v13.Color3, 1 - v13.Transparency), 
            Transparency = v10.Transparency
        };
    end;
end;
local function v21(v15, v16, v17) --[[ Line: 58 ]] --[[ Name: mapThemeToFoundation ]]
    -- upvalues: v4 (copy), v14 (copy), v3 (copy)
    local v18 = {};
    local v19 = if v17 ~= nil then v17 else v4.useColorTokensForThemeMapping;
    if v19 then
        v18.BackgroundDefault = v16.Color.Surface.Surface_0;
        v18.BackgroundContrast = v16.Color.Surface.Surface_100;
        v18.BackgroundMuted = v16.Color.Surface.Surface_200;
        v18.BackgroundUIDefault = v16.Color.Surface.Surface_300;
        v18.BackgroundUIContrast = v16.Color.OverMedia.OverMedia_0;
        v18.BackgroundOnHover = v16.Color.State.Hover;
        v18.BackgroundOnPress = v16.Color.State.Press;
        v18.UIDefault = v16.Color.Shift.Shift_200;
        v18.UIMuted = v16.Color.Shift.Shift_100;
        v18.UIEmphasis = v16.Color.Shift.Shift_400;
        v18.ContextualPrimaryDefault = v16.Color.ActionEmphasis.Background;
        v18.ContextualPrimaryOnHover = v14(v16.Color.ActionEmphasis.Background, v16, v19);
        v18.ContextualPrimaryContent = v16.Color.ActionEmphasis.Foreground;
        v18.SystemPrimaryDefault = v16.Color.ActionSubEmphasis.Background;
        v18.SystemPrimaryOnHover = v14(v16.Color.ActionSubEmphasis.Background, v16, v19);
        v18.SystemPrimaryContent = v16.Color.ActionSubEmphasis.Foreground;
        v18.IconDefault = v16.Color.Content.Default;
        v18.IconEmphasis = v16.Color.Content.Emphasis;
        v18.IconOnHover = v16.Color.Content.Emphasis;
        v18.TextEmphasis = v16.Color.Content.Emphasis;
        v18.TextDefault = v16.Color.Content.Default;
        v18.TextMuted = v16.Color.Content.Muted;
        v18.TextLink = v16.Color.Content.Link;
        v18.Divider = v16.Color.Stroke.Emphasis;
        v18.Overlay = v16.Color.Common.Scrim;
        v18.DropShadow = v16.Color.Common.Shadow;
        v18.NavigationBar = v16.Color.Common.NavigationBar;
        v18.PlaceHolder = v16.Color.Common.Shimmer;
        v18.OnlineStatus = v16.Color.System.Success;
        v18.OfflineStatus = v16.Color.System.Neutral;
        v18.Success = v16.Color.System.Success;
        v18.Alert = v16.Color.System.Alert;
        v18.Badge = v16.Color.System.Contrast;
        v18.BadgeContent = v16.Inverse.Content.Emphasis;
    else
        v18.BackgroundDefault = v16.Semantic.Color.Background.Default;
        v18.BackgroundContrast = v16.Semantic.Color.Background.Contrast;
        v18.BackgroundMuted = v16.Semantic.Color.Background.Muted;
        v18.BackgroundUIDefault = v16.Semantic.Color.BackgroundUi.Default;
        v18.BackgroundUIContrast = v16.Semantic.Color.BackgroundUi.Contrast;
        v18.BackgroundOnHover = v16.Semantic.Color.Background.OnHover;
        v18.BackgroundOnPress = v16.Semantic.Color.Background.OnPress;
        v18.UIDefault = v16.Semantic.Color.Ui.Default;
        v18.UIMuted = v16.Semantic.Color.Ui.Muted;
        v18.UIEmphasis = v16.Semantic.Color.Ui.Emphasis;
        v18.ContextualPrimaryDefault = v16.Semantic.Color.Action.PrimaryBrand.Background;
        v18.ContextualPrimaryOnHover = v14(v18.ContextualPrimaryDefault, v16, v19);
        v18.ContextualPrimaryContent = v16.Semantic.Color.Action.PrimaryBrand.Content;
        v18.SystemPrimaryDefault = v16.Semantic.Color.Action.Primary.Background;
        v18.SystemPrimaryOnHover = v14(v18.SystemPrimaryDefault, v16, v19);
        v18.SystemPrimaryContent = v16.Semantic.Color.Action.Primary.Content;
        v18.IconDefault = v16.Semantic.Color.Icon.Default;
        v18.IconEmphasis = v16.Semantic.Color.Icon.Emphasis;
        v18.IconOnHover = v16.Semantic.Color.Icon.OnHover;
        v18.TextEmphasis = v16.Semantic.Color.Text.Emphasis;
        v18.TextDefault = v16.Semantic.Color.Text.Default;
        v18.TextMuted = v16.Semantic.Color.Text.Muted;
        v18.TextLink = v16.Semantic.Color.Text.Link;
        v18.Divider = v16.Semantic.Color.Common.Divider;
        v18.Overlay = v16.Semantic.Color.Common.Overlay;
        v18.DropShadow = v16.Semantic.Color.Common.DropShadow;
        v18.NavigationBar = v16.Semantic.Color.Common.NavigationBar;
        v18.PlaceHolder = v16.Semantic.Color.Common.Placeholder;
        v18.OnlineStatus = v16.Semantic.Color.Common.Online;
        v18.OfflineStatus = v16.Semantic.Color.Common.Offline;
        v18.Success = v16.Semantic.Color.Common.Success;
        v18.Alert = v16.Semantic.Color.Common.Alert;
        v18.Badge = v16.Semantic.Color.Common.Badge;
        v18.BadgeContent = v16.Semantic.Color.Common.BadgeContent;
    end;
    return (v3.Dictionary.join(v15, v3.Dictionary.map(v18, function(v20) --[[ Line: 148 ]]
        return {
            Color = v20.Color3, 
            Transparency = v20.Transparency
        };
    end)));
end;
local v22 = {
    "Color", 
    "Config", 
    "DarkMode", 
    "Ease", 
    "LightMode", 
    "Inverse", 
    "Size", 
    "Padding", 
    "Margin", 
    "Gap", 
    "Gutter", 
    "Radius", 
    "Stroke", 
    "LineHeight", 
    "FontSize", 
    "FontWeight", 
    "Time", 
    "Typography"
};
return {
    mapColorTokensToFoundation = v9, 
    mapThemeToFoundation = v21, 
    addFoundationFlatKeys = function(v23, v24) --[[ Line: 181 ]] --[[ Name: addFoundationFlatKeys ]]
        -- upvalues: v22 (copy)
        for _, v26 in v22 do
            v23[v26] = v24[v26];
        end;
        return v23;
    end
};