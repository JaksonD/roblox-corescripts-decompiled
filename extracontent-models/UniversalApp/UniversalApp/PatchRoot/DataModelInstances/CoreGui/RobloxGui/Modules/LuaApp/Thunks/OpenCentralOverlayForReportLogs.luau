local l_CorePackages_0 = game:GetService("CorePackages");
local l_CentralOverlayType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).CentralOverlayType;
local l_SetCentralOverlay_0 = require(l_CorePackages_0.Workspace.Packages.CentralOverlay).Actions.SetCentralOverlay;
return function() --[[ Line: 5 ]]
    -- upvalues: l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy)
    return function(v3) --[[ Line: 6 ]]
        -- upvalues: l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref)
        v3:dispatch(l_SetCentralOverlay_0(l_CentralOverlayType_0.ReportLogsOverlay, {}));
    end;
end;