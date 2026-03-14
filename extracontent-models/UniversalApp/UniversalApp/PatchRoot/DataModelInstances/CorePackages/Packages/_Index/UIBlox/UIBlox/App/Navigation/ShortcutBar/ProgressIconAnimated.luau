local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v3 = require(l_Parent_0.React);
local _ = require(script.Parent.Types);
local v5 = require(script.Parent.ProgressIcon);
local function v29(v6, v7, v8) --[[ Line: 33 ]] --[[ Name: useRenderStepped ]]
    -- upvalues: v3 (copy), l_RunService_0 (copy)
    local v9 = v3.useRef(0);
    local v10 = v3.useRef(0);
    local l_isAnimationRunning_0 = v6.isAnimationRunning;
    local l_isKeyPressed_0 = v6.isKeyPressed;
    local l_isKeyHolding_0 = v6.isKeyHolding;
    local l_onKeyHolding_0 = v7.onKeyHolding;
    local l_onAnimationRunning_0 = v7.onAnimationRunning;
    local l_onComplete_0 = v7.onComplete;
    local l_onReset_0 = v7.onReset;
    local l_animationTriggerTime_0 = v8.animationTriggerTime;
    local l_animationKeyHoldingTime_0 = v8.animationKeyHoldingTime;
    local l_animationCoolDownTime_0 = v8.animationCoolDownTime;
    local v22 = v3.useCallback(function(v21) --[[ Line: 54 ]]
        -- upvalues: v10 (copy), l_animationTriggerTime_0 (copy), l_onKeyHolding_0 (copy)
        v10.current = v10.current + v21;
        if v10.current >= l_animationTriggerTime_0 then
            l_onKeyHolding_0();
        end;
    end, {
        l_onKeyHolding_0, 
        l_animationTriggerTime_0
    });
    local v24 = v3.useCallback(function(v23) --[[ Line: 61 ]]
        -- upvalues: v9 (copy), l_animationKeyHoldingTime_0 (copy), l_onAnimationRunning_0 (copy), l_onComplete_0 (copy)
        v9.current = math.clamp(v9.current + v23 / l_animationKeyHoldingTime_0, 0, 1);
        l_onAnimationRunning_0(v9.current);
        if v9.current >= 1 then
            l_onComplete_0();
        end;
    end, {
        l_onAnimationRunning_0, 
        l_animationKeyHoldingTime_0, 
        l_onComplete_0
    });
    local v26 = v3.useCallback(function(v25) --[[ Line: 69 ]]
        -- upvalues: v9 (copy), l_animationCoolDownTime_0 (copy), l_onAnimationRunning_0 (copy), l_onReset_0 (copy)
        v9.current = math.clamp(v9.current - v25 / l_animationCoolDownTime_0, 0, 1);
        l_onAnimationRunning_0(v9.current);
        if v9.current <= 0 then
            l_onReset_0();
        end;
    end, {
        l_onAnimationRunning_0, 
        l_animationCoolDownTime_0, 
        l_onReset_0
    });
    v3.useEffect(function() --[[ Line: 77 ]]
        -- upvalues: l_isKeyHolding_0 (copy), v9 (copy), v24 (copy), l_isKeyPressed_0 (copy), v22 (copy), l_isAnimationRunning_0 (copy), v26 (copy), l_RunService_0 (ref), v10 (copy)
        local v27 = nil;
        local v28 = nil;
        if l_isKeyHolding_0 then
            v9.current = 0;
            v28 = v24;
        elseif l_isKeyPressed_0 then
            v28 = v22;
        elseif l_isAnimationRunning_0 then
            v28 = v26;
        end;
        if v28 then
            v27 = l_RunService_0.RenderStepped:Connect(v28);
        end;
        if v27 then
            return function() --[[ Line: 94 ]]
                -- upvalues: l_isKeyPressed_0 (ref), v10 (ref), v27 (ref)
                if l_isKeyPressed_0 then
                    v10.current = 0;
                end;
                v27:Disconnect();
            end;
        else
            return function() --[[ Line: 102 ]]

            end;
        end;
    end, {
        l_isKeyPressed_0, 
        l_isKeyHolding_0, 
        l_isAnimationRunning_0, 
        v22, 
        v24, 
        v26
    });
