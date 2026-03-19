local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local l_Parent_0 = script.Parent;
local v3 = require(l_Parent_0.AdjustmentTypeSelected);
local v4 = require(l_Parent_0.SelectedAccessory);
return v1.combineReducers({
    AdjustmentTypeSelected = v3, 
    SelectedAccessory = v4
});