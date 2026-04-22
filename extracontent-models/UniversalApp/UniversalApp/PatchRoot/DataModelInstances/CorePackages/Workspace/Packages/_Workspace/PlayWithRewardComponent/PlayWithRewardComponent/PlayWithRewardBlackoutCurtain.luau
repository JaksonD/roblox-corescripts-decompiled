local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = {};
local v2 = nil;
v1.show = function() --[[ Line: 9 ]] --[[ Name: show ]]
    -- upvalues: v2 (ref), l_CoreGui_0 (copy)
    if v2 and v2.Parent then
        return;
    else
        local l_ScreenGui_0 = Instance.new("ScreenGui");
        l_ScreenGui_0.Name = "PlayWithRewardBlackoutCurtain";
        l_ScreenGui_0.DisplayOrder = 99;
        l_ScreenGui_0.IgnoreGuiInset = true;
        local l_Frame_0 = Instance.new("Frame");
        l_Frame_0.Name = "BlackoutCurtainFrame";
        l_Frame_0.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
        l_Frame_0.BackgroundTransparency = 0;
        l_Frame_0.Size = UDim2.fromScale(1, 1);
        l_Frame_0.Active = true;
        l_Frame_0.Parent = l_ScreenGui_0;
        l_ScreenGui_0.Parent = l_CoreGui_0;
        v2 = l_ScreenGui_0;
        return;
    end;
end;
v1.hide = function() --[[ Line: 31 ]] --[[ Name: hide ]]
    -- upvalues: v2 (ref)
    if v2 then
        v2:Destroy();
        v2 = nil;
    end;
end;
return v1;