local l_CorePackages_0 = game:GetService("CorePackages");
local l_useLogStatusBarTapped_0 = require(l_CorePackages_0.Workspace.Packages.UiShellEvents).useLogStatusBarTapped;
local l_AppEventIngestService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppEventIngestService;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_useLogInputTypeChanged_0 = require(l_CorePackages_0.Workspace.Packages.UiShellEvents).useLogInputTypeChanged;
local l_useLogOrientationChanged_0 = require(l_CorePackages_0.Workspace.Packages.UiShellEvents).useLogOrientationChanged;
return function(v6) --[[ Line: 13 ]] --[[ Name: ShellEventsContainer ]]
    -- upvalues: l_useLogStatusBarTapped_0 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_useLogInputTypeChanged_0 (copy), l_useLogOrientationChanged_0 (copy)
    l_useLogStatusBarTapped_0(v6.currentPage);
    local v7 = l_useRoactService_0(l_AppEventIngestService_0);
    l_useLogInputTypeChanged_0(v7);
    l_useLogOrientationChanged_0(v7, nil, v6.currentPage);
    return nil;
end;