local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v3 = require(l_CorePackages_0.Packages.Promise);
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetLookFavorite);
return function(v8, v9, v10) --[[ Line: 14 ]]
    -- upvalues: v4 (copy), l_PerformFetch_0 (copy), v6 (copy), v7 (copy), v3 (copy), l_Logging_0 (copy)
    v4.isType(v8, "function", "SetLookFavorite thunk expects networkImpl to be a function");
    v4.isType(v9, "string", "SetLookFavorite thunk expects lookId to be a string");
    v4.isType(v10, "boolean", "SetLookFavorite thunk expects isFavorited to be a boolean");
    return l_PerformFetch_0.Single("look.setlookfavorite", function(v11) --[[ Line: 18 ]]
        -- upvalues: v10 (copy), v6 (ref), v8 (copy), v9 (copy), v7 (ref), v3 (ref), l_Logging_0 (ref)
        if v10 then
            return v6.FavoriteLook(v8, v9):andThen(function(v12) --[[ Line: 20 ]]
                -- upvalues: v11 (copy), v7 (ref), v9 (ref), v3 (ref)
                if v12.responseBody then
                    v11:dispatch(v7(v9, true));
                end;
                v3.resolve();
            end, function(v13) --[[ Line: 26 ]]
                -- upvalues: l_Logging_0 (ref), v3 (ref)
                l_Logging_0.warn("WebApi failure in SetLookFavorite");
                v3.reject(v13);
            end);
        else
            return v6.UnfavoriteLook(v8, v9):andThen(function(v14) --[[ Line: 31 ]]
                -- upvalues: v11 (copy), v7 (ref), v9 (ref), v3 (ref)
                if v14.responseBody then
                    v11:dispatch(v7(v9, false));
                end;
                v3.resolve();
            end, function(v15) --[[ Line: 38 ]]
                -- upvalues: l_Logging_0 (ref), v11 (copy), v7 (ref), v3 (ref)
                l_Logging_0.warn("WebApi failure in SetLookFavorite");
                v11:dispatch(v7({}));
                v3.reject(v15);
            end);
        end;
    end);
end;