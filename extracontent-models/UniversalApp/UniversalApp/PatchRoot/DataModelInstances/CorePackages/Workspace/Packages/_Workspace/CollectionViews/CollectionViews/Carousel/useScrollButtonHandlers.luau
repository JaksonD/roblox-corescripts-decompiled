local l_TweenService_0 = game:GetService("TweenService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_Parent_0 = script:FindFirstAncestor("CollectionViews").Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.ArgCheck);
return function(v5, v6, v7, v8, v9, v10, v11) --[[ Line: 10 ]] --[[ Name: useScrollButtonHandlers ]]
    -- upvalues: v4 (copy), v3 (copy), l_UserGameSettings_0 (copy), l_TweenService_0 (copy)
    v4.assert(v8 >= 1);
    v4.assert(v6 >= 0);
    local v12, v13 = v3.useState(false);
    local v14, v15 = v3.useState(v7);
    local v16 = v3.useRef(0);
    local v17 = math.max(0, v6 - v8);
    local v18 = v3.useRef(nil);
    local v20 = v3.useCallback(function(v19) --[[ Line: 31 ]]
        -- upvalues: v16 (copy), v17 (copy)
        v16.current = math.max(0, (math.min(v17, v19)));
        return v16.current;
    end, {
        v17, 
        v16
    });
    local v21 = v3.useCallback(function() --[[ Line: 38 ]]
        -- upvalues: v7 (copy), v13 (copy), v15 (copy), v16 (copy), v17 (copy)
        if not v7 then
            v13(false);
            v15(false);
            return;
        else
            v13(v16.current > 0);
            v15(v16.current < v17);
            return;
        end;
    end, {
        v7, 
        v17, 
        v16
    });
    local v28 = v3.useCallback(function(v22, v23) --[[ Line: 56 ]]
        -- upvalues: v5 (copy), v9 (copy), v10 (copy), l_UserGameSettings_0 (ref), v18 (copy), l_TweenService_0 (ref), v11 (copy), v21 (copy)
        local l_current_0 = v5.current;
        if l_current_0 ~= nil then
            local v25 = v22 * (v9:getValue().X + v10);
            local l_CanvasPosition_0 = l_current_0.CanvasPosition;
            local v27 = Vector2.new(v25, l_CanvasPosition_0.Y);
            if v23 and not l_UserGameSettings_0.ReducedMotion then
                if v18.current then
                    v18.current:Cancel();
                end;
                v18.current = l_TweenService_0:Create(l_current_0, TweenInfo.new(v11 or 0.75, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {
                    CanvasPosition = v27
                }):Play();
                return;
            else
                l_current_0.CanvasPosition = v27;
                v21();
            end;
        end;
    end, {
        v21, 
        v9, 
        v10, 
        v18, 
        v11, 
        v5
    });
    local v30 = v3.useCallback(function() --[[ Line: 86 ]]
        -- upvalues: v20 (copy), v16 (copy), v8 (copy), v28 (copy)
        local v29 = v20(v16.current - v8);
        v28(v29, true);
    end, {
        v28, 
        v20, 
        v8, 
        v16
    });
    local v32 = v3.useCallback(function() --[[ Line: 91 ]]
        -- upvalues: v20 (copy), v16 (copy), v8 (copy), v28 (copy)
        local v31 = v20(v16.current + v8);
        v28(v31, true);
    end, {
        v28, 
        v20, 
        v8, 
        v16
    });
    v3.useEffect(function() --[[ Line: 99 ]]
        -- upvalues: v20 (copy), v16 (copy), v7 (copy), v28 (copy), v21 (copy)
        v20(v16.current);
        if v7 then
            v28(v16.current);
        end;
        v21();
    end, {
        v20, 
        v28, 
        v7
    });
    v3.useEffect(function() --[[ Line: 115 ]]
        -- upvalues: v7 (copy), v5 (copy), v20 (copy), v16 (copy), v28 (copy), v21 (copy)
        if not v7 then
            return nil;
        else
            local v33 = {};
            if v5.current ~= nil then
                local l_current_1 = v5.current;
                table.insert(v33, l_current_1:GetPropertyChangedSignal("CanvasSize"):Connect(function() --[[ Line: 125 ]]
                    -- upvalues: v20 (ref), v16 (ref), v28 (ref), v21 (ref)
                    v20(v16.current);
                    v28(v16.current);
                    v21();
                end));
                table.insert(v33, l_current_1:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ Line: 134 ]]
                    -- upvalues: v20 (ref), v16 (ref), v21 (ref)
                    v20(v16.current);
                    v21();
                end));
            end;
            return function() --[[ Line: 141 ]]
                -- upvalues: v33 (copy)
                for _, v36 in v33 do
                    v36:Disconnect();
                end;
            end;
        end;
    end, {
        v28, 
        v16, 
        v5, 
        v7, 
        v20
    });
    return v30, v32, v12, v14;
end;