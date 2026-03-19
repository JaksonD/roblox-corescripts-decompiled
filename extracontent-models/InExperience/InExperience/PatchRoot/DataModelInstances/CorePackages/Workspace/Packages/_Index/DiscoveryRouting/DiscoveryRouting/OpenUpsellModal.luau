local l_Parent_0 = script:FindFirstAncestor("DiscoveryRouting").Parent;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
return function(v3, v4, v5, v6, v7, v8, v9) --[[ Line: 6 ]]
    -- upvalues: l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy)
    return function(v10) --[[ Line: 15 ]]
        -- upvalues: l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), v3 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy)
        v10:dispatch(l_SetCentralOverlay_0(l_CentralOverlayType_0.UpsellModal, {
            titleText = v3, 
            bodyText = v4, 
            actionButtonText = v5, 
            cancelButtonText = v6, 
            onActionButtonClick = v7, 
            onCancelButtonClick = v8, 
            onCloseModal = v9
        }));
    end;
end;