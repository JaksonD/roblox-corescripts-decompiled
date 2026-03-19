local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Rodux);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetSponsoredItems);
return v3.createReducer({}, {
    [v5.name] = function(v6, v7) --[[ Line: 29 ]]
        -- upvalues: v4 (copy)
        local l_category_0 = v7.category;
        local v10 = v4.List.map(v7.items, function(v9) --[[ Line: 31 ]]
            return {
                id = tostring(v9.id), 
                type = tostring(v9.itemType), 
                productId = v9.productId, 
                encryptedAdTrackingData = v9.encryptedAdTrackingData
            };
        end);
        return (v4.Dictionary.join(v6, {
            [l_category_0] = v10
        }));
    end
});