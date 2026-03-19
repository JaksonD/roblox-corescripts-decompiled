local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Core_0 = l_Parent_1.Core;
local l_Parent_2 = l_Parent_1.Parent;
local v4 = require(l_Parent_2.Otter);
local v5 = require(l_Parent_2.Roact);
local v6 = require(l_Parent_2.t);
local v7 = require(l_Parent_2.Cryo);
local v8 = require(l_Parent_2.Foundation);
local v9 = require(l_Parent_0.Indicator.Enum.BadgeStates);
local v10 = require(l_Parent_0.ImageSet.Enum.IconSize);
local v11 = require(l_Parent_0.ImageSet.getIconSize);
local v12 = require(l_Parent_0.Indicator.Enum.BadgeVariant);
local l_StatusIndicator_0 = v8.StatusIndicator;
local v14 = require(l_Core_0.Control.Enum.ControlState);
local v15 = require(l_Core_0.Control.Interactable);
local v16 = require(l_Core_0.ImageSet.ImageSetComponent);
local v17 = require(l_Core_0.ImageSet.Validator.validateImage);
local v18 = require(l_Parent_1.Core.Style.Validator.validateColorInfo);
local v19 = require(l_Parent_1.Core.Style.Validator.validateFontInfo);
local v20 = require(l_Parent_1.Core.Style.Validator.validateTypographyInfo);
local v21 = require(l_Parent_1.Core.Style.withStyle);
local v22 = require(l_Parent_1.Utility.divideTransparency);
local v23 = require(l_Parent_0.SelectionCursor.CursorType);
local v24 = require(l_Parent_0.SelectionCursor.useCursorByType);
local v25 = require(l_Parent_1.Core.Text.GetTextSize);
local v26 = require(l_Parent_1.Utility.migrateBadgeVariant);
local v27 = UDim.new(0, 12);
local v28 = UDim.new(0, 8);
local v29 = {
    frequency = 6, 
    dampingRatio = 1
};
local v30 = {
    BACKGROUND = 1, 
    HOVER_MASK = 2, 
    ICON_AND_TITLE_CONTAINER = 3, 
    BADGE_CONTAINER = 4, 
    ROUNDED_CORNERS_MASK = 5
};
local v31 = {
    ICON = 1, 
    TITLE = 2
};
local v32 = v5.Component:extend("MenuTile");
v32.defaultProps = {
    size = UDim2.fromScale(1, 1), 
    styleProps = {}
};
v32.validateProps = v6.strictInterface({
    size = v6.optional(v6.UDim2), 
    position = v6.optional(v6.UDim2), 
    layoutOrder = v6.optional(v6.number), 
    cursor = v6.table, 
    badgeValue = v6.optional(v6.union(v6.string, v6.number, v9.isEnumValue)), 
    badgeVariant = v6.optional(v12.isEnumValue), 
    icon = v6.optional(v17), 
    title = v6.string, 
    onActivated = v6.callback, 
    styleProps = v6.optional(v6.strictInterface({
        iconStyle = v6.optional(v18), 
        iconSize = v6.optional(v10.isEnumValue), 
        titleStyle = v6.optional(v18), 
        titleFont = v6.optional(v6.union(v19, v20))
    }))
});
local function v36(v33, v34) --[[ Line: 102 ]] --[[ Name: withProviders ]]
    -- upvalues: v21 (copy)
    return v21(function(v35) --[[ Line: 103 ]]
        -- upvalues: v33 (copy), v34 (copy)
        return v33(v35, nil, v34);
    end);
end;
local function v42(v37, v38) --[[ Line: 108 ]] --[[ Name: getStyleProps ]]
    -- upvalues: v11 (copy), v10 (copy)
    local l_Theme_0 = v38.Theme;
    local l_Font_0 = v38.Font;
    local v41 = if v37.iconSize then v11(v37.iconSize, v38) else v11(v10.Large);
    return {
        iconStyle = v37.iconStyle or l_Theme_0.IconDefault, 
        iconSize = v41, 
        titleStyle = v37.titleStyle or l_Theme_0.TextDefault, 
        titleFont = v37.titleFont or l_Font_0.SubHeader1
    };
