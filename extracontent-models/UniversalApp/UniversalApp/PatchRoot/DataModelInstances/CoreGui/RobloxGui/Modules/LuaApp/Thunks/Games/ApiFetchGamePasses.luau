local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Actions_0 = l_Modules_0.LuaApp.Actions;
local v3 = require(l_Actions_0.Games.SetGamePasses);
local v4 = require(l_Modules_0.LuaApp.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v6 = require(l_Modules_0.LuaApp.Thunks.ApiFetchPassesThumbnails);
local v7 = require(l_Modules_0.LuaApp.Http.Requests.GamePassesHttpService.GamePassesListByUniverse);
return function(v8, v9) --[[ Line: 11 ]]
    -- upvalues: l_PerformFetch_0 (copy), v7 (copy), v3 (copy), v6 (copy), v4 (copy)
    return l_PerformFetch_0.Single("ApiFetchGamePasses" .. v9, function(v10) --[[ Line: 12 ]]
        -- upvalues: v7 (ref), v8 (copy), v9 (copy), v3 (ref), v6 (ref), v4 (ref)
        return v7(v8, v9):andThen(function(v11) --[[ Line: 13 ]]
            -- upvalues: v10 (copy), v3 (ref), v9 (ref), v6 (ref), v8 (ref), v4 (ref)
            local l_gamePasses_0 = v11.responseBody.gamePasses;
            v10:dispatch(v3(v9, l_gamePasses_0));
            if #l_gamePasses_0 > 0 then
                local v13 = {};
                for _, v15 in ipairs(l_gamePasses_0) do
                    table.insert(v13, v15.id);
                end;
                v10:dispatch(v6(v8, v13));
            end;
            return v4.resolve(v11);
        end);
    end);
end;