local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local v1 = require(l_Parent_0.Roact);
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local v3 = v1.PureComponent:extend("GridView");
v3.defaultProps = {
    items = {}, 
    cellPaddingOffset = Vector2.new(0, 0), 
    windowAbsoluteSize = Vector2.new(1, 1), 
    itemAbsoluteSize = Vector2.new(1, 1), 
    horizontalAlignment = Enum.HorizontalAlignment.Center, 
    onItemsPerRowChanged = nil
};
v3.init = function(v4) --[[ Line: 17 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), l_memoize_0 (copy)
    v4.state = {
        itemsPerRow = 0, 
        itemWindowStart = 1
    };
    v4.containerRef = v1.createRef();
    v4.isMounted = false;
    v4.itemsPerRow = 0;
    v4.itemWindowStart = 1;
    v4.getTotalRowsAndHeight = l_memoize_0(function(v5, v6, v7, v8, v9) --[[ Line: 33 ]]
        local v10 = 0;
        if v5 > 0 then
            v10 = math.ceil(v6 / v5);
        end;
        if v7 ~= nil then
            v10 = math.min(v10, v7);
        end;
        return v10, (math.max(0, v9.Y * v10 + v8.Y * (v10 - 1)));
    end);
    v4.getWindowHeight = function() --[[ Line: 55 ]]
        -- upvalues: v4 (copy)
        local l_windowAbsoluteSize_0 = v4.props.windowAbsoluteSize;
        local l_screenSize_0 = v4.props.screenSize;
        if l_screenSize_0 then
            return l_screenSize_0.Y;
        else
            return l_windowAbsoluteSize_0.Y;
        end;
    end;
    v4.updateItemWindowBounds = function(v13) --[[ Line: 68 ]]
        -- upvalues: v4 (copy)
        local l_current_0 = v4.containerRef.current;
        if not l_current_0 then
            return;
        else
            local l_Y_0 = l_current_0.AbsolutePosition.Y;
            local l_windowAbsoluteSize_1 = v4.props.windowAbsoluteSize;
            local l_cellPaddingOffset_0 = v4.props.cellPaddingOffset;
            local v18 = -l_Y_0;
            local l_itemAbsoluteSize_0 = v4.props.itemAbsoluteSize;
            local v20 = math.floor((l_windowAbsoluteSize_1.X + l_cellPaddingOffset_0.X) / (l_itemAbsoluteSize_0.X + l_cellPaddingOffset_0.X));
            local v21 = math.max(0, (math.floor(v18 / (l_itemAbsoluteSize_0.Y + l_cellPaddingOffset_0.Y))));
            if v20 > 0 then
                local v22, v23 = v4.getTotalRowsAndHeight(v20, #v4.props.items, v4.props.numberOfRowsToShow, l_cellPaddingOffset_0, l_itemAbsoluteSize_0);
                v21 = if not (v4.getWindowHeight() >= l_Y_0) or l_Y_0 + v23 < 0 then v22 else math.min(v21, v22);
            end;
            local v24 = math.max(1, v21 * v20 + 1);
            local v25 = true;
            if v20 == v4.itemsPerRow then
                v25 = v24 ~= v4.itemWindowStart;
            end;
            if v4.props.onItemsPerRowChanged and v20 ~= v4.itemsPerRow then
                v4.props.onItemsPerRowChanged(v20);
            end;
            v4.itemsPerRow = v20;
            v4.itemWindowStart = v24;
            if v25 and v4.isMounted then
                if v13 then
                    spawn(function() --[[ Line: 130 ]]
                        -- upvalues: v4 (ref)
                        if v4.isMounted then
                            v4:setState({
                                itemsPerRow = v4.itemsPerRow, 
                                itemWindowStart = v4.itemWindowStart
                            });
                        end;
                    end);
                    return;
                else
                    v4:setState({
                        itemsPerRow = v4.itemsPerRow, 
                        itemWindowStart = v4.itemWindowStart
                    });
                end;
            end;
            return;
        end;
    end;
end;
v3.render = function(v26) --[[ Line: 149 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local l_layoutOrder_0 = v26.props.layoutOrder;
    local l_items_0 = v26.props.items;
    local l_renderItem_0 = v26.props.renderItem;
    local l_cellPaddingOffset_1 = v26.props.cellPaddingOffset;
    local l_numberOfRowsToShow_0 = v26.props.numberOfRowsToShow;
    local l_itemAbsoluteSize_1 = v26.props.itemAbsoluteSize;
    local l_horizontalAlignment_0 = v26.props.horizontalAlignment;
    local l_itemsPerRow_0 = v26.state.itemsPerRow;
    local l_itemWindowStart_0 = v26.state.itemWindowStart;
    local v36 = #l_items_0;
    local v37, v38 = v26.getTotalRowsAndHeight(l_itemsPerRow_0, v36, l_numberOfRowsToShow_0, l_cellPaddingOffset_1, l_itemAbsoluteSize_1);
    local v39 = (math.ceil(v26.getWindowHeight() / (l_itemAbsoluteSize_1.Y + l_cellPaddingOffset_1.Y)) + 1) * l_itemsPerRow_0;
    local v40 = math.min(v36, v37 * l_itemsPerRow_0, l_itemWindowStart_0 + v39 - 1);
    local v41 = math.min((l_itemWindowStart_0 - 1) / l_itemsPerRow_0 * (l_itemAbsoluteSize_1.Y + l_cellPaddingOffset_1.Y), v38);
    local v42 = nil;
    if typeof(l_renderItem_0) == "function" then
        v42 = {
            Layout = v1.createElement("UIGridLayout", {
                CellPadding = UDim2.new(0, l_cellPaddingOffset_1.X, 0, l_cellPaddingOffset_1.Y), 
                CellSize = UDim2.new(0, l_itemAbsoluteSize_1.X, 0, l_itemAbsoluteSize_1.Y), 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = l_horizontalAlignment_0, 
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        };
        if l_itemWindowStart_0 > 0 then
            for v43 = l_itemWindowStart_0, v40 do
                local v44 = l_items_0[v43];
                v42[v43 % v39] = l_renderItem_0(v44, l_itemAbsoluteSize_1, v43, if l_itemsPerRow_0 > 0 then math.ceil(v43 / l_itemsPerRow_0) else -1);
            end;
        end;
    end;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v38), 
        LayoutOrder = l_layoutOrder_0, 
        BackgroundTransparency = 1, 
        [v1.Ref] = v26.containerRef, 
        [v1.Change.AbsolutePosition] = function() --[[ Line: 204 ]]
            -- upvalues: v26 (copy)
            v26.updateItemWindowBounds(true);
        end
    }, {
        Padding = v1.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v41)
        }), 
        Content = v42 and v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, v42)
    });
end;
v3.didMount = function(v45) --[[ Line: 218 ]] --[[ Name: didMount ]]
    v45.isMounted = true;
    v45.updateItemWindowBounds(false);
end;
v3.willUnmount = function(v46) --[[ Line: 223 ]] --[[ Name: willUnmount ]]
    v46.isMounted = false;
end;
v3.didUpdate = function(v47, v48, _) --[[ Line: 227 ]] --[[ Name: didUpdate ]]
    local v50 = true;
    if v47.props.windowAbsoluteSize == v48.windowAbsoluteSize then
        v50 = true;
        if v47.props.itemAbsoluteSize == v48.itemAbsoluteSize then
            v50 = true;
            if v47.props.cellPaddingOffset == v48.cellPaddingOffset then
                v50 = v47.props.screenSize and v47.props.screenSize ~= v48.screenSize;
            end;
        end;
    end;
    if v50 then
        v47.updateItemWindowBounds(false);
    end;
end;
return v3;