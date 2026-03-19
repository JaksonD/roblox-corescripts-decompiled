local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Rodux);
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Actions.SetPlaceInfo);
return v2.createReducer({
    name = "", 
    description = ""
}, {
    [v4.name] = function(_, v6) --[[ Line: 13 ]]
        return {
            name = v6.name, 
            description = v6.description
        };
    end
});