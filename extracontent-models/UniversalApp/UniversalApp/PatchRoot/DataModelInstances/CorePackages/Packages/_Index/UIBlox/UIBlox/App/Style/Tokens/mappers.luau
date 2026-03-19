local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Cryo);
local function v4(v2, v3) --[[ Line: 9 ]] --[[ Name: mapColorTokensToFoundation ]]
    -- upvalues: v1 (copy)
    v2.Semantic.Color = v1.Dictionary.join(v2.Semantic.Color, v3.Semantic.Color);
    v2.Global.Color = v1.Dictionary.join(v2.Global.Color, v3.Global.Color);
    v2.Component = v1.Dictionary.join(v2.Component, v3.Component);
    return v2;
end;
local function v8(v5, v6) --[[ Line: 17 ]] --[[ Name: getOnHoverColor ]]
    local l_Color_0 = v6.Component.StateLayer.Standard.Hover.Color;
    if l_Color_0.Transparency == 1 then
        return {
            Color3 = v5.Color3, 
            Transparency = v5.Transparency
        };
    elseif v5.Color3 == nil or v5.Transparency == 1 then
        return {
            Color3 = l_Color_0.Color3, 
            Transparency = l_Color_0.Transparency
        };
    else
        return {
            Color3 = v5.Color3:Lerp(l_Color_0.Color3, 1 - l_Color_0.Transparency), 
            Transparency = v5.Transparency
        };
    end;
end;
return {
    mapColorTokensToFoundation = v4, 
    mapThemeToFoundation = function(v9, v10) --[[ Line: 38 ]] --[[ Name: mapThemeToFoundation ]]
        -- upvalues: v8 (copy), v1 (copy)
        local v11 = {
            BackgroundDefault = v10.Semantic.Color.Background.Default, 
            BackgroundContrast = v10.Semantic.Color.Background.Contrast, 
            BackgroundMuted = v10.Semantic.Color.Background.Muted, 
            BackgroundUIDefault = v10.Semantic.Color.BackgroundUi.Default, 
            BackgroundUIContrast = v10.Semantic.Color.BackgroundUi.Contrast, 
            BackgroundOnHover = v10.Semantic.Color.Background.OnHover, 
            BackgroundOnPress = v10.Semantic.Color.Background.OnPress, 
            UIDefault = v10.Semantic.Color.Ui.Default, 
            UIMuted = v10.Semantic.Color.Ui.Muted, 
            UIEmphasis = v10.Semantic.Color.Ui.Emphasis, 
            ContextualPrimaryDefault = v10.Semantic.Color.Action.PrimaryBrand.Background
        };
        v11.ContextualPrimaryOnHover = v8(v11.ContextualPrimaryDefault, v10);
        v11.ContextualPrimaryContent = v10.Semantic.Color.Action.PrimaryBrand.Content;
        v11.SystemPrimaryDefault = v10.Semantic.Color.Action.Primary.Background;
        v11.SystemPrimaryOnHover = v8(v11.SystemPrimaryDefault, v10);
        v11.SystemPrimaryContent = v10.Semantic.Color.Action.Primary.Content;
        v11.IconDefault = v10.Semantic.Color.Icon.Default;
        v11.IconEmphasis = v10.Semantic.Color.Icon.Emphasis;
        v11.IconOnHover = v10.Semantic.Color.Icon.OnHover;
        v11.TextEmphasis = v10.Semantic.Color.Text.Emphasis;
        v11.TextDefault = v10.Semantic.Color.Text.Default;
        v11.TextMuted = v10.Semantic.Color.Text.Muted;
        v11.TextLink = v10.Semantic.Color.Text.Link;
        v11.Divider = v10.Semantic.Color.Common.Divider;
        v11.Overlay = v10.Semantic.Color.Common.Overlay;
        v11.DropShadow = v10.Semantic.Color.Common.DropShadow;
        v11.NavigationBar = v10.Semantic.Color.Common.NavigationBar;
        v11.PlaceHolder = v10.Semantic.Color.Common.Placeholder;
        v11.OnlineStatus = v10.Semantic.Color.Common.Online;
        v11.OfflineStatus = v10.Semantic.Color.Common.Offline;
        v11.Success = v10.Semantic.Color.Common.Success;
        v11.Alert = v10.Semantic.Color.Common.Alert;
        v11.Badge = v10.Semantic.Color.Common.Badge;
        v11.BadgeContent = v10.Semantic.Color.Common.BadgeContent;
        return (v1.Dictionary.join(v9, v1.Dictionary.map(v11, function(v12) --[[ Line: 77 ]]
            return {
                Color = v12.Color3, 
                Transparency = v12.Transparency
            };
        end)));
    end
};