local l_script_FirstAncestor_0 = script:FindFirstAncestor("CollectionViews");
local v1 = require(script.Parent.CollectionItemBreakpoint);
local l_CollectionItemSize_0 = require(l_script_FirstAncestor_0.CollectionViewTypes).CollectionItemSize;
local v3 = {
    [l_CollectionItemSize_0.XSmall] = {
        [v1.XSmall] = 3, 
        [v1.Small] = 4, 
        [v1.Medium] = 6, 
        [v1.MediumWide] = 9, 
        [v1.Large] = 12, 
        [v1.XLarge] = 16, 
        [v1.XXLarge] = 16
    }, 
    [l_CollectionItemSize_0.Small] = {
        [v1.XSmall] = 3, 
        [v1.Small] = 4, 
        [v1.Medium] = 4, 
        [v1.MediumWide] = 6, 
        [v1.Large] = 8, 
        [v1.XLarge] = 8, 
        [v1.XXLarge] = 10
    }, 
    [l_CollectionItemSize_0.Medium] = {
        [v1.XSmall] = 2, 
        [v1.Small] = 2, 
        [v1.Medium] = 2, 
        [v1.MediumWide] = 3, 
        [v1.Large] = 4, 
        [v1.XLarge] = 4, 
        [v1.XXLarge] = 5
    }, 
    [l_CollectionItemSize_0.Large] = {
        [v1.XSmall] = 1, 
        [v1.Small] = 1, 
        [v1.Medium] = 2, 
        [v1.MediumWide] = 3, 
        [v1.Large] = 3, 
        [v1.XLarge] = 4, 
        [v1.XXLarge] = 4
    }, 
    [l_CollectionItemSize_0.XLarge] = {
        [v1.XSmall] = 1, 
        [v1.Small] = 1, 
        [v1.Medium] = 1, 
        [v1.MediumWide] = 1, 
        [v1.Large] = 1, 
        [v1.XLarge] = 1, 
        [v1.XXLarge] = 1
    }
};
return function(v4, v5) --[[ Line: 63 ]] --[[ Name: getItemsPerRow ]]
    -- upvalues: v3 (copy), l_CollectionItemSize_0 (copy)
    local v6 = v3[v5];
    if v6 then
        return v6[v4] or 1;
    else
        return v3[l_CollectionItemSize_0.Small][v4];
    end;
end;