local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.Actions.ClearUserSpecificData);
local l_HttpCanceller_0 = require(l_CorePackages_0.Workspace.Packages.Http).NetworkLayers.HttpCanceller;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_Common_0 = require(l_CorePackages_0.Workspace.Packages.SquadsCore).Common;
local v7 = nil;
local l_GetFFlagIsSquadEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled;
local l_FFlagLuaAppUseAppHttpStore_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppUseAppHttpStore;
if l_FFlagLuaAppUseAppHttpStore_0 then
    v7 = require(l_CorePackages_0.Workspace.Packages.HttpStore);
end;
return function() --[[ Line: 17 ]]
    -- upvalues: l_GetFFlagIsSquadEnabled_0 (copy), l_Common_0 (copy), v3 (copy), l_HttpCanceller_0 (copy), l_FFlagLuaAppUseAppHttpStore_0 (copy), v7 (ref), l_PerformFetch_0 (copy)
    return function(v10) --[[ Line: 18 ]]
        -- upvalues: l_GetFFlagIsSquadEnabled_0 (ref), l_Common_0 (ref), v3 (ref), l_HttpCanceller_0 (ref), l_FFlagLuaAppUseAppHttpStore_0 (ref), v7 (ref), l_PerformFetch_0 (ref)
        if l_GetFFlagIsSquadEnabled_0() then
            l_Common_0.clearSquadStorage();
        end;
        v10:dispatch(v3());
        l_HttpCanceller_0.cancel();
        local v11 = nil;
        if l_FFlagLuaAppUseAppHttpStore_0 then
            v11 = v7.Instance.get();
            if v11 then
                v11.cancelAll();
            end;
        end;
        l_PerformFetch_0.ClearOutstandingPromiseStatus();
    end;
end;