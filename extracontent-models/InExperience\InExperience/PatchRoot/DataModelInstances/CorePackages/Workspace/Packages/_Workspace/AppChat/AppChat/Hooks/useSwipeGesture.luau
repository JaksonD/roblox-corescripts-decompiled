local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactOtter);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_script_FirstAncestor_0.Enums.SwipeDirection);
local v6 = game:DefineFastInt("AppChatSwipeStartThreshold", 10);
local v7 = game:DefineFastInt("AppChatSwipeCompleteThreshold", 50);
local v8 = game:DefineFastInt("AppChatSwipeMaxVerticalDrift", 35);
local v9 = game:DefineFastFlag("AppChatGlobalSwipeTracking", false);
local v10 = nil;
local v11 = {
    frequency = 4, 
    dampingRatio = 0.8
};
local v12 = {
    onSwipeComplete = function() --[[ Line: 34 ]] --[[ Name: onSwipeComplete ]]

    end, 
    direction = v5.Right, 
    swipeStartThreshold = v6, 
    swipeCompleteThreshold = v7, 
    swipeMaxVerticalDrift = v8
};
return function(v13) --[[ Line: 47 ]] --[[ Name: useSwipeGesture ]]
    -- upvalues: v4 (copy), v12 (copy), v3 (copy), v2 (copy), v9 (copy), v10 (ref), v11 (copy), v5 (copy)
    local v14 = v4.Dictionary.union(v12, v13);
    local v15, v16 = v3.useAnimatedBinding(0);
    local v18 = v2.useMemo(function() --[[ Line: 51 ]]
        -- upvalues: v15 (copy), v14 (copy)
        return v15:map(function(v17) --[[ Line: 52 ]]
            -- upvalues: v14 (ref)
            return (math.clamp(v17 / v14.swipeCompleteThreshold, 0, 1));
        end);
    end, {
        v15, 
        v14.swipeCompleteThreshold
    });
    local v19 = v2.useRef(nil);
    local v20 = v2.useRef(nil);
    local v21 = v2.useRef(Vector2.zero);
    local v22 = v2.useRef(false);
    local v32 = v2.useMemo(function() --[[ Line: 62 ]]
        -- upvalues: v19 (copy), v9 (ref), v10 (ref), v21 (copy), v20 (copy), v22 (copy), v16 (copy), v3 (ref), v11 (ref), v14 (copy)
        local function v23() --[[ Line: 63 ]]
            -- upvalues: v19 (ref)
            return v19.current;
        end;
        local function v26(v24, v25) --[[ Line: 66 ]]
            -- upvalues: v9 (ref), v10 (ref), v19 (ref), v21 (ref), v20 (ref)
            if v9 then
                v10 = v24;
            end;
            v19.current = v24;
            v21.current = Vector2.new(v24.Position.X, v24.Position.Y);
            v20.current = v24.Changed:Connect(function() --[[ Line: 72 ]]
                -- upvalues: v25 (copy)
                v25();
            end);
        end;
        local function v27() --[[ Line: 76 ]]
            -- upvalues: v20 (ref)
            if v20.current then
                v20.current:Disconnect();
                v20.current = nil;
            end;
        end;
        local function v28() --[[ Line: 82 ]]
            -- upvalues: v9 (ref), v10 (ref), v19 (ref), v22 (ref), v20 (ref), v16 (ref), v3 (ref), v11 (ref)
            if v9 and v10 == v19.current then
                v10 = nil;
            end;
            v19.current = nil;
            v22.current = false;
            if v20.current then
                v20.current:Disconnect();
                v20.current = nil;
            end;
            v16(v3.spring(0, v11));
        end;
        local function v29() --[[ Line: 91 ]]
            -- upvalues: v22 (ref)
            return v22.current;
        end;
        local function v31(v30) --[[ Line: 94 ]]
            -- upvalues: v16 (ref), v3 (ref), v11 (ref), v22 (ref), v14 (ref)
            v16(v3.spring(v30, v11));
            if not v22.current and v14.swipeCompleteThreshold < v30 then
                v22.current = true;
                if v14.onSwipeThresholdReached then
                    v14.onSwipeThresholdReached();
                    return;
                end;
            elseif v22.current and v30 <= v14.swipeCompleteThreshold then
                v22.current = false;
            end;
        end;
        return {
            getActiveInput = v23, 
            setOffset = v31, 
            isPastCompleteThreshold = v29, 
            startSwipe = v26, 
            resetSwipe = v28, 
            disconnectInputListener = v27
        };
    end, {
        v16
    });
    local v38 = v2.useCallback(function() --[[ Line: 116 ]]
        -- upvalues: v32 (copy), v14 (copy), v21 (copy), v5 (ref)
        local v33 = v32.getActiveInput();
        if not v33 then
            return;
        elseif v33.UserInputState == Enum.UserInputState.End or v33.UserInputState == Enum.UserInputState.Cancel then
            if v32.isPastCompleteThreshold() then
                v14.onSwipeComplete();
            end;
            v32.resetSwipe();
            return;
        else
            local v34 = Vector2.new(v33.Position.X, v33.Position.Y) - v21.current;
            local v35 = if v14.direction == v5.Right then v34.X else -v34.X;
            local v36 = math.abs(v34.Y);
            if v35 < v14.swipeStartThreshold or v14.swipeMaxVerticalDrift < v36 then
                v32.setOffset(0);
                return;
            else
                local v37 = math.max(0, v35);
                v32.setOffset(v37);
                return;
            end;
        end;
    end, {
        v32, 
        v14.swipeCompleteThreshold, 
        v14.swipeMaxVerticalDrift, 
        v14.direction, 
        v16
    });
    v2.useEffect(function() --[[ Line: 159 ]]
        -- upvalues: v32 (copy)
        return v32.resetSwipe;
    end, {
        v32.resetSwipe
    });
    local v41 = v2.useCallback(function(_, v40) --[[ Line: 163 ]]
        -- upvalues: v9 (ref), v10 (ref), v32 (copy), v38 (copy)
        if v9 and v10 ~= nil then
            return;
        elseif v32.getActiveInput() ~= nil then
            return;
        else
            if v40.UserInputType == Enum.UserInputType.Touch or v40.UserInputType == Enum.UserInputType.MouseButton1 then
                v32.startSwipe(v40, v38);
            end;
            return;
        end;
    end, {});
    return v2.useMemo(function() --[[ Line: 181 ]]
        -- upvalues: v15 (copy), v18 (copy), v41 (copy)
        return {
            swipeOffset = v15, 
            swipeProgress = v18, 
            onInputBegan = v41
        };
    end, {
        v15, 
        v18, 
        v41
    });
end;