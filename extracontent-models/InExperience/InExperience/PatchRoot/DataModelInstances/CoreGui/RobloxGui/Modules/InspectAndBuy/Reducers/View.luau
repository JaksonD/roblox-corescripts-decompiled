local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Actions.SetView);
local v4 = require(l_Parent_0.Constants);
return v1.createReducer(v4.View.Wide, {
    [v3.name] = function(_, v6) --[[ Line: 8 ]]
        return v6.view;
    end
});