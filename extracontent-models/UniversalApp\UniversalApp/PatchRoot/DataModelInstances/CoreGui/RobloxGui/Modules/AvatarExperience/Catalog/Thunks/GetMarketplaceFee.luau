local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Promise);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetMarketplaceFee);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local function _() --[[ Line: 12 ]] --[[ Name: keyMapper ]]
    -- upvalues: v5 (copy)
    return v5.GetMarketplaceFeeKey;
end;
return function(v9) --[[ Line: 16 ]]
    -- upvalues: l_PerformFetch_0 (copy), v5 (copy), v6 (copy), v4 (copy), v2 (copy)
    return l_PerformFetch_0.Single(v5.GetMarketplaceFeeKey, function(v10) --[[ Line: 17 ]]
        -- upvalues: v6 (ref), v9 (copy), v4 (ref), v2 (ref)
        return v6.GetMarketplaceFee(v9):andThen(function(v11) --[[ Line: 18 ]]
            -- upvalues: v10 (copy), v4 (ref), v2 (ref)
            local v12 = v11 and v11.responseBody;
            if v12 then
                v10:dispatch(v4(v12));
                return v2.resolve();
            else
                return v2.reject();
            end;
        end);
    end);
end;