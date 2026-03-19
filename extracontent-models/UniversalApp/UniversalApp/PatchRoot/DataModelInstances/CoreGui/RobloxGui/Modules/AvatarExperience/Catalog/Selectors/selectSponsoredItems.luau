local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v6 = require(l_CorePackages_0.Packages.Dash);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_SponsoredItemsCategoryRecommended_0 = v4.SponsoredItemsCategoryRecommended;
local v13 = l_memoize_0(function(v9, v10) --[[ Line: 26 ]]
    -- upvalues: v6 (copy)
    return v6.map(v9, function(v11) --[[ Line: 27 ]]
        -- upvalues: v10 (copy), v6 (ref)
        local v12 = v10[v11.id];
        if v12 and v12.product then
            return (v6.join(v11, {
                productId = v12.product.id
            }));
        else
            return v11;
        end;
    end);
end);
return function(v14) --[[ Line: 37 ]] --[[ Name: selectSponsoredItems ]]
    -- upvalues: l_SponsoredItemsCategoryRecommended_0 (copy), v13 (copy)
    local v15 = v14.AvatarExperience.Catalog.SponsoredItems[l_SponsoredItemsCategoryRecommended_0];
    local l_AssetInfos_0 = v14.AvatarExperience.Common.AssetInfos;
    if v15 then
        return (v13(v15, l_AssetInfos_0));
    else
        return nil;
    end;
end;