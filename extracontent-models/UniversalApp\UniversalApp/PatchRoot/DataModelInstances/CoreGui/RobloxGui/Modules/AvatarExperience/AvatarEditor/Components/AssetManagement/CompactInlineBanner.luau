local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Foundation);
local l_useTokens_0 = v3.Hooks.useTokens;
local l_Button_0 = v3.Button;
local l_Icon_0 = v3.Icon;
local l_Text_0 = v3.Text;
local l_View_0 = v3.View;
local l_IconSize_0 = v3.Enums.IconSize;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_ButtonSize_0 = v3.Enums.ButtonSize;
local v12 = require(l_Modules_0.AvatarExperience.Common.Enum.CompactInlineBannerPlacement);
local v13 = require(l_Modules_0.AvatarExperience.Common.Enum.CompactInlineBannerVariant);
local v14 = require(l_CorePackages_0.Packages.React);
local v15 = require(l_CorePackages_0.Packages.Cryo);
return function(v16) --[[ Line: 38 ]] --[[ Name: CompactInlineBanner ]]
    -- upvalues: l_useTokens_0 (copy), v14 (copy), v12 (copy), v13 (copy), v15 (copy), l_Icon_0 (copy), l_IconSize_0 (copy), l_View_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_ButtonSize_0 (copy)
    local v17 = l_useTokens_0();
    local v18 = v14.useMemo(function() --[[ Line: 41 ]]
        -- upvalues: v12 (ref), v13 (ref), v17 (copy)
        return {
            visible = true, 
            placement = v12.Bleed, 
            variant = v13.Default, 
            margin = v17.Margin.Small
        };
    end, {
        v17
    });
    local v19 = v15.Dictionary.union(v18, v16);
    local l_placement_0 = v19.placement;
    local l_variant_0 = v19.variant;
    local l_margin_0 = v19.margin;
    local v23 = l_placement_0 == v12.Inline;
    local v24 = false;
    if v19.actionText ~= nil then
        v24 = v19.onActivated ~= nil;
    end;
    local v25 = {
        [v13.Default] = v17.Color.Shift.Shift_100, 
        [v13.Success] = v17.Color.System.Success, 
        [v13.Alert] = v17.Color.System.Alert
    };
    local v26 = {
        [v13.Default] = v25[v13.Default].Transparency, 
        [v13.Success] = 0.8, 
        [v13.Alert] = 0.8
    };
    local v27 = {
        [v13.Default] = v17.Color.Content.Default, 
        [v13.Success] = v17.Color.System.Success, 
        [v13.Alert] = v17.Color.System.Alert
    };
    local v28 = {
        [v13.Default] = "icons/actions/info_small", 
        [v13.Success] = "icons/status/success_small", 
        [v13.Alert] = "icons/status/alert_small"
    };
    return v14.createElement("Frame", {
        BackgroundTransparency = v26[l_variant_0], 
        BackgroundColor3 = v25[l_variant_0].Color3, 
        BorderSizePixel = 0, 
        Visible = v19.visible, 
        Size = UDim2.new(1, if v23 then -2 * l_margin_0 else 0, 0, 0), 
        Position = UDim2.new(0, if v23 then l_margin_0 else 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        UILayout = v14.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, v17.Gap.Medium)
        }), 
        UIPadding = v14.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, if v23 then v17.Padding.Medium else l_margin_0), 
            PaddingRight = UDim.new(0, if v23 then v17.Padding.Small else l_margin_0), 
            PaddingTop = UDim.new(0, v17.Padding.Small), 
            PaddingBottom = UDim.new(0, v17.Padding.Small)
        }), 
        UICorner = if v23 then v14.createElement("UICorner", {
            CornerRadius = UDim.new(0, v17.Radius.Medium)
        }) else nil, 
        Icon = v14.createElement(l_Icon_0, {
            style = v27[l_variant_0], 
            name = v19.iconImage or v28[l_variant_0], 
            size = l_IconSize_0.Small, 
            LayoutOrder = 1
        }), 
        TextView = v14.createElement(l_View_0, {
            Size = UDim2.fromScale(0, 0), 
            tag = "auto-y grow padding-right-xsmall", 
            LayoutOrder = 2
        }, {
            ContentText = v14.createElement(l_Text_0, {
                textStyle = v17.Color.Content.Emphasis, 
                fontStyle = v17.Typography.CaptionLarge, 
                Text = v19.contentText, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Size = UDim2.new(1, 0, 0, v17.Size.Size_800)
            })
        }), 
        Button = v24 and v14.createElement(l_Button_0, {
            text = v19.actionText, 
            onActivated = v19.onActivated, 
            variant = l_ButtonVariant_0.Link, 
            size = l_ButtonSize_0.XSmall, 
            LayoutOrder = 3
        })
    });
end;