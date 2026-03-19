local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local l_Parent_0 = script.Parent.Parent;
local l_Actions_0 = l_Parent_0.Actions;
local v4 = require(l_Actions_0.SetLocale);
local v5 = require(l_Parent_0.Constants);
return v1.createReducer(v5.FallbackLocale, {
    [v4.name] = function(_, v7) --[[ Line: 14 ]]
        return v7.locale;
    end
});