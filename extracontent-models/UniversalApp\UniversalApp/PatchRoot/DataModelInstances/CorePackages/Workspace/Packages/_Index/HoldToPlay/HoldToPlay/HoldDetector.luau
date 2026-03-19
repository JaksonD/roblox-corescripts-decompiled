local l_script_FirstAncestor_0 = script:FindFirstAncestor("HoldToPlay");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useSelected_0 = require(l_Parent_0.GuiObjectUtils).useSelected;
local v4 = require(l_Parent_0.FocusNavigationUtils);
local v5 = require(l_Parent_0.ReactFocusNavigation);
local l_AppShortcutBarContext_0 = require(l_Parent_0.AppShortcutBar).AppShortcutBarContext;
local l_useButtonHold_0 = v4.useButtonHold;
local l_ButtonHoldStateEnum_0 = v4.ButtonHoldStateEnum;
local v9 = require(l_script_FirstAncestor_0.Constants);
local function v28(v10) --[[ Line: 29 ]] --[[ Name: HoldDetectorForSelectedObject ]]
    -- upvalues: v2 (copy), l_useButtonHold_0 (copy), v9 (copy), l_AppShortcutBarContext_0 (copy), l_ButtonHoldStateEnum_0 (copy), v5 (copy)
    local v11, v12 = v2.useState(nil);
    local v13, v14 = v2.useState(nil);
    local v15 = v11 or v10.keyCode;
    local v16 = v13 or v10.focusNavigationEventName;
    local v17 = v2.useRef(false);
    local v18 = v2.useRef(false);
    local v19 = l_useButtonHold_0(v9.SIGNAL_HOLD_INTENT_SECONDS, v9.SIGNAL_HOLD_COMPLETE_SECONDS, true);
    local v20 = l_AppShortcutBarContext_0.useDispatchButtonHoldStarted();
    local v21 = l_AppShortcutBarContext_0.useDispatchButtonHoldEnded();
    local v22 = true;
    if v19.holdState ~= l_ButtonHoldStateEnum_0.HOLDING then
        v22 = true;
        if v19.holdState ~= l_ButtonHoldStateEnum_0.JUST_PRESSED then
            v22 = v19.holdState == l_ButtonHoldStateEnum_0.COMPLETED;
        end;
    end;
    v2.useEffect(function() --[[ Line: 55 ]]
        -- upvalues: v22 (copy), v10 (copy)
        if not v22 and v10.setDisabledForHold then
            v10.setDisabledForHold(false);
        end;
        return function() --[[ Line: 61 ]]
            -- upvalues: v10 (ref)
            if v10.setDisabledForHold then
                v10.setDisabledForHold(false);
            end;
        end;
    end, {
        v22, 
        v10.setDisabledForHold
    });
    v2.useEffect(function() --[[ Line: 75 ]]
        -- upvalues: v17 (copy), v22 (copy), v10 (copy), v20 (copy), v19 (copy), v12 (copy), v14 (copy), v16 (copy), v21 (copy), v18 (copy)
        if not v17.current and v22 then
            v17.current = true;
            if v10.focusNavigationEventName then
                v20(v10.focusNavigationEventName, v19.holdProgress);
            end;
            v12(v10.keyCode);
            v14(v10.focusNavigationEventName);
            return;
        else
            if v17.current and not v22 then
                if v16 then
                    v21(v16);
                end;
                v12(nil);
                v14(nil);
                v17.current = false;
                if v18.current then
                    v18.current = false;
                end;
            end;
            return;
        end;
    end, {
        v22, 
        v19.holdProgress, 
        v20, 
        v21, 
        v10.focusNavigationEventName, 
        v10.keyCode, 
        v16, 
        v15
    });
    local v23 = false;
    if v19.holdState == l_ButtonHoldStateEnum_0.COMPLETED then
        v23 = v18.current == false;
    end;
    v2.useEffect(function() --[[ Line: 113 ]]
        -- upvalues: v23 (copy), v10 (copy), v18 (copy)
        if v23 and v10.onHoldDetected then
            v18.current = true;
            if v10.setDisabledForHold then
                v10.setDisabledForHold(true);
            end;
            v10.onHoldDetected(v10.guiObject);
        end;
    end, {
        v23, 
        v10.onHoldDetected, 
        v10.guiObject, 
        v10.setDisabledForHold
    });
    local v24 = v2.useMemo(function() --[[ Line: 133 ]]
        -- upvalues: v15 (copy), v16 (copy)
        if v15 and v16 then
            return {
                [v15] = v16
            };
        else
            return {};
        end;
    end, {
        v15, 
        v16
    });
    local v25 = v2.useMemo(function() --[[ Line: 143 ]]
        -- upvalues: v16 (copy), v19 (copy)
        if v16 then
            return {
                [v16] = {
                    handler = v19.eventHandler
                }
            };
        else
            return {};
        end;
    end, {
        v19.eventHandler, 
        v16
    });
    local v26 = v5.useEventMap(v24);
    local v27 = v5.useEventHandlerMap(v25, v26);
    v2.useEffect(function() --[[ Line: 159 ]]
        -- upvalues: v27 (copy), v10 (copy)
        if v27 then
            v27(v10.guiObject);
        end;
        return function() --[[ Line: 163 ]]
            -- upvalues: v27 (ref)
            v27(nil);
        end;
    end, {
        v27, 
        v10.guiObject
    });
    return nil;
end;
return v2.memo(function(v29) --[[ Line: 171 ]] --[[ Name: HoldDetector ]]
    -- upvalues: l_useSelected_0 (copy), v2 (copy), v28 (copy)
    if l_useSelected_0({
        current = v29.guiObject
    }) then
        return v2.createElement(v28, v29);
    else
        return nil;
    end;
end);