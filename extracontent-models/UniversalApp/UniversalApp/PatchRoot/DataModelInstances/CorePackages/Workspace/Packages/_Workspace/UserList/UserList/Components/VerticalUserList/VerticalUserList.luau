local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserList");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_View_0 = require(l_Parent_0.Foundation).View;
local l_FlatList_0 = require(l_Parent_0.VirtualizedList).FlatList;
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v6 = require(l_script_FirstAncestor_0.Common.Enums);
local v7 = require(l_script_FirstAncestor_0.Hooks.useEntities);
local v8 = require(l_script_FirstAncestor_0.Hooks.useEntitySelectionHandler);
local v9 = require(l_script_FirstAncestor_0.Hooks.useRenderEntity);
local v10 = {
    BackgroundTransparency = 1, 
    ScrollBarThickness = 0, 
    BorderSizePixel = 0
};
local v11 = {
    BackgroundTransparency = 1
};
local function v14(v12, _) --[[ Line: 52 ]] --[[ Name: keyExtractor ]]
    return v12;
end;
return function(v15) --[[ Line: 56 ]] --[[ Name: VerticalUserList ]]
    -- upvalues: v7 (copy), v8 (copy), v2 (copy), v9 (copy), v6 (copy), l_View_0 (copy), l_FlatList_0 (copy), v14 (copy), v10 (copy), v11 (copy)
    local v16 = v7(v15.entities);
    local v17 = v8(v15.onRowSelected);
    local v20 = v2.useMemo(function() --[[ Line: 61 ]]
        -- upvalues: v15 (copy)
        if v15.initialRowCount and v15.initialRowCount < #v15.entities then
            local v18 = {};
            for v19 = 1, v15.initialRowCount do
                table.insert(v18, v15.entities[v19]);
            end;
            return v18;
        else
            return v15.entities;
        end;
    end, {
        v15.entities, 
        v15.initialRowCount
    });
    local v24 = v2.useMemo(function() --[[ Line: 73 ]]
        -- upvalues: v20 (copy)
        local v21 = {};
        for _, v23 in v20 do
            table.insert(v21, v23.id);
        end;
        return v21;
    end, {
        v20
    });
    local v25 = v9({
        entitiesMap = v16.entitiesMap, 
        onActivated = v17, 
        renderRow = v15.renderRow, 
        configs = v15.configs, 
        layoutMode = v6.LayoutMode.Vertical
    });
    local v27 = v2.useCallback(function(v26) --[[ Line: 90 ]]
        -- upvalues: v25 (copy)
        return v25(v26.item, v26.index);
    end, {
        v25
    });
    if #v15.entities == 0 then
        return nil;
    elseif v15.isScrollEnabled then
        return v2.createElement(l_View_0, {
            tag = "size-full-0 fill", 
            LayoutOrder = v15.layoutOrder
        }, {
            List = v2.createElement(l_FlatList_0, {
                data = v24, 
                renderItem = v27, 
                keyExtractor = v14, 
                windowSize = 3, 
                initialNumToRender = 10, 
                onEndReachedThreshold = 2, 
                style = v10, 
                contentContainerStyle = v11, 
                ListHeaderComponent = v15.ListHeaderComponent, 
                ListFooterComponent = v15.ListFooterComponent
            })
        });
    else
        return v2.createElement(l_View_0, {
            tag = "size-full-0 auto-y col gap-xxsmall", 
            LayoutOrder = v15.layoutOrder
        }, {
            EntityRows = v2.createElement(v2.Fragment, {}, unpack(v2.useMemo(function() --[[ Line: 127 ]]
                -- upvalues: v24 (copy), v2 (ref), l_View_0 (ref), v25 (copy)
                local v28 = {};
                for v29, v30 in ipairs(v24) do
                    v28[v29] = v2.createElement(l_View_0, {
                        key = v30, 
                        tag = "size-full-0 auto-y", 
                        LayoutOrder = v29
                    }, {
                        Content = v25(v30, v29)
                    });
                end;
                return v28;
            end, {
                v24, 
                v25
            })))
        });
    end;
end;