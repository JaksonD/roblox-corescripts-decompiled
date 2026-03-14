local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_1.Cryo);
local l_StatusIndicator_0 = require(l_Parent_1.Foundation).StatusIndicator;
local v6 = require(l_Parent_0.Core.Style.withStyle);
local v7 = require(l_Parent_0.Core.Control.Enum.ControlState);
local v8 = require(l_Parent_0.Core.ImageSet.ImageSetComponent);
local v9 = require(l_Parent_0.Core.ImageSet.Validator.validateImageSetData);
local v10 = require(l_Parent_0.App.Indicator.Enum.BadgeVariant);
local v11 = require(l_Parent_0.App.Indicator.Enum.BadgeStates);
local v12 = require(l_Parent_0.App.ImageSet.Enum.IconSize);
local v13 = require(l_Parent_0.App.ImageSet.getIconSize);
local v14 = require(l_Parent_0.Core.Control.InteractableList);
local v15 = require(l_Parent_0.Core.Animation.withAnimation);
local v16 = require(l_Parent_0.Utility.migrateBadgeVariant);
local v17 = require(script.Parent.Enum.Placement);
local v18 = {
    frequency = 3
};
local v19 = v13(v12.Medium);
local v20 = v19 + 8;
local v21 = (v20 - v19) / 2;
local v22 = (v20 - v19) / 2;
local v23 = v21 + 4;
local v24 = v22 - 4;
local v25 = 12 + (64 - v20) / 2;
local v26 = 4 + (64 - v20);
local v27 = v2.PureComponent:extend("SystemBar");
v27.validateProps = v3.strictInterface({
    itemList = v3.array(v3.strictInterface({
        iconOn = v3.optional(v9), 
        iconOff = v3.optional(v9), 
        iconImageComponent = v3.optional(v3.union(v3.table, v3.callback)), 
        iconComponent = v3.optional(v3.union(v3.table, v3.callback)), 
        onActivated = v3.callback, 
        badgeValue = v3.optional(v3.union(v3.integer, v3.string, v11.isEnumValue)), 
        itemSize = v3.optional(v3.UDim2), 
        bottomAligned = v3.optional(v3.boolean)
    })), 
    selection = v3.optional(v3.integer), 
    placement = v3.optional(v17.isEnumValue), 
    hidden = v3.optional(v3.boolean), 
    onSafeAreaChanged = v3.optional(v3.callback), 
    size = v3.optional(v3.UDim2), 
    position = v3.optional(v3.UDim2), 
    layoutOrder = v3.optional(v3.integer), 
    layoutPaddingOffset = v3.optional(v3.UDim), 
    firstItemPaddingOffset = v3.optional(v3.UDim), 
    lastItemPaddingOffset = v3.optional(v3.UDim), 
    [v2.Children] = v3.optional(v3.any), 
    roundCorners = v3.optional(v3.boolean), 
    buttonStroke = v3.optional(v3.boolean), 
    bgTransparency = v3.optional(v3.integer), 
    sortOrder = v3.optional(v3.enum(Enum.SortOrder)), 
    clipsDescendants = v3.optional(v3.boolean), 
    experimentalTabSizePortraitY = v3.optional(v3.number)
});
v27.defaultProps = {
    placement = v17.Auto, 
    layoutPaddingOffset = UDim.new(0, 0), 
    firstItemPaddingOffset = UDim.new(0, 0), 
    lastItemPaddingOffset = UDim.new(0, 0), 
    clipsDescendants = true, 
    experimentalTabSizePortraitY = 48
};
v27.isPortrait = function(v28) --[[ Line: 145 ]] --[[ Name: isPortrait ]]
    -- upvalues: v17 (copy)
    if v28.props.placement == v17.Left then
        return false;
    elseif v28.props.placement == v17.Bottom then
        return true;
    else
        return v28.state.portrait;
    end;
