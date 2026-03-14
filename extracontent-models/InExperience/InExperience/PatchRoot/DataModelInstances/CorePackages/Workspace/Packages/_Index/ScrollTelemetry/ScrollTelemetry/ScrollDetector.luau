local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script:FindFirstAncestor("ScrollTelemetry").Parent;
local v2 = require(l_Parent_0.React);
game:DefineFastInt("ScrollDetectorTimeThresholdMillis", 300000);
game:DefineFastInt("ScrollDetectorDelayMillis", 250);
local function _() --[[ Line: 9 ]] --[[ Name: getDelaySeconds ]]
    return game:GetFastInt("ScrollDetectorDelayMillis") / 1000;
end;
local function _() --[[ Line: 13 ]] --[[ Name: getThresholdSeconds ]]
    return game:GetFastInt("ScrollDetectorTimeThresholdMillis") / 1000;
end;
return function(v5) --[[ Line: 22 ]]
    -- upvalues: v2 (copy), l_RunService_0 (copy)
    local v6 = v2.useRef(0);
    local v7 = v2.useRef(0);
    local v8 = v2.useRef(nil);
    local v9 = v2.useRef(nil);
    local v10 = v2.useRef(0);
    local v11 = v2.useRef(0);
    local v12 = v2.useRef(nil);
    local function _(v13) --[[ Line: 31 ]]
        -- upvalues: v6 (copy), v7 (copy), v5 (copy), v10 (copy)
        local v14 = v6.current - v7.current;
        if v14 == 0 then
            return;
        else
            v5.sendScrollEvent(v14, v13 - v10.current, v7.current);
            return;
        end;
    end;
    local function v28() --[[ Line: 40 ]]
        -- upvalues: v5 (copy), v11 (copy), v6 (copy), v7 (copy), v10 (copy), v8 (copy), v12 (copy)
        if not v5.scrollingFrameRef or not v5.scrollingFrameRef.current then
            local l_current_0 = v11.current;
            local v17 = v6.current - v7.current;
            if v17 ~= 0 then
                v5.sendScrollEvent(v17, l_current_0 - v10.current, v7.current);
            end;
            if v8.current then
                v8.current:Disconnect();
            end;
            v8.current = nil;
            return;
        else
            local v18 = nil;
            local v19 = time();
            local v20 = v19 - v10.current;
            if v5.scrollingFrameRef and v5.scrollingFrameRef.current then
                v18 = if v5.scrollingFrameRef.current.ScrollingDirection == Enum.ScrollingDirection.Y then v5.scrollingFrameRef.current.CanvasPosition.Y else v5.scrollingFrameRef.current.CanvasPosition.X;
            end;
            local v21 = v6.current - v7.current;
            local v22 = v18 - v6.current;
            if not v12.current and v22 == 0 then
                v12.current = v11.current;
            elseif v12.current and v22 ~= 0 then
                v12.current = nil;
            end;
            if v12.current and v12.current + game:GetFastInt("ScrollDetectorDelayMillis") / 1000 < v19 then
                v6.current = v18;
                local l_current_1 = v12.current;
                local v24 = v6.current - v7.current;
                if v24 ~= 0 then
                    v5.sendScrollEvent(v24, l_current_1 - v10.current, v7.current);
                end;
                v7.current = v18;
                l_current_1 = v8.current;
                if l_current_1 then
                    l_current_1:Disconnect();
                end;
                v8.current = nil;
                return;
            else
                if v21 ~= 0 and v22 ~= 0 and math.sign(v21) ~= math.sign(v22) then
                    local l_current_2 = v11.current;
                    local v26 = v6.current - v7.current;
                    if v26 ~= 0 then
                        v5.sendScrollEvent(v26, l_current_2 - v10.current, v7.current);
                    end;
                    v7.current = v6.current;
                    v10.current = v11.current;
                elseif not v12.current and game:GetFastInt("ScrollDetectorTimeThresholdMillis") / 1000 <= v20 then
                    v6.current = v18;
                    local v27 = v6.current - v7.current;
                    if v27 ~= 0 then
                        v5.sendScrollEvent(v27, v19 - v10.current, v7.current);
                    end;
                    v7.current = v18;
                    v10.current = v19;
                end;
                v6.current = v18;
                v11.current = v19;
                return;
            end;
        end;
    end;
    local function v29() --[[ Line: 105 ]]
        -- upvalues: v8 (copy), v10 (copy), v11 (copy), v7 (copy), v6 (copy), l_RunService_0 (ref), v28 (copy)
        if not v8.current then
            v10.current = time();
            v11.current = v10.current;
            v7.current = v6.current;
            v8.current = l_RunService_0.Stepped:Connect(function() --[[ Line: 111 ]]
                -- upvalues: v28 (ref)
                v28();
            end);
        end;
    end;
    v2.useEffect(function() --[[ Line: 117 ]]
        -- upvalues: v5 (copy), v9 (copy), v6 (copy), v29 (copy), v8 (copy), v11 (copy), v7 (copy), v10 (copy)
        local v30 = nil;
        if v5.scrollingFrameRef and v5.scrollingFrameRef.current and v9.current ~= v5.scrollingFrameRef.current then
            v6.current = if v5.scrollingFrameRef.current.ScrollingDirection == Enum.ScrollingDirection.Y then v5.scrollingFrameRef.current.CanvasPosition.Y else v5.scrollingFrameRef.current.CanvasPosition.X;
            v30 = v5.scrollingFrameRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ Line: 130 ]]
                -- upvalues: v29 (ref)
                v29();
            end);
            v9.current = v5.scrollingFrameRef.current;
        end;
        return function() --[[ Line: 137 ]]
            -- upvalues: v8 (ref), v11 (ref), v6 (ref), v7 (ref), v5 (ref), v10 (ref), v30 (ref), v9 (ref)
            if v8.current then
                local l_current_3 = v11.current;
                local v32 = v6.current - v7.current;
                if v32 ~= 0 then
                    v5.sendScrollEvent(v32, l_current_3 - v10.current, v7.current);
                end;
                v8.current:Disconnect();
            end;
            v8.current = nil;
            if v30 then
                v30:Disconnect();
            end;
            v30 = nil;
            if not v5.scrollingFrameRef or not v5.scrollingFrameRef.current then
                v9.current = nil;
            end;
        end;
    end, {
        v5.scrollingFrameRef
    });
    return nil;
end;