local l_script_FirstAncestor_0 = script:FindFirstAncestor("PeopleReactView");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Signals);
local v4 = require(l_Parent_0.SignalsReact);
local l_View_0 = require(l_Parent_0.Foundation).View;
local v6 = require(script.Parent.VirtualizedItem);
local _ = require(l_script_FirstAncestor_0.Stores.GetScrollingFrameStore);
local v8 = require(l_script_FirstAncestor_0.Stores.GetVirtualizedGridStore);
return v2.memo(function(v9) --[[ Line: 33 ]] --[[ Name: VirtualizedGrid ]]
    -- upvalues: v4 (copy), v8 (copy), v2 (copy), v3 (copy), v6 (copy), l_View_0 (copy)
    local v10 = v4.useSignalState(v8);
    local v11 = v4.useSignalState(v10.getNumVirtualizedItems);
    local v12 = v2.useRef(nil);
    local v13 = v2.joinBindings({
        itemWidth = v9.itemWidth, 
        itemHeight = v9.itemHeight, 
        numColumns = v9.numColumns
    });
    local v15 = v2.useMemo(function() --[[ Line: 46 ]]
        -- upvalues: v13 (copy), v9 (copy)
        return v13:map(function(v14) --[[ Line: 47 ]]
            -- upvalues: v9 (ref)
            return UDim2.new(1, 0, 0, math.ceil(v9.numItems / v14.numColumns) * (v14.itemHeight + v9.gapSize) - v9.gapSize);
        end);
    end, {
        v9.numItems, 
        v9.gapSize
    });
    v2.useEffect(function() --[[ Line: 57 ]]
        -- upvalues: v9 (copy), v12 (copy), v10 (copy), v3 (ref)
        local v16 = nil;
        local v17 = nil;
        if v9.scrollingFrameStore and v12.current then
            local function v18() --[[ Line: 63 ]] --[[ Name: handleCalculateVirtualizedGridLimits ]]
                -- upvalues: v10 (ref), v9 (ref)
                v10.calculateVirtualizedGridLimits(v9.scrollingFrameStore.getCanvasPositionY(), v9.scrollingFrameStore.getAbsoluteSizeY(), v9.itemWidth:getValue(), v9.itemHeight:getValue(), v9.numColumns:getValue(), v9.gapSize);
            end;
            if v9.onContainerWidthChanged then
                v9.onContainerWidthChanged(v12.current.AbsoluteSize.X);
            end;
            v18();
            v16 = v3.createEffect(function(v19) --[[ Line: 80 ]]
                -- upvalues: v9 (ref), v18 (copy)
                v9.scrollingFrameStore.getCanvasPositionY(v19);
                v9.scrollingFrameStore.getAbsoluteSizeY(v19);
                v18();
            end);
            v17 = v12.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 88 ]]
                -- upvalues: v9 (ref), v12 (ref), v18 (copy)
                if v9.onContainerWidthChanged then
                    v9.onContainerWidthChanged(v12.current.AbsoluteSize.X);
                end;
                v18();
            end);
        end;
        return function() --[[ Line: 97 ]]
            -- upvalues: v16 (ref), v17 (ref)
            if v16 then
                v16();
            end;
            if v17 then
                v17:Disconnect();
            end;
        end;
    end, {
        v9.onContainerWidthChanged, 
        v9.scrollingFrameStore, 
        v9.gapSize
    });
    local v20 = {};
    for v21 = 1, v11 do
        v20["VirtualizedItem_" .. v21] = v2.createElement(v6, {
            relativeIndex = v21, 
            getMinVirtualizedIndex = v10.getMinVirtualizedIndex, 
            getMaxVirtualizedIndex = v10.getMaxVirtualizedIndex, 
            itemWidth = v9.itemWidth, 
            itemHeight = v9.itemHeight, 
            numColumns = v9.numColumns, 
            gapSize = v9.gapSize, 
            getElement = v9.getElement
        });
    end;
    return v2.createElement(l_View_0, {
        Size = v15, 
        LayoutOrder = v9.layoutOrder, 
        ref = v12
    }, v20);
end);