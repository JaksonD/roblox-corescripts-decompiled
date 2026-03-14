local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Actions_0 = l_Modules_0.LuaApp.Actions;
local v3 = require(l_Actions_0.SetGameBadges);
local v4 = require(l_Modules_0.LuaApp.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v6 = require(l_Modules_0.LuaApp.Http.Requests.BadgesGetBadges);
return function(v7, v8) --[[ Line: 10 ]]
    -- upvalues: l_PerformFetch_0 (copy), v6 (copy), v3 (copy), v4 (copy)
    return l_PerformFetch_0.Single("ApiFetchGameBadges" .. v8, function(v9) --[[ Line: 11 ]]
        -- upvalues: v6 (ref), v7 (copy), v8 (copy), v3 (ref), v4 (ref)
        return v6(v7, v8):andThen(function(v10) --[[ Line: 12 ]]
            -- upvalues: v9 (copy), v3 (ref), v8 (ref), v4 (ref)
            local l_data_0 = v10.responseBody.data;
            v9:dispatch(v3(v8, l_data_0));
            return v4.resolve(v10);
        end);
    end);
end;