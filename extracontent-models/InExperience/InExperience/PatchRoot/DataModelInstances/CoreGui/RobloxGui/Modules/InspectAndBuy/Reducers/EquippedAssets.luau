local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Actions.SetEquippedAssets);
return v1.createReducer({}, {
    [v3.name] = function(_, v5) --[[ Line: 11 ]]
        local v6 = {};
        for _, v8 in ipairs(v5.equippedAssets) do
            v6[tostring(v8.assetId)] = true;
        end;
        return v6;
    end
});