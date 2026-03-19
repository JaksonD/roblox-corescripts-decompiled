local l_script_FirstAncestor_0 = script:FindFirstAncestor("CollectionViews");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signals);
local v3 = require(l_Parent_0.Display);
local v4 = require(script.Parent.CollectionItemBreakpoint);
local l_CollectionItemSize_0 = require(l_script_FirstAncestor_0.CollectionViewTypes).CollectionItemSize;
local v6 = require(script.Parent.getItemsPerRow);
local v7 = {
    {
        breakpoint = v4.XSmall, 
        maxWidth = 499
    }, 
    {
        breakpoint = v4.Small, 
        maxWidth = 600
    }, 
    {
        breakpoint = v4.Medium, 
        maxWidth = 799
    }, 
    {
        breakpoint = v4.MediumWide, 
        maxWidth = 1140
    }, 
    {
        breakpoint = v4.Large, 
        maxWidth = 1520
    }, 
    {
        breakpoint = v4.XLarge, 
        maxWidth = 1919
    }
};
local _ = function(v8) --[[ Line: 27 ]] --[[ Name: resolveCollectionItemBreakpoint ]]
    -- upvalues: v7 (copy), v4 (copy)
    for _, v10 in v7 do
        if v8 <= v10.maxWidth then
            return v10.breakpoint;
        end;
    end;
    return v4.XXLarge;
end;
return function(v12) --[[ Line: 40 ]] --[[ Name: createCollectionLayoutStore ]]
    -- upvalues: v3 (copy), v2 (copy), v7 (copy), v4 (copy), l_CollectionItemSize_0 (copy), v6 (copy)
    local l_getPlatformScale_0 = v3.GetDisplayStore(false).getPlatformScale;
    local v15 = v2.createComputed(function(v14) --[[ Line: 43 ]]
        -- upvalues: v12 (copy), l_getPlatformScale_0 (copy)
        return v12(v14) / l_getPlatformScale_0(v14);
    end);
    local v20 = v2.createComputed(function(v16) --[[ Line: 48 ]]
        -- upvalues: v15 (copy), v7 (ref), v4 (ref)
        local v17 = v15(v16);
        for _, v19 in v7 do
            if v17 <= v19.maxWidth then
                return v19.breakpoint;
            end;
        end;
        return v4.XXLarge;
    end);
    local v26 = v2.createComputed(function(v21) --[[ Line: 55 ]]
        -- upvalues: v20 (copy), l_CollectionItemSize_0 (ref), v6 (ref)
        local v22 = v20(v21);
        local v23 = {};
        for _, v25 in l_CollectionItemSize_0 do
            v23[v25] = v6(v22, v25);
        end;
        return v23;
    end);
    return {
        getContainerWidth = v12, 
        getDesignSpaceContainerWidth = v15, 
        getCollectionItemBreakpoint = v20, 
        getNumItemsForAllCategories = v26
    };
end;