local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCatalogSearchWithSponsoredItems);
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v5 = require(l_CorePackages_0.Packages.Promise);
local _ = require(l_Modules_0.AvatarExperience.Catalog.SearchTypes);
return function(v7, v8, v9, v10) --[[ Line: 25 ]] --[[ Name: fetchCatalogSearchWithSponsoredItems ]]
    -- upvalues: v5 (copy), v2 (copy), l_Logging_0 (copy)
    return v5.new(function(v11, v12) --[[ Line: 31 ]]
        -- upvalues: v9 (copy), v10 (copy), v7 (copy), v2 (ref), v8 (copy), l_Logging_0 (ref)
        local v13 = {
            searchUuid = v9, 
            categoryInfo = v10, 
            recordSearchTime = true
        };
        local v14 = v7(v2(v8, v13));
        if v14 and v14.andThen then
            v14:andThen(function(v15) --[[ Line: 40 ]]
                -- upvalues: v11 (copy)
                v11(v15);
            end, function(v16) --[[ Line: 42 ]]
                -- upvalues: l_Logging_0 (ref), v12 (copy)
                l_Logging_0.warn("fetchCatalogSearchWithSponsoredItems: Catalog search with sponsored items fetch failed: " .. tostring(v16));
                v12(v16);
            end);
            return;
        else
            v11(true);
            return;
        end;
    end);
end;