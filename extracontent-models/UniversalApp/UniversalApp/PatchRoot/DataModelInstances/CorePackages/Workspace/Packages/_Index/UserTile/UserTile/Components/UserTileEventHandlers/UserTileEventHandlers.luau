local l_Parent_0 = script:FindFirstAncestor("UserTile").Parent;
local v1 = require(l_Parent_0.React);
local l_HoldDetector_0 = require(l_Parent_0.HoldToPlay).HoldDetector;
local v3 = require(l_Parent_0.ReactFocusNavigation);
local v4 = require(l_Parent_0.InputHandlers);
local _ = require(l_Parent_0.FocusNavigationUtils);
local v6 = {
    primary = Enum.KeyCode.ButtonA, 
    secondary = Enum.KeyCode.ButtonX
};
return function(v7) --[[ Line: 30 ]] --[[ Name: UserTileEventHandlers ]]
    -- upvalues: v1 (copy), v6 (copy), v4 (copy), v3 (copy), l_HoldDetector_0 (copy)
    local l_tileRef_0 = v7.tileRef;
    local l_buttons_0 = v7.buttons;
    local l_onTileActivated_0 = v7.onTileActivated;
    local v11 = v1.useRef(false);
    local v13 = v1.useCallback(function(v12) --[[ Line: 36 ]]
        -- upvalues: v11 (copy)
        v11.current = v12;
    end, {});
    local v14, v15 = v1.useMemo(function() --[[ Line: 40 ]]
        -- upvalues: l_buttons_0 (copy)
        if l_buttons_0 then
            return l_buttons_0[#l_buttons_0], l_buttons_0[#l_buttons_0 - 1];
        else
            return nil, nil;
        end;
    end, {
        l_buttons_0
    });
    local v16 = v1.useCallback(function() --[[ Line: 47 ]]
        -- upvalues: v11 (copy), l_onTileActivated_0 (copy)
        if v11.current then
            return;
        else
            l_onTileActivated_0();
            return;
        end;
    end, {
        l_onTileActivated_0
    });
    local v17 = v1.useCallback(function() --[[ Line: 54 ]]
        -- upvalues: v14 (copy)
        if v14 and v14.onActivated then
            v14.onActivated();
        end;
    end, {
        v14
    });
    local v18 = v1.useCallback(function() --[[ Line: 60 ]]
        -- upvalues: v15 (copy)
        if v15 and v15.onActivated then
            v15.onActivated();
        end;
    end, {
        v15
    });
    local v20, v21 = v1.useMemo(function() --[[ Line: 66 ]]
        -- upvalues: v15 (copy), v6 (ref), v4 (ref), v18 (copy)
        local v19 = if v15 then v15.focusEventName else nil;
        if v19 then
            return {
                [v6.secondary] = v19
            }, {
                [v19] = {
                    handler = v4.onRelease(v18)
                }
            };
        else
            return {}, {};
        end;
    end, {
        v15, 
        v18
    });
    local v22 = v3.useEventMap(v20);
    local v23 = v3.useEventHandlerMap(v21, v22);
    v1.useEffect(function() --[[ Line: 87 ]]
        -- upvalues: v23 (copy), l_tileRef_0 (copy)
        if v23 and l_tileRef_0 then
            v23(l_tileRef_0.current);
        end;
        return function() --[[ Line: 91 ]]
            -- upvalues: v23 (ref)
            v23(nil);
        end;
    end, {
        v23
    });
    local v24 = v14 and v14.focusEventName or nil;
    if l_tileRef_0.current and v24 then
        return (v1.createElement(l_HoldDetector_0, {
            guiObject = l_tileRef_0.current, 
            onHoldDetected = v17, 
            onRegularActivated = v16, 
            setDisabledForHold = v13, 
            keyCode = v6.primary, 
            focusNavigationEventName = v24
        }));
    else
        return nil;
    end;
end;