local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Core_0 = l_Parent_1.Core;
local v4 = require(l_Parent_2.React);
local v5 = require(l_Parent_2.t);
local v6 = require(l_Parent_2.Otter);
local v7 = require(l_Parent_2.Cryo);
local v8 = require(l_Parent_2.RoactGamepad);
local l_Focusable_0 = v8.Focusable;
local v10 = require(script.Parent.TileSlot);
local v11 = require(l_Core_0.Style.useStyle);
local v12 = require(l_Parent_0.SelectionImage.CursorKind);
local v13 = require(l_Parent_0.SelectionImage.useSelectionCursor);
local v14 = {
    dampingRatio = 1, 
    frequency = 10
};
local v15 = v5.strictInterface({
    displayText = v5.optional(v5.string), 
    thumbnail = v5.optional(v5.string), 
    isDisabled = v5.optional(v5.boolean), 
    isLoading = v5.optional(v5.boolean)
});
local v16 = v5.strictInterface({
    slots = v5.array(v15), 
    defaultSelectedSlotIndex = v5.optional(v5.integer), 
    onChange = v5.callback, 
    width = v5.optional(v5.integer), 
    darken = v5.optional(v5.boolean), 
    onInputBegan = v5.optional(v5.callback), 
    onInputEnded = v5.optional(v5.callback), 
    scrollingFrameRef = v5.optional(v5.table), 
    onFocusChanged = v5.optional(v5.callback), 
    inputBindings = v5.optional(v5.table), 
    NextSelectionLeft = v5.optional(v5.table), 
    NextSelectionRight = v5.optional(v5.table), 
    NextSelectionUp = v5.optional(v5.table), 
    NextSelectionDown = v5.optional(v5.table), 
    isRoactGamepadEnabled = v5.optional(v5.boolean)
});
local function v22(v17, v18) --[[ Line: 117 ]] --[[ Name: useScrollingFrameMotor ]]
    -- upvalues: v4 (copy), v6 (copy)
    local v19 = v4.useRef(nil);
    if v19.current == nil then
        v19.current = v6.createSingleMotor(v18 or 0);
    end;
    local l_current_0 = v19.current;
    v4.useEffect(function() --[[ Line: 123 ]]
        -- upvalues: l_current_0 (copy), v17 (copy)
        l_current_0:onStep(function(v21) --[[ Line: 124 ]]
            -- upvalues: v17 (ref)
            if v17.current ~= nil then
                v17.current.CanvasPosition = Vector2.new(v21, 0);
            end;
        end);
        return function() --[[ Line: 130 ]]
            -- upvalues: l_current_0 (ref)
            l_current_0:destroy();
        end;
    end, {});
    return l_current_0;
