local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script:FindFirstAncestor("AppCommonLib").Parent;
local v3 = require(script.Parent.IsVRAppBuild);
local v4 = require(l_Parent_0.RobloxAppEnums);
local l_DeviceOrientationMode_0 = v4.DeviceOrientationMode;
local l_DeviceType_0 = v4.DeviceType;
return function(v7) --[[ Line: 16 ]] --[[ Name: getDeviceType ]]
    -- upvalues: v3 (copy), l_DeviceType_0 (copy), l_GuiService_0 (copy), l_UserInputService_0 (copy), l_DeviceOrientationMode_0 (copy)
    if v3() then
        return l_DeviceType_0.VR;
    elseif l_GuiService_0:IsTenFootInterface() then
        return l_DeviceType_0.Console;
    else
        local l_None_0 = Enum.Platform.None;
        pcall(function() --[[ Line: 26 ]]
            -- upvalues: l_None_0 (ref), l_UserInputService_0 (ref)
            l_None_0 = l_UserInputService_0:GetPlatform();
        end);
        if l_None_0 == Enum.Platform.Windows or l_None_0 == Enum.Platform.OSX or l_None_0 == Enum.Platform.UWP then
            return l_DeviceType_0.Desktop;
        else
            if l_None_0 == Enum.Platform.IOS or l_None_0 == Enum.Platform.Android then
                if v7 == l_DeviceOrientationMode_0.Landscape then
                    return l_DeviceType_0.Tablet;
                elseif v7 == l_DeviceOrientationMode_0.Portrait then
                    return l_DeviceType_0.Phone;
                end;
            end;
            return l_DeviceType_0.Unknown;
        end;
    end;
end;