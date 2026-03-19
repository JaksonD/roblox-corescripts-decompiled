local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.ReactOtter);
local _ = require(l_Parent_0.Types);
local function _(v5, v6) --[[ Line: 40 ]] --[[ Name: validateNumber ]]
    if type(v5) == "number" then
        return v5;
    else
        return v6 or 0;
    end;
end;
return function(v8) --[[ Line: 49 ]] --[[ Name: useAnimatedValue ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v9 = v2.useRef(nil);
    local v10 = v2.useCallback(function(...) --[[ Line: 52 ]]
        -- upvalues: v9 (copy)
        if v9.current ~= nil then
            if type(v9.current) == "function" then
                v9.current(...);
                return;
            elseif v9.current._isMockFunction then
                v9.current(...);
            end;
        end;
    end, {
        v9
    });
    if typeof(v8) == "UDim" then
        local l_useAnimatedBinding_0 = v3.useAnimatedBinding;
        local v12 = {};
        local l_Scale_0 = v8.Scale;
        v12.scale = if type(l_Scale_0) == "number" then l_Scale_0 else 0;
        l_Scale_0 = v8.Offset;
        v12.offset = if type(l_Scale_0) == "number" then l_Scale_0 else 0;
        l_useAnimatedBinding_0, v12 = l_useAnimatedBinding_0(v12, v10);
        return l_useAnimatedBinding_0:map(function(v14) --[[ Line: 69 ]]
            return UDim.new(v14.scale, v14.offset);
        end), function(v15, v16) --[[ Line: 73 ]]
            -- upvalues: v9 (copy), v12 (copy), v3 (ref)
            if not v15 then
                return;
            elseif typeof(v15) ~= "UDim" then
                warn("Expected UDim target but got", (typeof(v15)));
                return;
            else
                v9.current = v16 and v16.onComplete or nil;
                local v17 = if v16 then {
                    duration = v16.duration or 0.3, 
                    easingStyle = v16.easingStyle
                } else nil;
                local l_v12_0 = v12;
                local v19 = {};
                local l_ease_0 = v3.ease;
                local l_Scale_1 = v15.Scale;
                v19.scale = l_ease_0(if type(l_Scale_1) == "number" then l_Scale_1 else 0, v17);
                l_ease_0 = v3.ease;
                l_Scale_1 = v15.Offset;
                v19.offset = l_ease_0(if type(l_Scale_1) == "number" then l_Scale_1 else 0, v17);
                l_v12_0(v19);
                return;
            end;
        end;
    elseif typeof(v8) == "UDim2" then
        local l_useAnimatedBinding_1 = v3.useAnimatedBinding;
        local v23 = {};
        local l_Scale_2 = v8.X.Scale;
        v23.xScale = if type(l_Scale_2) == "number" then l_Scale_2 else 0;
        l_Scale_2 = v8.X.Offset;
        v23.xOffset = if type(l_Scale_2) == "number" then l_Scale_2 else 0;
        l_Scale_2 = v8.Y.Scale;
        v23.yScale = if type(l_Scale_2) == "number" then l_Scale_2 else 0;
        l_Scale_2 = v8.Y.Offset;
        v23.yOffset = if type(l_Scale_2) == "number" then l_Scale_2 else 0;
        l_useAnimatedBinding_1, v23 = l_useAnimatedBinding_1(v23, v10);
        return l_useAnimatedBinding_1:map(function(v25) --[[ Line: 110 ]]
            return UDim2.new(v25.xScale, v25.xOffset, v25.yScale, v25.yOffset);
        end), function(v26, v27) --[[ Line: 114 ]]
            -- upvalues: v9 (copy), v23 (copy), v3 (ref)
            if not v26 then
                return;
            elseif typeof(v26) ~= "UDim2" then
                warn("Expected UDim2 target but got", (typeof(v26)));
                return;
            else
                v9.current = v27 and v27.onComplete or nil;
                local v28 = if v27 then {
                    duration = v27.duration or 0.3, 
                    easingStyle = v27.easingStyle
                } else nil;
                local l_v23_0 = v23;
                local v30 = {};
                local l_ease_1 = v3.ease;
                local l_Scale_3 = v26.X.Scale;
                v30.xScale = l_ease_1(if type(l_Scale_3) == "number" then l_Scale_3 else 0, v28);
                l_ease_1 = v3.ease;
                l_Scale_3 = v26.X.Offset;
                v30.xOffset = l_ease_1(if type(l_Scale_3) == "number" then l_Scale_3 else 0, v28);
                l_ease_1 = v3.ease;
                l_Scale_3 = v26.Y.Scale;
                v30.yScale = l_ease_1(if type(l_Scale_3) == "number" then l_Scale_3 else 0, v28);
                l_ease_1 = v3.ease;
                l_Scale_3 = v26.Y.Offset;
                v30.yOffset = l_ease_1(if type(l_Scale_3) == "number" then l_Scale_3 else 0, v28);
                l_v23_0(v30);
                return;
            end;
        end;
    elseif typeof(v8) == "Vector2" then
        local l_useAnimatedBinding_2 = v3.useAnimatedBinding;
        local v34 = {};
        local l_X_0 = v8.X;
        v34.x = if type(l_X_0) == "number" then l_X_0 else 0;
        l_X_0 = v8.Y;
        v34.y = if type(l_X_0) == "number" then l_X_0 else 0;
        l_useAnimatedBinding_2, v34 = l_useAnimatedBinding_2(v34, v10);
        return l_useAnimatedBinding_2:map(function(v36) --[[ Line: 149 ]]
            return Vector2.new(v36.x, v36.y);
        end), function(v37, v38) --[[ Line: 153 ]]
            -- upvalues: v9 (copy), v34 (copy), v3 (ref)
            if not v37 then
                return;
            elseif typeof(v37) ~= "Vector2" then
                warn("Expected Vector2 target but got", (typeof(v37)));
                return;
            else
                v9.current = v38 and v38.onComplete or nil;
                local v39 = if v38 then {
                    duration = v38.duration or 0.3, 
                    easingStyle = v38.easingStyle
                } else nil;
                local l_v34_0 = v34;
                local v41 = {};
                local l_ease_2 = v3.ease;
                local l_X_1 = v37.X;
                v41.x = l_ease_2(if type(l_X_1) == "number" then l_X_1 else 0, v39);
                l_ease_2 = v3.ease;
                l_X_1 = v37.Y;
                v41.y = l_ease_2(if type(l_X_1) == "number" then l_X_1 else 0, v39);
                l_v34_0(v41);
                return;
            end;
        end;
    elseif typeof(v8) == "Color3" then
        local l_useAnimatedBinding_3 = v3.useAnimatedBinding;
        local v45 = {};
        local l_R_0 = v8.R;
        v45.r = if type(l_R_0) == "number" then l_R_0 else 0;
        l_R_0 = v8.G;
        v45.g = if type(l_R_0) == "number" then l_R_0 else 0;
        l_R_0 = v8.B;
        v45.b = if type(l_R_0) == "number" then l_R_0 else 0;
        l_useAnimatedBinding_3, v45 = l_useAnimatedBinding_3(v45, v10);
        return l_useAnimatedBinding_3:map(function(v47) --[[ Line: 188 ]]
            return Color3.new(v47.r, v47.g, v47.b);
        end), function(v48, v49) --[[ Line: 192 ]]
            -- upvalues: v9 (copy), v45 (copy), v3 (ref)
            if not v48 then
                return;
            elseif typeof(v48) ~= "Color3" then
                warn("Expected Color3 target but got", (typeof(v48)));
                return;
            else
                v9.current = v49 and v49.onComplete or nil;
                local v50 = if v49 then {
                    duration = v49.duration or 0.3, 
                    easingStyle = v49.easingStyle
                } else nil;
                local l_v45_0 = v45;
                local v52 = {};
                local l_ease_3 = v3.ease;
                local l_R_1 = v48.R;
                v52.r = l_ease_3(if type(l_R_1) == "number" then l_R_1 else 0, v50);
                l_ease_3 = v3.ease;
                l_R_1 = v48.G;
                v52.g = l_ease_3(if type(l_R_1) == "number" then l_R_1 else 0, v50);
                l_ease_3 = v3.ease;
                l_R_1 = v48.B;
                v52.b = l_ease_3(if type(l_R_1) == "number" then l_R_1 else 0, v50);
                l_v45_0(v52);
                return;
            end;
        end;
    elseif typeof(v8) == "number" then
        local v55, v56 = v3.useAnimatedBinding(if type(v8) == "number" then v8 else 0, v10);
        return v55:map(function(v57) --[[ Line: 224 ]]
            return v57;
        end), function(v58, v59) --[[ Line: 228 ]]
            -- upvalues: v9 (copy), v56 (copy), v3 (ref)
            if typeof(v58) ~= "number" then
                return;
            else
                v9.current = v59 and v59.onComplete or nil;
                local v60 = if v59 then {
                    duration = v59.duration or 0.3, 
                    easingStyle = v59.easingStyle
                } else nil;
                v56(v3.ease(v58, v60));
                return;
            end;
        end;
    else
        warn("Unsupported type for animated value:", (typeof(v8)));
        return v2.createBinding(v8), function() --[[ Line: 248 ]]

        end;
    end;
end;