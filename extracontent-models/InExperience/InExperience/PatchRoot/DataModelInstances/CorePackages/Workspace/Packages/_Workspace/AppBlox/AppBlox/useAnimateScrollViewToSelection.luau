local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_TweenService_0 = game:GetService("TweenService");
local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v3 = require(l_Parent_0.React);
local l_GamepadService_0 = game:GetService("GamepadService");
return function(v5, v6) --[[ Line: 11 ]] --[[ Name: useAnimateScrollViewToSelection ]]
    -- upvalues: v3 (copy), l_GamepadService_0 (copy), l_UserGameSettings_0 (copy), l_TweenService_0 (copy)
    v3.useEffect(function() --[[ Line: 15 ]]
        -- upvalues: v5 (copy), l_GamepadService_0 (ref), l_UserGameSettings_0 (ref), l_TweenService_0 (ref), v6 (copy)
        local v7 = {};
        local v8 = nil;
        local v9 = 0;
        local v10 = 0;
        if v5 and v5.current ~= nil then
            local l_current_0 = v5.current;
            v9 = l_current_0.AbsolutePosition.Y;
            v10 = l_current_0.AbsoluteWindowSize.Y;
            table.insert(v7, l_current_0:GetPropertyChangedSignal("AbsolutePosition"):Connect(function() --[[ Line: 27 ]]
                -- upvalues: v9 (ref), l_current_0 (copy)
                v9 = l_current_0.AbsolutePosition.Y;
            end));
            table.insert(v7, l_current_0:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function() --[[ Line: 33 ]]
                -- upvalues: v10 (ref), l_current_0 (copy)
                v10 = l_current_0.AbsoluteWindowSize.Y;
            end));
            table.insert(v7, l_current_0.SelectionChanged:Connect(function(_, _, v14) --[[ Line: 39 ]]
                -- upvalues: l_current_0 (copy), l_GamepadService_0 (ref), v8 (ref), v10 (ref), v9 (ref), l_UserGameSettings_0 (ref), l_TweenService_0 (ref), v6 (ref)
                if v14 == nil or not v14:IsDescendantOf(l_current_0) or l_GamepadService_0.GamepadCursorEnabled then
                    return;
                else
                    if v8 then
                        v8:Cancel();
                        v8 = nil;
                    end;
                    local l_Y_0 = v14.AbsoluteSize.Y;
                    local v16 = v14.AbsolutePosition.Y - (v10 * 0.5 - l_Y_0 * 0.5 + v9);
                    local l_CanvasPosition_0 = l_current_0.CanvasPosition;
                    local v18 = Vector2.new(l_CanvasPosition_0.X, l_CanvasPosition_0.Y + v16);
                    if l_UserGameSettings_0.ReducedMotion then
                        l_current_0.CanvasPosition = v18;
                        return;
                    else
                        v8 = l_TweenService_0:Create(l_current_0, TweenInfo.new(v6, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                            CanvasPosition = v18
                        });
                        if v8 then
                            v8:Play();
                        end;
                        return;
                    end;
                end;
            end));
        end;
        return function() --[[ Line: 79 ]]
            -- upvalues: v7 (copy), v8 (ref)
            for _, v20 in v7 do
                v20:Disconnect();
            end;
            if v8 then
                v8:Cancel();
            end;
        end;
    end, {
        v5, 
        v6
    });
end;