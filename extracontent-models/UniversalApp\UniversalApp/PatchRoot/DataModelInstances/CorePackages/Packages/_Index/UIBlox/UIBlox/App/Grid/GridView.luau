local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.RoactGamepad);
local v3 = require(l_Parent_0.Utility.isCallable);
local v4 = require(l_Parent_0.UIBloxConfig);
local v5 = require(l_Parent_1.Roact);
local v6 = require(l_Parent_1.Cryo);
local v7 = require(l_Parent_1.t);
local v8 = require(l_Parent_0.Utility.isPositiveVector2);
local v9 = v5.PureComponent:extend("GridView");
v9.validateProps = v7.strictInterface({
    renderItem = v3, 
    itemSize = v8, 
    itemPadding = v7.Vector2, 
    items = v7.table, 
    maxHeight = v7.numberMin(0), 
    windowHeight = v7.optional(v7.numberMin(0)), 
    LayoutOrder = v7.optional(v7.integer), 
    onWidthChanged = v7.optional(v3), 
    onNumItemsPerRowChanged = v7.optional(v3), 
    NextSelectionLeft = v7.optional(v7.table), 
    NextSelectionRight = v7.optional(v7.table), 
    NextSelectionUp = v7.optional(v7.table), 
    NextSelectionDown = v7.optional(v7.table), 
    frameRef = v7.optional(v7.table), 
    restorePreviousChildFocus = v7.optional(v7.boolean), 
    onFocusGained = v7.optional(v7.callback), 
    defaultChildIndex = v7.optional(v7.numberMin(1)), 
    isRoactGamepadEnabled = v7.optional(v7.boolean)
});
v9.itemsAreVisible = function(v10) --[[ Line: 60 ]] --[[ Name: itemsAreVisible ]]
    return v10.state.isInDataModel and v10.state.containerWidth ~= 0 and v10.props.itemSize.X ~= 0;
