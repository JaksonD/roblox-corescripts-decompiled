local l_CorePackages_0 = game:GetService("CorePackages");
local l_Parent_0 = script.Parent;
local v2 = require(l_Parent_0.Reducers.SettingsReducer);
local v3 = require(l_CorePackages_0.Packages.Rodux);
local l_Store_0 = v3.Store;
return {
    Destruct = function(v5) --[[ Line: 10 ]] --[[ Name: Destruct ]]
        v5.store:destruct();
    end, 
    store = l_Store_0.new(v2, nil, {
        v3.thunkMiddleware
    })
};