end;
v27.renderItem = function(v29, v30, v31, v32, v33) --[[ Line: 155 ]] --[[ Name: renderItem ]]
    -- upvalues: v7 (copy), v17 (copy), v2 (copy), v11 (copy), v3 (copy), v21 (copy), v22 (copy), v24 (copy), v23 (copy), v15 (copy), v6 (copy), v8 (copy), v19 (copy), v19 (copy), l_StatusIndicator_0 (copy), v16 (copy), v10 (copy), v18 (copy)
    assert(v30.iconOn ~= nil and v30.iconOff ~= nil or v30.iconImageComponent ~= nil or v30.iconComponent ~= nil, "items must define either iconOn and iconOff or iconImageComponent or iconComponent");
    local v34 = v31 == v7.Pressed;
    local v35 = v34 or v31 == v7.Hover;
    if v30.iconComponent then
        local v36 = nil;
        v36 = if v29:isPortrait() then v17.Bottom else v17.Left;
        return v2.createElement(v30.iconComponent, {
            placement = v36, 
            hovered = v35, 
            selected = v32, 
            pressed = v34, 
            badgeValue = v30.badgeValue
        }), {
            LayoutOrder = v33
        };
    else
        local v37 = nil;
        v37 = if v30.badgeValue then v30.badgeValue == v11.isEmpty or v3.string(v30.badgeValue) and true or v30.badgeValue > 0 else false;
        local l_v21_0 = v21;
        local l_v22_0 = v22;
        if v35 then
            if v29:isPortrait() then
                l_v22_0 = v24;
            else
                l_v21_0 = v23;
            end;
        end;
        return v15({
            positionX = l_v21_0, 
            positionY = l_v22_0
        }, function(v40) --[[ Line: 208 ]]
            -- upvalues: v6 (ref), v2 (ref), v30 (copy), v8 (ref), v19 (ref), v19 (ref), v29 (copy), v32 (copy), v34 (copy), v37 (ref), l_StatusIndicator_0 (ref), v11 (ref), v16 (ref), v10 (ref)
            return v6(function(v41) --[[ Line: 209 ]]
                -- upvalues: v2 (ref), v30 (ref), v8 (ref), v40 (copy), v19 (ref), v19 (ref), v29 (ref), v32 (ref), v34 (ref), v37 (ref), l_StatusIndicator_0 (ref), v11 (ref), v16 (ref), v10 (ref)
                local l_Theme_0 = v41.Theme;
                return v2.createElement(v30.iconImageComponent or v8.Label, {
                    Position = UDim2.fromOffset(math.floor(v40.positionX + 0.5), (math.floor(v40.positionY + 0.5))), 
                    Size = UDim2.fromOffset(v19, v19), 
                    BackgroundTransparency = v29.props.buttonStroke and 0.99 or 1, 
                    Image = v32 and v30.iconOn or v30.iconOff, 
                    ImageColor3 = l_Theme_0.IconDefault.Color, 
                    ImageTransparency = v34 and 0.5 or 0
                }, {
                    Badge = v37 and v2.createElement(l_StatusIndicator_0, {
                        position = if v30.badgeValue == v11.isEmpty then UDim2.fromOffset(22, 2) else UDim2.fromOffset(18, -2), 
                        value = tonumber(v30.badgeValue), 
                        variant = v16(v10.Default), 
                        max = tonumber(v30.badgeValue) and 99 or nil
                    }), 
                    UICorner = v29.props.roundCorners and v2.createElement("UICorner", {
                        CornerRadius = UDim.new(0.15, 0)
                    }) or nil, 
                    UIStroke = v29.props.buttonStroke and v2.createElement("UIStroke", {
                        Color = Color3.new(0.4, 0.4, 0.4), 
                        Transparency = 0, 
                        Thickness = 1
                    }) or nil
                });
            end);
        end, v18), {
            LayoutOrder = v33
        };
    end;
