local l_TweenService_0 = game:GetService("TweenService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CollectionViews");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.ArgCheck);
local l_FFlagCollectionViewMathChanges_0 = require(l_Parent_0.SharedFlags).FFlagCollectionViewMathChanges;
local _ = require(l_script_FirstAncestor_0.Carousel.calculateCarouselSpacingMetrics);
return function(v8, v9, v10, v11, v12, v13, v14, v15) --[[ Line: 16 ]] --[[ Name: useScrollButtonHandlers ]]
    -- upvalues: v5 (copy), v4 (copy), l_FFlagCollectionViewMathChanges_0 (copy), l_UserGameSettings_0 (copy), l_TweenService_0 (copy)
    v5.assert(v11 >= 1);
    v5.assert(v9 >= 0);
    local v16, v17 = v4.useState(false);
    local v18, v19 = v4.useState(v10);
    local v20 = v4.useRef(0);
    local v21 = math.max(0, v9 - v11);
    local v22 = v4.useRef(nil);
    local v24 = v4.useCallback(function(v23) --[[ Line: 38 ]]
        -- upvalues: v20 (copy), v21 (copy)
        v20.current = math.max(0, (math.min(v21, v23)));
        return v20.current;
    end, {
        v21, 
        v20
    });
    local v25 = v4.useCallback(function() --[[ Line: 45 ]]
        -- upvalues: v10 (copy), v17 (copy), v19 (copy), v20 (copy), v21 (copy)
        if not v10 then
            v17(false);
            v19(false);
            return;
        else
            v17(v20.current > 0);
            v19(v20.current < v21);
            return;
        end;
    end, {
        v10, 
        v21, 
        v20
    });
    local v33 = v4.useCallback(function(v26, v27) --[[ Line: 63 ]]
        -- upvalues: v8 (copy), l_FFlagCollectionViewMathChanges_0 (ref), v11 (copy), v15 (copy), v12 (copy), v13 (copy), l_UserGameSettings_0 (ref), v22 (copy), l_TweenService_0 (ref), v14 (copy), v25 (copy)
        local l_current_0 = v8.current;
        if l_current_0 ~= nil then
            local _ = nil;
            local v30 = nil;
            if l_FFlagCollectionViewMathChanges_0 then
                if v11 < 1 then
                    return;
                else
                    v30 = math.floor(v26 * v15:getValue().stride + 0.5);
                end;
            else
                v30 = v26 * (v12:getValue().X + v13);
            end;
            local l_CanvasPosition_0 = l_current_0.CanvasPosition;
            if l_FFlagCollectionViewMathChanges_0 and math.abs(l_CanvasPosition_0.X - v30) < 1 then
                return;
            else
                local v32 = Vector2.new(v30, l_CanvasPosition_0.Y);
                if v27 and not l_UserGameSettings_0.ReducedMotion then
                    if v22.current then
                        v22.current:Cancel();
                    end;
                    v22.current = l_TweenService_0:Create(l_current_0, TweenInfo.new(v14 or 0.75, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {
                        CanvasPosition = v32
                    }):Play();
                    return;
                else
                    l_current_0.CanvasPosition = v32;
                    v25();
                end;
            end;
        end;
    end, {
        v25, 
        if l_FFlagCollectionViewMathChanges_0 then v15 else v12, 
        if l_FFlagCollectionViewMathChanges_0 then v11 else v13, 
        v22, 
        v14, 
        v8
    });
    local v35 = v4.useCallback(function() --[[ Line: 113 ]]
        -- upvalues: v24 (copy), v20 (copy), v11 (copy), v33 (copy)
        local v34 = v24(v20.current - v11);
        v33(v34, true);
    end, {
        v33, 
        v24, 
        v11, 
        v20
    });
    local v37 = v4.useCallback(function() --[[ Line: 118 ]]
        -- upvalues: v24 (copy), v20 (copy), v11 (copy), v33 (copy)
        local v36 = v24(v20.current + v11);
        v33(v36, true);
    end, {
        v33, 
        v24, 
        v11, 
        v20
    });
    v4.useEffect(function() --[[ Line: 126 ]]
        -- upvalues: v24 (copy), v20 (copy), v10 (copy), v33 (copy), v25 (copy)
        v24(v20.current);
        if v10 then
            v33(v20.current);
        end;
        v25();
    end, {
        v24, 
        v33, 
        v10
    });
    v4.useEffect(function() --[[ Line: 142 ]]
        -- upvalues: v10 (copy), v8 (copy), v24 (copy), v20 (copy), v33 (copy), v25 (copy)
        if not v10 then
            return nil;
        else
            local v38 = {};
            if v8.current ~= nil then
                local l_current_1 = v8.current;
                table.insert(v38, l_current_1:GetPropertyChangedSignal("CanvasSize"):Connect(function() --[[ Line: 152 ]]
                    -- upvalues: v24 (ref), v20 (ref), v33 (ref), v25 (ref)
                    v24(v20.current);
                    v33(v20.current);
                    v25();
                end));
                table.insert(v38, l_current_1:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ Line: 161 ]]
                    -- upvalues: v24 (ref), v20 (ref), v25 (ref)
                    v24(v20.current);
                    v25();
                end));
            end;
            return function() --[[ Line: 168 ]]
                -- upvalues: v38 (copy)
                for _, v41 in v38 do
                    v41:Disconnect();
                end;
            end;
        end;
    end, {
        v33, 
        v20, 
        v8, 
        v10, 
        v24
    });
    return v35, v37, v16, v18;
end;