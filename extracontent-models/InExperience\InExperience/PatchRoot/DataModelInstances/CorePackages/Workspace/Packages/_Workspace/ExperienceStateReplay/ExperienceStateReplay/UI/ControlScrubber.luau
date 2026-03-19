local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.LoadSlices);
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ExperienceStateRecordingService_0 = game:GetService("ExperienceStateRecordingService");
local l_Mouse_0 = game:GetService("Players").LocalPlayer:GetMouse();
local v5 = {};
computePercentX = function(v6, v7, v8) --[[ Line: 13 ]] --[[ Name: computePercentX ]]
    local l_X_0 = v6.X;
    local v10 = l_X_0 + v7.X;
    return (v8 - l_X_0) / (v10 - l_X_0);
end;
v5.jumpTo = function(v11) --[[ Line: 19 ]] --[[ Name: jumpTo ]]
    -- upvalues: l_Mouse_0 (copy), v1 (copy), l_ExperienceStateRecordingService_0 (copy)
    local v12 = computePercentX(v11.ScrubberLoadProgress.AbsolutePosition, v11.ScrubberLoadProgress.AbsoluteSize, l_Mouse_0.X);
    if v12 < 0 or v12 > 1 then
        local v13 = computePercentX(v11.ScrubberButton.AbsolutePosition, v11.ScrubberButton.AbsoluteSize, l_Mouse_0.X);
        v1.loadNoncontiguousSlice(v11, v13);
        return;
    else
        l_ExperienceStateRecordingService_0:SetPlaybackPercentage(v12);
        return;
    end;
end;
v5.setupControl = function(v14) --[[ Line: 39 ]] --[[ Name: setupControl ]]
    -- upvalues: l_UserInputService_0 (copy), v5 (copy)
    v14.ScrubberButton.MouseMoved:Connect(function() --[[ Line: 40 ]]
        -- upvalues: l_UserInputService_0 (ref), v5 (ref), v14 (copy)
        if not l_UserInputService_0:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
            return;
        else
            v5.jumpTo(v14);
            return;
        end;
    end);
    v14.ScrubberButton.MouseButton1Down:Connect(function() --[[ Line: 48 ]]
        -- upvalues: v5 (ref), v14 (copy)
        v5.jumpTo(v14);
    end);
end;
return v5;