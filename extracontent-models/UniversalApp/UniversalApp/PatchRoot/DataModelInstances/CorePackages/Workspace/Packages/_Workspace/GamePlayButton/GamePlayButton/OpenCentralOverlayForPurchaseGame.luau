local l_Parent_0 = script:FindFirstAncestor("GamePlayButton").Parent;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
return function(v3, v4, v5, v6, v7, v8) --[[ Line: 6 ]]
    -- upvalues: l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy)
    return function(v9) --[[ Line: 7 ]]
        -- upvalues: l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), v3 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy)
        v9:dispatch(l_SetCentralOverlay_0(l_CentralOverlayType_0.PurchaseGame, {
            universeId = v3, 
            gameName = v4, 
            price = v5, 
            productId = v6, 
            sellerId = v7, 
            pageFilter = v8
        }));
    end;
end;