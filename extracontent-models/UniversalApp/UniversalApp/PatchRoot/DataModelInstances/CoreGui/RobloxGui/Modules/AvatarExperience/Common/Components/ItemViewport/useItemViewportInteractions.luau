local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.ReactOtter);
local v6 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXFixItemViewportErrors);
local v7 = game:DefineFastInt("ItemViewportInitialAngleX", -45);
local v8 = game:DefineFastInt("ItemViewportInitialAngleY", 20);
local v9 = game:DefineFastInt("ItemViewportIdleRotationSpeed", 30);
local v10 = game:DefineFastInt("ItemViewportSwipeRotationSpeed", 1000);
local v11 = game:DefineFastInt("ItemViewportMaxZoom", 5000);
local v12 = game:DefineFastInt("ItemViewportMouseWheelZoomRatio", 1100);
local v13 = Vector2.new(v7, v8);
local v14 = v10 / 1000;
local v15 = v10 / 1000;
local v16 = v10 / 1000;
local v17 = 1 / (math.max(v11, 1) / 1000);
local v18 = v11 / 1000;
local v19 = v12 / 1000;
local function _(v20, v21) --[[ Line: 41 ]] --[[ Name: swipeDistanceToRotationAngles ]]
    -- upvalues: v14 (copy), v15 (copy)
    return Vector2.new(-v20.X * v14, (math.clamp(v20.Y * v15, -90 - v21, 90 - v21)));
