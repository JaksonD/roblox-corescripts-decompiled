local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_Modules_0.LuaApp.Actions.SetIsLocalUserSoothsayer);
local v4 = require(l_Modules_0.LuaApp.Http.Requests.UsersGetRoles);
return function(v5) --[[ Line: 10 ]]
    -- upvalues: v4 (copy), v2 (copy), v3 (copy)
    return function(v6) --[[ Line: 11 ]]
        -- upvalues: v4 (ref), v5 (copy), v2 (ref), v3 (ref)
        return v4(v5):andThen(function(v7) --[[ Line: 12 ]]
            -- upvalues: v2 (ref), v6 (copy), v3 (ref)
            local v8 = v7.responseBody.roles or {};
            local v9 = v2.List.find(v8, "Soothsayer") ~= nil;
            v6:dispatch(v3(v9));
        end);
    end;
end;