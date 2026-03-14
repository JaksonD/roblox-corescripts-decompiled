local l_Parent_0 = script.Parent.Parent.Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local v2 = require(l_Parent_0.React);
local l_useMemo_0 = v2.useMemo;
local l_useContext_0 = v2.useContext;
local v5 = {};
local v6 = v2.createContext(nil);
v5.VirtualizedListContext = v6;
if _G.__DEV__ then
    v6.displayName = "VirtualizedListContext";
end;
v5.VirtualizedListContextResetter = function(v7) --[[ Line: 96 ]] --[[ Name: VirtualizedListContextResetter ]]
    -- upvalues: v2 (copy), v6 (copy)
    local l_children_0 = v7.children;
    return v2.createElement(v6.Provider, {
        value = nil
    }, l_children_0);
end;
v5.VirtualizedListContextProvider = function(v9) --[[ Line: 109 ]] --[[ Name: VirtualizedListContextProvider ]]
    -- upvalues: l_useMemo_0 (copy), v2 (copy), v6 (copy)
    local l_children_1 = v9.children;
    local l_value_0 = v9.value;
    local v12 = l_useMemo_0(function() --[[ Line: 116 ]]
        -- upvalues: l_value_0 (copy)
        return {
            cellKey = nil, 
            getScrollMetrics = l_value_0.getScrollMetrics, 
            horizontal = l_value_0.horizontal, 
            getOutermostParentListRef = l_value_0.getOutermostParentListRef, 
            getNestedChildState = l_value_0.getNestedChildState, 
            registerAsNestedChild = l_value_0.registerAsNestedChild, 
            unregisterAsNestedChild = l_value_0.unregisterAsNestedChild, 
            debugInfo = {
                cellKey = l_value_0.debugInfo.cellKey, 
                horizontal = l_value_0.debugInfo.horizontal, 
                listKey = l_value_0.debugInfo.listKey, 
                parent = l_value_0.debugInfo.parent
            }
        };
    end, {
        l_value_0.getScrollMetrics, 
        l_value_0.horizontal, 
        l_value_0.getOutermostParentListRef, 
        l_value_0.getNestedChildState, 
        l_value_0.registerAsNestedChild, 
        l_value_0.unregisterAsNestedChild, 
        l_value_0.debugInfo.cellKey, 
        l_value_0.debugInfo.horizontal, 
        l_value_0.debugInfo.listKey, 
        l_value_0.debugInfo.parent
    });
    return v2.createElement(v6.Provider, {
        value = v12
    }, l_children_1);
end;
v5.VirtualizedListCellContextProvider = function(v13) --[[ Line: 156 ]] --[[ Name: VirtualizedListCellContextProvider ]]
    -- upvalues: l_useContext_0 (copy), v6 (copy), v2 (copy), l_Object_0 (copy)
    local l_cellKey_0 = v13.cellKey;
    local l_children_2 = v13.children;
    local v16 = l_useContext_0(v6);
    return v2.createElement(v6.Provider, {
        value = if v16 == nil then nil else l_Object_0.assign(table.clone(v16), {
            cellKey = l_cellKey_0
        })
    }, l_children_2);
end;
return v5;