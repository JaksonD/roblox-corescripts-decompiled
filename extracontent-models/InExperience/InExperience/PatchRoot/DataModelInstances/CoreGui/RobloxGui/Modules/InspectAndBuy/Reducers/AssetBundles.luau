local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Rodux);
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Actions.SetAssetToBundlesMapping);
return v2.createReducer({}, {
    [v4.name] = function(v5, v6) --[[ Line: 19 ]]
        -- upvalues: v1 (copy)
        local v7 = tostring(v6.assetId);
        local l_bundleIds_0 = v6.bundleIds;
        return v1.Dictionary.join(v5, {
            [v7] = l_bundleIds_0
        });
    end
});