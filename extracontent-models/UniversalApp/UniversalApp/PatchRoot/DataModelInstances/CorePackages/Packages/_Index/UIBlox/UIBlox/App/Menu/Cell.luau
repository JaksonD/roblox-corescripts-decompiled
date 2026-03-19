local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_0.Core.Style.withStyle);
local v5 = require(l_Parent_0.Core.Style.Validator.validateColorInfo);
local v6 = require(l_Parent_0.App.SelectionImage.withSelectionCursorProvider);
local v7 = require(l_Parent_0.App.SelectionImage.CursorKind);
local _ = require(l_Parent_0.App.Style.StyleTypes);
local l_Object_0 = require(l_Parent_1.LuauPolyfill).Object;
local v10 = require(l_Parent_1.UIBlox.Core.ImageSet.ImageSetComponent);
local v11 = require(l_Parent_1.UIBlox.App.ImageSet.Images);
local v12 = require(l_Parent_0.Core.Text.GenericTextLabel.GenericTextLabel);
local v13 = require(l_Parent_0.Utility.divideTransparency);
local v14 = require(l_Parent_1.UIBlox.Core.Style.Validator.validateFontInfo);
local v15 = require(l_Parent_1.UIBlox.Core.Control.Enum.ControlState);
local v16 = require(script.Parent.KeyLabel.KeyLabel);
local v17 = require(script.Parent.RoundedFrame);
local v18 = require(l_Parent_0.Core.Control.Interactable);
local v19 = v11["component_assets/circle_17"];
local v20 = v2.PureComponent:extend("Cell");
v20.validateProps = v3.strictInterface({
    icon = v3.optional(v3.union(v3.table, v3.string)), 
    text = v3.string, 
    onActivated = v3.callback, 
    keyCodeLabel = v3.optional(v3.union(v3.enum(Enum.KeyCode), v3.strictInterface({
        key = v3.enum(Enum.KeyCode), 
        axis = v3.optional(v3.string)
    }))), 
    selected = v3.optional(v3.boolean), 
    iconColorOverride = v3.optional(v3.Color3), 
    textColorOverride = v3.optional(v3.Color3), 
    elementHeight = v3.integer, 
    hasRoundTop = v3.boolean, 
    hasRoundBottom = v3.boolean, 
    hasDivider = v3.boolean, 
    disabled = v3.optional(v3.boolean), 
    stayOnActivated = v3.optional(v3.boolean), 
    renderRightSideGadget = v3.optional(v3.callback), 
    rightSideGadgetSize = v3.optional(v3.Vector2), 
    leftPaddingOffset = v3.optional(v3.number), 
    layoutOrder = v3.integer, 
    setButtonRef = v3.optional(v3.union(v3.callback, v3.table)), 
    cursorKind = v3.optional(v7.isEnumValue), 
    isElementBackgroundVisible = v3.optional(v3.boolean), 
    dividerOffset = v3.optional(v3.number), 
    dividerSize = v3.optional(v3.number), 
    fontStyle = v3.optional(v3.union(v3.string, v14)), 
    iconSize = v3.optional(v3.integer), 
    selectedIconSize = v3.optional(v3.integer), 
    iconPaddingLeft = v3.optional(v3.integer), 
    textPadding = v3.optional(v3.strictInterface({
        left = v3.integer, 
        right = v3.integer
    })), 
    selectedIconPaddingRight = v3.optional(v3.integer), 
    keyLabelPaddingRight = v3.optional(v3.integer), 
    textOnlyPadding = v3.optional(v3.integer), 
    borderCornerRadius = v3.optional(v3.integer), 
    background = v3.optional(v5), 
    selectionOrder = v3.optional(v3.number), 
    selectionCursor = v3.optional(v3.table)
});
v20.defaultProps = {
    selected = false, 
    disabled = false, 
    rightSideGadgetSize = nil, 
    leftPaddingOffset = 0, 
    isElementBackgroundVisible = true, 
    dividerOffset = 0, 
    dividerSize = 1, 
    iconSize = 36, 
    selectedIconSize = 16, 
    iconPaddingLeft = 12, 
    textPadding = {
        left = 12, 
        right = 12
    }, 
    selectedIconPaddingRight = 24, 
    textOnlyPadding = 24, 
    keyLabelPaddingRight = 16, 
    borderCornerRadius = 4
};
v20.init = function(v21) --[[ Line: 134 ]] --[[ Name: init ]]
    -- upvalues: v15 (copy)
    v21.state = {
        controlState = v15.Default, 
        keyLabelWidth = 0
    };
    v21.keyLabelSizeChanged = function(v22) --[[ Line: 141 ]]
        -- upvalues: v21 (copy)
        v21:setState({
            keyLabelWidth = v22.AbsoluteSize.X
        });
    end;
    v21.setControlState = function(v23) --[[ Line: 147 ]]
        -- upvalues: v21 (copy)
        v21:setState({
            controlState = v23
        });
    end;
    v21.onStateChanged = function(_, v25) --[[ Line: 153 ]]
        -- upvalues: v21 (copy)
        v21.setControlState(v25);
    end;
