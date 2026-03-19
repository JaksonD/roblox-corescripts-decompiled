local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.Promise);
local v3 = require(l_Modules_0.LuaApp.Http.Requests.GamesApi.GamePostFavorite);
local v4 = require(l_Modules_0.LuaApp.Actions.Games.SetGameFavorite);
local v5 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local function v7(v8, v9, v10) --[[ Line: 9 ]] --[[ Name: GamePostFavorite ]]
    -- upvalues: l_PerformFetch_0 (copy), v3 (copy), v7 (copy), v2 (copy), v4 (copy), v5 (copy)
    if type(v9) ~= "string" then
        error("GamePostFavorite thunk expects universeId to be a string");
    end;
    if type(v10) ~= "boolean" then
        error("GamePostFavorite thunk expects isFavorited to be a boolean");
    end;
    return l_PerformFetch_0.Single("GamePostFavorite" .. v9, function(v11) --[[ Line: 18 ]]
        -- upvalues: v3 (ref), v8 (copy), v9 (copy), v10 (copy), v7 (ref), v2 (ref), v4 (ref), v5 (ref)
        return v3(v8, v9, v10):andThen(function(v12) --[[ Line: 19 ]]
            -- upvalues: v11 (copy), v9 (ref), v10 (ref), v7 (ref), v8 (ref), v2 (ref)
            local v13 = v11:getState().GameFavorites[v9];
            if v13 ~= v10 then
                return v7(v8, v9, v13);
            else
                return v2.resolve(v12);
            end;
        end, function(v14) --[[ Line: 27 ]]
            -- upvalues: v11 (copy), v4 (ref), v9 (ref), v10 (ref), v5 (ref), v2 (ref)
            v11:dispatch(v4(v9, not v10));
            v11:dispatch(v5(v14));
            return v2.reject(v14);
        end);
    end);
end;
return v7;