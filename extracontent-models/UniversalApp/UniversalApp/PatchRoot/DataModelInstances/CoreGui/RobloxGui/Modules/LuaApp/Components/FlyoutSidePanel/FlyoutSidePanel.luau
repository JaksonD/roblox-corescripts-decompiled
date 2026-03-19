local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v6 = require(l_Modules_0.LuaApp.Thunks.Economy.OpenPurchaseRobuxPage);
local v7 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForReportLogs);
local v8 = require(l_Modules_0.LuaApp.Thunks.OpenProfilePeekView);
local l_FlyoutSidePanelComponent_0 = require(l_CorePackages_0.Workspace.Packages.FlyoutSidePanel).Components.FlyoutSidePanelComponent;
local v10 = require(script.Parent.FlyoutLogoutButton);
local v11 = require(script.Parent.Hooks.shouldFlyoutShowAccountSwitch);
local v12 = require(script.Parent.Hooks.useFlyoutSwitchAccount);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v14 = require(l_Modules_0.LuaApp.Flags.GetFFlagForceEnableReportLogsButton);
local l_useUserExperiment_0 = require(l_CorePackages_0.Packages.RoactAppExperiment).useUserExperiment;
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
return function(v17, _) --[[ Line: 27 ]] --[[ Name: FlyoutSidePanel ]]
    -- upvalues: l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v1 (copy), v6 (copy), v7 (copy), l_useSelector_0 (copy), v10 (copy), v11 (copy), v12 (copy), v8 (copy), v14 (copy), l_useUserExperiment_0 (copy), l_AppUserLayers_0 (copy), l_FlyoutSidePanelComponent_0 (copy)
    local v19 = l_useDispatch_0();
    local v20 = l_useRoactService_0(l_RoactNetworking_0);
    local v21 = v1.useCallback(function() --[[ Line: 30 ]]
        -- upvalues: v19 (copy), v6 (ref), v20 (copy)
        v19(v6(nil, v20));
    end, {});
    local v22 = v1.useCallback(function() --[[ Line: 33 ]]
        -- upvalues: v19 (copy), v7 (ref)
        v19(v7());
    end, {});
    local v24 = l_useSelector_0(function(v23) --[[ Line: 36 ]]
        return v23.Users[v23.LocalUserId];
    end);
    local v26 = v1.useCallback(function(v25) --[[ Line: 40 ]]
        -- upvalues: v1 (ref), v10 (ref)
        return v1.createElement(v10, {
            layoutOrder = v25
        });
    end, {});
    local v27, v28, v29 = v11();
    local v30 = v12(v28, v29);
    local v31 = v1.useCallback(function() --[[ Line: 48 ]]
        -- upvalues: v24 (copy), v19 (copy), v8 (ref)
        if v24 and v24.id then
            v19(v8(v24.id, {
                source = "FlyoutSidePanel"
            }));
        end;
    end, {
        v24
    });
    local v33 = v14() or l_useUserExperiment_0({
        l_AppUserLayers_0.AppHealthReportLogs
    }, function(v32) --[[ Line: 55 ]]
        -- upvalues: l_AppUserLayers_0 (ref)
        return (v32[l_AppUserLayers_0.AppHealthReportLogs] or {}).ReportLogsButtonEnabled or nil;
    end);
    return v1.createElement(l_FlyoutSidePanelComponent_0, {
        displayOrder = v17.displayOrder, 
        renderLogOut = v26, 
        localUserModel = v24, 
        onSwitchAccountActivated = if v27 then v30 else nil, 
        onProfileActivated = v31, 
        openPurchaseRobuxPage = v21, 
        openReportLogConfirmation = if v33 then v22 else nil
    });
end;