end;
v27.renderPortrait = function(v43, v44, v45) --[[ Line: 244 ]] --[[ Name: renderPortrait ]]
    -- upvalues: v15 (copy), v2 (copy), v4 (copy), v20 (copy), v18 (copy)
    return v15({
        offset = v43.props.hidden and 0 or -v43.props.experimentalTabSizePortraitY
    }, function(v46) --[[ Line: 247 ]]
        -- upvalues: v2 (ref), v4 (ref), v44 (copy), v43 (copy), v20 (ref), v45 (copy)
        return v2.createElement("Frame", v4.Dictionary.join(v44, {
            Position = UDim2.new(0, 0, 1, (math.floor(v46.offset + 0.5))), 
            Size = UDim2.new(1, 0, 0, v43.props.experimentalTabSizePortraitY), 
            ZIndex = 99
        }), {
            Layout = v2.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            InnerFrame = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            }, v4.Dictionary.join({
                Constraint = v2.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(600, v43.props.experimentalTabSizePortraitY)
                }), 
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = v43.props.layoutPaddingOffset + UDim.new(1 / #v43.props.itemList, -v20), 
                    SortOrder = v43.props.sortOrder
                }, {})
            }, v45))
        });
    end, v18);
end;
v27.renderLandscape = function(v47, v48, v49, v50) --[[ Line: 283 ]] --[[ Name: renderLandscape ]]
    -- upvalues: v15 (copy), v2 (copy), v4 (copy), v25 (copy), v26 (copy), v18 (copy)
    return v15({
        offset = v47.props.hidden and -64 or 0
    }, function(v51) --[[ Line: 286 ]]
        -- upvalues: v2 (ref), v4 (ref), v48 (copy), v50 (copy), v47 (copy), v25 (ref), v26 (ref), v49 (copy)
        return v2.createElement("Frame", v4.Dictionary.join(v48, {
            Position = UDim2.new(0, math.floor(v51.offset + 0.5), 0, 0), 
            Size = UDim2.new(0, 64, 1, 0), 
            ZIndex = 99, 
            BackgroundTransparency = v50 and 1 or nil
        }), v4.Dictionary.join({
            Padding = v2.createElement("UIPadding", {
                PaddingTop = if not v50 then v47.props.firstItemPaddingOffset + UDim.new(0, v25) else nil, 
                PaddingBottom = if v50 then v47.props.lastItemPaddingOffset + UDim.new(0, v26) else nil
            }), 
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = if v50 then Enum.VerticalAlignment.Bottom else nil, 
                Padding = v47.props.layoutPaddingOffset + UDim.new(0, v26), 
                SortOrder = v47.props.sortOrder
            })
        }, v49));
    end, v18);
end;
v27.renderBackground = function(v52, v53, v54) --[[ Line: 316 ]] --[[ Name: renderBackground ]]
    -- upvalues: v4 (copy), v2 (copy)
    if v52:isPortrait() then
        return v52:renderPortrait(v53, v54);
    else
        local v57 = v4.List.filter(v54, function(_, v56) --[[ Line: 320 ]]
            -- upvalues: v52 (copy)
            return not v52.props.itemList[v56].bottomAligned;
        end);
        local v60 = v4.List.filter(v54, function(_, v59) --[[ Line: 323 ]]
            -- upvalues: v52 (copy)
            return v52.props.itemList[v59].bottomAligned;
        end);
        local v61 = v52:renderLandscape(v53, v57);
        if #v60 > 0 then
            v61 = v2.createFragment({
                NavBar = v61, 
                BottomAlignedNavBar = v52:renderLandscape(v53, v60, true)
            });
        end;
        return v61;
    end;
end;
v27.renderSafeArea = function(v62) --[[ Line: 337 ]] --[[ Name: renderSafeArea ]]
    -- upvalues: v2 (copy)
    local v63 = nil;
    local v64 = nil;
    if v62.props.hidden then
        v63 = UDim2.new(0, 0, 0, 0);
        v64 = UDim2.new(1, 0, 1, 0);
    elseif v62:isPortrait() then
        v63 = UDim2.new(0, 0, 0, 0);
        v64 = UDim2.new(1, 0, 1, -v62.props.experimentalTabSizePortraitY);
    else
        v63 = UDim2.new(0, 64, 0, 0);
        v64 = UDim2.new(1, -64, 1, 0);
    end;
    return v2.createElement("Frame", {
        Position = v63, 
        Size = v64, 
        BackgroundTransparency = 1, 
        [v2.Change.AbsoluteSize] = v62.onSafeAreaEvent, 
        [v2.Change.AbsolutePosition] = v62.onSafeAreaEvent
    }, v62.props[v2.Children]);
