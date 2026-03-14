local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local l_TweenService_0 = game:GetService("TweenService");
local v3 = {
    linear = Enum.EasingStyle.Linear, 
    quadratic = Enum.EasingStyle.Quad, 
    cubic = Enum.EasingStyle.Cubic
};
local function _(v4) --[[ Line: 32 ]] --[[ Name: stopTween ]]
    if v4.current then
        v4.current:Cancel();
        v4.current = nil;
    end;
end;
local function _(v6, v7) --[[ Line: 40 ]] --[[ Name: isApproximatelyEqual ]]
    return math.abs(v6 - v7) < 0.001;
end;
return function(v9) --[[ Line: 44 ]] --[[ Name: useAnimation ]]
    -- upvalues: v1 (copy), v3 (copy), l_TweenService_0 (copy)
    local v10 = v1.useRef(nil);
    local v11 = v1.useRef(nil);
    v1.useEffect(function() --[[ Line: 48 ]]
        -- upvalues: v9 (copy), v11 (copy), v3 (ref), v10 (copy), l_TweenService_0 (ref)
        local l_startOffset_0 = v9.startOffset;
        local v13 = v9.endOffset or 0;
        local v14 = v9.duration or 0.2;
        local v15 = v9.easingStyle or "quadratic";
        if math.abs(l_startOffset_0 - v13) < 0.001 then
            return;
        else
            local l_NumberValue_0 = Instance.new("NumberValue");
            l_NumberValue_0.Value = l_startOffset_0;
            v11.current = l_startOffset_0;
            local v17 = v3[v15] or v3.quadratic;
            local v18 = TweenInfo.new(v14, v17, Enum.EasingDirection.Out);
            local l_v10_0 = v10;
            if l_v10_0.current then
                l_v10_0.current:Cancel();
                l_v10_0.current = nil;
            end;
            v10.current = l_TweenService_0:Create(l_NumberValue_0, v18, {
                Value = v13
            });
            l_v10_0 = l_NumberValue_0:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 75 ]]
                -- upvalues: l_NumberValue_0 (copy), v11 (ref), v9 (ref)
                local l_Value_0 = l_NumberValue_0.Value;
                if v11.current == nil or not (math.abs(l_Value_0 - v11.current) < 0.001) then
                    v11.current = l_Value_0;
                    v9.setAnimationOffset(l_Value_0);
                end;
            end);
            if v10.current then
                v10.current.Completed:Connect(function() --[[ Line: 84 ]]
                    -- upvalues: l_v10_0 (copy), l_NumberValue_0 (copy), v10 (ref), v11 (ref)
                    l_v10_0:Disconnect();
                    l_NumberValue_0:Destroy();
                    v10.current = nil;
                    v11.current = nil;
                end);
                v10.current:Play();
            end;
            return function() --[[ Line: 93 ]]
                -- upvalues: l_v10_0 (copy), v10 (ref), l_NumberValue_0 (copy), v11 (ref)
                l_v10_0:Disconnect();
                local l_v10_1 = v10;
                if l_v10_1.current then
                    l_v10_1.current:Cancel();
                    l_v10_1.current = nil;
                end;
                l_NumberValue_0:Destroy();
                v11.current = nil;
            end;
        end;
    end, {
        v9.startOffset, 
        v9.endOffset, 
        v9.duration, 
        v9.easingStyle, 
        v9.setAnimationOffset
    });
end;