local l_script_FirstAncestor_0 = script:FindFirstAncestor("VariableItemWidthCarousel");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_TweenService_0 = game:GetService("TweenService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local function v7(v5, v6) --[[ Line: 8 ]] --[[ Name: clampTargetCanvasPosition ]]
    return Vector2.new(math.round((math.clamp(v6, 0, v5.AbsoluteCanvasSize.X - v5.AbsoluteSize.X))), 0);
end;
useVariableItemWidthScrollHandlers = function(v8, v9, v10, v11, v12) --[[ Line: 15 ]] --[[ Name: useVariableItemWidthScrollHandlers ]]
    -- upvalues: v4 (copy), l_UserGameSettings_0 (copy), l_TweenService_0 (copy), v7 (copy)
    local v13 = v4.useRef(nil);
    local v14 = v4.useRef(0);
    local v15 = v4.useRef(0);
    local v16, v17 = v4.useState(false);
    local v18, v19 = v4.useState(true);
    local v20, v21 = v4.useState(Vector2.zero);
    local v25 = v4.useMemo(function() --[[ Line: 28 ]]
        -- upvalues: v8 (copy), v10 (copy)
        local v22 = {
            [0] = 0
        };
        for v23, _ in ipairs(v8) do
            v22[v23] = v10(v23);
        end;
        return v22;
    end, {
        v8, 
        v10
    });
    v4.useEffect(function() --[[ Line: 36 ]]
        -- upvalues: v11 (copy), v21 (copy)
        local v26 = nil;
        if v11.current then
            local l_current_0 = v11.current;
            v21(l_current_0.AbsoluteSize);
            v26 = l_current_0:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 44 ]]
                -- upvalues: v21 (ref), l_current_0 (copy)
                v21(l_current_0.AbsoluteSize);
            end);
        end;
        return function() --[[ Line: 49 ]]
            -- upvalues: v26 (ref)
            if v26 then
                v26:Disconnect();
            end;
        end;
    end, {
        v11
    });
    local v31 = v4.useCallback(function(v28, v29) --[[ Line: 57 ]]
        -- upvalues: v13 (copy), v14 (copy), l_UserGameSettings_0 (ref), v12 (copy), l_TweenService_0 (ref)
        if v13.current then
            v13.current:Cancel();
        end;
        v14.current = v29.X;
        if l_UserGameSettings_0.ReducedMotion then
            v28.CanvasPosition = v29;
            return;
        else
            local v30 = TweenInfo.new(v12 or 0.75, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut);
            v13.current = l_TweenService_0:Create(v28, v30, {
                CanvasPosition = v29
            }):Play();
            return;
        end;
    end, {
        l_UserGameSettings_0.ReducedMotion, 
        v12
    });
    local v33 = v4.useCallback(function() --[[ Line: 73 ]]
        -- upvalues: v11 (copy), v17 (copy), v14 (copy), v19 (copy), v20 (copy)
        local l_current_1 = v11.current;
        if l_current_1 then
            v17(v14.current > 0);
            v19(v14.current < l_current_1.AbsoluteCanvasSize.X - v20.X);
            return;
        else
            v17(false);
            v19(false);
            return;
        end;
    end, {
        v17, 
        v19, 
        v20
    });
    local v38 = v4.useCallback(function(_) --[[ Line: 84 ]]
        -- upvalues: v8 (copy), v25 (copy), v9 (copy), v20 (copy)
        local v35 = 0;
        for v36 = #v8, 1, -1 do
            local v37 = v25[v36];
            v35 = v35 + (v37 + (v37 > 0 and v9 or 0));
            if v20.X <= v35 then
                return v36;
            end;
        end;
        return 1;
    end, {
        v8, 
        v25, 
        v9, 
        v20
    });
    local v52 = v4.useCallback(function(v39, v40) --[[ Line: 97 ]]
        -- upvalues: v20 (copy), v15 (copy), v8 (copy), v25 (copy), v9 (copy), v38 (copy)
        local l_X_0 = v20.X;
        local v42 = 0;
        local l_current_2 = v15.current;
        local v44 = 0;
        local v45 = 0;
        for v46 = math.max(l_current_2, 1), #v8 do
            local v47 = v25[v46];
            v45 = v45 + (v47 + (v47 > 0 and v9 or 0));
            if l_X_0 > v45 then
                v44 = v44 + 1;
            else
                break;
            end;
        end;
        local v48 = math.clamp(math.max(1, v44) * v40, -#v8, #v8);
        for v49 = 0, math.clamp(l_current_2 + v48, 0, #v8) do
            local v50 = v25[v49];
            v42 = v42 + (v50 + (v50 > 0 and v9 or 0));
        end;
        local v51 = math.clamp(l_current_2 + v48, 0, v38(v39));
        return Vector2.new(math.round((math.clamp(v42, 0, v39.AbsoluteCanvasSize.X - v39.AbsoluteSize.X))), 0), v51;
    end, {
        v8, 
        v25, 
        v9, 
        v7, 
        v38, 
        v20
    });
    local v56 = v4.useCallback(function() --[[ Line: 132 ]]
        -- upvalues: v11 (copy), v52 (copy), v15 (copy), v31 (copy), v33 (copy)
        local l_current_3 = v11.current;
        if l_current_3 then
            local v54, v55 = v52(l_current_3, -1);
            v15.current = v55;
            v31(l_current_3, v54);
            v33();
        end;
    end, {
        v31, 
        v33, 
        v52
    });
    local v60 = v4.useCallback(function() --[[ Line: 149 ]]
        -- upvalues: v11 (copy), v52 (copy), v15 (copy), v31 (copy), v33 (copy)
        local l_current_4 = v11.current;
        if l_current_4 then
            local v58, v59 = v52(l_current_4, 1);
            v15.current = v59;
            v31(l_current_4, v58);
            v33();
        end;
    end, {
        v31, 
        v33, 
        v52
    });
    v4.useEffect(v33, {
        v33
    });
    return v56, v60, v16, v18, v33;
end;
return useVariableItemWidthScrollHandlers;