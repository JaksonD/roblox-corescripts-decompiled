local l_script_FirstAncestor_0 = script:FindFirstAncestor("FocusNavigationUtils");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ArgCheck);
local v3 = require(l_script_FirstAncestor_0.ButtonHoldStateEnum);
local v4 = require(l_Parent_0.InputHandlers);
local v5 = require(l_Parent_0.React);
local function v11(v6, v7, v8) --[[ Line: 18 ]] --[[ Name: useFakeCancelHoldAfterBlur ]]
    -- upvalues: v5 (copy)
    local v9 = v5.useCallback(function() --[[ Line: 19 ]]
        -- upvalues: v7 (copy), v8 (copy)
        v7({
            eventData = {
                UserInputState = Enum.UserInputState.End
            }
        });
        v8();
    end, {
        v7, 
        v8
    });
    v5.useEffect(function() --[[ Line: 31 ]]
        -- upvalues: v6 (copy), v9 (copy)
        if v6 and v6:IsA("GuiObject") then
            local v10 = v6.SelectionLost:Connect(v9);
            return function() --[[ Line: 34 ]]
                -- upvalues: v10 (copy)
                v10:Disconnect();
            end;
        else
            return function() --[[ Line: 38 ]]

            end;
        end;
    end, {
        v6, 
        v9
    });
end;
return function(v12, v13, v14) --[[ Line: 42 ]] --[[ Name: useButtonHold ]]
    -- upvalues: v2 (copy), v5 (copy), v3 (copy), v4 (copy), v11 (copy)
    v2.assert(v12 >= 0, "signalHoldIntentSeconds must be greater than or equal to 0");
    v2.assert(v13 > 0, "signalHoldCompleteSeconds must be greater than 0");
    v2.assert(v12 < v13, "signalHoldIntentSeconds should be less than signalHoldCompleteSeconds");
    local v15, v16 = v5.useState(v3.NOT_HELD);
    local v17 = v5.useRef(nil);
    local v18, v19 = v5.useBinding(0);
    local v20, v21 = v5.useState(nil);
    local v22 = v5.useCallback(function() --[[ Line: 59 ]]
        -- upvalues: v17 (copy), v16 (copy), v3 (ref)
        v17.current = tick();
        v16(v3.JUST_PRESSED);
    end, {});
    local v25 = v5.useCallback(function(_) --[[ Line: 64 ]]
        -- upvalues: v2 (ref), v17 (copy), v19 (copy), v18 (copy), v12 (copy), v16 (copy), v3 (ref)
        local v24 = tick();
        v2.assert(v17.current ~= nil, "startTime.current should not be nil");
        if v17.current then
            v2.assert(v17.current <= v24, "startTime.current should be less than or equal to tick()");
            v19(v24 - v17.current);
        end;
        if v18:getValue() >= v12 then
            v16(v3.HOLDING);
        end;
    end, {
        v18, 
        v12
    });
    local v26 = v5.useCallback(function() --[[ Line: 79 ]]
        -- upvalues: v19 (copy), v13 (copy), v17 (copy), v16 (copy), v3 (ref)
        v19(v13);
        v17.current = nil;
        v16(v3.COMPLETED);
    end, {
        v13
    });
    local v27 = v5.useCallback(function() --[[ Line: 85 ]]
        -- upvalues: v19 (copy), v17 (copy), v16 (copy), v3 (ref)
        v19(0);
        v17.current = nil;
        v16(v3.NOT_HELD);
    end, {});
    local v28 = v5.useCallback(v4.handleInput({
        hold = {
            durationSeconds = v13, 
            onStep = v25, 
            onComplete = v26, 
            allowReleaseAfterHold = v14
        }, 
        onPress = v22, 
        onRelease = v27
    }), {
        v27, 
        v25, 
        v26, 
        v13, 
        v14
    });
    local v30 = v5.useCallback(function(v29) --[[ Line: 111 ]]
        -- upvalues: v21 (copy), v28 (copy)
        v21(v29.targetInstance);
        v28(v29);
    end, {
        v28
    });
    v11(v20, v28, v27);
    return {
        eventHandler = v30, 
        holdState = v15, 
        holdTime = v18, 
        holdProgress = v18:map(function(v31) --[[ Line: 122 ]]
            -- upvalues: v13 (copy)
            return v31 / v13;
        end), 
        cancelHold = v27
    };
end;