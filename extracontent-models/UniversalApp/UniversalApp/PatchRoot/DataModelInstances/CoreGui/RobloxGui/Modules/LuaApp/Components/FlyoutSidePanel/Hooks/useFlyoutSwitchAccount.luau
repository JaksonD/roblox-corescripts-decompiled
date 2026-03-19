local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v4 = require(l_Modules_0.LuaApp.Thunks.Authentication.OpenAccountSwitcher);
local v5 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v6 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_useAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).useAppPolicy;
local v9 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags);
local l_RoactNetworking_0 = v9.RoactNetworking;
local l_AppOmniRecommendationsRequest_0 = v9.AppOmniRecommendationsRequest;
return function(v12, v13) --[[ Line: 15 ]] --[[ Name: useFlyoutSwitchAccount ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v6 (copy), l_useAppPolicy_0 (copy), l_AppOmniRecommendationsRequest_0 (copy), l_useDispatch_0 (copy), v1 (copy), v4 (copy), v5 (copy)
    local v14 = l_useRoactService_0(l_RoactNetworking_0);
    local v15 = l_useRoactService_0(v6);
    local v17 = l_useAppPolicy_0(function(v16) --[[ Line: 18 ]]
        return v16;
    end);
    local v18 = l_useRoactService_0(l_AppOmniRecommendationsRequest_0);
    local v19 = l_useDispatch_0();
    return v1.useCallback(function() --[[ Line: 24 ]]
        -- upvalues: v19 (copy), v4 (ref), v14 (copy), v5 (ref), v15 (copy), v17 (copy), v18 (copy), v12 (copy), v13 (copy)
        v19(v4(true, v14, v5.Origin.FlyoutSidePanel, v15, v17, v18, v12, v13));
        v15.reportAuthButtonClick(v5.Context.FlyoutSidePanel, v5.Button.SwitchAccounts);
    end, {
        v14, 
        v15, 
        v17, 
        v18, 
        v12, 
        v13, 
        v19
    });
end;