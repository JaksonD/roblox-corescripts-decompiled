local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Promise);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v5 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetCollectibleResaleData);
local function _(v8) --[[ Line: 18 ]] --[[ Name: keyMapper ]]
    -- upvalues: v5 (copy)
    return v5.FetchCollectibleResaleDataKey .. tostring(v8);
end;
return function(v10, v11) --[[ Line: 22 ]]
    -- upvalues: v3 (copy), l_PerformFetch_0 (copy), v5 (copy), v6 (copy), v7 (copy), v2 (copy)
    v3.isType(v11, "string", "FetchCollectibleResaleData thunk expects collectibleItemId");
    return l_PerformFetch_0.Single(v5.FetchCollectibleResaleDataKey .. tostring(v11), function(v12) --[[ Line: 24 ]]
        -- upvalues: v6 (ref), v10 (copy), v11 (copy), v7 (ref), v2 (ref)
        return v6.FetchCollectibleResaleData(v10, v11):andThen(function(v13) --[[ Line: 25 ]]
            -- upvalues: v12 (copy), v7 (ref), v11 (ref), v2 (ref)
            local v14 = v13 and v13.responseBody;
            if v14 then
                v12:dispatch(v7(v11, v14));
                return v2.resolve();
            else
                return v2.reject();
            end;
        end);
    end);
end;