end;
v27.renderList = function(v65, v66, v67) --[[ Line: 358 ]] --[[ Name: renderList ]]
    -- upvalues: v6 (copy), v4 (copy), v2 (copy)
    return v6(function(v68) --[[ Line: 359 ]]
        -- upvalues: v4 (ref), v66 (copy), v67 (copy), v2 (ref), v65 (copy)
        local l_Theme_1 = v68.Theme;
        local v72 = v4.List.map(v66, function(_, v71) --[[ Line: 361 ]]
            -- upvalues: v67 (ref)
            return v67(v71);
        end);
        return v2.createElement("Frame", {
            Position = v65.props.position or UDim2.new(0, 0, 0, 0), 
            Size = v65.props.size or UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = Color3.new(0, 0, 0), 
            ClipsDescendants = v65.props.clipsDescendants, 
            LayoutOrder = v65.props.layoutOrder, 
            BackgroundTransparency = v65.props.bgTransparency or 1, 
            [v2.Change.AbsoluteSize] = function(v73) --[[ Line: 371 ]]
                -- upvalues: v65 (ref)
                if v65.state.portrait and v73.AbsoluteSize.X > v73.AbsoluteSize.Y then
                    v65:setState({
                        portrait = false
                    });
                    return;
                else
                    if not v65.state.portrait and v73.AbsoluteSize.X < v73.AbsoluteSize.Y then
                        v65:setState({
                            portrait = true
                        });
                    end;
                    return;
                end;
            end
        }, {
            NavBar = v65:renderBackground({
                BackgroundColor3 = l_Theme_1.NavigationBar.Color, 
                BackgroundTransparency = v65.props.roundCorners and 1 or l_Theme_1.NavigationBar.Transparency, 
                BorderSizePixel = 0
            }, v72), 
            SafeArea = v65:renderSafeArea()
        }, {
            UICorner = v65.props.roundCorners and v2.createElement("UICorner", {
                CornerRadius = UDim.new(0.15, 0) or nil
            }) or nil
        });
    end);
end;
v27.init = function(v74) --[[ Line: 397 ]] --[[ Name: init ]]
    v74:setState({
        portrait = true
    });
    v74.onSelectionChanged = function(v75) --[[ Line: 401 ]]
        -- upvalues: v74 (copy)
        if #v75 > 0 then
            local v76 = v74.props.itemList[v75[1]];
            if v76 and v76.onActivated then
                v76.onActivated();
            end;
        end;
    end;
    v74.onSafeAreaEvent = function(v77) --[[ Line: 409 ]]
        -- upvalues: v74 (copy)
        if v74.props.onSafeAreaChanged then
            v74.props.onSafeAreaChanged({
                Position = v77.Position, 
                AbsolutePosition = v77.AbsolutePosition, 
                Size = v77.Size, 
                AbsoluteSize = v77.AbsoluteSize
            });
        end;
    end;
end;
v27.render = function(v78) --[[ Line: 421 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v14 (copy), v20 (copy), v20 (copy)
    local l_itemList_0 = v78.props.itemList;
    local l_selection_0 = v78.props.selection;
    if l_selection_0 then
        l_selection_0 = if l_itemList_0[l_selection_0] == nil then nil else {
            l_selection_0
        };
    end;
    return v2.createElement(v14, {
        itemList = l_itemList_0, 
        selection = l_selection_0, 
        itemSize = UDim2.fromOffset(v20, v20), 
        renderList = function(...) --[[ Line: 437 ]] --[[ Name: renderList ]]
            -- upvalues: v78 (copy)
            return v78:renderList(...);
        end, 
        renderItem = function(...) --[[ Line: 440 ]] --[[ Name: renderItem ]]
            -- upvalues: v78 (copy)
            return v78:renderItem(...);
        end, 
        sortOrder = v78.props.sortOrder, 
        onSelectionChanged = v78.onSelectionChanged
    });
end;
return v27;