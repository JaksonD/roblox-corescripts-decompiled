local l_Parent_0 = script:FindFirstAncestor("InputUi").Parent;
local v1 = require(l_Parent_0.React);
local l_useInputType_0 = require(l_Parent_0.RoactUtils).Hooks.useInputType;
local l_InputTypeConstants_0 = require(l_Parent_0.InputType).InputTypeConstants;
local l_useIsGamepad_0 = require(l_Parent_0.RoactUtils).Hooks.useIsGamepad;
local v5 = require(script.Parent.useGamepadConnectedEvent);
local v6 = game:DefineFastFlag("EnableGamepadHookForCorescriptGlobalEffects", false);
return function(v7, v8, v9, v10) --[[ Line: 11 ]] --[[ Name: useGamepadDisconnectOverlayEffect ]]
    -- upvalues: v6 (copy), l_useIsGamepad_0 (copy), l_useInputType_0 (copy), l_InputTypeConstants_0 (copy), v1 (copy), v5 (copy)
    local v11 = nil;
    v11 = if v6 then l_useIsGamepad_0() else l_useInputType_0() == l_InputTypeConstants_0.Gamepad;
    local v12 = v1.useRef(false);
    local v14 = v1.useCallback(function() --[[ Line: 26 ]]
        -- upvalues: v12 (copy), v9 (copy), v10 (copy), v8 (copy)
        if v12.current then
            local v13 = {
                connectionEvent = "gamepadReconnected"
            };
            v9:sendEventDeferred(v10 or "", "gamepadConnectionEvent", v13);
            v12.current = false;
            v8();
        end;
    end, {
        v8
    });
    local v16 = v1.useCallback(function() --[[ Line: 38 ]]
        -- upvalues: v11 (ref), v12 (copy), v9 (copy), v10 (copy), v7 (copy)
        if not v11 then
            return;
        else
            if not v12.current then
                local v15 = {
                    connectionEvent = "gamepadDisconnected"
                };
                v9:sendEventDeferred(v10 or "", "gamepadConnectionEvent", v15);
                v12.current = true;
                v7();
            end;
            return;
        end;
    end, {
        v11, 
        v7
    });
    v5(v14, v16);
end;