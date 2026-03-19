local l_Parent_0 = script:FindFirstAncestor("DiscoveryRouting").Parent;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
return function(v3, v4, v5, v6, v7) --[[ Line: 6 ]]
    -- upvalues: l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy)
    return function(v8) --[[ Line: 7 ]]
        -- upvalues: l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), v3 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy)
        v8:dispatch(l_SetCentralOverlay_0(l_CentralOverlayType_0.CloseOnlyInteractiveAlert, {
            title = v3, 
            body = v4, 
            closeAlert = v5, 
            buttonText = v6, 
            showCloseButton = v7
        }));
    end;
end;