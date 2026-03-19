local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.React);
local v4 = require(l_Parent_2.ReactOtter);
local v5 = require(l_Parent_0.TimingConfigs).presets[require(l_Parent_1.Enums.TransitionPreset).Default];
local _ = require(l_Parent_1.Types);
local function _(v7, v8) --[[ Line: 54 ]] --[[ Name: validateNumber ]]
    if type(v7) == "number" then
        return v7;
    else
        return v8 or 0;
    end;
end;
return function(v10) --[[ Line: 63 ]] --[[ Name: useAnimatedValue ]]
    -- upvalues: v3 (copy), v4 (copy), v5 (copy)
    local v11 = v3.useRef(nil);
    local v12 = v3.useCallback(function(...) --[[ Line: 66 ]]
        -- upvalues: v11 (copy)
        if v11.current ~= nil then
            if type(v11.current) == "function" then
                v11.current(...);
                return;
            elseif v11.current._isMockFunction then
                v11.current(...);
            end;
        end;
    end, {
        v11
    });
    if typeof(v10) == "table" and v10.Color3 and v10.Transparency then
        local l_useAnimatedBinding_0 = v4.useAnimatedBinding;
        local v14 = {};
        local l_R_0 = v10.Color3.R;
        v14.r = if type(l_R_0) == "number" then l_R_0 else 0;
        l_R_0 = v10.Color3.G;
        v14.g = if type(l_R_0) == "number" then l_R_0 else 0;
        l_R_0 = v10.Color3.B;
        v14.b = if type(l_R_0) == "number" then l_R_0 else 0;
        l_R_0 = v10.Transparency;
        v14.Transparency = if type(l_R_0) == "number" then l_R_0 else 0;
        l_useAnimatedBinding_0, v14 = l_useAnimatedBinding_0(v14, v12);
        return l_useAnimatedBinding_0:map(function(v16) --[[ Line: 85 ]]
            return {
                Color3 = Color3.new(v16.r, v16.g, v16.b), 
                Transparency = v16.Transparency
            };
        end), function(v17, v18) --[[ Line: 92 ]]
            -- upvalues: v11 (copy), v5 (ref), v14 (copy), v4 (ref)
            if typeof(v17) ~= "table" or not v17.Color3 or v17.Transparency == nil then
                warn("Expected target to be a table with Color3 and Transparency fields");
                return;
            else
                v11.current = v18 and v18.onComplete or nil;
                local v19 = if v18 then {
                    duration = v18.duration or v5.duration, 
                    easingStyle = v18.easingStyle
                } else nil;
                local l_v14_0 = v14;
                local v21 = {};
                local l_ease_0 = v4.ease;
                local l_R_1 = v17.Color3.R;
                v21.r = l_ease_0(if type(l_R_1) == "number" then l_R_1 else 0, v19);
                l_ease_0 = v4.ease;
                l_R_1 = v17.Color3.G;
                v21.g = l_ease_0(if type(l_R_1) == "number" then l_R_1 else 0, v19);
                l_ease_0 = v4.ease;
                l_R_1 = v17.Color3.B;
                v21.b = l_ease_0(if type(l_R_1) == "number" then l_R_1 else 0, v19);
                l_ease_0 = v4.ease;
                l_R_1 = v17.Transparency;
                v21.Transparency = l_ease_0(if type(l_R_1) == "number" then l_R_1 else 0, v19);
                l_v14_0(v21);
                return;
            end;
        end;
    elseif typeof(v10) == "UDim" then
        local l_useAnimatedBinding_1 = v4.useAnimatedBinding;
        local v25 = {};
        local l_Scale_0 = v10.Scale;
        v25.scale = if type(l_Scale_0) == "number" then l_Scale_0 else 0;
        l_Scale_0 = v10.Offset;
        v25.offset = if type(l_Scale_0) == "number" then l_Scale_0 else 0;
        l_useAnimatedBinding_1, v25 = l_useAnimatedBinding_1(v25, v12);
        return l_useAnimatedBinding_1:map(function(v27) --[[ Line: 125 ]]
            return UDim.new(v27.scale, v27.offset);
        end), function(v28, v29) --[[ Line: 129 ]]
            -- upvalues: v11 (copy), v5 (ref), v25 (copy), v4 (ref)
            if not v28 then
                return;
            elseif typeof(v28) ~= "UDim" then
                warn("Expected UDim target but got", (typeof(v28)));
                return;
            else
                v11.current = v29 and v29.onComplete or nil;
                local v30 = if v29 then {
                    duration = v29.duration or v5.duration, 
                    easingStyle = v29.easingStyle
                } else nil;
                local l_v25_0 = v25;
                local v32 = {};
                local l_ease_1 = v4.ease;
                local l_Scale_1 = v28.Scale;
                v32.scale = l_ease_1(if type(l_Scale_1) == "number" then l_Scale_1 else 0, v30);
                l_ease_1 = v4.ease;
                l_Scale_1 = v28.Offset;
                v32.offset = l_ease_1(if type(l_Scale_1) == "number" then l_Scale_1 else 0, v30);
                l_v25_0(v32);
                return;
            end;
        end;
    elseif typeof(v10) == "UDim2" then
        local l_useAnimatedBinding_2 = v4.useAnimatedBinding;
        local v36 = {};
        local l_Scale_2 = v10.X.Scale;
        v36.xScale = if type(l_Scale_2) == "number" then l_Scale_2 else 0;
        l_Scale_2 = v10.X.Offset;
        v36.xOffset = if type(l_Scale_2) == "number" then l_Scale_2 else 0;
        l_Scale_2 = v10.Y.Scale;
        v36.yScale = if type(l_Scale_2) == "number" then l_Scale_2 else 0;
        l_Scale_2 = v10.Y.Offset;
        v36.yOffset = if type(l_Scale_2) == "number" then l_Scale_2 else 0;
        l_useAnimatedBinding_2, v36 = l_useAnimatedBinding_2(v36, v12);
        return l_useAnimatedBinding_2:map(function(v38) --[[ Line: 166 ]]
            return UDim2.new(v38.xScale, v38.xOffset, v38.yScale, v38.yOffset);
        end), function(v39, v40) --[[ Line: 170 ]]
            -- upvalues: v11 (copy), v5 (ref), v36 (copy), v4 (ref)
            if not v39 then
                return;
            elseif typeof(v39) ~= "UDim2" then
                warn("Expected UDim2 target but got", (typeof(v39)));
                return;
            else
                v11.current = v40 and v40.onComplete or nil;
                local v41 = if v40 then {
                    duration = v40.duration or v5.duration, 
                    easingStyle = v40.easingStyle
                } else nil;
                local l_v36_0 = v36;
                local v43 = {};
                local l_ease_2 = v4.ease;
                local l_Scale_3 = v39.X.Scale;
                v43.xScale = l_ease_2(if type(l_Scale_3) == "number" then l_Scale_3 else 0, v41);
                l_ease_2 = v4.ease;
                l_Scale_3 = v39.X.Offset;
                v43.xOffset = l_ease_2(if type(l_Scale_3) == "number" then l_Scale_3 else 0, v41);
                l_ease_2 = v4.ease;
                l_Scale_3 = v39.Y.Scale;
                v43.yScale = l_ease_2(if type(l_Scale_3) == "number" then l_Scale_3 else 0, v41);
                l_ease_2 = v4.ease;
                l_Scale_3 = v39.Y.Offset;
                v43.yOffset = l_ease_2(if type(l_Scale_3) == "number" then l_Scale_3 else 0, v41);
                l_v36_0(v43);
                return;
            end;
        end;
    elseif typeof(v10) == "Vector2" then
        local l_useAnimatedBinding_3 = v4.useAnimatedBinding;
        local v47 = {};
        local l_X_0 = v10.X;
        v47.x = if type(l_X_0) == "number" then l_X_0 else 0;
        l_X_0 = v10.Y;
        v47.y = if type(l_X_0) == "number" then l_X_0 else 0;
        l_useAnimatedBinding_3, v47 = l_useAnimatedBinding_3(v47, v12);
        return l_useAnimatedBinding_3:map(function(v49) --[[ Line: 205 ]]
            return Vector2.new(v49.x, v49.y);
        end), function(v50, v51) --[[ Line: 209 ]]
            -- upvalues: v11 (copy), v5 (ref), v47 (copy), v4 (ref)
            if not v50 then
                return;
            elseif typeof(v50) ~= "Vector2" then
                warn("Expected Vector2 target but got", (typeof(v50)));
                return;
            else
                v11.current = v51 and v51.onComplete or nil;
                local v52 = if v51 then {
                    duration = v51.duration or v5.duration, 
                    easingStyle = v51.easingStyle
                } else nil;
                local l_v47_0 = v47;
                local v54 = {};
                local l_ease_3 = v4.ease;
                local l_X_1 = v50.X;
                v54.x = l_ease_3(if type(l_X_1) == "number" then l_X_1 else 0, v52);
                l_ease_3 = v4.ease;
                l_X_1 = v50.Y;
                v54.y = l_ease_3(if type(l_X_1) == "number" then l_X_1 else 0, v52);
                l_v47_0(v54);
                return;
            end;
        end;
    elseif typeof(v10) == "Color3" then
        local l_useAnimatedBinding_4 = v4.useAnimatedBinding;
        local v58 = {};
        local l_R_2 = v10.R;
        v58.r = if type(l_R_2) == "number" then l_R_2 else 0;
        l_R_2 = v10.G;
        v58.g = if type(l_R_2) == "number" then l_R_2 else 0;
        l_R_2 = v10.B;
        v58.b = if type(l_R_2) == "number" then l_R_2 else 0;
        l_useAnimatedBinding_4, v58 = l_useAnimatedBinding_4(v58, v12);
        return l_useAnimatedBinding_4:map(function(v60) --[[ Line: 244 ]]
            return Color3.new(v60.r, v60.g, v60.b);
        end), function(v61, v62) --[[ Line: 248 ]]
            -- upvalues: v11 (copy), v5 (ref), v58 (copy), v4 (ref)
            if not v61 then
                return;
            elseif typeof(v61) ~= "Color3" then
                warn("Expected Color3 target but got", (typeof(v61)));
                return;
            else
                v11.current = v62 and v62.onComplete or nil;
                local v63 = if v62 then {
                    duration = v62.duration or v5.duration, 
                    easingStyle = v62.easingStyle
                } else nil;
                local l_v58_0 = v58;
                local v65 = {};
                local l_ease_4 = v4.ease;
                local l_R_3 = v61.R;
                v65.r = l_ease_4(if type(l_R_3) == "number" then l_R_3 else 0, v63);
                l_ease_4 = v4.ease;
                l_R_3 = v61.G;
                v65.g = l_ease_4(if type(l_R_3) == "number" then l_R_3 else 0, v63);
                l_ease_4 = v4.ease;
                l_R_3 = v61.B;
                v65.b = l_ease_4(if type(l_R_3) == "number" then l_R_3 else 0, v63);
                l_v58_0(v65);
                return;
            end;
        end;
    elseif typeof(v10) == "number" then
        local v68, v69 = v4.useAnimatedBinding(if type(v10) == "number" then v10 else 0, v12);
        return v68:map(function(v70) --[[ Line: 280 ]]
            return v70;
        end), function(v71, v72) --[[ Line: 284 ]]
            -- upvalues: v11 (copy), v5 (ref), v69 (copy), v4 (ref)
            if typeof(v71) ~= "number" then
                return;
            else
                v11.current = v72 and v72.onComplete or nil;
                local v73 = if v72 then {
                    duration = v72.duration or v5.duration, 
                    easingStyle = v72.easingStyle
                } else nil;
                v69(v4.ease(v71, v73));
                return;
            end;
        end;
    else
        warn("Unsupported type for animated value:", (typeof(v10)));
        return v3.createBinding(v10), function() --[[ Line: 304 ]]

        end;
    end;
end;