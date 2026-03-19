local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local v1 = require(l_Parent_0.RobloxAppEnums);
local l_CentralOverlayType_0 = v1.CentralOverlayType;
local l_AppPage_0 = v1.AppPage;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v6 = require(l_Parent_0.Responsive);
return function(v7) --[[ Line: 11 ]]
    -- upvalues: v6 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy)
    return function(v8) --[[ Line: 12 ]]
        -- upvalues: v7 (copy), v6 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref)
        if v7 == v6.Input.Touch then
            v8:dispatch(l_NavigateDown_0({
                name = l_AppPage_0.SponsoredTooltipPeekView
            }));
            return;
        else
            v8:dispatch(l_SetCentralOverlay_0(l_CentralOverlayType_0.SponsoredTooltip));
            return;
        end;
    end;
end;