local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_VRService_0 = game:GetService("VRService");
local v3 = require(l_script_FirstAncestor_0.Enums.PaymentPlatformEnum);
return function() --[[ Line: 9 ]] --[[ Name: getPaymentPlatform ]]
    -- upvalues: l_UserInputService_0 (copy), v3 (copy), l_VRService_0 (copy)
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    if l_l_UserInputService_0_Platform_0 == Enum.Platform.Windows or l_l_UserInputService_0_Platform_0 == Enum.Platform.OSX or l_l_UserInputService_0_Platform_0 == Enum.Platform.Linux then
        return v3.Desktop;
    elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS or l_l_UserInputService_0_Platform_0 == Enum.Platform.Android or l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP then
        return v3.Mobile;
    elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.XBoxOne or l_l_UserInputService_0_Platform_0 == Enum.Platform.XBox360 or l_l_UserInputService_0_Platform_0 == Enum.Platform.PS3 or l_l_UserInputService_0_Platform_0 == Enum.Platform.PS4 or l_l_UserInputService_0_Platform_0 == Enum.Platform.PS5 then
        return v3.Console;
    elseif l_VRService_0:IsVRAppBuild() then
        return v3.VR;
    else
        return v3.Unknown;
    end;
end;