local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Promise);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v5 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAssetVersionData);
local function _(v8) --[[ Line: 21 ]] --[[ Name: keyMapper ]]
    -- upvalues: v5 (copy)
    return v5.FetchAssetVersionDataKey .. tostring(v8);
end;
return function(v10, v11) --[[ Line: 25 ]]
    -- upvalues: v3 (copy), v2 (copy), l_PerformFetch_0 (copy), v5 (copy), v6 (copy), v7 (copy)
    return function(v12) --[[ Line: 26 ]]
        -- upvalues: v3 (ref), v11 (copy), v2 (ref), l_PerformFetch_0 (ref), v5 (ref), v6 (ref), v10 (copy), v7 (ref)
        v3.isType(v11, "string", "FetchAssetVersionData thunk expects assetId to be a string");
        local v13 = v12:getState().AvatarExperience.Common.AssetInfos[v11];
        if v13 and v13.receivedFromVersionData then
            return v2.resolve("We already have the asset version data");
        else
            local l_Single_0 = l_PerformFetch_0.Single;
            local l_v11_0 = v11;
            return l_Single_0(v5.FetchAssetVersionDataKey .. tostring(l_v11_0), function(v16) --[[ Line: 35 ]]
                -- upvalues: v6 (ref), v10 (ref), v11 (ref), v7 (ref), v2 (ref)
                return v6.FetchAssetVersionData(v10, v11):andThen(function(v17) --[[ Line: 36 ]]
                    -- upvalues: v16 (copy), v7 (ref), v11 (ref), v2 (ref)
                    local v18 = v17 and v17.responseBody;
                    if v18 then
                        v16:dispatch(v7(v11, v18));
                        return v2.resolve();
                    else
                        return v2.reject();
                    end;
                end);
            end)(v12);
        end;
    end;
end;