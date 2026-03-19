local l_script_FirstAncestor_0 = script:FindFirstAncestor("CollectionViews");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.Style);
local _ = require(l_Parent_0.Foundation);
local _ = require(l_Parent_0.Signals);
local _ = require(l_script_FirstAncestor_0.CollectionLayoutStore.CollectionItemBreakpoint);
return {
    CollectionItemSize = {
        XSmall = "XSmall", 
        Small = "Small", 
        Medium = "Medium", 
        Large = "Large", 
        XLarge = "XLarge"
    }
};