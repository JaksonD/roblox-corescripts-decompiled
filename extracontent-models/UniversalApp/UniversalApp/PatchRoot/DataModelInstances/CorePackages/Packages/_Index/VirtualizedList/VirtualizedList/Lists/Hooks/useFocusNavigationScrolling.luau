local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local _ = require(script.Parent.Parent.FlatList);
return function(v3) --[[ Line: 40 ]] --[[ Name: useFocusNavigationScrolling ]]
    -- upvalues: v1 (copy)
    local v4 = if v3.cellRendererKey then v3.cellRendererKey else "CellRendererView";
    local v5 = if v3.initialIndex then v3.initialIndex else 1;
    local l_listRef_0 = v3.listRef;
    local l_onSelectedIndexChanged_0 = v3.onSelectedIndexChanged;
    local l_viewOffset_0 = v3.viewOffset;
    local v9 = v3.animated == nil or v3.animated;
    local v10 = v1.useRef(v5);
    local l_data_0 = v3.data;
    local v14 = v1.useCallback(function(v12) --[[ Line: 50 ]]
        -- upvalues: l_listRef_0 (copy)
        local v13 = v12.index * v12.averageItemLength;
        if l_listRef_0 and l_listRef_0.current then
            l_listRef_0.current:scrollToOffset({
                offset = v13
            });
            return;
        else
            warn("Animated scrolling failed, the ref to the ScrollView is nil.This could indicate that you are selecting focus before the ScrollView has mounted.");
            return;
        end;
    end, {
        l_listRef_0
    });
    return v1.useCallback(function(v15, _, _, v18) --[[ Line: 64 ]]
        -- upvalues: v4 (copy), v10 (copy), l_data_0 (copy), l_onSelectedIndexChanged_0 (copy), l_listRef_0 (copy), v9 (copy), l_viewOffset_0 (copy)
        if v18 and v18:IsDescendantOf(v15) then
            local l_v18_FirstAncestor_0 = v18:FindFirstAncestor(v4);
            if not l_v18_FirstAncestor_0 or not l_v18_FirstAncestor_0.LayoutOrder then
                return nil;
            elseif l_v18_FirstAncestor_0.LayoutOrder == v10.current or l_v18_FirstAncestor_0.LayoutOrder > #l_data_0 or l_v18_FirstAncestor_0.LayoutOrder < 1 then
                return nil;
            else
                v10.current = l_v18_FirstAncestor_0.LayoutOrder;
                if l_onSelectedIndexChanged_0 then
                    l_onSelectedIndexChanged_0(v10.current);
                end;
                if not l_listRef_0 or not l_listRef_0.current then
                    return nil;
                else
                    l_listRef_0.current:scrollToIndex({
                        index = v10.current, 
                        animated = v9, 
                        viewOffset = l_viewOffset_0
                    });
                end;
            end;
        end;
        return nil;
    end, {
        l_listRef_0, 
        v10, 
        v4, 
        l_onSelectedIndexChanged_0, 
        v9, 
        l_viewOffset_0, 
        l_data_0
    }), v14;
end;