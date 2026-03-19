local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("CoreGui");
local v2 = require(script.Parent.Reducers.AppShellReducer);
local v3 = require(l_CorePackages_0.Packages.Rodux);
local v5 = {
    Destruct = function(v4) --[[ Line: 12 ]] --[[ Name: Destruct ]]
        v4.store:destruct();
    end
};
local v6 = {
    v3.thunkMiddleware
};
v5.store = v3.Store.new(v2, {}, v6, nil);
return v5;