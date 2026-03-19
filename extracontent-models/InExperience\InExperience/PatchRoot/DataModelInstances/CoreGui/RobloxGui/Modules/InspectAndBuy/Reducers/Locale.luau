local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Actions.SetLocale);
return v1.createReducer("en-us", {
    [v3.name] = function(_, v5) --[[ Line: 9 ]]
        return v5.locale;
    end
});