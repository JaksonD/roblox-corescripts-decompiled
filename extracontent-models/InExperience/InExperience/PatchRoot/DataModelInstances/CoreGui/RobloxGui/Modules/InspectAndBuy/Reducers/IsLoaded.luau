local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Actions.SetAssets);
return (v1.createReducer(false, {
    [v3.name] = function(_, _) --[[ Line: 8 ]]
        return true;
    end
}));