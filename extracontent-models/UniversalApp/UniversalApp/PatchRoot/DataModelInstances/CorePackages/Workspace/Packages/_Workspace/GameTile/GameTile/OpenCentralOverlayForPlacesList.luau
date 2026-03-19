local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
return function(v3, v4, v5) --[[ Line: 6 ]]
    -- upvalues: l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy)
    return function(v6) --[[ Line: 7 ]]
        -- upvalues: l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), v3 (copy), v4 (copy), v5 (copy)
        v6:dispatch(l_SetCentralOverlay_0(l_CentralOverlayType_0.PlacesList, {
            game = v3, 
            anchorSpaceSize = v4, 
            anchorSpacePosition = v5
        }));
    end;
end;