local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.RoactGamepad);
local v4 = require(l_Parent_2.Roact);
local v5 = require(l_Parent_2.React);
local v6 = require(l_Parent_2.Cryo);
local v7 = require(l_Parent_2.t);
local v8 = require(l_Parent_1.Core.Style.withStyle);
local v9 = require(l_Parent_1.Core.Style.useStyle);
local v10 = require(l_Parent_1.Core.Style.Validator.validateColorInfo);
local v11 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local v12 = require(script.Parent.validateButtonProps);
local v13 = require(l_Parent_0.Container.VerticalScrollView);
local v14 = require(l_Parent_0.ImageSet.Images);
local v15 = require(l_Parent_0.SelectionImage.withSelectionCursorProvider);
local v16 = require(l_Parent_0.SelectionImage.CursorKind);
local v17 = require(l_Parent_1.Utility.setDefault);
local v18 = require(script.Parent.Cell);
local v19 = require(script.Parent.RoundedFrame);
local v20 = require(script.Parent.StyleDefaults);
local v21 = v14["component_assets/dropshadow_17_8"];
local v22 = v4.PureComponent:extend("BaseMenu");
v22.validateProps = v7.strictInterface({
    buttonProps = v12, 
    width = v7.optional(v7.UDim), 
    position = v7.optional(v7.union(v7.UDim2, v7.table)), 
    anchorPoint = v7.optional(v7.Vector2), 
    layoutOrder = v7.optional(v7.number), 
    topElementRounded = v7.optional(v7.boolean), 
    bottomElementRounded = v7.optional(v7.boolean), 
    setFirstItemRef = v7.optional(v7.union(v7.callback, v7.table)), 
    setFrameRef = v7.optional(v7.union(v7.callback, v7.table)), 
    stayOnActivated = v7.optional(v7.boolean), 
    maxHeight = v7.optional(v7.number), 
    showDropShadow = v7.optional(v7.boolean), 
    fixedListHeight = v7.optional(v7.number), 
    isElementBackgroundVisible = v7.optional(v7.boolean), 
    isElementDividerVisible = v7.optional(v7.boolean), 
    elementHeight = v7.optional(v7.number), 
    borderCornerRadius = v7.optional(v7.integer), 
    background = v7.optional(v10), 
    enableTokenOverride = v7.optional(v7.boolean), 
    renderHeader = v7.optional(v7.callback), 
    headerHeight = v7.optional(v7.number), 
    selectionOrder = v7.optional(v7.number), 
    isRoactGamepadEnabled = v7.optional(v7.boolean)
});
v22.defaultProps = {
    width = UDim.new(1, 0), 
    position = UDim2.new(0, 0, 0, 0), 
    topElementRounded = true, 
    bottomElementRounded = true, 
    showDropShadow = false, 
    fixedListHeight = nil, 
    isElementBackgroundVisible = true, 
    isElementDividerVisible = true, 
    elementHeight = 56, 
    borderCornerRadius = 4, 
    enableTokenOverride = true, 
    headerHeight = 0, 
    isRoactGamepadEnabled = true
};
v22.init = function(v23) --[[ Line: 98 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    v23.gamepadRefs = v23.props.isRoactGamepadEnabled and v3.createRefCache() or {};
end;
v22.renderFixedHeightMenu = function(_, v25, v26, v27) --[[ Line: 102 ]] --[[ Name: renderFixedHeightMenu ]]
    -- upvalues: v17 (copy), v4 (copy), v11 (copy), v21 (copy), v13 (copy)
    local l_fixedListHeight_0 = v25.fixedListHeight;
    local v29 = v17(v25.borderCornerRadius, 8);
    local l_BackgroundUIDefault_0 = v26.Theme.BackgroundUIDefault;
    local v31 = v17(v25.background, {
        Color = l_BackgroundUIDefault_0.Color, 
        Transparency = l_BackgroundUIDefault_0.Transparency
    });
    return v4.createElement("Frame", {
        AnchorPoint = v25.anchorPoint, 
        BackgroundTransparency = 1, 
        LayoutOrder = v25.layoutOrder, 
        Size = UDim2.new(v25.width.Scale, v25.width.Offset, 0, l_fixedListHeight_0), 
        Position = v25.position
    }, {
        DropShadow = v25.showDropShadow and v4.createElement(v11.Label, {
            ZIndex = 2, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 16, 1, 16), 
            Image = v21, 
            ImageColor3 = v26.Theme.DropShadow.Color, 
            ImageTransparency = v26.Theme.DropShadow.Transparency, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(16, 16, 16, 16)
        }) or nil, 
        ContentFrame = v4.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            BackgroundColor3 = v31.Color, 
            BackgroundTransparency = v31.Transparency, 
            ZIndex = 3
        }, {
            UICorner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(0, v29)
            }), 
            ClippingFrame = v4.createElement("Frame", {
                ZIndex = 4, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, -v29 * 2), 
                Position = UDim2.new(0, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0, 0.5), 
                ClipsDescendants = true
            }, {
                ScrollingFrame = v4.createElement(v13, {
                    canvasSizeY = UDim.new(0, #v25.buttonProps * v25.elementHeight), 
                    selectable = false
                }, v27)
            })
        })
    });
