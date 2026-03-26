local l_script_FirstAncestor_0 = script:FindFirstAncestor("CollectionViews");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signals);
local v3 = require(l_Parent_0.Display);
local l_CollectionItemSize_0 = require(l_script_FirstAncestor_0.CollectionViewTypes).CollectionItemSize;
local v5 = require(script.Parent.CollectionBreakpointConfig);
local l_resolveBreakpoint_0 = v5.resolveBreakpoint;
local l_getItemsPerRow_0 = v5.getItemsPerRow;
return function(v8) --[[ Line: 20 ]] --[[ Name: createCollectionLayoutStore ]]
    -- upvalues: v3 (copy), v2 (copy), l_resolveBreakpoint_0 (copy), l_CollectionItemSize_0 (copy), l_getItemsPerRow_0 (copy)
    local l_getPlatformScale_0 = v3.GetDisplayStore(false).getPlatformScale;
    local v11 = v2.createComputed(function(v10) --[[ Line: 23 ]]
        -- upvalues: v8 (copy), l_getPlatformScale_0 (copy)
        return v8(v10) / l_getPlatformScale_0(v10);
    end);
    local v13 = v2.createComputed(function(v12) --[[ Line: 27 ]]
        -- upvalues: l_resolveBreakpoint_0 (ref), v11 (copy)
        return l_resolveBreakpoint_0(v11(v12));
    end);
    local v14 = {
        l_CollectionItemSize_0.XSmall, 
        l_CollectionItemSize_0.Small, 
        l_CollectionItemSize_0.Medium, 
        l_CollectionItemSize_0.Large, 
        l_CollectionItemSize_0.XLarge
    };
    local v15 = {};
    for _, v17 in v14 do
        v15[v17] = v2.createComputed(function(v18) --[[ Line: 41 ]]
            -- upvalues: l_getItemsPerRow_0 (ref), v13 (copy), v17 (copy)
            return l_getItemsPerRow_0(v13(v18), v17);
        end);
    end;
    local v23 = v2.createComputed(function(v19) --[[ Line: 47 ]]
        -- upvalues: v15 (copy)
        local v20 = {};
        for v21, v22 in v15 do
            v20[v21] = v22(v19);
        end;
        return v20;
    end);
    return {
        getContainerWidth = v8, 
        getDesignSpaceContainerWidth = v11, 
        getItemsPerRow = v15, 
        getNumItemsForAllCategories = v23
    };
end;