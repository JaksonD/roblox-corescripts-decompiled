local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script:FindFirstAncestor("AvatarSwitcher").Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.ReactOtter);
local function _(v5) --[[ Line: 21 ]] --[[ Name: swipeDistanceToRotationAngle ]]
    return -v5.X * 1;
end;
return function(v7) --[[ Line: 30 ]] --[[ Name: useOutfitViewportInteractions ]]
    -- upvalues: v3 (copy), v4 (copy), l_HttpService_0 (copy), l_RunService_0 (copy)
    local v8 = v3.useRef(false);
    local v9 = v3.useRef((Vector3.new()));
    local v10, v11 = v4.useAnimatedBinding(0);
    local v12 = v3.useRef(0);
    local v13 = v3.useRef(0);
    local v14 = v3.useRef(nil);
    local v15, v16 = v3.useBinding(CFrame.new());
    v3.useEffect(function() --[[ Line: 39 ]]
        -- upvalues: l_HttpService_0 (ref), v14 (copy), l_RunService_0 (ref), v8 (copy), v11 (copy), v4 (ref), v10 (copy), v12 (copy), v13 (copy), v7 (copy), v16 (copy)
        local v17 = 0;
        local v18 = "OutfitVewportSpin_" .. l_HttpService_0:GenerateGUID(false);
        local l_current_0 = v14.current;
        l_RunService_0:BindToRenderStep(v18, Enum.RenderPriority.Camera.Value + 1, function(v20) --[[ Line: 45 ]]
            -- upvalues: v8 (ref), v14 (ref), l_current_0 (ref), v11 (ref), v4 (ref), v17 (ref), v10 (ref), v12 (ref), v13 (ref), v7 (ref), v16 (ref)
            if v8.current then
                local v21 = if v14.current and l_current_0 then (v14.current - l_current_0) / v20 else Vector2.new(0, 0);
                v11(v4.instant(-v21.X * 1));
            else
                v17 = v17 + v20 * v10:getValue();
            end;
            l_current_0 = v14.current;
            local v22 = math.rad(v17) + math.rad(v12.current) + math.rad(v13.current);
            local v23 = CFrame.Angles(0, v22, 0);
            local l_current_1 = v7.defaultCameraDistanceRef.current;
            v16(CFrame.lookAt(v23.LookVector * l_current_1, Vector3.new(0, 0, 0, 0), v23.UpVector));
        end);
        return function() --[[ Line: 68 ]]
            -- upvalues: l_RunService_0 (ref), v18 (copy)
            l_RunService_0:UnbindFromRenderStep(v18);
        end;
    end, {
        v11, 
        v7.defaultCameraDistanceRef, 
        v16
    });
    local v27 = v3.useCallback(function(v25) --[[ Line: 73 ]]
        -- upvalues: v12 (copy), v9 (copy), v8 (copy), v14 (copy), v13 (copy), v7 (copy), v11 (copy), v4 (ref)
        local l_v12_0 = v12;
        l_v12_0.current = l_v12_0.current + -(v25 - v9.current).X * 1;
        v8.current = false;
        v14.current = nil;
        v13.current = 0;
        if v7.onInteractionChanged then
            v7.onInteractionChanged(false);
        end;
        v11((v4.spring(0, {
            frequency = 1
        })));
    end, {
        v7.onInteractionChanged, 
        v11
    });
    local v31 = v3.useCallback(function(_, v29) --[[ Line: 86 ]]
        -- upvalues: v8 (copy), v9 (copy), v14 (copy), v7 (copy)
        local v30 = true;
        if v29.UserInputType ~= Enum.UserInputType.MouseButton1 then
            v30 = v29.UserInputType == Enum.UserInputType.Touch;
        end;
        if v30 and not v8.current then
            v8.current = true;
            v9.current = v29.Position;
            v14.current = v29.Position;
            if v7.onInteractionChanged then
                v7.onInteractionChanged(true);
            end;
        end;
    end, {
        v7.onInteractionChanged
    });
    local v34 = v3.useCallback(function(v32) --[[ Line: 100 ]]
        -- upvalues: v8 (copy), v13 (copy), v9 (copy), v14 (copy)
        local v33 = true;
        if v32.UserInputType ~= Enum.UserInputType.MouseMovement then
            v33 = v32.UserInputType == Enum.UserInputType.Touch;
        end;
        if v8.current and v33 then
            v13.current = -(v32.Position - v9.current).X * 1;
            v14.current = v32.Position;
        end;
    end, {});
    local v37 = v3.useCallback(function(v35) --[[ Line: 109 ]]
        -- upvalues: v8 (copy), v27 (copy)
        local v36 = true;
        if v35.UserInputType ~= Enum.UserInputType.MouseButton1 then
            v36 = v35.UserInputType == Enum.UserInputType.Touch;
        end;
        if v36 and v8.current then
            v27(v35.Position);
        end;
    end, {
        v27
    });
    return {
        onInputBegan = v31, 
        onInputChanged = v34, 
        onInputEnded = v37, 
        cameraCFrame = v15
    };
end;