end;
v20.getImageProperties = function(v26) --[[ Line: 158 ]] --[[ Name: getImageProperties ]]
    -- upvalues: v19 (copy), v11 (copy)
    local l_ImageRectSize_0 = v19.ImageRectSize;
    local l_ImageRectOffset_0 = v19.ImageRectOffset;
    local v29 = 8 * v11.ImagesResolutionScale;
    local v30 = 8 * v11.ImagesResolutionScale;
    local v31 = Rect.new(v29, v30, l_ImageRectSize_0.x - v29, l_ImageRectSize_0.y - v30);
    local l_X_0 = l_ImageRectSize_0.X;
    local v33 = math.floor(l_X_0 / 2);
    local _ = nil;
    local _ = nil;
    local _ = nil;
    if v26.props.hasRoundTop and v26.props.hasRoundBottom then
        return l_ImageRectSize_0, l_ImageRectOffset_0, v31;
    elseif v26.props.hasRoundTop then
        return Vector2.new(l_X_0, v33), l_ImageRectOffset_0, (Rect.new(v33 - 1, v33 - 1, v33 + 1, v33));
    elseif v26.props.hasRoundBottom then
        return Vector2.new(l_X_0, v33), l_ImageRectOffset_0 + Vector2.new(0, v33), (Rect.new(v33 - 1, 0, v33 + 1, 1));
    else
        return Vector2.new(1, 1), l_ImageRectOffset_0 + Vector2.new(v33, v33), (Rect.new(0, 0, 0, 0));
    end;
end;
v20.renderRoundedBackground = function(v37, v38, v39) --[[ Line: 192 ]] --[[ Name: renderRoundedBackground ]]
    -- upvalues: v2 (copy), v17 (copy)
    local v40 = UDim.new(0, v37.props.borderCornerRadius);
    return v2.createElement(v17, {
        zIndex = v38, 
        background = v39, 
        topCornerRadius = if v37.props.hasRoundTop then v40 else nil, 
        bottomCornerRadius = if v37.props.hasRoundBottom then v40 else nil
    });
