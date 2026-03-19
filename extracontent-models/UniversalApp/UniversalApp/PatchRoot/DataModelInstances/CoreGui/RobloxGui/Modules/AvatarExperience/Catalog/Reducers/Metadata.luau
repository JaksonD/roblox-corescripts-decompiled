local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Rodux);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetCatalogMetadata);
local v6 = {
    obtainedCatalogMetadata = false
};
return v3.createReducer(v6, {
    [v5.name] = function(_, v8) --[[ Line: 25 ]]
        -- upvalues: v4 (copy)
        return v4.Dictionary.join({
            obtainedCatalogMetadata = true
        }, v8.metadata);
    end
});