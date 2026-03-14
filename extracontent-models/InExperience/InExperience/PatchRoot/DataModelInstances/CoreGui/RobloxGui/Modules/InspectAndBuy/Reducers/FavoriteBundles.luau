local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(l_CorePackages_0.Packages.Cryo);
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Actions.SetFavoriteBundle);
return v1.createReducer({}, {
    [v4.name] = function(v5, v6) --[[ Line: 8 ]]
        -- upvalues: v2 (copy)
        local l_id_0 = v6.id;
        local l_isFavorite_0 = v6.isFavorite;
        return v2.Dictionary.join(v5, {
            [l_id_0] = l_isFavorite_0
        });
    end
});