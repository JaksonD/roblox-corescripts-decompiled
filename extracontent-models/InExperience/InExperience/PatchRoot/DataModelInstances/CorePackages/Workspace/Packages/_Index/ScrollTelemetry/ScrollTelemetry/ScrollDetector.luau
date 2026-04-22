local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script:FindFirstAncestor("ScrollTelemetry").Parent;
local v2 = require(l_Parent_0.React);
local l_FFlagLuaAppScrollDetectorLifecycleHardening_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppScrollDetectorLifecycleHardening;
game:DefineFastInt("ScrollDetectorTimeThresholdMillis", 300000);
game:DefineFastInt("ScrollDetectorDelayMillis", 250);
local function _() --[[ Line: 12 ]] --[[ Name: getDelaySeconds ]]
    return game:GetFastInt("ScrollDetectorDelayMillis") / 1000;
end;
local function _() --[[ Line: 16 ]] --[[ Name: getThresholdSeconds ]]
    return game:GetFastInt("ScrollDetectorTimeThresholdMillis") / 1000;
end;
return function(v6) --[[ Line: 25 ]]
    -- upvalues: v2 (copy), l_FFlagLuaAppScrollDetectorLifecycleHardening_0 (copy), l_RunService_0 (copy)
    local v7 = v2.useRef(0);
    local v8 = v2.useRef(0);
    local v9 = v2.useRef(nil);
    local v10 = v2.useRef(nil);
    local v11 = v2.useRef(0);
    local v12 = v2.useRef(0);
    local v13 = v2.useRef(nil);
    if l_FFlagLuaAppScrollDetectorLifecycleHardening_0 then
        local v14 = v2.useRef(v6.sendScrollEvent);
        v14.current = v6.sendScrollEvent;
        v2.useEffect(function() --[[ Line: 38 ]]
            -- upvalues: v7 (copy), v8 (copy), v14 (copy), v11 (copy), v6 (copy), v12 (copy), v9 (copy), v13 (copy), l_RunService_0 (ref), v10 (copy)
            local function _(v15) --[[ Line: 39 ]]
                -- upvalues: v7 (ref), v8 (ref), v14 (ref), v11 (ref)
                local v16 = v7.current - v8.current;
                if v16 == 0 then
                    return;
                else
                    v14.current(v16, v15 - v11.current, v8.current);
                    return;
                end;
            end;
            local function v30() --[[ Line: 48 ]]
                -- upvalues: v6 (ref), v12 (ref), v7 (ref), v8 (ref), v14 (ref), v11 (ref), v9 (ref), v13 (ref)
                if not v6.scrollingFrameRef or not v6.scrollingFrameRef.current then
                    local l_current_0 = v12.current;
                    local v19 = v7.current - v8.current;
                    if v19 ~= 0 then
                        v14.current(v19, l_current_0 - v11.current, v8.current);
                    end;
                    if v9.current then
                        v9.current:Disconnect();
                    end;
                    v9.current = nil;
                    return;
                else
                    local v20 = nil;
                    local v21 = time();
                    local v22 = v21 - v11.current;
                    if v6.scrollingFrameRef and v6.scrollingFrameRef.current then
                        v20 = if v6.scrollingFrameRef.current.ScrollingDirection == Enum.ScrollingDirection.Y then v6.scrollingFrameRef.current.CanvasPosition.Y else v6.scrollingFrameRef.current.CanvasPosition.X;
                    end;
                    local v23 = v7.current - v8.current;
                    local v24 = v20 - v7.current;
                    if not v13.current and v24 == 0 then
                        v13.current = v12.current;
                    elseif v13.current and v24 ~= 0 then
                        v13.current = nil;
                    end;
                    if v13.current and v13.current + game:GetFastInt("ScrollDetectorDelayMillis") / 1000 < v21 then
                        v7.current = v20;
                        local l_current_1 = v13.current;
                        local v26 = v7.current - v8.current;
                        if v26 ~= 0 then
                            v14.current(v26, l_current_1 - v11.current, v8.current);
                        end;
                        v8.current = v20;
                        l_current_1 = v9.current;
                        if l_current_1 then
                            l_current_1:Disconnect();
                        end;
                        v9.current = nil;
                        return;
                    else
                        if v23 ~= 0 and v24 ~= 0 and math.sign(v23) ~= math.sign(v24) then
                            local l_current_2 = v12.current;
                            local v28 = v7.current - v8.current;
                            if v28 ~= 0 then
                                v14.current(v28, l_current_2 - v11.current, v8.current);
                            end;
                            v8.current = v7.current;
                            v11.current = v12.current;
                        elseif not v13.current and game:GetFastInt("ScrollDetectorTimeThresholdMillis") / 1000 <= v22 then
                            v7.current = v20;
                            local v29 = v7.current - v8.current;
                            if v29 ~= 0 then
                                v14.current(v29, v21 - v11.current, v8.current);
                            end;
                            v8.current = v20;
                            v11.current = v21;
                        end;
                        v7.current = v20;
                        v12.current = v21;
                        return;
                    end;
                end;
            end;
            local function v31() --[[ Line: 113 ]]
                -- upvalues: v9 (ref), v11 (ref), v12 (ref), v8 (ref), v7 (ref), l_RunService_0 (ref), v30 (copy)
                if not v9.current then
                    v11.current = time();
                    v12.current = v11.current;
                    v8.current = v7.current;
                    v9.current = l_RunService_0.Stepped:Connect(function() --[[ Line: 119 ]]
                        -- upvalues: v30 (ref)
                        v30();
                    end);
                end;
            end;
            local v32 = nil;
            if v6.scrollingFrameRef and v6.scrollingFrameRef.current and v10.current ~= v6.scrollingFrameRef.current then
                v7.current = if v6.scrollingFrameRef.current.ScrollingDirection == Enum.ScrollingDirection.Y then v6.scrollingFrameRef.current.CanvasPosition.Y else v6.scrollingFrameRef.current.CanvasPosition.X;
                v32 = v6.scrollingFrameRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ Line: 137 ]]
                    -- upvalues: v31 (copy)
                    v31();
                end);
                v10.current = v6.scrollingFrameRef.current;
            end;
            return function() --[[ Line: 144 ]]
                -- upvalues: v9 (ref), v12 (ref), v7 (ref), v8 (ref), v14 (ref), v11 (ref), v32 (ref), v6 (ref), v10 (ref)
                if v9.current then
                    local l_current_3 = v12.current;
                    local v34 = v7.current - v8.current;
                    if v34 ~= 0 then
                        v14.current(v34, l_current_3 - v11.current, v8.current);
                    end;
                    v9.current:Disconnect();
                end;
                v9.current = nil;
                if v32 then
                    v32:Disconnect();
                end;
                v32 = nil;
                if not v6.scrollingFrameRef or not v6.scrollingFrameRef.current then
                    v10.current = nil;
                end;
            end;
        end, {
            v6.scrollingFrameRef
        });
    else
        local function _(v35) --[[ Line: 162 ]]
            -- upvalues: v7 (copy), v8 (copy), v6 (copy), v11 (copy)
            local v36 = v7.current - v8.current;
            if v36 == 0 then
                return;
            else
                v6.sendScrollEvent(v36, v35 - v11.current, v8.current);
                return;
            end;
        end;
        local function v50() --[[ Line: 171 ]]
            -- upvalues: v6 (copy), v12 (copy), v7 (copy), v8 (copy), v11 (copy), v9 (copy), v13 (copy)
            if not v6.scrollingFrameRef or not v6.scrollingFrameRef.current then
                local l_current_4 = v12.current;
                local v39 = v7.current - v8.current;
                if v39 ~= 0 then
                    v6.sendScrollEvent(v39, l_current_4 - v11.current, v8.current);
                end;
                if v9.current then
                    v9.current:Disconnect();
                end;
                v9.current = nil;
                return;
            else
                local v40 = nil;
                local v41 = time();
                local v42 = v41 - v11.current;
                if v6.scrollingFrameRef and v6.scrollingFrameRef.current then
                    v40 = if v6.scrollingFrameRef.current.ScrollingDirection == Enum.ScrollingDirection.Y then v6.scrollingFrameRef.current.CanvasPosition.Y else v6.scrollingFrameRef.current.CanvasPosition.X;
                end;
                local v43 = v7.current - v8.current;
                local v44 = v40 - v7.current;
                if not v13.current and v44 == 0 then
                    v13.current = v12.current;
                elseif v13.current and v44 ~= 0 then
                    v13.current = nil;
                end;
                if v13.current and v13.current + game:GetFastInt("ScrollDetectorDelayMillis") / 1000 < v41 then
                    v7.current = v40;
                    local l_current_5 = v13.current;
                    local v46 = v7.current - v8.current;
                    if v46 ~= 0 then
                        v6.sendScrollEvent(v46, l_current_5 - v11.current, v8.current);
                    end;
                    v8.current = v40;
                    l_current_5 = v9.current;
                    if l_current_5 then
                        l_current_5:Disconnect();
                    end;
                    v9.current = nil;
                    return;
                else
                    if v43 ~= 0 and v44 ~= 0 and math.sign(v43) ~= math.sign(v44) then
                        local l_current_6 = v12.current;
                        local v48 = v7.current - v8.current;
                        if v48 ~= 0 then
                            v6.sendScrollEvent(v48, l_current_6 - v11.current, v8.current);
                        end;
                        v8.current = v7.current;
                        v11.current = v12.current;
                    elseif not v13.current and game:GetFastInt("ScrollDetectorTimeThresholdMillis") / 1000 <= v42 then
                        v7.current = v40;
                        local v49 = v7.current - v8.current;
                        if v49 ~= 0 then
                            v6.sendScrollEvent(v49, v41 - v11.current, v8.current);
                        end;
                        v8.current = v40;
                        v11.current = v41;
                    end;
                    v7.current = v40;
                    v12.current = v41;
                    return;
                end;
            end;
        end;
        local function v51() --[[ Line: 236 ]]
            -- upvalues: v9 (copy), v11 (copy), v12 (copy), v8 (copy), v7 (copy), l_RunService_0 (ref), v50 (copy)
            if not v9.current then
                v11.current = time();
                v12.current = v11.current;
                v8.current = v7.current;
                v9.current = l_RunService_0.Stepped:Connect(function() --[[ Line: 242 ]]
                    -- upvalues: v50 (ref)
                    v50();
                end);
            end;
        end;
        v2.useEffect(function() --[[ Line: 248 ]]
            -- upvalues: v6 (copy), v10 (copy), v7 (copy), v51 (copy), v9 (copy), v12 (copy), v8 (copy), v11 (copy)
            local v52 = nil;
            if v6.scrollingFrameRef and v6.scrollingFrameRef.current and v10.current ~= v6.scrollingFrameRef.current then
                v7.current = if v6.scrollingFrameRef.current.ScrollingDirection == Enum.ScrollingDirection.Y then v6.scrollingFrameRef.current.CanvasPosition.Y else v6.scrollingFrameRef.current.CanvasPosition.X;
                v52 = v6.scrollingFrameRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ Line: 261 ]]
                    -- upvalues: v51 (ref)
                    v51();
                end);
                v10.current = v6.scrollingFrameRef.current;
            end;
            return function() --[[ Line: 268 ]]
                -- upvalues: v9 (ref), v12 (ref), v7 (ref), v8 (ref), v6 (ref), v11 (ref), v52 (ref), v10 (ref)
                if v9.current then
                    local l_current_7 = v12.current;
                    local v54 = v7.current - v8.current;
                    if v54 ~= 0 then
                        v6.sendScrollEvent(v54, l_current_7 - v11.current, v8.current);
                    end;
                    v9.current:Disconnect();
                end;
                v9.current = nil;
                if v52 then
                    v52:Disconnect();
                end;
                v52 = nil;
                if not v6.scrollingFrameRef or not v6.scrollingFrameRef.current then
                    v10.current = nil;
                end;
            end;
        end, {
            v6.scrollingFrameRef
        });
    end;
    return nil;
end;