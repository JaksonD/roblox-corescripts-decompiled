local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_GetFFlagEnableAccountSwitcherFoundationDesign_0 = v2.SharedFlags.GetFFlagEnableAccountSwitcherFoundationDesign;
return function(v8, v9, v10) --[[ Line: 12 ]]
    -- upvalues: l_GetFFlagEnableAccountSwitcherFoundationDesign_0 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy)
    return function(v11) --[[ Line: 13 ]]
        -- upvalues: v9 (copy), l_GetFFlagEnableAccountSwitcherFoundationDesign_0 (ref), v10 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), v8 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        if v9 then
            if l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and v10 then
                v11:dispatch(l_SetCentralOverlay_0(l_CentralOverlayType_0.AccountSwitcher, v8));
                return;
            else
                v11:dispatch(l_NavigateDown_0({
                    name = l_AppPage_0.AccountSelectorPeekView, 
                    extraProps = v8
                }));
                return;
            end;
        else
            v11:dispatch(l_SetCentralOverlay_0(l_CentralOverlayType_0.AccountSelector, v8));
            return;
        end;
    end;
end;