end;
v32.init = function(v43) --[[ Line: 124 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), v4 (copy)
    local v44, v45 = v5.createBinding(1);
    v43.hoverTransparency = v44;
    v43.updateHoverTransparency = v45;
    v43.hoverTransparencyMotor = v4.createSingleMotor(1);
    v43.hoverTransparencyMotor:onStep(v43.updateHoverTransparency);
    v43.hoverTransparencyMotor:onComplete(function(v46) --[[ Line: 128 ]]
        -- upvalues: v43 (copy)
        if v46 == 1 then
            v43:setState({
                showHoverMask = false
            });
        end;
    end);
    v43:setState({
        backgroundTransparency = 0, 
        iconTransparency = 0, 
        titleTransparency = 0, 
        showHoverMask = false
    });
end;
v32.render = function(v47) --[[ Line: 144 ]] --[[ Name: render ]]
    -- upvalues: v36 (copy), v42 (copy), v25 (copy), v14 (copy), v4 (copy), v29 (copy), v22 (copy), v5 (copy), v15 (copy), v30 (copy), v27 (copy), v28 (copy), v16 (copy), v31 (copy), l_StatusIndicator_0 (copy), v26 (copy)
    local l_backgroundTransparency_0 = v47.state.backgroundTransparency;
    local l_iconTransparency_0 = v47.state.iconTransparency;
    local l_titleTransparency_0 = v47.state.titleTransparency;
    local l_badgeValue_0 = v47.props.badgeValue;
    local l_icon_0 = v47.props.icon;
    local l_layoutOrder_0 = v47.props.layoutOrder;
    local l_onActivated_0 = v47.props.onActivated;
    local l_position_0 = v47.props.position;
    local l_size_0 = v47.props.size;
    local l_title_0 = v47.props.title;
    return v36(function(v58, _, v60) --[[ Line: 157 ]]
        -- upvalues: v42 (ref), v47 (copy), v25 (ref), l_title_0 (copy), v14 (ref), v4 (ref), v29 (ref), v22 (ref), v5 (ref), v15 (ref), l_size_0 (copy), l_position_0 (copy), l_layoutOrder_0 (copy), l_onActivated_0 (copy), l_backgroundTransparency_0 (copy), v30 (ref), v27 (ref), v28 (ref), l_icon_0 (copy), v16 (ref), l_iconTransparency_0 (copy), v31 (ref), l_titleTransparency_0 (copy), l_badgeValue_0 (copy), l_StatusIndicator_0 (ref), v26 (ref)
        local l_Theme_1 = v58.Theme;
        local v62 = v42(v47.props.styleProps, v58);
        local l_BackgroundUIDefault_0 = l_Theme_1.BackgroundUIDefault;
        local l_BackgroundOnHover_0 = l_Theme_1.BackgroundOnHover;
        local l_iconStyle_0 = v62.iconStyle;
        local l_iconSize_0 = v62.iconSize;
        local l_titleStyle_0 = v62.titleStyle;
        local l_titleFont_0 = v62.titleFont;
        local v69 = if l_titleFont_0.RelativeSize then l_titleFont_0.RelativeSize * v58.Font.BaseSize else l_titleFont_0.FontSize;
        local l_Y_0 = v25(l_title_0, v69, l_titleFont_0.Font, Vector2.new(100, v69)).Y;
        local function v73(_, v72) --[[ Line: 178 ]] --[[ Name: onStateChanged ]]
            -- upvalues: v14 (ref), v47 (ref), l_BackgroundUIDefault_0 (copy), l_iconStyle_0 (copy), l_titleStyle_0 (copy), v4 (ref), l_BackgroundOnHover_0 (copy), v29 (ref), v22 (ref)
            if v72 == v14.Hover then
                v47:setState({
                    backgroundTransparency = l_BackgroundUIDefault_0.Transparency, 
                    iconTransparency = l_iconStyle_0.Transparency, 
                    titleTransparency = l_titleStyle_0.Transparency, 
                    showHoverMask = true
                });
                v47.hoverTransparencyMotor:setGoal(v4.spring(l_BackgroundOnHover_0.Transparency, v29));
                return;
            elseif v72 == v14.Default then
                v47:setState({
                    backgroundTransparency = l_BackgroundUIDefault_0.Transparency, 
                    iconTransparency = l_iconStyle_0.Transparency, 
                    titleTransparency = l_titleStyle_0.Transparency
                });
                v47.hoverTransparencyMotor:setGoal(v4.spring(1, v29));
                return;
            else
                if v72 == v14.Pressed then
                    v47:setState({
                        backgroundTransparency = v22(l_BackgroundUIDefault_0.Transparency, 2), 
                        iconTransparency = v22(l_iconStyle_0.Transparency, 2), 
                        titleTransparency = v22(l_titleStyle_0.Transparency, 2), 
                        showHoverMask = false
                    });
                    v47.hoverTransparencyMotor:setGoal(v4.instant(1));
                end;
                return;
            end;
        end;
        return v5.createElement(v15, {
            Size = l_size_0, 
            Position = l_position_0, 
            BackgroundTransparency = 1, 
            SelectionImageObject = v60, 
            LayoutOrder = l_layoutOrder_0, 
            onStateChanged = v73, 
            [v5.Event.Activated] = l_onActivated_0
        }, {
            MenuTileFrame = v5.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = l_size_0
            }, {
                Background = v5.createElement("Frame", {
                    BackgroundColor3 = l_BackgroundUIDefault_0.Color, 
                    BackgroundTransparency = l_backgroundTransparency_0, 
                    BorderSizePixel = 0, 
                    Size = UDim2.fromScale(1, 1), 
                    ZIndex = v30.BACKGROUND
                }, {
                    RoundedCornerUI = v5.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    })
                }), 
                HoverMask = v47.state.showHoverMask and v5.createElement("Frame", {
                    BackgroundColor3 = l_BackgroundOnHover_0.Color, 
                    BackgroundTransparency = v47.hoverTransparency, 
                    BorderSizePixel = 0, 
                    Size = UDim2.fromScale(1, 1), 
                    ZIndex = v30.HOVER_MASK
                }, {
                    RoundedCornerUI = v5.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    })
                }), 
                IconAndTitleContainer = v5.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1), 
                    ZIndex = v30.ICON_AND_TITLE_CONTAINER
                }, {
                    IconAndTitleUIListLayout = v5.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = v27, 
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    }), 
                    IconAndTitleUIPadding = v5.createElement("UIPadding", {
                        PaddingBottom = v28, 
                        PaddingLeft = v28, 
                        PaddingRight = v28, 
                        PaddingTop = v28 + UDim.new(0, l_Y_0)
                    }), 
                    Icon = l_icon_0 and v5.createElement(v16.Label, {
                        BackgroundTransparency = 1, 
                        Image = l_icon_0, 
                        ImageColor3 = l_iconStyle_0.Color, 
                        ImageTransparency = l_iconTransparency_0, 
                        LayoutOrder = v31.ICON, 
                        Size = UDim2.fromOffset(l_iconSize_0, l_iconSize_0)
                    }), 
                    Title = l_title_0 and v5.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Font = l_titleFont_0.Font, 
                        LayoutOrder = v31.TITLE, 
                        Size = UDim2.new(1, 0, 0, l_Y_0 * 2), 
                        Text = l_title_0, 
                        TextColor3 = l_titleStyle_0.Color, 
                        TextSize = v69, 
                        TextTransparency = l_titleTransparency_0, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextWrapped = true, 
                        TextYAlignment = Enum.TextYAlignment.Top
                    })
                }), 
                BadgeContainer = l_badgeValue_0 and v5.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1), 
                    ZIndex = v30.BADGE_CONTAINER
                }, {
                    BadgeUIListLayout = v5.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                        Padding = v27, 
                        VerticalAlignment = Enum.VerticalAlignment.Top
                    }), 
                    BadgeUIPadding = v5.createElement("UIPadding", {
                        PaddingBottom = v28, 
                        PaddingLeft = v28, 
                        PaddingRight = v28, 
                        PaddingTop = v28
                    }), 
                    Badge = v5.createElement(l_StatusIndicator_0, {
                        value = tonumber(l_badgeValue_0), 
                        max = tonumber(l_badgeValue_0) and 99 or nil, 
                        variant = v26(v47.props.badgeVariant)
                    })
                })
            })
        });
    end, v47.props.cursor);
end;
v32.willUnmount = function(v74) --[[ Line: 310 ]] --[[ Name: willUnmount ]]
    if v74.hoverTransparencyMotor then
        v74.hoverTransparencyMotor:destroy();
    end;
end;
MenuTileFunctionalWrapper = function(v75) --[[ Line: 315 ]] --[[ Name: MenuTileFunctionalWrapper ]]
    -- upvalues: v24 (copy), v23 (copy), v5 (copy), v32 (copy), v7 (copy)
    local v76 = v24(v23.RoundedRect);
    return v5.createElement(v32, v7.Dictionary.join(v75, {
        cursor = v76
    }));
end;
return MenuTileFunctionalWrapper;