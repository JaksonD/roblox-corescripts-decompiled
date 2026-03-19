local l_script_FirstAncestor_0 = script:FindFirstAncestor("HoldToPlay");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.FocusNavigationUtils);
local l_useButtonHold_0 = v3.useButtonHold;
local v5 = require(l_script_FirstAncestor_0.Constants);
local l_ButtonHoldStateEnum_0 = v3.ButtonHoldStateEnum;
return function(v7, v8) --[[ Line: 13 ]] --[[ Name: useHoldToPlayStateAndCallbacks ]]
    -- upvalues: l_useButtonHold_0 (copy), v5 (copy), v2 (copy), l_ButtonHoldStateEnum_0 (copy)
    local v9 = l_useButtonHold_0(v7 or v5.SIGNAL_HOLD_INTENT_SECONDS, v8 or v5.SIGNAL_HOLD_COMPLETE_SECONDS);
    local v10, v11 = v2.useState(nil);
    local v12, v13 = v2.useState(nil);
    local v14, v15 = v2.useState(nil);
    local v19 = v2.useCallback(function(v16, v17, v18) --[[ Line: 24 ]]
        -- upvalues: v15 (copy), v13 (copy), v11 (copy)
        v15(v16);
        v13(v17);
        v11(v18);
    end, {});
    local v20 = v2.useCallback(function() --[[ Line: 30 ]]
        -- upvalues: v11 (copy), v13 (copy), v15 (copy)
        v11(nil);
        v13(nil);
        v15(nil);
    end, {});
    local v21 = true;
    if v9.holdState ~= l_ButtonHoldStateEnum_0.HOLDING then
        v21 = v9.holdState == l_ButtonHoldStateEnum_0.COMPLETED;
    end;
    local v23 = v2.useCallback(function(v22) --[[ Line: 38 ]]
        -- upvalues: v21 (copy), v12 (copy)
        return v21 and v12 and v22 == v12;
    end, {
        v21, 
        v12
    });
    local v24 = v14 ~= nil;
    return {
        selectedEntry = v14, 
        selectedIndex = v12, 
        selectedNavigationUniverseId = v10, 
        onHoldableFocused = v19, 
        onHoldableUnfocused = v20, 
        shouldRenderHoldToPlayLauncher = v24, 
        shouldDisableHoldable = v23, 
        holdState = v9.holdState, 
        holdProgress = v9.holdProgress, 
        cancelHold = v9.cancelHold, 
        holdToPlayEventHandler = v9.eventHandler
    };
end;