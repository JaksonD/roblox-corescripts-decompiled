local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v3 = require(l_Modules_0.LuaApp.Promise);
local v4 = require(l_Modules_0.LuaApp.Http.Requests.GamesApi.GameGetPrivateServersEnabled);
local v5 = require(l_Modules_0.LuaApp.Actions.Games.SetGamePrivateServersEnabled);
return function(v6, v7) --[[ Line: 8 ]]
    -- upvalues: v4 (copy), v5 (copy), v3 (copy), l_Logging_0 (copy)
    if type(v7) ~= "string" then
        error("ApiFetchPrivateServersEnabled thunk expects universeId to be a string");
    end;
    return function(v8) --[[ Line: 13 ]]
        -- upvalues: v4 (ref), v6 (copy), v7 (copy), v5 (ref), v3 (ref), l_Logging_0 (ref)
        return v4(v6, v7):andThen(function(v9) --[[ Line: 14 ]]
            -- upvalues: v8 (copy), v5 (ref), v7 (ref), v3 (ref), l_Logging_0 (ref)
            local l_responseBody_0 = v9.responseBody;
            if l_responseBody_0 ~= nil and l_responseBody_0.privateServersEnabled ~= nil then
                v8:dispatch(v5(v7, l_responseBody_0.privateServersEnabled));
                return v3.resolve(v9);
            else
                l_Logging_0.warn("Response from GameGetPrivateServersEnabled is malformed!");
                return v3.reject({
                    HttpError = Enum.HttpError.OK
                });
            end;
        end);
    end;
end;