end;
v22.render = function(v32) --[[ Line: 157 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v4 (copy), v16 (copy), v15 (copy), v3 (copy), v18 (copy), v8 (copy), v17 (copy), v11 (copy), v21 (copy), v19 (copy)
    local l_headerHeight_0 = v32.props.headerHeight;
    local v34 = v32.props.elementHeight * 7.5 + l_headerHeight_0;
    local v35 = #v32.props.buttonProps * v32.props.elementHeight + l_headerHeight_0;
    local v36 = false;
    if v34 <= v35 then
        v35 = v34;
        v36 = true;
    end;
    local l_maxHeight_0 = v32.props.maxHeight;
    if l_maxHeight_0 and l_maxHeight_0 > 0 and l_maxHeight_0 < v35 then
        v35 = (math.max(math.floor((l_maxHeight_0 - v32.props.elementHeight * 0.5 - l_headerHeight_0) / v32.props.elementHeight), 1) + 0.5) * v32.props.elementHeight + l_headerHeight_0;
        v36 = true;
    end;
    local v38 = {};
    for v39, v40 in ipairs(v32.props.buttonProps) do
        local v41 = v6.Dictionary.join(v40, {
            elementHeight = v32.props.elementHeight, 
            hasRoundTop = v32.props.topElementRounded and v39 == 1 and not v36, 
            hasRoundBottom = v32.props.bottomElementRounded and v39 == #v32.props.buttonProps and not v36, 
            hasDivider = if v32.props.isElementDividerVisible then v39 < #v32.props.buttonProps else false, 
            layoutOrder = v39, 
            inputBindingKey = v6.None, 
            setButtonRef = v39 == 1 and v32.props.setFirstItemRef or nil, 
            isElementBackgroundVisible = v32.props.isElementBackgroundVisible, 
            borderCornerRadius = v32.props.borderCornerRadius, 
            background = v32.props.background
        });
        if not v32.props.isRoactGamepadEnabled then
            v32.gamepadRefs[v39] = v32.gamepadRefs[v39] or v4.createRef();
        end;
        local v42 = nil;
        v42 = if v41.hasRoundBottom and v41.hasRoundTop then v16.RoundedRectNoInset else if v41.hasRoundBottom then v16.BulletDown else if v41.hasRoundTop then v16.BulletUp else v16.Square;
        v41 = v6.Dictionary.join(v41, {
            cursorKind = v42, 
            selectionOrder = v32.props.selectionOrder
        });
        do
            local l_v41_0, l_v42_0 = v41, v42;
            v38["cell " .. v39] = v15(function(v45) --[[ Line: 212 ]]
                -- upvalues: v4 (ref), v32 (copy), v3 (ref), v39 (copy), v40 (copy), l_v42_0 (ref), v18 (ref), l_v41_0 (ref)
                return v4.createElement(if v32.props.isRoactGamepadEnabled then v3.Focusable.Frame else "Frame", {
                    Size = UDim2.new(v32.props.width, UDim.new(0, v32.props.elementHeight)), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = v39, 
                    [v4.Ref] = v32.gamepadRefs[v39], 
                    NextSelectionUp = v39 > 1 and v32.gamepadRefs[v39 - 1] or nil, 
                    NextSelectionDown = v39 < #v32.props.buttonProps and v32.gamepadRefs[v39 + 1] or nil, 
                    inputBindings = if v32.props.isRoactGamepadEnabled then {
                        Activated = v3.Input.onBegin(Enum.KeyCode.ButtonA, v40.onActivated, {
                            key = v40.inputBindingKey
                        })
                    } else nil, 
                    SelectionImageObject = v45(l_v42_0)
                }, {
                    Cell = v4.createElement(v18, l_v41_0)
                });
            end);
        end;
    end;
    v38.layout = v4.createElement("UIListLayout", {
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        FillDirection = Enum.FillDirection.Vertical, 
        SortOrder = Enum.SortOrder.LayoutOrder
    });
    return v8(function(v46) --[[ Line: 245 ]]
        -- upvalues: v17 (ref), v32 (copy), v36 (ref), v38 (copy), v4 (ref), v35 (ref), v11 (ref), v21 (ref), v19 (ref), l_headerHeight_0 (copy)
        local l_Theme_0 = v46.Theme;
        local l_BackgroundUIDefault_1 = l_Theme_0.BackgroundUIDefault;
        local v49 = v17(v32.props.background, {
            Color = l_BackgroundUIDefault_1.Color, 
            Transparency = l_BackgroundUIDefault_1.Transparency
        });
        local l_isElementBackgroundVisible_0 = v32.props.isElementBackgroundVisible;
        local v51 = v36 and v32.props.topElementRounded and l_isElementBackgroundVisible_0;
        local v52 = v36 and v32.props.bottomElementRounded and l_isElementBackgroundVisible_0;
        local v53 = (v51 and 1 or 0) + (v52 and 1 or 0);
        local l_renderHeader_0 = v32.props.renderHeader;
        local v55 = not v51 and (l_renderHeader_0 and true or false);
        if v32.props.fixedListHeight then
            return v32:renderFixedHeightMenu(v32.props, v46, v38);
        else
            return v4.createElement("Frame", {
                AnchorPoint = v32.props.anchorPoint, 
                BackgroundTransparency = 1, 
                LayoutOrder = v32.props.layoutOrder, 
                Size = UDim2.new(v32.props.width.Scale, v32.props.width.Offset, 0, v35), 
                Position = v32.props.position
            }, {
                DropShadow = v32.props.showDropShadow and v4.createElement(v11.Label, {
                    ZIndex = 2, 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 16, 1, 16), 
                    Image = v21, 
                    ImageColor3 = v46.Theme.DropShadow.Color, 
                    ImageTransparency = v46.Theme.DropShadow.Transparency, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(16, 16, 16, 16)
                }) or nil, 
                Background = if not not v51 or v52 then v4.createElement(v19, {
                    zIndex = -1, 
                    background = v49, 
                    topCornerRadius = if v51 then UDim.new(0, v32.props.borderCornerRadius) else nil, 
                    bottomCornerRadius = if v52 then UDim.new(0, v32.props.borderCornerRadius) else nil
                }) else nil, 
                ClippingFrame = v4.createElement("Frame", {
                    ZIndex = 3, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 1, -(v32.props.borderCornerRadius * v53)), 
                    Position = UDim2.fromScale(0, v51 and 0.5 or 0), 
                    AnchorPoint = Vector2.new(0, v51 and 0.5 or 0), 
                    ClipsDescendants = true
                }, {
                    HeaderFrame = if v55 then v4.createElement("Frame", {
                        Selectable = false, 
                        Size = UDim2.new(1, 0, 0, l_headerHeight_0), 
                        Position = UDim2.fromOffset(0, 0), 
                        AnchorPoint = Vector2.new(0, 0), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0
                    }, {
                        Header = l_renderHeader_0()
                    }) else nil, 
                    ScrollingFrame = v4.createElement("ScrollingFrame", {
                        [v4.Ref] = v32.props.setFrameRef, 
                        Selectable = false, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, v51 and -4 or 0, 1, if v55 then -l_headerHeight_0 else 0), 
                        Position = if v55 then UDim2.fromOffset(0, l_headerHeight_0) else nil, 
                        BorderSizePixel = 0, 
                        ScrollBarThickness = v36 and 4 or 0, 
                        ScrollBarImageColor3 = l_Theme_0.UIEmphasis.Color, 
                        ScrollBarImageTransparency = l_Theme_0.UIEmphasis.Transparency, 
                        ScrollingDirection = Enum.ScrollingDirection.Y, 
                        CanvasSize = UDim2.new(1, 0, 0, #v32.props.buttonProps * v32.props.elementHeight), 
                        ClipsDescendants = v55
                    }, v38)
                })
            });
        end;
    end);
end;
return function(v56) --[[ Line: 341 ]] --[[ Name: BaseMenuFn ]]
    -- upvalues: v9 (copy), v6 (copy), v20 (copy), v5 (copy), v22 (copy)
    local l_v56_0 = v56;
    if v56.enableTokenOverride then
        local v58 = v9();
        local v59 = {};
        for v60, v61 in ipairs(v56.buttonProps) do
            v59[v60] = v6.Dictionary.join(v61, v20.getCellDefaultTokens(v58));
        end;
        l_v56_0 = v6.Dictionary.join(l_v56_0, v20.getBaseMenuDefaultTokens(v58), {
            buttonProps = v59
        });
    end;
    return v5.createElement(v22, l_v56_0);
end;