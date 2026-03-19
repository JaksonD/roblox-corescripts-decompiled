local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_View_0 = v2.View;
local l_useTokens_0 = v2.Hooks.useTokens;
local v5 = require(l_Parent_0.UIBlox);
local l_Button_0 = v5.App.Button.Button;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local v8 = require(l_Parent_0.AvatarExperienceFlags);
local l_ItemCardComponents_0 = require(l_Parent_0.AvatarExperienceUIKit).ItemCardComponents;
local l_ItemCardIcon_0 = l_ItemCardComponents_0.ItemCardIcon;
local l_ItemCardBadge_0 = l_ItemCardComponents_0.ItemCardBadge;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v13 = require(l_Parent_0.Responsive);
local l_useLastInput_0 = v13.useLastInput;
local l_useIsSpatial_0 = v13.useIsSpatial;
local l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 = require(l_Parent_0.SharedFlags).FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation;
local l_FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark_0 = v8.FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark;
local l_FFlagAXDurablesSupport_0 = v8.FFlagAXDurablesSupport;
local l_FFlagAXInventoryDurablesSupport_0 = v8.FFlagAXInventoryDurablesSupport;
return function(v20) --[[ Line: 41 ]] --[[ Name: CatalogItemCardSelectedOverlay ]]
    -- upvalues: l_useTokens_0 (copy), l_useDesignTokens_0 (copy), l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 (copy), l_useLastInput_0 (copy), l_useIsSpatial_0 (copy), v13 (copy), v1 (copy), l_FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark_0 (copy), l_ItemCardIcon_0 (copy), l_FFlagAXDurablesSupport_0 (copy), l_View_0 (copy), l_ItemCardBadge_0 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    local v21 = l_useTokens_0();
    local v22 = l_useDesignTokens_0();
    if l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 then
        local v23 = l_useLastInput_0();
        local v24 = l_useIsSpatial_0();
        local v25 = false;
        if v23 == v13.Input.Directional then
            v25 = not v24;
        end;
        return v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 2
        }, {
            CatalogItemCardSelectedOverlayCornerRadius = if l_FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark_0 then v1.createElement("UICorner", {
                CornerRadius = UDim.new(0, v21.Radius.Medium)
            }) else nil, 
            CatalogItemCardSelectedOverlayStroke = if l_FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark_0 then v1.createElement("UIStroke", {
                Color = v21.Color.Content.Emphasis.Color3, 
                Transparency = v21.Color.Content.Emphasis.Transparency, 
                Thickness = v21.Stroke.Standard, 
                LineJoinMode = Enum.LineJoinMode.Round, 
                [v1.Tag] = "data-testid=selection-stroke"
            }) else nil, 
            CatalogItemCardSelectedOverlayIcon = if l_FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark_0 then nil else v1.createElement("Frame", {
                BackgroundColor3 = v22.Semantic.Color.Icon.Emphasis.Color3, 
                BackgroundTransparency = v22.Semantic.Color.Icon.Emphasis.Transparency, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Position = UDim2.new(1, -v21.Gap.Small, 0, v21.Gap.Small), 
                AnchorPoint = Vector2.new(1, 0)
            }, v1.createElement("UICorner", {
                CornerRadius = UDim.new(0, v21.Radius.Medium)
            }), v1.createElement(l_ItemCardIcon_0, {
                icon = "icons/status/success_small", 
                iconStyle = v21.Inverse.Content.Emphasis
            }), v1.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v21.Padding.XSmall), 
                PaddingRight = UDim.new(0, v21.Padding.XSmall), 
                PaddingTop = UDim.new(0, v21.Padding.XSmall), 
                PaddingBottom = UDim.new(0, v21.Padding.XSmall)
            })), 
            CatalogItemCardSelectedOverlayBadge = if l_FFlagAXDurablesSupport_0 and v20.badge then v1.createElement(l_View_0, {
                tag = "padding-top-small padding-left-small", 
                Size = UDim2.fromScale(0, 0), 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                Badge = v1.createElement(l_ItemCardBadge_0, {
                    content = {
                        {
                            type = "icon", 
                            icon = v20.badge.icon
                        }, 
                        {
                            type = "text", 
                            text = v20.badge.text
                        }
                    }, 
                    displayBorder = true
                })
            }) else nil, 
            CatalogItemCardSelectedOverlayItemStatusIcon = if not (l_FFlagAXInventoryDurablesSupport_0 and v20.itemStatusIcon) or v20.badge then nil else v1.createElement(l_View_0, {
                tag = "padding-top-small padding-left-small", 
                Size = UDim2.fromScale(0, 0), 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                Icon = v1.createElement(l_ItemCardIcon_0, {
                    icon = v20.itemStatusIcon
                })
            }), 
            CatalogItemCardSelectedOverlayButton = if not v25 and v20.buttonText then v1.createElement(l_Button_0, {
                text = v20.buttonText, 
                buttonType = l_ButtonType_0.PrimarySystem, 
                onActivated = v20.onActivated, 
                isDisabled = false, 
                anchorPoint = Vector2.new(0.5, 1), 
                position = UDim2.new(0.5, 0, 1, -v21.Gap.XXSmall), 
                size = UDim2.new(1, -(v21.Gap.XXSmall * 2), 0, v21.Size.Size_700), 
                fontStyle = "CaptionHeader"
            }) else nil
        });
    else
        return v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 2
        }, {
            CatalogItemCardSelectedOverlayCornerRadius = if l_FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark_0 then v1.createElement("UICorner", {
                CornerRadius = UDim.new(0, v21.Radius.Medium)
            }) else nil, 
            CatalogItemCardSelectedOverlayStroke = if l_FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark_0 then v1.createElement("UIStroke", {
                ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, 
                Color = v21.Color.Content.Emphasis.Color3, 
                Transparency = v21.Color.Content.Emphasis.Transparency, 
                Thickness = v21.Stroke.Standard, 
                LineJoinMode = Enum.LineJoinMode.Round
            }) else nil, 
            CatalogItemCardSelectedOverlayIcon = if l_FFlagAXItemCardSelectedOverlayBorderInsteadOfCheckmark_0 then nil else v1.createElement("Frame", {
                BackgroundColor3 = v22.Semantic.Color.Icon.Emphasis.Color3, 
                BackgroundTransparency = v22.Semantic.Color.Icon.Emphasis.Transparency, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Position = UDim2.new(1, -v21.Gap.Small, 0, v21.Gap.Small), 
                AnchorPoint = Vector2.new(1, 0)
            }, v1.createElement("UICorner", {
                CornerRadius = UDim.new(0, v21.Radius.Medium)
            }), v1.createElement(l_ItemCardIcon_0, {
                icon = "icons/status/success_small", 
                iconStyle = v21.Inverse.Content.Emphasis
            }), v1.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v21.Padding.XSmall), 
                PaddingRight = UDim.new(0, v21.Padding.XSmall), 
                PaddingTop = UDim.new(0, v21.Padding.XSmall), 
                PaddingBottom = UDim.new(0, v21.Padding.XSmall)
            })), 
            CatalogItemCardSelectedOverlayBadge = if l_FFlagAXDurablesSupport_0 and v20.badge then v1.createElement(l_View_0, {
                tag = "padding-top-small padding-left-small", 
                Size = UDim2.fromScale(0, 0), 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                Badge = v1.createElement(l_ItemCardBadge_0, {
                    content = {
                        {
                            type = "icon", 
                            icon = v20.badge.icon
                        }, 
                        {
                            type = "text", 
                            text = v20.badge.text
                        }
                    }, 
                    displayBorder = true
                })
            }) else nil, 
            CatalogItemCardSelectedOverlayItemStatusIcon = if not (l_FFlagAXInventoryDurablesSupport_0 and v20.itemStatusIcon) or v20.badge then nil else v1.createElement(l_View_0, {
                tag = "padding-top-small padding-left-small", 
                Size = UDim2.fromScale(0, 0), 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                Icon = v1.createElement(l_ItemCardIcon_0, {
                    icon = v20.itemStatusIcon
                })
            }), 
            CatalogItemCardSelectedOverlayButton = if v20.buttonText then v1.createElement(l_Button_0, {
                text = v20.buttonText, 
                buttonType = l_ButtonType_0.PrimarySystem, 
                onActivated = v20.onActivated, 
                isDisabled = false, 
                anchorPoint = Vector2.new(0.5, 1), 
                position = UDim2.new(0.5, 0, 1, -v21.Gap.XXSmall), 
                size = UDim2.new(1, -(v21.Gap.XXSmall * 2), 0, v21.Size.Size_700), 
                fontStyle = "CaptionHeader"
            }) else nil
        });
    end;
end;