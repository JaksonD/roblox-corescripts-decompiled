local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Thunks.Authentication.User);
local v3 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_AppBtidLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppBtidLayers;
local l_useAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).useAppPolicy;
local v6 = require(l_Modules_0.LuaApp.Flags.FFlagEnableLuaAccountSwitch);
local v7 = require(l_Modules_0.LuaApp.Flags.FFlagLuaAccountSwitchExperimentBypassBackdoorDev);
local l_FFlagAuthSecExclusions_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAuthSecExclusions;
local l_GetFFlagEnableAccountSwitcherRedesignIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAccountSwitcherRedesignIXP;
return function() --[[ Line: 14 ]] --[[ Name: shouldFlyoutShowAccountSwitch ]]
    -- upvalues: l_useAppPolicy_0 (copy), v3 (copy), l_AppBtidLayers_0 (copy), v2 (copy), v7 (copy), l_FFlagAuthSecExclusions_0 (copy), v6 (copy), l_GetFFlagEnableAccountSwitcherRedesignIXP_0 (copy)
    local v11 = l_useAppPolicy_0(function(v10) --[[ Line: 15 ]]
        return v10;
    end);
    local v13 = v3.useBrowserTrackerExperiment({
        l_AppBtidLayers_0.AccountSwitcherLayer
    }, function(v12) --[[ Line: 20 ]]
        -- upvalues: l_AppBtidLayers_0 (ref)
        return v12[l_AppBtidLayers_0.AccountSwitcherLayer] or {};
    end);
    local l_isAccountSwitcherEnabled_0 = v13.isAccountSwitcherEnabled;
    local v15 = v2.fromLocalStorage();
    local v16 = l_isAccountSwitcherEnabled_0 or v7;
    local v17 = v15.isUnder13 ~= true;
    local v18 = l_FFlagAuthSecExclusions_0 and v11.getExcludeAccountSwitcher();
    local v19 = v6 and not v18 and v17 and v16;
    local _ = nil;
    local _ = nil;
    if l_GetFFlagEnableAccountSwitcherRedesignIXP_0() then
        return v19, v13.enableAccountSwitcherFoundationDesign == true, v13.enableAccountSwitcherSignedOutAccounts == true;
    else
        return v19, true, true;
    end;
end;