local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Promise);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v5 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetCollectibleResellersInstances);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Actions.AppendCollectibleResellersInstances);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetResellerCursor);
local function _(v10) --[[ Line: 22 ]] --[[ Name: keyMapper ]]
    -- upvalues: v5 (copy)
    return v5.GetResellersKey .. tostring(v10);
end;
return function(v12, v13, v14, v15) --[[ Line: 26 ]]
    -- upvalues: v3 (copy), l_PerformFetch_0 (copy), v5 (copy), v6 (copy), v9 (copy), v8 (copy), v7 (copy), v2 (copy)
    v3.isType(v13, "string", "FetchCollectibResellersInstances thunk expects collectibleItemId");
    return l_PerformFetch_0.Single(v5.GetResellersKey .. tostring(v13), function(v16) --[[ Line: 29 ]]
        -- upvalues: v6 (ref), v12 (copy), v13 (copy), v14 (copy), v15 (copy), v9 (ref), v8 (ref), v7 (ref), v2 (ref)
        return v6.GetCollectibleResellers(v12, v13, v14, v15):andThen(function(v17) --[[ Line: 31 ]]
            -- upvalues: v16 (copy), v9 (ref), v14 (ref), v8 (ref), v13 (ref), v7 (ref), v2 (ref)
            local v18 = v17 and v17.responseBody and v17.responseBody.data;
            if v18 then
                local l_nextPageCursor_0 = v17.responseBody.nextPageCursor;
                if l_nextPageCursor_0 and l_nextPageCursor_0 == "" then
                    l_nextPageCursor_0 = nil;
                end;
                v16:dispatch(v9(l_nextPageCursor_0));
                if v14 then
                    v16:dispatch(v8(v13, v18));
                else
                    v16:dispatch(v7(v13, v18));
                end;
                return v2.resolve();
            else
                return v2.reject();
            end;
        end);
    end);
end;