end;
return function(v23) --[[ Line: 138 ]] --[[ Name: SlotTray ]]
    -- upvalues: v4 (copy), v8 (copy), v22 (copy), v6 (copy), v14 (copy), v11 (copy), v13 (copy), v12 (copy), v16 (copy), v7 (copy), l_Focusable_0 (copy), v10 (copy)
    local v24 = v23.isRoactGamepadEnabled == nil or v23.isRoactGamepadEnabled;
    local v25 = v4.useRef({});
    local v26 = if v24 then v8.useRefCache() else v25.current;
    local v27 = v4.useRef(nil);
    if v23.scrollingFrameRef then
        v27 = v23.scrollingFrameRef;
    end;
    local v28 = v23.width or 360;
    local v29 = v22(v27, 0);
    local v30, v31 = v4.useState(v23.defaultSelectedSlotIndex or 1);
    v4.useEffect(function() --[[ Line: 155 ]]
        -- upvalues: v27 (ref), v30 (copy), v26 (copy), v28 (copy), v29 (copy), v6 (ref), v14 (ref)
        local l_current_1 = v27.current;
        if v30 == 0 or not l_current_1 then
            return;
        else
            local v33 = v26[v30] and v26[v30].current;
            if not v33 then
                return;
            else
                local l_X_0 = l_current_1.CanvasPosition.X;
                local l_X_1 = l_current_1.AbsolutePosition.X;
                local v36 = l_X_1 + v28;
                local l_X_2 = v33.AbsolutePosition.X;
                local v38 = l_X_2 + 48 + 24 - v36;
                local v39 = l_X_2 - 24 - l_X_1;
                local v40 = l_X_0 + v38;
                local v41 = l_X_0 + v39;
                if l_X_0 < v40 then
                    v29:setGoal(v6.spring(v40, v14));
                    return;
                else
                    if v41 < l_X_0 then
                        v29:setGoal(v6.spring(v41, v14));
                    end;
                    return;
                end;
            end;
        end;
    end, {
        v30, 
        v28, 
        v26, 
        v27, 
        v29
    });
    local v43 = v4.useCallback(function(v42) --[[ Line: 187 ]]
        -- upvalues: v31 (copy), v23 (copy)
        v31(v42);
        v23.onChange(v42);
    end, {
        v23.onChange
    });
    local v44 = #v23.slots * 48 + (#v23.slots - 1) * 12 + 48;
    local v45 = v11();
    local v46 = v13(v12.RoundedSlot);
    assert(v16(v23));
    local l_Theme_0 = v45.Theme;
    local v50 = v7.List.map(v23.slots, function(v48, v49) --[[ Line: 200 ]]
        -- upvalues: v24 (copy), v26 (copy), v4 (ref), l_Focusable_0 (ref), v23 (copy), v43 (copy), v46 (copy), v10 (ref), v30 (copy)
        if not v24 then
            v26[v49] = v26[v49] or v4.createRef();
        end;
        return v4.createElement(if v24 then l_Focusable_0.Frame else "Frame", {
            key = "Slot" .. tostring(v49), 
            LayoutOrder = v49, 
            Size = UDim2.fromOffset(48, 48), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 2, 
            ref = v26[v49], 
            NextSelectionRight = v49 < #v23.slots and v26[v49 + 1] or nil, 
            NextSelectionLeft = v49 > 1 and v26[v49 - 1] or nil, 
            onFocusGained = v24 and function() --[[ Line: 215 ]]
                -- upvalues: v43 (ref), v49 (copy)
                v43(v49);
            end or nil, 
            SelectionImageObject = v46
        }, {
            Slot = v4.createElement(v10, {
                isSelected = v30 == v49, 
                displayText = v48.displayText, 
                thumbnail = v48.thumbnail, 
                isLoading = v48.isLoading, 
                isDisabled = v48.isDisabled, 
                index = v49, 
                onActivated = v43
            })
        });
    end);
    table.insert(v50, (v4.createElement("UIListLayout", {
        key = "Layout", 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        FillDirection = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Padding = UDim.new(0, 12)
    })));
    return v4.createElement(if v24 then l_Focusable_0.ScrollingFrame else "ScrollingFrame", {
        Size = UDim2.fromOffset(v28, 72), 
        CanvasSize = UDim2.new(0, v44, 0, 72), 
        BackgroundTransparency = 1, 
        ScrollBarImageColor3 = l_Theme_0.PlaceHolder.Color, 
        ScrollBarImageTransparency = l_Theme_0.PlaceHolder.Transparency, 
        ScrollBarThickness = 0, 
        BorderSizePixel = 0, 
        ClipsDescendants = true, 
        ElasticBehavior = Enum.ElasticBehavior.Always, 
        ScrollingDirection = Enum.ScrollingDirection.X, 
        ref = v27, 
        [v4.Event.InputBegan] = v23.onInputBegan, 
        [v4.Event.InputEnded] = v23.onInputEnded, 
        onFocusChanged = if v24 then v23.onFocusChanged else nil, 
        inputBindings = if v24 then v23.inputBindings else nil, 
        NextSelectionDown = v23.NextSelectionDown, 
        NextSelectionUp = v23.NextSelectionUp, 
        NextSelectionLeft = v23.NextSelectionLeft, 
        NextSelectionRight = v23.NextSelectionRight, 
        defaultChild = if v24 then v26[1] else nil, 
        restorePreviousChildFocus = v24 and true or nil
    }, {
        SlotContainer = v4.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = if v23.darken then l_Theme_0.Overlay.Color else l_Theme_0.PlaceHolder.Color, 
            BackgroundTransparency = if v23.darken then l_Theme_0.Overlay.Transparency else l_Theme_0.PlaceHolder.Transparency
        }, v50)
    });
end;