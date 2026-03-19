local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v3 = require(l_CorePackages_0.Packages.Promise);
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetCatalogMetadata);
return function(v8) --[[ Line: 16 ]]
    -- upvalues: v4 (copy), l_PerformFetch_0 (copy), v6 (copy), v7 (copy), l_Logging_0 (copy), v3 (copy)
    v4.isType(v8, "function", "GetCatalogMetadata thunk expects networkImpl to be a function");
    return l_PerformFetch_0.Single("catalog.getcatalogmetadata", function(v9) --[[ Line: 19 ]]
        -- upvalues: v6 (ref), v8 (copy), v7 (ref), l_Logging_0 (ref), v3 (ref)
        return v6.GetCatalogMetadata(v8):andThen(function(v10) --[[ Line: 20 ]]
            -- upvalues: v9 (copy), v7 (ref)
            local l_responseBody_0 = v10.responseBody;
            if l_responseBody_0 then
                v9:dispatch(v7(l_responseBody_0));
            end;
            return l_responseBody_0;
        end, function(v12) --[[ Line: 27 ]]
            -- upvalues: l_Logging_0 (ref), v9 (copy), v7 (ref), v3 (ref)
            l_Logging_0.warn("WebApi failure in GetCatalogMetadata");
            v9:dispatch(v7({}));
            v3.reject(v12);
        end);
    end);
end;