end;
v9.defaultProps = {
    maxHeight = 1e999, 
    restorePreviousChildFocus = true, 
    isRoactGamepadEnabled = true
};
v9.init = function(v11) --[[ Line: 74 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), v2 (copy)
    v11.currentItemsPerRow = -1;
    v11.frameRef = v5.createRef();
    v11.isMounted = false;
    v11.state = {
        containerWidth = 0, 
        containerYPosition = 0, 
        isInDataModel = false
    };
    v11.focusableRefs = v11.props.isRoactGamepadEnabled and v2.createRefCache() or {};
    v11.onAncestryChanged = function(v12) --[[ Line: 87 ]]
        -- upvalues: v11 (copy)
        if v12:IsDescendantOf(game) then
            v11:setState(function(v13) --[[ Line: 89 ]]
                -- upvalues: v12 (copy)
                if not v13.isInDataModel or v13.containerWidth ~= v12.AbsoluteSize.X then
                    return {
                        isInDataModel = true, 
                        containerWidth = v12.AbsoluteSize.X
                    };
                else
                    return nil;
                end;
            end);
        end;
    end;
end;
v9.render = function(v14) --[[ Line: 102 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v2 (copy), v4 (copy)
    local l_items_0 = v14.props.items;
    local v16 = #l_items_0;
    local l_itemSize_0 = v14.props.itemSize;
    local l_itemPadding_0 = v14.props.itemPadding;
    local l_maxHeight_0 = v14.props.maxHeight;
    local l_containerWidth_0 = v14.state.containerWidth;
    local l_containerYPosition_0 = v14.state.containerYPosition;
    local l_defaultChildIndex_0 = v14.props.defaultChildIndex;
    local l_onNumItemsPerRowChanged_0 = v14.props.onNumItemsPerRowChanged;
    local v24 = 1;
    local l_v16_0 = v16;
    local v26 = {};
    local v27 = 0;
    local v28 = 0;
    local v29 = nil;
    local v30 = nil;
    local v31 = math.max(1, l_itemSize_0.X + l_itemPadding_0.X);
    local v32 = math.max(1, l_itemSize_0.Y + l_itemPadding_0.Y);
    v29 = math.floor((l_containerWidth_0 + l_itemPadding_0.X) / v31);
    v30 = math.floor((l_maxHeight_0 + l_itemPadding_0.Y) / v32);
    if v29 ~= v14.currentItemsPerRow then
        v14.currentItemsPerRow = v29;
        if l_onNumItemsPerRowChanged_0 then
            l_onNumItemsPerRowChanged_0(v29);
        end;
    end;
    local v33 = math.min(v30, (math.ceil(v16 / v29)));
    local v34 = v33 * l_itemSize_0.Y + math.max(v33 - 1, 0) * l_itemPadding_0.Y;
    if v14.props.windowHeight ~= nil then
        local v35 = math.floor((v14.props.windowHeight + l_itemPadding_0.Y) / (l_itemSize_0.Y + l_itemPadding_0.Y)) + 2;
        local v36 = math.floor((l_containerYPosition_0 + l_itemPadding_0.Y) / (l_itemSize_0.Y + l_itemPadding_0.Y));
        local v37 = math.min(v33, v36 + v35) + 1;
        v24 = math.max(1, v36 * v29 + 1);
        l_v16_0 = math.min(v16, v37 * v29);
        v28 = v36 * l_itemSize_0.Y + v36 * l_itemPadding_0.Y;
    end;
    local function _(v38, v39) --[[ Line: 152 ]] --[[ Name: getItemIndexRef ]]
        -- upvalues: v29 (ref), v24 (ref), l_v16_0 (ref), v14 (copy)
        local v40 = false;
        if v38 > 0 then
            v40 = false;
            if v39 > 0 then
                v40 = v39 <= v29;
            end;
        end;
        local v41 = 1 + ((v38 - 1) * v29 + (v39 - 1));
        local v42 = false;
        if v24 <= v41 then
            v42 = v41 <= l_v16_0;
        end;
        return v42 and v40 and v14.focusableRefs[v41] or nil;
    end;
    local function v55(v44) --[[ Line: 161 ]] --[[ Name: renderItem ]]
        -- upvalues: v29 (ref), v14 (copy), v5 (ref), v2 (ref), v27 (ref), v28 (ref), l_itemSize_0 (copy), v24 (ref), l_v16_0 (ref), l_items_0 (copy), v4 (ref)
        local v45 = math.floor((v44 - 1) / v29) + 1;
        local v46 = 1 + (v44 - 1) % v29;
        local v47 = v14:itemsAreVisible();
        if not v14.props.isRoactGamepadEnabled then
            v14.focusableRefs[v44] = v14.focusableRefs[v44] or v5.createRef();
        end;
        local l_createElement_0 = v5.createElement;
        local v49 = if v14.props.isRoactGamepadEnabled then v2.Focusable.Frame else "Frame";
        local v50 = {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, v27, 0, v28), 
            Size = UDim2.new(0, l_itemSize_0.X, 0, l_itemSize_0.Y)
        };
        local v51 = v46 - 1;
        local v52 = false;
        if v45 > 0 then
            v52 = false;
            if v51 > 0 then
                v52 = v51 <= v29;
            end;
        end;
        local v53 = 1 + ((v45 - 1) * v29 + (v51 - 1));
        local v54 = false;
        if v24 <= v53 then
            v54 = v53 <= l_v16_0;
        end;
        v50.NextSelectionLeft = v54 and v52 and v14.focusableRefs[v53] or nil;
        v51 = v46 + 1;
        v52 = false;
        if v45 > 0 then
            v52 = false;
            if v51 > 0 then
                v52 = v51 <= v29;
            end;
        end;
        v53 = 1 + ((v45 - 1) * v29 + (v51 - 1));
        v54 = false;
        if v24 <= v53 then
            v54 = v53 <= l_v16_0;
        end;
        v50.NextSelectionRight = v54 and v52 and v14.focusableRefs[v53] or nil;
        v51 = v45 - 1;
        v52 = false;
        if v51 > 0 then
            v52 = false;
            if v46 > 0 then
                v52 = v46 <= v29;
            end;
        end;
        v53 = 1 + ((v51 - 1) * v29 + (v46 - 1));
        v54 = false;
        if v24 <= v53 then
            v54 = v53 <= l_v16_0;
        end;
        v50.NextSelectionUp = v54 and v52 and v14.focusableRefs[v53] or nil;
        v51 = v45 + 1;
        v52 = false;
        if v51 > 0 then
            v52 = false;
            if v46 > 0 then
                v52 = v46 <= v29;
            end;
        end;
        v53 = 1 + ((v51 - 1) * v29 + (v46 - 1));
        v54 = false;
        if v24 <= v53 then
            v54 = v53 <= l_v16_0;
        end;
        v50.NextSelectionDown = v54 and v52 and v14.focusableRefs[v53] or nil;
        v50[v5.Ref] = v14.focusableRefs[v44];
        v50.onFocusGained = if v14.props.isRoactGamepadEnabled then v14.props.onFocusGained else nil;
        return l_createElement_0(v49, v50, {
            Content = v47 and v14.props.renderItem(l_items_0[v44], v44, if v4.passRowAndColumnDataToItemInGridView then {
                row = v45, 
                column = v46
            } else nil)
        });
    end;
    if v34 < l_maxHeight_0 then
        local v56 = false;
        local v57 = l_defaultChildIndex_0 and l_defaultChildIndex_0 <= v16;
        for v58 = v24, l_v16_0 do
            if v58 == l_defaultChildIndex_0 then
                v56 = true;
            end;
            v26[tostring(v58)] = v55(v58);
            local l_X_0 = l_itemSize_0.X;
            v27 = math.floor(v27 + l_X_0 + l_itemPadding_0.X);
            if l_containerWidth_0 < v27 + l_itemSize_0.X and v58 < l_v16_0 then
                v27 = 0;
                local l_Y_0 = l_itemPadding_0.Y;
                v28 = v28 + l_Y_0 + l_itemSize_0.Y;
            end;
        end;
        if v57 and not v56 then
            v27 = (l_defaultChildIndex_0 - 1) % v29 * (l_itemSize_0.X + l_itemPadding_0.X);
            v28 = math.floor((l_defaultChildIndex_0 - 1) / v29) * (l_itemPadding_0.Y + l_itemSize_0.Y);
            v26[tostring(l_defaultChildIndex_0)] = v55(l_defaultChildIndex_0);
        end;
    end;
    return v5.createElement(if v14.props.isRoactGamepadEnabled then v2.Focusable.Frame else "Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = v14.props.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, v34), 
        [v5.Change.AbsolutePosition] = v14.props.windowHeight ~= nil and function(v61) --[[ Line: 238 ]]
            -- upvalues: v14 (copy)
            if v14.isMounted then
                v14:setState({
                    containerYPosition = -math.min(0, v61.AbsolutePosition.Y)
                });
            end;
        end or nil, 
        [v5.Change.AbsoluteSize] = function(v62) --[[ Line: 245 ]]
            -- upvalues: v14 (copy)
            if v14.isMounted then
                if v14.state.isInDataModel then
                    v14:setState({
                        containerWidth = v62.AbsoluteSize.X
                    });
                end;
                if v14.props.onWidthChanged ~= nil then
                    v14.props.onWidthChanged(v62.AbsoluteSize.X);
                end;
            end;
        end, 
        [v5.Event.AncestryChanged] = v14.onAncestryChanged, 
        [v5.Ref] = v14.props.frameRef or v14.frameRef, 
        NextSelectionLeft = v14.props.NextSelectionLeft, 
        NextSelectionRight = v14.props.NextSelectionRight, 
        NextSelectionUp = v14.props.NextSelectionUp, 
        NextSelectionDown = v14.props.NextSelectionDown, 
        defaultChild = if v14.props.isRoactGamepadEnabled and l_defaultChildIndex_0 then v14.focusableRefs[l_defaultChildIndex_0] else nil, 
        restorePreviousChildFocus = if v14.props.isRoactGamepadEnabled then v14.props.restorePreviousChildFocus else nil
    }, v26);
end;
v9.didMount = function(v63) --[[ Line: 273 ]] --[[ Name: didMount ]]
    v63.isMounted = true;
    local v64 = v63.props.frameRef or v63.frameRef;
    if v64:getValue() and v64:getValue().AbsoluteSize.X ~= 0 then
        if v64:getValue():IsDescendantOf(game) then
            v63:setState(function(_) --[[ Line: 283 ]]
                -- upvalues: v64 (copy)
                if v64:getValue() then
                    return {
                        isInDataModel = true, 
                        containerWidth = v64:getValue().AbsoluteSize.X
                    };
                else
                    return nil;
                end;
            end);
        end;
        if v63.props.onWidthChanged ~= nil then
            delay(0, function() --[[ Line: 296 ]]
                -- upvalues: v64 (copy), v63 (copy)
                if v64:getValue() then
                    v63.props.onWidthChanged(v64:getValue().AbsoluteSize.X);
                end;
            end);
        end;
    end;
end;
v9.willUnmount = function(v66) --[[ Line: 305 ]] --[[ Name: willUnmount ]]
    v66.isMounted = false;
end;
return v5.forwardRef(function(v67, v68) --[[ Line: 309 ]]
    -- upvalues: v5 (copy), v9 (copy), v6 (copy)
    return v5.createElement(v9, v6.Dictionary.join(v67, {
        frameRef = v68
    }));
end);