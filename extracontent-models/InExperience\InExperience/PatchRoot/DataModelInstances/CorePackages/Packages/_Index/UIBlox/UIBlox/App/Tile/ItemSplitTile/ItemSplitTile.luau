local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Core_0 = l_Parent_1.Core;
local l_Parent_2 = l_Parent_1.Parent;
local v4 = require(l_Parent_2.Roact);
local v5 = require(l_Parent_2.t);
local v6 = require(l_Core_0.Style.withStyle);
local v7 = require(l_Core_0.Control.Interactable);
local v8 = require(l_Core_0.Control.Enum.ControlState);
local v9 = require(l_Parent_1.App.Loading.LoadableImage);
local v10 = require(l_Parent_0.ImageSet.Images);
local v11 = require(l_Core_0.ImageSet.ImageSetComponent);
local v12 = require(l_Parent_1.App.Tile.ItemSplitTile.ItemSplitTileFooter);
local v13 = UDim.new(0, 8);
local v14 = UDim.new(0, 8);
local v15 = UDim.new(0, 12);
local v16 = v4.PureComponent:extend("ItemSplitTile");
v16.validateProps = v5.strictInterface({
    itemName = v5.optional(v5.string), 
    priceText = v5.optional(v5.string), 
    isOwned = v5.optional(v5.boolean), 
    hasBackground = v5.optional(v5.boolean), 
    isHovered = v5.optional(v5.boolean), 
    onActivated = v5.optional(v5.callback), 
    thumbnail = v5.optional(v5.string)
});
v16.defaultProps = {
    itemName = "--", 
    priceText = "--", 
    hasBackground = true, 
    isHovered = false
};
v16.init = function(v17) --[[ Line: 68 ]] --[[ Name: init ]]
    -- upvalues: v8 (copy)
    v17:setState({
        controlState = v8.Initialize
    });
    v17.onStateChanged = function(_, v19) --[[ Line: 73 ]]
        -- upvalues: v17 (copy)
        v17:setState({
            controlState = v19
        });
    end;
end;
v16.renderImageFrame = function(_, v21, v22, v23, v24) --[[ Line: 80 ]] --[[ Name: renderImageFrame ]]
    -- upvalues: v4 (copy), v11 (copy), v13 (copy), v9 (copy)
    local l_Theme_0 = v24.Theme;
    local v26 = v23 or not v22;
    local v27 = typeof(v21) == "table";
    return v4.createElement("Frame", {
        Position = UDim2.fromScale(0, v22 and 0.5 or 0), 
        Size = UDim2.fromScale(1, v23 and 1 or 0.5), 
        ClipsDescendants = true, 
        BackgroundTransparency = 1
    }, {
        Image = if v27 then v4.createElement(v11.Label, {
            BackgroundColor3 = l_Theme_0.PlaceHolder.Color, 
            BackgroundTransparency = 1, 
            Image = v21, 
            Position = UDim2.fromScale(0, v22 and -1 or 0), 
            Size = UDim2.fromScale(1, v23 and 1 or 2)
        }, {
            UICorner = if v26 then v4.createElement("UICorner", {
                CornerRadius = v13
            }) else nil
        }) else v4.createElement(v9, {
            BackgroundColor3 = l_Theme_0.PlaceHolder.Color, 
            BackgroundTransparency = 1, 
            Image = v21, 
            Position = UDim2.fromScale(0.5, v22 and 0 or 1), 
            Size = UDim2.fromScale(1, v23 and 1 or 2), 
            AnchorPoint = Vector2.new(0.5, v23 and 1 or 0.5), 
            cornerRadius = if v26 then v13 else nil, 
            showFailedStateWhenLoadingFailed = true, 
            useShimmerAnimationWhileLoading = true
        })
    });
end;
v16.renderTopContent = function(v28, v29) --[[ Line: 119 ]] --[[ Name: renderTopContent ]]
    -- upvalues: v10 (copy), v4 (copy), v11 (copy)
    local l_hasBackground_0 = v28.props.hasBackground;
    local l_isHovered_0 = v28.props.isHovered;
    local v32 = not l_hasBackground_0;
    local l_Theme_1 = v29.Theme;
    local v34 = v10[l_Theme_1.ItemBackgroundDefault.Image];
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        SizeConstraint = Enum.SizeConstraint.RelativeXX, 
        ZIndex = 2
    }, {
        BackgroundImage = if v28.props.thumbnail then v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            TopImageFrame = v28:renderImageFrame(v34, false, v32, v29), 
            BottomImageFrame = if not v32 then v28:renderImageFrame(v34, true, false, v29) else nil
        }) else nil, 
        ItemImage = v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            TopImageFrame = v28:renderImageFrame(v28.props.thumbnail, false, v32, v29), 
            BottomImageFrame = if not v32 then v28:renderImageFrame(v28.props.thumbnail, true, false, v29) else nil
        }), 
        HoverShadow = if not l_isHovered_0 or l_hasBackground_0 then nil else v4.createElement(v11.Label, {
            ZIndex = 0, 
            Position = UDim2.new(0.5, 0, 0.5, 2), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 12), 
            Image = v10["component_assets/dropshadow_24_6"], 
            ImageColor3 = l_Theme_1.DropShadow.Color, 
            ImageTransparency = l_Theme_1.DropShadow.Transparency, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(18, 18, 18, 18)
        })
    });