end;
return function(v23) --[[ Line: 57 ]] --[[ Name: useItemViewportInteractions ]]
    -- upvalues: v4 (copy), v5 (copy), v9 (copy), v13 (copy), l_HttpService_0 (copy), l_RunService_0 (copy), v16 (copy), v14 (copy), v15 (copy), v17 (copy), v18 (copy), v6 (copy), v19 (copy)
    local v24 = v4.useRef(false);
    local v25 = v4.useRef(false);
    local v26 = v4.useRef(false);
    local v27 = v4.useRef((Vector3.new()));
    local v28, v29 = v5.useAnimatedBinding(v9);
    local v30 = v4.useRef(v13);
    local v31 = v4.useRef(Vector2.new());
    local v32 = v4.useRef(nil);
    local v33 = v4.useRef(1);
    local v34 = v4.useRef(1);
    local v35 = v4.useRef(0);
    local v36, v37 = v4.useBinding(CFrame.new());
    local l_setParentScrollingEnabled_0 = v23.setParentScrollingEnabled;
    v4.useEffect(function() --[[ Line: 72 ]]
        -- upvalues: l_HttpService_0 (ref), v32 (copy), l_RunService_0 (ref), v24 (copy), v29 (copy), v5 (ref), v16 (ref), v25 (copy), v28 (copy), v30 (copy), v31 (copy), v23 (copy), v33 (copy), v34 (copy), v37 (copy)
        local v39 = 0;
        local v40 = "ItemVewportSpin_" .. l_HttpService_0:GenerateGUID(false);
        local l_current_0 = v32.current;
        l_RunService_0:BindToRenderStep(v40, Enum.RenderPriority.Camera.Value + 1, function(v42) --[[ Line: 78 ]]
            -- upvalues: v24 (ref), v32 (ref), l_current_0 (ref), v29 (ref), v5 (ref), v16 (ref), v25 (ref), v39 (ref), v28 (ref), v30 (ref), v31 (ref), v23 (ref), v33 (ref), v34 (ref), v37 (ref)
            if v24.current then
                local v43 = if v32.current and l_current_0 then (v32.current - l_current_0) / v42 else Vector2.new(0, 0);
                v29(v5.instant(-v43.X * v16));
            elseif not v25.current then
                v39 = v39 + v42 * v28:getValue();
            end;
            l_current_0 = v32.current;
            local v44 = math.rad(v39) + math.rad(v30.current.X) + math.rad(v31.current.X);
            local v45 = math.rad(v30.current.Y) + math.rad(v31.current.Y);
            local v46 = CFrame.Angles(0, v44, 0) * CFrame.Angles(v45, 0, 0);
            local v47 = v23.defaultCameraDistanceRef.current / (v33.current * v34.current);
            v37(CFrame.lookAt(v46.LookVector * v47, Vector3.new(0, 0, 0, 0), v46.UpVector));
        end);
        return function() --[[ Line: 102 ]]
            -- upvalues: l_RunService_0 (ref), v40 (copy)
            l_RunService_0:UnbindFromRenderStep(v40);
        end;
    end, {
        v29, 
        v23.defaultCameraDistanceRef, 
        v37
    });
    local v53 = v4.useCallback(function(v48) --[[ Line: 107 ]]
        -- upvalues: v30 (copy), v27 (copy), v14 (ref), v15 (ref), v24 (copy), v32 (copy), v31 (copy), l_setParentScrollingEnabled_0 (copy), v26 (copy), v29 (copy), v5 (ref), v9 (ref)
        local l_v30_0 = v30;
        local l_current_1 = l_v30_0.current;
        local v51 = v48 - v27.current;
        local l_Y_0 = v30.current.Y;
        l_v30_0.current = l_current_1 + Vector2.new(-v51.X * v14, (math.clamp(v51.Y * v15, -90 - l_Y_0, 90 - l_Y_0)));
        v24.current = false;
        v32.current = nil;
        v31.current = Vector2.new();
        if l_setParentScrollingEnabled_0 and not v26.current then
            l_setParentScrollingEnabled_0(true);
        end;
        v29((v5.spring(v9, {
            frequency = 1
        })));
    end, {
        l_setParentScrollingEnabled_0, 
        v29
    });
    local v57 = v4.useCallback(function(_, v55) --[[ Line: 124 ]]
        -- upvalues: v24 (copy), v25 (copy), v27 (copy), v32 (copy), l_setParentScrollingEnabled_0 (copy)
        local v56 = true;
        if v55.UserInputType ~= Enum.UserInputType.MouseButton1 then
            v56 = v55.UserInputType == Enum.UserInputType.Touch;
        end;
        if v56 and not v24.current and not v25.current then
            v24.current = true;
            v27.current = v55.Position;
            v32.current = v55.Position;
            if l_setParentScrollingEnabled_0 then
                l_setParentScrollingEnabled_0(false);
            end;
        end;
    end, {
        l_setParentScrollingEnabled_0
    });
    local v63 = v4.useCallback(function(v58) --[[ Line: 137 ]]
        -- upvalues: v24 (copy), v31 (copy), v27 (copy), v30 (copy), v14 (ref), v15 (ref), v32 (copy)
        local v59 = true;
        if v58.UserInputType ~= Enum.UserInputType.MouseMovement then
            v59 = v58.UserInputType == Enum.UserInputType.Touch;
        end;
        if v24.current and v59 then
            local l_v31_0 = v31;
            local v61 = v58.Position - v27.current;
            local l_Y_1 = v30.current.Y;
            l_v31_0.current = Vector2.new(-v61.X * v14, (math.clamp(v61.Y * v15, -90 - l_Y_1, 90 - l_Y_1)));
            v32.current = v58.Position;
        end;
    end, {});
    local v66 = v4.useCallback(function(v64) --[[ Line: 147 ]]
        -- upvalues: v24 (copy), v53 (copy)
        local v65 = true;
        if v64.UserInputType ~= Enum.UserInputType.MouseButton1 then
            v65 = v64.UserInputType == Enum.UserInputType.Touch;
        end;
        if v65 and v24.current then
            v53(v64.Position);
        end;
    end, {
        v53
    });
    local v76 = v4.useCallback(function(v67, _, _, v70) --[[ Line: 155 ]]
        -- upvalues: v35 (copy), v25 (copy), v24 (copy), v53 (copy), v32 (copy), v27 (copy), v33 (copy), v17 (ref), v18 (ref), v6 (ref), v34 (copy)
        if #v67 < 2 then
            return;
        else
            local l_Magnitude_0 = (v67[1] - v67[2]).Magnitude;
            local v72 = l_Magnitude_0 / v35.current;
            if v70 == Enum.UserInputState.Begin then
                v25.current = true;
                v35.current = l_Magnitude_0;
                if v24.current then
                    v53(v32.current or v27.current);
                    return;
                end;
            elseif v70 == Enum.UserInputState.Change then
                local l_current_2 = v33.current;
                local v74 = math.min(v17 / l_current_2, v18 / l_current_2);
                local v75 = math.max(v17 / l_current_2, v18 / l_current_2);
                if v6() then
                    pcall(function() --[[ Line: 181 ]]
                        -- upvalues: v34 (ref), v72 (copy), v74 (copy), v75 (copy)
                        v34.current = math.clamp(v72, v74, v75);
                    end);
                    return;
                else
                    v34.current = math.clamp(v72, v74, v75);
                    return;
                end;
            elseif v70 == Enum.UserInputState.End then
                v25.current = false;
                v34.current = 1;
                v33.current = math.clamp(v33.current * v72, v17, v18);
            end;
            return;
        end;
    end, {
        v53
    });
    local v77 = v4.useCallback(function() --[[ Line: 194 ]]
        -- upvalues: v33 (copy), v19 (ref), v17 (ref), v18 (ref)
        v33.current = math.clamp(v33.current * v19, v17, v18);
    end, {});
    local v78 = v4.useCallback(function() --[[ Line: 199 ]]
        -- upvalues: v33 (copy), v19 (ref), v17 (ref), v18 (ref)
        v33.current = math.clamp(v33.current / v19, v17, v18);
    end, {});
    local v79 = v4.useCallback(function() --[[ Line: 205 ]]
        -- upvalues: v26 (copy), l_setParentScrollingEnabled_0 (copy)
        v26.current = true;
        if l_setParentScrollingEnabled_0 then
            l_setParentScrollingEnabled_0(false);
        end;
    end, {
        l_setParentScrollingEnabled_0
    });
    local v80 = v4.useCallback(function() --[[ Line: 212 ]]
        -- upvalues: v26 (copy), v24 (copy), l_setParentScrollingEnabled_0 (copy)
        v26.current = false;
        if not v24.current and l_setParentScrollingEnabled_0 then
            l_setParentScrollingEnabled_0(true);
        end;
    end, {
        l_setParentScrollingEnabled_0
    });
    return {
        onInputBegan = v57, 
        onInputChanged = v63, 
        onInputEnded = v66, 
        onTouchPinch = v76, 
        onMouseWheelForward = v77, 
        onMouseWheelBackward = v78, 
        onMouseEnter = v79, 
        onMouseLeave = v80, 
        cameraCFrame = v36
    };
end;