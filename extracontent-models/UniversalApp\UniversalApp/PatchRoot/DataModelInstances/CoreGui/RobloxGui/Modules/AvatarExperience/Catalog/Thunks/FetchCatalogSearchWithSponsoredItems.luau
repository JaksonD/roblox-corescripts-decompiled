local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.ApiFetchCatalogSearch);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchSponsoredItems);
local _ = require(l_Modules_0.AvatarExperience.Catalog.SearchTypes);
local _ = require(l_CorePackages_0.Packages.LuauPolyfill);
return function(v8, v9) --[[ Line: 23 ]]
    -- upvalues: v5 (copy), v3 (copy), v4 (copy)
    return function(v10) --[[ Line: 24 ]]
        -- upvalues: v9 (copy), v5 (ref), v8 (copy), v3 (ref), v4 (ref)
        if (v9 and v9.categoryInfo or {}).ShowSponsored then
            v10:dispatch(v5(v8, v3.SponsoredItemsCategoryRecommended, v3.SponsoredItemsToFetch));
        end;
        return v10:dispatch(v4(v9, v8));
    end;
end;