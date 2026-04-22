local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.ApiFetchCatalogSearch);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchSponsoredItems);
local _ = require(l_Modules_0.AvatarExperience.Catalog.SearchTypes);
local _ = require(l_CorePackages_0.Packages.LuauPolyfill);
local l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableMilestoneTrackingForAvatarExperience;
local l_OrganicTTIMilestoneManager_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceTTIPerformance).OrganicTTIMilestoneManager;
return function(v10, v11) --[[ Line: 30 ]]
    -- upvalues: l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (copy), l_OrganicTTIMilestoneManager_0 (copy), v5 (copy), v3 (copy), v4 (copy)
    return function(v12) --[[ Line: 31 ]]
        -- upvalues: v11 (copy), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (ref), l_OrganicTTIMilestoneManager_0 (ref), v5 (ref), v10 (copy), v3 (ref), v4 (ref)
        if (v11 and v11.categoryInfo or {}).ShowSponsored then
            if l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 and l_OrganicTTIMilestoneManager_0 then
                l_OrganicTTIMilestoneManager_0.L3.sponsoredSearchStarted();
            end;
            if l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 and l_OrganicTTIMilestoneManager_0 then
                local v13 = v12:dispatch(v5(v10, v3.SponsoredItemsCategoryRecommended, v3.SponsoredItemsToFetch));
                if v13 and v13.andThen then
                    v13:andThen(function() --[[ Line: 47 ]]
                        -- upvalues: l_OrganicTTIMilestoneManager_0 (ref)
                        l_OrganicTTIMilestoneManager_0.L3.sponsoredSearchCompleted();
                    end);
                end;
            else
                v12:dispatch(v5(v10, v3.SponsoredItemsCategoryRecommended, v3.SponsoredItemsToFetch));
            end;
        end;
        return v12:dispatch(v4(v11, v10));
    end;
end;