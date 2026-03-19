local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.Http.Requests.DevSubsPatchDevSub);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
return {
    Patch = function(v4, v5, v6) --[[ Line: 11 ]] --[[ Name: Patch ]]
        -- upvalues: l_PerformFetch_0 (copy), v2 (copy)
        return l_PerformFetch_0.Single("luaapp.devsubs.cancelsubscription", function(_) --[[ Line: 12 ]]
            -- upvalues: v2 (ref), v4 (copy), v5 (copy), v6 (copy)
            return v2(v4, v5, v6);
        end);
    end, 
    GetPatchingStatus = function(v8) --[[ Line: 17 ]] --[[ Name: GetPatchingStatus ]]
        -- upvalues: l_PerformFetch_0 (copy)
        return l_PerformFetch_0.GetStatus(v8, "luaapp.devsubs.cancelsubscription");
    end
};