end;
v16.renderBottomContent = function(v35, v36) --[[ Line: 169 ]] --[[ Name: renderBottomContent ]]
    -- upvalues: v8 (copy), v15 (copy), v14 (copy), v4 (copy), v12 (copy)
    local l_itemName_0 = v35.props.itemName;
    local l_hasBackground_1 = v35.props.hasBackground;
    local l_Font_0 = v36.Font;
    local v40 = math.ceil(v36.Font.BaseSize * v36.Font.Header2.RelativeSize);
    local l_Theme_2 = v36.Theme;
    local l_controlState_0 = v35.state.controlState;
    local v43 = if (not not v35.props.isHovered or l_controlState_0 == v8.Pressed) and l_hasBackground_1 then v15 else v14;
    local v44 = v40 * 3 + v14.Offset + v43.Offset * 2;
    local l_TextEmphasis_0 = l_Theme_2.TextEmphasis;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v44), 
        BackgroundTransparency = 1, 
        LayoutOrder = 2
    }, {
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = v14
        }), 
        Padding = v4.createElement("UIPadding", {
            PaddingLeft = if l_hasBackground_1 then v43 else nil, 
            PaddingRight = if l_hasBackground_1 then v43 else nil, 
            PaddingTop = if l_hasBackground_1 then v43 else v14, 
            PaddingBottom = if l_hasBackground_1 then v43 else v14
        }), 
        TitleArea = if l_itemName_0 and string.len(l_itemName_0) > 0 then v4.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Text = l_itemName_0, 
            Font = l_Font_0.Header2.Font, 
            TextSize = v40, 
            TextTransparency = l_TextEmphasis_0.Transparency, 
            TextColor3 = l_TextEmphasis_0.Color, 
            TextWrapped = true, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            LayoutOrder = 1
        }, {
            UISizeConstraint = v4.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(1e999, v40 * 2)
            })
        }) else nil, 
        Footer = v4.createElement(v12, {
            priceText = v35.props.priceText, 
            isOwned = v35.props.isOwned, 
            layoutOrder = 2
        })
    });
end;
v16.renderTileContent = function(v46, v47) --[[ Line: 237 ]] --[[ Name: renderTileContent ]]
    -- upvalues: v4 (copy), v13 (copy), v7 (copy)
    local l_hasBackground_2 = v46.props.hasBackground;
    local l_onActivated_0 = v46.props.onActivated;
    local l_Theme_3 = v47.Theme;
    local v51 = if l_hasBackground_2 then l_Theme_3.BackgroundUIDefault.Color else nil;
    local v52 = if l_hasBackground_2 then l_Theme_3.BackgroundUIDefault.Transparency else 1;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = v51, 
        BackgroundTransparency = v52, 
        ClipsDescendants = true, 
        ZIndex = 1
    }, {
        UICorner = v4.createElement("UICorner", {
            CornerRadius = v13
        }), 
        Panel = v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            UIListLayout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            TopContentPlaceholder = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                SizeConstraint = Enum.SizeConstraint.RelativeXX, 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }), 
            BottomContent = v46:renderBottomContent(v47)
        }), 
        TopContent = v46:renderTopContent(v47), 
        TileOverlay = v4.createElement(v7, {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            onStateChanged = v46.onStateChanged, 
            [v4.Event.Activated] = l_onActivated_0, 
            ZIndex = 3
        }, {
            UICorner = v4.createElement("UICorner", {
                CornerRadius = v13
            }), 
            BorderFrame = v4.createElement("Frame", {
                Size = UDim2.new(1, -2, 1, -2), 
                Position = UDim2.fromOffset(1, 1), 
                BackgroundTransparency = 1, 
                SizeConstraint = if not l_hasBackground_2 then Enum.SizeConstraint.RelativeXX else nil
            }, {
                UIStroke = v4.createElement("UIStroke", {
                    Color = l_Theme_3.Divider.Color, 
                    Transparency = l_Theme_3.Divider.Transparency, 
                    Thickness = 1
                }), 
                UICorner = v4.createElement("UICorner", {
                    CornerRadius = v13
                })
            })
        })
    });
end;
v16.render = function(v53) --[[ Line: 300 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v4 (copy), v11 (copy), v10 (copy)
    local l_hasBackground_3 = v53.props.hasBackground;
    local l_isHovered_1 = v53.props.isHovered;
    return v6(function(v56) --[[ Line: 304 ]]
        -- upvalues: v4 (ref), v53 (copy), l_isHovered_1 (copy), l_hasBackground_3 (copy), v11 (ref), v10 (ref)
        local l_Theme_4 = v56.Theme;
        return v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            UISizeConstraint = v4.createElement("UISizeConstraint", {
                MinSize = Vector2.new(146, 233)
            }), 
            TileContent = v53:renderTileContent(v56), 
            HoverShadow = if l_isHovered_1 and l_hasBackground_3 then v4.createElement(v11.Label, {
                ZIndex = 0, 
                Position = UDim2.new(0.5, 0, 0.5, 2), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 10, 1, 12), 
                Image = v10["component_assets/dropshadow_24_6"], 
                ImageColor3 = l_Theme_4.DropShadow.Color, 
                ImageTransparency = l_Theme_4.DropShadow.Transparency, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(18, 18, 18, 18)
            }) else nil
        });
    end);
end;
return v16;