local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.Cryo);
local v5 = require(l_Parent_2.RoactGamepad);
local v6 = require(l_Parent_2.t);
local v7 = require(l_Parent_1.Core.Style.withStyle);
local v8 = require(l_Parent_1.Utility.SpringAnimatedItem);
local v9 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local v10 = require(l_Parent_1.App.ImageSet.Images);
local v11 = require(l_Parent_1.Core.Text.GenericTextLabel.GenericTextLabel);
local v12 = require(l_Parent_1.Core.Text.ExpandableText.ExpandableTextUtils);
local v13 = require(l_Parent_0.SelectionImage.withSelectionCursorProvider);
local v14 = require(l_Parent_0.SelectionCursor.CursorType);
local v15 = require(l_Parent_0.SelectionCursor.useCursorByType);
local v16 = 30;
local v17 = 5;
local v18 = UDim2.new(0, 36, 0, 36);
local v19 = UDim2.new(1, 0, 0, 36);
local v20 = v10["gradient/gradient_0_100"];
local v21 = v10["truncate_arrows/actions_truncationExpand"];
local v22 = v10["truncate_arrows/actions_truncationCollapse"];
local v23 = {
    dampingRatio = 1, 
    frequency = 3.5
};
local v24 = {
    dampingRatio = 1, 
    frequency = 3.5
};
local v25 = v8.wrap(v9.Label);
local v26 = v3.PureComponent:extend("ExpandableTextArea");
v26.validateProps = v6.strictInterface({
    Text = v6.optional(v6.string), 
    Position = v6.optional(v6.UDim2), 
    compactNumberOfLines = v6.optional(v6.number), 
    LayoutOrder = v6.optional(v6.number), 
    width = v6.optional(v6.UDim), 
    padding = v6.optional(v6.Vector2), 
    onClick = v6.optional(v6.callback), 
    NextSelectionUp = v6.optional(v6.table), 
    NextSelectionDown = v6.optional(v6.table), 
    NextSelectionLeft = v6.optional(v6.table), 
    NextSelectionRight = v6.optional(v6.table), 
    frameRef = v6.optional(v6.table), 
    gradientColor = v6.optional(v6.Color3), 
    selectionCursor = v6.table, 
    isRoactGamepadEnabled = v6.optional(v6.boolean)
});
v26.defaultProps = {
    compactNumberOfLines = 2, 
    Text = "", 
    isRoactGamepadEnabled = true
};
v26.init = function(v27) --[[ Line: 74 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    v27.state = {
        isExpanded = false, 
        frameWidth = 0
    };
    v27.onClick = function() --[[ Line: 80 ]]
        -- upvalues: v27 (copy)
        v27:setState(function(v28) --[[ Line: 81 ]]
            return {
                isExpanded = not v28.isExpanded
            };
        end);
        if v27.props.onClick then
            v27.props.onClick(v27.state.isExpanded);
        end;
    end;
    v27.ref = v3.createRef();
    v27.layoutRef = v3.createRef();
end;
v26.getRef = function(v29) --[[ Line: 95 ]] --[[ Name: getRef ]]
    return v29.props.frameRef or v29.ref;
end;
v26.applyFit = function(v30, v31) --[[ Line: 99 ]] --[[ Name: applyFit ]]
    -- upvalues: v16 (ref), v17 (ref)
    local v32 = v30:getRef();
    if not v32.current then
        return;
    else
        local l_current_0 = v32.current;
        local v34 = v31 + v16 + v17;
        local l_width_0 = v30.props.width;
        if l_width_0 then
            l_current_0.Size = UDim2.new(l_width_0.Scale, l_width_0.Offset, 0, v34);
            return;
        else
            l_current_0.Size = UDim2.new(1, 0, 0, v34);
            return;
        end;
    end;
end;
v26.didMount = function(v36) --[[ Line: 114 ]] --[[ Name: didMount ]]
    v36.isMounted = true;
    local l_current_1 = v36.layoutRef.current;
    if l_current_1 then
        v36:applyFit(l_current_1.AbsoluteContentSize.y);
    end;
end;
v26.willUnmount = function(v38) --[[ Line: 123 ]] --[[ Name: willUnmount ]]
    v38.isMounted = false;
end;
v26.render = function(v39) --[[ Line: 127 ]] --[[ Name: render ]]
    -- upvalues: v16 (ref), v17 (ref), v7 (copy), v13 (copy), v12 (copy), v5 (copy), v3 (copy), v8 (copy), v23 (copy), v11 (copy), v25 (copy), v20 (copy), v24 (copy), v19 (copy), v9 (copy), v22 (copy), v21 (copy), v18 (copy)
    local l_Text_0 = v39.props.Text;
    local l_Position_0 = v39.props.Position;
    local l_compactNumberOfLines_0 = v39.props.compactNumberOfLines;
    local l_LayoutOrder_0 = v39.props.LayoutOrder;
    local l_width_1 = v39.props.width;
    local l_padding_0 = v39.props.padding;
    local l_gradientColor_0 = v39.props.gradientColor;
    local v47 = v39:getRef();
    v16 = l_padding_0 and l_padding_0.Y or 30;
    v17 = l_padding_0 and l_padding_0.X or 5;
    return v7(function(v48) --[[ Line: 140 ]]
        -- upvalues: v13 (ref), v12 (ref), v39 (copy), l_Text_0 (copy), l_compactNumberOfLines_0 (copy), v17 (ref), v5 (ref), v3 (ref), l_LayoutOrder_0 (copy), l_Position_0 (copy), l_width_1 (copy), v47 (copy), v16 (ref), v8 (ref), v23 (ref), v11 (ref), v25 (ref), v20 (ref), l_gradientColor_0 (copy), v24 (ref), v19 (ref), v9 (ref), v22 (ref), v21 (ref), v18 (ref)
        return v13(function(_) --[[ Line: 141 ]]
            -- upvalues: v48 (copy), v12 (ref), v39 (ref), l_Text_0 (ref), l_compactNumberOfLines_0 (ref), v17 (ref), v5 (ref), v3 (ref), l_LayoutOrder_0 (ref), l_Position_0 (ref), l_width_1 (ref), v47 (ref), v16 (ref), v8 (ref), v23 (ref), v11 (ref), v25 (ref), v20 (ref), l_gradientColor_0 (ref), v24 (ref), v19 (ref), v9 (ref), v22 (ref), v21 (ref), v18 (ref)
            local l_Theme_0 = v48.Theme;
            local l_Font_0 = v48.Font;
            local v52 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
            local v53, v54 = v12.getExpandableTextHeights(l_Font_0, v39.state.frameWidth, l_Text_0, l_compactNumberOfLines_0);
            local v55 = UDim2.new(1, 0, 0, v54 + v17);
            local v56 = UDim2.new(1, 0, 0, v53 + v17);
            local v57 = v54 < v53;
            local v58 = not v57 or v39.state.isExpanded;
            local v59 = v58 and v56 or v55;
            local v60 = v58 and 0 or 30;
            local v61 = if v39.props.isRoactGamepadEnabled and v57 then v5.Focusable.Frame else "Frame";
            return v3.createElement(v61, {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = l_LayoutOrder_0, 
                Position = l_Position_0, 
                Size = l_width_1 and UDim2.new(l_width_1.Scale, l_width_1.Offset, 0, 0) or UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                SelectionImageObject = v39.props.selectionCursor, 
                [v3.Ref] = v47, 
                [v3.Change.AbsoluteSize] = function(v62) --[[ Line: 174 ]]
                    -- upvalues: v39 (ref)
                    if v39.state.frameWidth ~= v62.AbsoluteSize.X then
                        v39:setState({
                            frameWidth = v62.AbsoluteSize.X
                        });
                    end;
                end, 
                NextSelectionUp = v39.props.NextSelectionUp, 
                NextSelectionDown = v39.props.NextSelectionDown, 
                NextSelectionLeft = v39.props.NextSelectionLeft, 
                NextSelectionRight = v39.props.NextSelectionRight, 
                inputBindings = if v39.props.isRoactGamepadEnabled and v57 then {
                    Activated = v5.Input.onBegin(Enum.KeyCode.ButtonA, v39.onClick)
                } else nil
            }, {
                Layout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, 10), 
                    [v3.Change.AbsoluteContentSize] = function(v63) --[[ Line: 198 ]]
                        -- upvalues: v39 (ref)
                        v39:applyFit(v63.AbsoluteContentSize.y);
                    end, 
                    [v3.Ref] = v39.layoutRef
                }), 
                UIPadding = v3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v16)
                }), 
                ExpandableContainer = v3.createElement(v8.AnimatedFrame, {
                    animatedValues = {
                        height = v59.Y.Offset
                    }, 
                    mapValuesToProps = function(v64) --[[ Line: 211 ]] --[[ Name: mapValuesToProps ]]
                        -- upvalues: v59 (copy)
                        return {
                            Size = UDim2.new(1, 0, v59.Y.Scale, v64.height)
                        };
                    end, 
                    regularProps = {
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        ClipsDescendants = true, 
                        Size = v59, 
                        LayoutOrder = 0
                    }, 
                    springOptions = v23
                }, {
                    DescriptionText = v3.createElement(v11, {
                        colorStyle = l_Theme_0.TextDefault, 
                        fontStyle = l_Font_0.Body, 
                        Size = v59, 
                        Text = l_Text_0, 
                        TextSize = v52, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true, 
                        BackgroundTransparency = 1
                    }), 
                    Gradient = v57 and v3.createElement(v25, {
                        animatedValues = {
                            height = v60
                        }, 
                        mapValuesToProps = function(v65) --[[ Line: 239 ]] --[[ Name: mapValuesToProps ]]
                            return {
                                Size = UDim2.new(1, 0, 0, v65.height)
                            };
                        end, 
                        regularProps = {
                            Size = UDim2.new(1, 0, 0, 30), 
                            Position = UDim2.new(0, 0, 1, 0), 
                            AnchorPoint = Vector2.new(0, 1), 
                            BackgroundTransparency = 1, 
                            Image = v20, 
                            ImageColor3 = l_gradientColor_0 or l_Theme_0.BackgroundDefault.Color
                        }, 
                        springOptions = v24
                    })
                }), 
                ButtonContainer = v57 and v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, 10), 
                    LayoutOrder = 1
                }, {
                    PressableButton = v3.createElement("TextButton", {
                        Position = UDim2.new(0, 0, 0, -24), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Size = v19, 
                        Text = "", 
                        [v3.Event.Activated] = v39.onClick
                    }, {
                        DownArrow = v3.createElement(v9.Label, {
                            AnchorPoint = Vector2.new(0.5, 0), 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            Position = UDim2.new(0.5, 0, 0, 0), 
                            Image = v59 == v56 and v22 or v21, 
                            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                            ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                            Size = v18
                        })
                    })
                })
            });
        end);
    end);
end;
return v3.forwardRef(function(v66, v67) --[[ Line: 286 ]]
    -- upvalues: v15 (copy), v14 (copy), v4 (copy), v3 (copy), v26 (copy)
    local v68 = v15(v14.RoundedRect);
    v66 = v4.Dictionary.join(v66, {
        selectionCursor = v68
    });
    return v3.createElement(v26, v4.Dictionary.join(v66, {
        frameRef = v67
    }));
end);