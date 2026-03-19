local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local v3 = require(script.Parent.FlatList);
local l_useFocusNavigationScrolling_0 = require(script.Parent.Hooks).useFocusNavigationScrolling;
return function(v5) --[[ Line: 38 ]] --[[ Name: AnimatedFlatList ]]
    -- upvalues: v1 (copy), l_useFocusNavigationScrolling_0 (copy), l_Object_0 (copy), v3 (copy)
    local v6 = v1.useRef(nil);
    local v7, v8 = l_useFocusNavigationScrolling_0({
        listRef = v5.listRef or v6, 
        onSelectedIndexChanged = v5.onSelectedIndexChanged, 
        initialIndex = v5.initialScrollIndex, 
        cellRendererKey = v5.cellRendererKey, 
        viewOffset = v5.viewOffset, 
        animated = v5.animated, 
        data = v5.data
    });
    local v9 = l_Object_0.assign(table.clone(v5), {
        viewOffset = l_Object_0.None, 
        animated = l_Object_0.None, 
        onSelectedIndexChanged = l_Object_0.None, 
        ref = v5.listRef or v6, 
        onScrollToIndexFailed = if v5.getItemLayout then nil else v8, 
        onSelectionChanged = v7
    });
    return v1.createElement(v3, v9);
end;