end;
return function(v30) --[[ Line: 113 ]] --[[ Name: ProgressIconAnimated ]]
    -- upvalues: v3 (copy), v29 (copy), l_UserInputService_0 (copy), v5 (copy)
    local v31, v32 = v3.useState(false);
    local v33, v34 = v3.useState(false);
    local v35, v36 = v3.useState(false);
    local v37, v38 = v3.useState(false);
    local v39, v40 = v3.useBinding(nil);
    local v41 = v3.useCallback(function() --[[ Line: 121 ]]
        -- upvalues: v34 (copy), v36 (copy)
        v34(true);
        v36(true);
    end, {});
    local v43 = v3.useCallback(function(v42) --[[ Line: 126 ]]
        -- upvalues: v40 (copy)
        v40(v42);
    end, {});
    local v44 = v3.useCallback(function() --[[ Line: 130 ]]
        -- upvalues: v32 (copy), v34 (copy), v36 (copy), v38 (copy), v30 (copy)
        v32(false);
        v34(false);
        v36(false);
        v38(true);
        if v30.onHoldComplete then
            v30.onHoldComplete();
        end;
    end, {
        v30.onHoldComplete
    });
    local v45 = v3.useCallback(function() --[[ Line: 140 ]]
        -- upvalues: v36 (copy), v40 (copy)
        v36(false);
        v40(nil);
    end, {});
    v29({
        isKeyPressed = v31, 
        isKeyHolding = v33, 
        isAnimationRunning = v35
    }, {
        onKeyHolding = v41, 
        onAnimationRunning = v43, 
        onComplete = v44, 
        onReset = v45
    }, {
        animationTriggerTime = v30.animationTriggerTime, 
        animationKeyHoldingTime = v30.animationKeyHoldingTime, 
        animationCoolDownTime = v30.animationCoolDownTime
    });
    local v47 = v3.useCallback(function(v46) --[[ Line: 160 ]]
        -- upvalues: v30 (copy), v32 (copy), v38 (copy), v35 (copy), v34 (copy), v40 (copy)
        if v46.UserInputType ~= Enum.UserInputType.Keyboard and v46.UserInputType ~= Enum.UserInputType.Gamepad1 then
            return;
        else
            if v46.KeyCode == v30.keyCode then
                if v46.UserInputState == Enum.UserInputState.Begin then
                    v32(true);
                    v38(false);
                    if v35 then
                        v34(true);
                        return;
                    else
                        v40(nil);
                        return;
                    end;
                elseif v46.UserInputState == Enum.UserInputState.End then
                    v32(false);
                    v34(false);
                end;
            end;
            return;
        end;
    end, {
        v30.keyCode, 
        v35
    });
    v3.useEffect(function() --[[ Line: 184 ]]
        -- upvalues: v30 (copy), l_UserInputService_0 (ref), v47 (copy)
        if v30.progress then
            return function() --[[ Line: 186 ]]

            end;
        else
            local v48 = l_UserInputService_0.InputBegan:Connect(v47);
            local v49 = l_UserInputService_0.InputEnded:Connect(v47);
            return function() --[[ Line: 191 ]]
                -- upvalues: v48 (copy), v49 (copy)
                v48:Disconnect();
                v49:Disconnect();
            end;
        end;
    end, {
        v47, 
        v30.progress
    });
    local v50 = false;
    if v30.progress or v33 or v35 or v37 then
        v50 = true;
    end;
    return v3.createElement(v5, {
        progress = v30.progress or v39, 
        icon = v30.icon, 
        iconHolding = v30.iconHolding, 
        isHolding = v50
    });
end;