local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_0.Utility.SpringAnimatedItem);
local v5 = {
    dampingRatio = 1, 
    frequency = 3.5
};
local v6 = v2.PureComponent:extend("AccordionView");
v6.validateProps = v3.strictInterface({
    items = v3.table, 
    itemWidth = v3.number, 
    itemHeight = v3.number, 
    renderItem = v3.callback, 
    placeholderColor = v3.Color3, 
    placeholderBaseTransparency = v3.number, 
    collapseButtonSize = v3.number, 
    renderCollapseButton = v3.callback, 
    LayoutOrder = v3.optional(v3.integer), 
    maxItemsInCompactView = v3.numberPositive, 
    onExpand = v3.optional(v3.callback), 
    onCollapse = v3.optional(v3.callback)
});
v6.defaultProps = {
    maxItemsInCompactView = 3
};
v6.init = function(v7) --[[ Line: 48 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v7.state = {
        expanded = false, 
        isExpandButtonPressed = false
    };
    v7.onExpandButtonActivated = function() --[[ Line: 54 ]]
        -- upvalues: v7 (copy)
        if v7.props.onExpand then
            v7.props.onExpand();
        end;
        v7:setState({
            expanded = true, 
            isExpandButtonPressed = false
        });
    end;
    v7.onCollapseButtonActivated = function() --[[ Line: 64 ]]
        -- upvalues: v7 (copy)
        if v7.props.onCollapse then
            v7.props.onCollapse();
        end;
        v7:setState({
            expanded = false
        });
    end;
    v7.onExpandButtonInputBegan = function(_, v9) --[[ Line: 73 ]]
        -- upvalues: v7 (copy)
        if v9.UserInputState == Enum.UserInputState.Begin and (v9.UserInputType == Enum.UserInputType.Touch or v9.UserInputType == Enum.UserInputType.MouseButton1) then
            v7:setState({
                isExpandButtonPressed = true
            });
        end;
    end;
    v7.onExpandButtonInputEnded = function() --[[ Line: 87 ]]
        -- upvalues: v7 (copy)
        if v7.state.isExpandButtonPressed then
            v7:setState({
                isExpandButtonPressed = false
            });
        end;
    end;
    v7.rootFrameRef = v2.createRef();
    v7.onListLayoutAbsoluteContentSizeChanged = function(v10) --[[ Line: 97 ]]
        -- upvalues: v7 (copy)
        if v7.rootFrameRef.current then
            local l_itemWidth_0 = v7.props.itemWidth;
            local v12 = v7:getCompactTotalHeight();
            v7.rootFrameRef.current.Size = UDim2.new(0, l_itemWidth_0, 0, (math.max(v10.AbsoluteContentSize.Y, v12)));
        end;
    end;
end;
v6.getCompactTotalHeight = function(v13) --[[ Line: 108 ]] --[[ Name: getCompactTotalHeight ]]
    local l_items_0 = v13.props.items;
    local l_itemHeight_0 = v13.props.itemHeight;
    local l_maxItemsInCompactView_0 = v13.props.maxItemsInCompactView;
    local v17 = #l_items_0;
    if v17 == 0 then
        return 0;
    else
        return l_itemHeight_0 + (math.min(l_maxItemsInCompactView_0, v17) - 1) * 10;
    end;
end;
v6.getLayoutInfo = function(v18) --[[ Line: 121 ]] --[[ Name: getLayoutInfo ]]
    local l_items_1 = v18.props.items;
    local l_itemWidth_1 = v18.props.itemWidth;
    local l_itemHeight_1 = v18.props.itemHeight;
    local l_placeholderBaseTransparency_0 = v18.props.placeholderBaseTransparency;
    local l_maxItemsInCompactView_1 = v18.props.maxItemsInCompactView;
    local l_expanded_0 = v18.state.expanded;
    local v25 = {};
    local v26 = #l_items_1;
    local v27 = math.min(l_maxItemsInCompactView_1, v26);
    local v28 = 0;
    if v27 > 1 then
        v28 = (1 - l_placeholderBaseTransparency_0) / (v27 - 1);
    end;
    for v29 = 1, v26 do
        if l_expanded_0 then
            v25[v29] = {
                width = l_itemWidth_1, 
                height = l_itemHeight_1, 
                placeholderTransparency = 1, 
                itemTransparency = 0
            };
        elseif v29 == 1 then
            v25[v29] = {
                width = l_itemWidth_1, 
                height = l_itemHeight_1, 
                placeholderTransparency = 1, 
                itemTransparency = 0
            };
        elseif v29 <= l_maxItemsInCompactView_1 then
            v25[v29] = {
                width = l_itemWidth_1 - 20 * (v29 - 1), 
                height = 10, 
                placeholderTransparency = l_placeholderBaseTransparency_0 + v28 * (v29 - 2), 
                itemTransparency = 1
            };
        else
            v25[v29] = {
                width = l_itemWidth_1 - 20 * (v29 - 1), 
                height = 0, 
                placeholderTransparency = 1, 
                itemTransparency = 1
            };
        end;
    end;
    return v25;
end;
v6.render = function(v30) --[[ Line: 175 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v4 (copy), v5 (copy)
    local l_items_2 = v30.props.items;
    local v32 = #l_items_2;
    if v32 == 0 then
        return nil;
    else
        local l_LayoutOrder_0 = v30.props.LayoutOrder;
        local l_itemWidth_2 = v30.props.itemWidth;
        local l_renderItem_0 = v30.props.renderItem;
        local l_placeholderColor_0 = v30.props.placeholderColor;
        local l_collapseButtonSize_0 = v30.props.collapseButtonSize;
        local l_renderCollapseButton_0 = v30.props.renderCollapseButton;
        local l_expanded_1 = v30.state.expanded;
        local l_isExpandButtonPressed_0 = v30.state.isExpandButtonPressed;
        local v41 = v30:getLayoutInfo();
        local v45 = {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, l_expanded_1 and 10 or 0), 
                [v2.Change.AbsoluteContentSize] = v30.onListLayoutAbsoluteContentSizeChanged
            }), 
            Scaler = v2.createElement(v4.AnimatedUIScale, {
                springOptions = v5, 
                animatedValues = {
                    scale = l_isExpandButtonPressed_0 and 0.9 or 1
                }, 
                mapValuesToProps = function(v42) --[[ Line: 208 ]] --[[ Name: mapValuesToProps ]]
                    return {
                        Scale = v42.scale
                    };
                end
            }), 
            CollapseButton = v2.createElement(v4.AnimatedFrame, {
                springOptions = v5, 
                animatedValues = {
                    sizeOffsetY = l_expanded_1 and l_collapseButtonSize_0 + 1 or 0
                }, 
                mapValuesToProps = function(v43) --[[ Line: 221 ]] --[[ Name: mapValuesToProps ]]
                    -- upvalues: l_collapseButtonSize_0 (copy)
                    return {
                        Size = UDim2.new(0, l_collapseButtonSize_0, 0, v43.sizeOffsetY)
                    };
                end, 
                regularProps = {
                    BackgroundTransparency = 1, 
                    ClipsDescendants = true, 
                    [v2.Children] = {
                        ButtonMoveContainer = v2.createElement(v4.AnimatedFrame, {
                            springOptions = v5, 
                            animatedValues = {
                                positionOffsetY = l_expanded_1 and 0 or l_collapseButtonSize_0 / 2
                            }, 
                            mapValuesToProps = function(v44) --[[ Line: 235 ]] --[[ Name: mapValuesToProps ]]
                                return {
                                    Position = UDim2.new(0, 0, 0, v44.positionOffsetY)
                                };
                            end, 
                            regularProps = {
                                Size = UDim2.new(0, l_collapseButtonSize_0, 0, l_collapseButtonSize_0), 
                                BackgroundTransparency = 1, 
                                [v2.Children] = {
                                    Button = l_renderCollapseButton_0(v30.onCollapseButtonActivated)
                                }
                            }
                        })
                    }
                }
            })
        };
        for v46, _ in ipairs(l_items_2) do
            local v48 = v41[v46];
            v45["Item" .. tostring(v46)] = v2.createElement(v4.AnimatedFrame, {
                springOptions = v5, 
                animatedValues = {
                    width = v48.width, 
                    height = v48.height
                }, 
                mapValuesToProps = function(v49) --[[ Line: 262 ]] --[[ Name: mapValuesToProps ]]
                    return {
                        Size = UDim2.new(0, v49.width, 0, v49.height)
                    };
                end, 
                regularProps = {
                    Size = UDim2.new(1, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = v46 + 1, 
                    ZIndex = v32 + 1 - v46, 
                    ClipsDescendants = true, 
                    [v2.Children] = {
                        Item = l_renderItem_0(l_items_2[v46], v48.itemTransparency, v5), 
                        Placeholder = v2.createElement(v4.AnimatedFrame, {
                            key = "Placeholder", 
                            springOptions = v5, 
                            animatedValues = {
                                transparency = v48.placeholderTransparency
                            }, 
                            mapValuesToProps = function(v50) --[[ Line: 282 ]] --[[ Name: mapValuesToProps ]]
                                return {
                                    BackgroundTransparency = v50.transparency
                                };
                            end, 
                            regularProps = {
                                Size = UDim2.new(1, 0, 1, 0), 
                                BackgroundColor3 = l_placeholderColor_0, 
                                BorderSizePixel = 0
                            }
                        })
                    }
                }
            });
        end;
        local v51 = v32 > 1 and not l_expanded_1;
        return v2.createElement("Frame", {
            Size = UDim2.new(0, l_itemWidth_2, 0, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = l_LayoutOrder_0, 
            [v2.Ref] = v30.rootFrameRef
        }, {
            ContentFrame = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1
            }, v45), 
            ClickToExpandButton = v51 and v2.createElement("TextButton", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ZIndex = v32 + 1, 
                Text = "", 
                [v2.Event.Activated] = v30.onExpandButtonActivated, 
                [v2.Event.InputBegan] = v30.onExpandButtonInputBegan, 
                [v2.Event.InputEnded] = v30.onExpandButtonInputEnded
            })
        });
    end;
end;
return v6;