local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local l_TweenService_0 = game:GetService("TweenService");
local _ = require(l_Parent_0.React);
return function(v3, v4) --[[ Line: 13 ]] --[[ Name: scrollToItem ]]
    -- upvalues: l_TweenService_0 (copy)
    if not v3 or not v3.current or not v4 then
        return;
    else
        local l_FirstChildWhichIsA_0 = v3.current:FindFirstChildWhichIsA("ScrollingFrame", true);
        if not l_FirstChildWhichIsA_0 then
            return;
        else
            task.wait();
            local l_current_0 = v4.current;
            if not l_current_0 then
                return;
            else
                local l_Y_0 = l_current_0.AbsolutePosition.Y;
                local v8 = l_Y_0 + l_current_0.AbsoluteSize.Y;
                local l_Y_1 = l_FirstChildWhichIsA_0.AbsolutePosition.Y;
                local v10 = l_Y_1 + l_FirstChildWhichIsA_0.AbsoluteWindowSize.Y;
                if l_Y_1 <= l_Y_0 and v8 <= v10 then
                    return;
                else
                    local v11 = l_Y_0 - l_FirstChildWhichIsA_0.AbsolutePosition.Y + l_FirstChildWhichIsA_0.CanvasPosition.Y;
                    local v12 = v8 - l_FirstChildWhichIsA_0.AbsolutePosition.Y + l_FirstChildWhichIsA_0.CanvasPosition.Y;
                    local l_Y_2 = l_FirstChildWhichIsA_0.CanvasPosition.Y;
                    if l_Y_0 < l_Y_1 then
                        l_Y_2 = v11;
                    elseif v10 < v8 then
                        l_Y_2 = v12 - l_FirstChildWhichIsA_0.AbsoluteWindowSize.Y;
                    end;
                    l_Y_2 = math.max(0, (math.min(l_Y_2, l_FirstChildWhichIsA_0.AbsoluteCanvasSize.Y - l_FirstChildWhichIsA_0.AbsoluteWindowSize.Y)));
                    local v14 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
                    l_TweenService_0:Create(l_FirstChildWhichIsA_0, v14, {
                        CanvasPosition = Vector2.new(0, l_Y_2)
                    }):Play();
                    return;
                end;
            end;
        end;
    end;
end;