end;
v20.renderWithSelectionCursor = function(v41, _) --[[ Line: 202 ]] --[[ Name: renderWithSelectionCursor ]]
    -- upvalues: v4 (copy), v15 (copy), v13 (copy), l_Object_0 (copy), v2 (copy), v10 (copy), v12 (copy), v16 (copy), v11 (copy), v18 (copy)
    return v4(function(v43) --[[ Line: 203 ]]
        -- upvalues: v41 (copy), v15 (ref), v13 (ref), l_Object_0 (ref), v2 (ref), v10 (ref), v12 (ref), v16 (ref), v11 (ref), v18 (ref)
        local l_Theme_0 = v43.Theme;
        local l_Font_0 = v43.Font;
        local l_Settings_0 = v43.Settings;
        local l_textOnlyPadding_0 = v41.props.textOnlyPadding;
        if v41.props.icon then
            l_textOnlyPadding_0 = v41.props.iconPaddingLeft;
        end;
        l_textOnlyPadding_0 = l_textOnlyPadding_0 + v41.props.leftPaddingOffset;
        local v48 = 0;
        if v41.props.keyCodeLabel then
            v48 = v41.props.keyLabelPaddingRight;
        elseif v41.props.selected then
            v48 = v41.props.selectedIconPaddingRight;
        end;
        local v49 = {
            Color = Color3.new(1, 1, 1), 
            Transparency = 1
        };
        if v41.state.controlState == v15.Pressed then
            v49 = l_Theme_0.BackgroundOnPress;
        elseif v41.state.controlState == v15.Hover then
            v49 = l_Theme_0.BackgroundOnHover;
        end;
        local v50, v51, v52 = v41:getImageProperties();
        local v53 = 0;
        local v54 = true;
        if v41.props.rightSideGadgetSize ~= nil then
            v53 = v41.props.rightSideGadgetSize.X + v41.props.iconPaddingLeft + v41.props.iconSize + v41.props.textPadding.left;
        else
            if v41.props.icon then
                v54 = false;
                l_textOnlyPadding_0 = v41.props.iconPaddingLeft;
                v53 = v41.props.iconPaddingLeft + v41.props.iconSize;
            end;
            if v41.props.selected then
                v54 = false;
                v53 = v53 + v41.props.selectedIconSize + v41.props.selectedIconPaddingRight;
            end;
            if v41.props.keyCodeLabel then
                v54 = false;
                v53 = v53 + v41.props.keyLabelPaddingRight + v41.state.keyLabelWidth;
            end;
            v53 = if v54 then v53 + v41.props.textOnlyPadding * 2 else v53 + v41.props.textPadding.left + v41.props.textPadding.right;
        end;
        local l_TextEmphasis_0 = l_Theme_0.TextEmphasis;
        if v41.props.textColorOverride then
            l_TextEmphasis_0 = {
                Color = v41.props.textColorOverride, 
                Transparency = l_Theme_0.TextEmphasis.Transparency
            };
        end;
        if v41.state.controlState == v15.Pressed or v41.props.disabled then
            l_TextEmphasis_0 = {
                Color = l_TextEmphasis_0.Color, 
                Transparency = v13(l_Theme_0.TextEmphasis.Transparency, 2)
            };
        end;
        local l_BackgroundUIDefault_0 = l_Theme_0.BackgroundUIDefault;
        local v57 = l_Object_0.assign({}, {
            Color = l_BackgroundUIDefault_0.Color, 
            Transparency = l_BackgroundUIDefault_0.Transparency
        }, v41.props.background);
        v57.Transparency = v57.Transparency * l_Settings_0.PreferredTransparency;
        local v58 = {
            Background = if v41.props.isElementBackgroundVisible then v41:renderRoundedBackground(-1, v57) else nil, 
            Divider = v2.createElement("Frame", {
                BackgroundColor3 = l_Theme_0.Divider.Color, 
                BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, -v41.props.dividerOffset, 0, v41.props.dividerSize), 
                Position = UDim2.new(0, v41.props.dividerOffset, 1, 0), 
                AnchorPoint = Vector2.new(0, 1), 
                Visible = v41.props.hasDivider
            }), 
            StateOverlay = v41:renderRoundedBackground(2, v49), 
            LeftAlignedContent = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1)
            }, {
                Layout = v2.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, v41.props.textPadding.left)
                }), 
                LeftPadding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, l_textOnlyPadding_0)
                }), 
                Icon = v41.props.icon and v2.createElement(v10.Label, {
                    Image = v41.props.icon, 
                    Size = UDim2.fromOffset(v41.props.iconSize, v41.props.iconSize), 
                    BackgroundTransparency = 1, 
                    ImageColor3 = v41.props.iconColorOverride or l_Theme_0.IconEmphasis.Color, 
                    ImageTransparency = v13(l_Theme_0.IconEmphasis.Transparency, v41.props.disabled and 2 or 1), 
                    LayoutOrder = 1
                }), 
                Text = v2.createElement(v12, {
                    fontStyle = v41.props.fontStyle or l_Font_0.Header2, 
                    colorStyle = l_TextEmphasis_0, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, -v53, 1, 0), 
                    Text = v41.props.text, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = false, 
                    LayoutOrder = 2
                })
            }), 
            RightAlignedContent = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1)
            }, {
                Layout = v2.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, v41.props.textPadding.right)
                }), 
                RightPadding = v2.createElement("UIPadding", {
                    PaddingRight = UDim.new(0, v48)
                }), 
                RightSideContent = v41.props.renderRightSideGadget and v41.props.rightSideGadgetSize and v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 3, 
                    Size = UDim2.fromOffset(v41.props.rightSideGadgetSize.X, v41.props.rightSideGadgetSize.Y)
                }, v41.props.renderRightSideGadget()) or v2.createFragment({
                    KeyLabel = v41.props.keyCodeLabel and v2.createElement(v16, {
                        keyCode = v41.props.keyCodeLabel, 
                        LayoutOrder = 2, 
                        [v2.Change.AbsoluteSize] = v41.keyLabelSizeChanged
                    }), 
                    SelectedIcon = v2.createElement(v10.Label, {
                        Image = v11["icons/status/success_small"], 
                        Size = UDim2.fromOffset(v41.props.selectedIconSize, v41.props.selectedIconSize), 
                        LayoutOrder = 1, 
                        BackgroundTransparency = 1, 
                        ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                        ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                        Visible = v41.props.selected
                    })
                })
            })
        };
        return v2.createElement(v18, {
            Size = UDim2.new(1, 0, 0, v41.props.elementHeight), 
            BackgroundTransparency = 1, 
            Image = nil, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v52, 
            ImageRectSize = v50, 
            ImageRectOffset = v51, 
            SliceScale = 1 / v11.ImagesResolutionScale, 
            ImageTransparency = 1, 
            ImageColor3 = v57.Color, 
            AutoButtonColor = false, 
            LayoutOrder = v41.props.layoutOrder, 
            BorderSizePixel = 0, 
            [v2.Ref] = v41.props.setButtonRef, 
            SelectionImageObject = v41.props.selectionCursor, 
            SelectionOrder = v41.props.selectionOrder, 
            onStateChanged = v41.onStateChanged, 
            [v2.Event.Activated] = v41.props.onActivated, 
            isDisabled = v41.props.disabled
        }, v58);
    end);
end;
v20.render = function(v59) --[[ Line: 417 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy)
    return v6(function(v60) --[[ Line: 418 ]]
        -- upvalues: v59 (copy)
        return v59:renderWithSelectionCursor(v60);
    end);
end;
return v20;