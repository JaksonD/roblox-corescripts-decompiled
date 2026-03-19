local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Enums.Breakpoint);
local v2 = {
    [v1.XSmall] = 3, 
    [v1.Small] = 6, 
    [v1.Medium] = 12, 
    [v1.Large] = 12, 
    [v1.XLarge] = 12, 
    [v1.XXLarge] = 12
};
local v3 = {
    [v1.XSmall] = 12, 
    [v1.Small] = 20, 
    [v1.Medium] = 24, 
    [v1.Large] = 24, 
    [v1.XLarge] = 32, 
    [v1.XXLarge] = 48
};
local v4 = {
    [v1.XSmall] = 8, 
    [v1.Small] = 12, 
    [v1.Medium] = 16, 
    [v1.Large] = 16, 
    [v1.XLarge] = 20, 
    [v1.XXLarge] = 20
};
local v5 = {
    [v1.XSmall] = 8, 
    [v1.Small] = 12, 
    [v1.Medium] = 16, 
    [v1.Large] = 16, 
    [v1.XLarge] = 20, 
    [v1.XXLarge] = 20
};
return {
    columns = v2, 
    margins = v3, 
    gutters = v4, 
    gaps = v5
};