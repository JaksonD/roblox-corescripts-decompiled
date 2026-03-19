local l_script_FirstAncestor_0 = script:FindFirstAncestor("AccountSwitching");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_CentralOverlayType_0 = v1.RobloxAppEnums.CentralOverlayType;
local l_SetCentralOverlay_0 = v1.CentralOverlay.Actions.SetCentralOverlay;
return function(v4, v5, v6, v7, v8, v9, v10, v11, v12) --[[ Line: 7 ]]
    -- upvalues: l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy)
    return function(v13) --[[ Line: 18 ]]
        -- upvalues: l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy)
        v13:dispatch(l_SetCentralOverlay_0(l_CentralOverlayType_0.AccountSwitchingErrorOverlay, {
            titleTextKey = v4, 
            bodyTextKey = v5, 
            primaryButtonTextKey = v6, 
            secondaryButtonTextKey = v7, 
            primaryButtonCallback = v8, 
            secondaryButtonCallback = v9, 
            errorType = v10, 
            bodyUsername = v11, 
            forceDarkTheme = v12
        }));
    end;
end;