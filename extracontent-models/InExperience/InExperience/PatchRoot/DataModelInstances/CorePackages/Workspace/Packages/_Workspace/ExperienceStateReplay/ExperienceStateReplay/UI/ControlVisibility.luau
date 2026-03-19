local v0 = {};
local l_Mouse_0 = game:GetService("Players").LocalPlayer:GetMouse();
local l_TweenService_0 = game:GetService("TweenService");
v0.setupControl = function(v3) --[[ Line: 10 ]] --[[ Name: setupControl ]]
    -- upvalues: l_Mouse_0 (copy), l_TweenService_0 (copy)
    local v4 = os.time();
    local v5 = false;
    local v6 = false;
    l_Mouse_0.Move:Connect(function() --[[ Line: 15 ]]
        -- upvalues: v4 (ref)
        v4 = os.time();
    end);
    v3.ControlBarContainer.MouseEnter:Connect(function() --[[ Line: 19 ]]
        -- upvalues: v5 (ref)
        v5 = true;
    end);
    v3.ControlBarContainer.MouseLeave:Connect(function() --[[ Line: 23 ]]
        -- upvalues: v5 (ref)
        v5 = false;
    end);
    local v7 = nil;
    local function v8() --[[ Line: 29 ]] --[[ Name: createTween ]]
        -- upvalues: v7 (ref), l_TweenService_0 (ref), v3 (copy), v8 (copy)
        v7 = l_TweenService_0:Create(v3.ControlBarContainer, TweenInfo.new(2), {
            Position = v3.ControlBarContainerNonVisiblePosition
        });
        if v7 then
            v7.Completed:Connect(function() --[[ Line: 36 ]]
                -- upvalues: v8 (ref)
                v8();
            end);
            return;
        else
            error("Failed to create tween for control visibility");
            return;
        end;
    end;
    v8();
    task.spawn(function() --[[ Line: 45 ]]
        -- upvalues: v7 (ref), v5 (ref), v4 (ref), v6 (ref), v3 (copy)
        while true do
            if not v7 then
                error("No current tween for control visibility");
            end;
            if not v5 and os.time() - v4 > 2 then
                if not v6 then
                    v6 = true;
                    v7:Play();
                end;
            elseif v6 then
                v6 = false;
                v7:Cancel();
                v3.ControlBarContainer.Position = v3.ControlBarContainerVisiblePosition;
            end;
            task.wait(0.1);
        end;
    end);
end;
return v0;