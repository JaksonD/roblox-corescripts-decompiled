local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.Http.Requests.PostRegisterAppPresence);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local function _() --[[ Line: 6 ]] --[[ Name: postKeymapper ]]
    return "luaapp.presenceapi.register-app-presence";
end;
return function(v5, v6) --[[ Line: 10 ]]
    -- upvalues: l_PerformFetch_0 (copy), v2 (copy)
    assert(type(v6) == "string", string.format("PostRegisterAppPresence thunk expects locationId to be a string, was %s", (type(v6))));
    return l_PerformFetch_0.Single("luaapp.presenceapi.register-app-presence", function(_) --[[ Line: 16 ]]
        -- upvalues: v2 (ref), v5 (copy), v6 (copy)
        return v2(v5, v6);
    end);
end;