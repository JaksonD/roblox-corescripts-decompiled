local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetCollectibleMarketplaceResaleParameters);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local function _(v8) --[[ Line: 23 ]] --[[ Name: keyMapper ]]
    -- upvalues: v6 (copy)
    return v6.GetCollectibleMarketplaceResaleParametersKey .. tostring(v8);
end;
return function(v10, v11, v12) --[[ Line: 27 ]]
    -- upvalues: l_PerformFetch_0 (copy), v6 (copy), v7 (copy), v5 (copy), v2 (copy)
    return l_PerformFetch_0.Single(v6.GetCollectibleMarketplaceResaleParametersKey .. tostring(v11), function(v13) --[[ Line: 28 ]]
        -- upvalues: v7 (ref), v10 (copy), v11 (copy), v5 (ref), v12 (copy), v2 (ref)
        return v7.GetCollectibleMarketplaceResaleParameters(v10, v11):andThen(function(v14) --[[ Line: 30 ]]
            -- upvalues: v13 (copy), v5 (ref), v11 (ref), v12 (ref), v2 (ref)
            local v15 = v14 and v14.responseBody;
            if v15 then
                v13:dispatch(v5(v11, v15, v12));
                return v2.resolve();
            else
                return v2.reject();
            end;
        end);
    end);
end;