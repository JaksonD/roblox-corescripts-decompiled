local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local l_CloseCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Thunks.CloseCentralOverlay;
local v2 = require(l_Parent_0.Responsive);
local l_GetInputModeStore_0 = v2.GetInputModeStore;
local l_OpenInfoPeekView_0 = require(l_Parent_0.DiscoveryRouting).OpenInfoPeekView;
local l_OpenCloseOnlyInteractiveAlert_0 = require(l_Parent_0.DiscoveryRouting).OpenCloseOnlyInteractiveAlert;
local l_SduiResponsiveHelpers_0 = require(l_Parent_0.SduiCoreSystem).SduiResponsiveHelpers;
return function(v7, _, v9) --[[ Line: 18 ]]
    -- upvalues: l_SduiResponsiveHelpers_0 (copy), l_GetInputModeStore_0 (copy), v2 (copy), l_OpenInfoPeekView_0 (copy), l_OpenCloseOnlyInteractiveAlert_0 (copy), l_CloseCentralOverlay_0 (copy)
    local l_dispatch_0 = v9.dependencies.dispatch;
    local v11 = l_SduiResponsiveHelpers_0.isPortraitOrientation();
    local v12 = l_GetInputModeStore_0(false).getLastInputType(false);
    local v13 = v7 and v7.actionParams and v7.actionParams.tooltipInfoText or "";
    local v14 = v7 and v7.actionParams and v7.actionParams.tooltipTitle or "";
    if v12 == v2.Input.Touch and v11 then
        l_dispatch_0(l_OpenInfoPeekView_0(v14, v13));
        return;
    else
        l_dispatch_0(l_OpenCloseOnlyInteractiveAlert_0(v14, v13, function() --[[ Line: 34 ]]
            -- upvalues: l_dispatch_0 (copy), l_CloseCentralOverlay_0 (ref)
            return l_dispatch_0(l_CloseCentralOverlay_0());
        end));
        return;
    end;
end;