local l_UserInputService_0 = game:GetService("UserInputService");
local l_VRService_0 = game:GetService("VRService");
return function(v2) --[[ Line: 6 ]]
    -- upvalues: l_UserInputService_0 (copy), l_VRService_0 (copy)
    if v2 then
        l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceShow;
        return;
    elseif l_VRService_0.VREnabled then
        l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide;
        return;
    else
        l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None;
        return;
    end;
end;