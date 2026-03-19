local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v3 = require(l_CorePackages_0.Packages.Promise);
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetLookFavorite);
if require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogMakeupSupport then
    return function(v8, v9, v10, v11) --[[ Line: 17 ]]
        -- upvalues: v4 (copy), l_PerformFetch_0 (copy), v6 (copy), v7 (copy), v3 (copy), l_Logging_0 (copy)
        v4.isType(v8, "function", "SetLookFavorite thunk expects networkImpl to be a function");
        v4.isType(v9, "string", "SetLookFavorite thunk expects lookId to be a string");
        v4.isType(v10, "boolean", "SetLookFavorite thunk expects isFavorited to be a boolean");
        return l_PerformFetch_0.Single("look.setlookfavorite", function(v12) --[[ Line: 21 ]]
            -- upvalues: v10 (copy), v6 (ref), v8 (copy), v9 (copy), v11 (copy), v7 (ref), v3 (ref), l_Logging_0 (ref)
            if v10 then
                return v6.FavoriteLookV2(v8, v9, v11):andThen(function(v13) --[[ Line: 23 ]]
                    -- upvalues: v12 (copy), v7 (ref), v9 (ref), v3 (ref)
                    if v13.responseBody then
                        v12:dispatch(v7(v9, true));
                    end;
                    v3.resolve();
                end, function(v14) --[[ Line: 29 ]]
                    -- upvalues: l_Logging_0 (ref), v3 (ref)
                    l_Logging_0.warn("WebApi failure in SetLookFavorite");
                    v3.reject(v14);
                end);
            else
                return v6.UnfavoriteLookV2(v8, v9, v11):andThen(function(v15) --[[ Line: 34 ]]
                    -- upvalues: v12 (copy), v7 (ref), v9 (ref), v3 (ref)
                    if v15.responseBody then
                        v12:dispatch(v7(v9, false));
                    end;
                    v3.resolve();
                end, function(v16) --[[ Line: 41 ]]
                    -- upvalues: l_Logging_0 (ref), v12 (copy), v7 (ref), v3 (ref)
                    l_Logging_0.warn("WebApi failure in SetLookFavorite");
                    v12:dispatch(v7({}));
                    v3.reject(v16);
                end);
            end;
        end);
    end;
else
    return function(v17, v18, v19) --[[ Line: 50 ]]
        -- upvalues: v4 (copy), l_PerformFetch_0 (copy), v6 (copy), v7 (copy), v3 (copy), l_Logging_0 (copy)
        v4.isType(v17, "function", "SetLookFavorite thunk expects networkImpl to be a function");
        v4.isType(v18, "string", "SetLookFavorite thunk expects lookId to be a string");
        v4.isType(v19, "boolean", "SetLookFavorite thunk expects isFavorited to be a boolean");
        return l_PerformFetch_0.Single("look.setlookfavorite", function(v20) --[[ Line: 54 ]]
            -- upvalues: v19 (copy), v6 (ref), v17 (copy), v18 (copy), v7 (ref), v3 (ref), l_Logging_0 (ref)
            if v19 then
                return v6.FavoriteLook(v17, v18):andThen(function(v21) --[[ Line: 56 ]]
                    -- upvalues: v20 (copy), v7 (ref), v18 (ref), v3 (ref)
                    if v21.responseBody then
                        v20:dispatch(v7(v18, true));
                    end;
                    v3.resolve();
                end, function(v22) --[[ Line: 62 ]]
                    -- upvalues: l_Logging_0 (ref), v3 (ref)
                    l_Logging_0.warn("WebApi failure in SetLookFavorite");
                    v3.reject(v22);
                end);
            else
                return v6.UnfavoriteLook(v17, v18):andThen(function(v23) --[[ Line: 67 ]]
                    -- upvalues: v20 (copy), v7 (ref), v18 (ref), v3 (ref)
                    if v23.responseBody then
                        v20:dispatch(v7(v18, false));
                    end;
                    v3.resolve();
                end, function(v24) --[[ Line: 74 ]]
                    -- upvalues: l_Logging_0 (ref), v20 (copy), v7 (ref), v3 (ref)
                    l_Logging_0.warn("WebApi failure in SetLookFavorite");
                    v20:dispatch(v7({}));
                    v3.reject(v24);
                end);
            end;
        end);
    end;
end;