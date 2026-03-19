local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent;
local v2 = require(l_Parent_0.AvatarExperienceFlags);
local l_isSpatial_0 = require(l_Parent_0.AppCommonLib).isSpatial;
local l_FFlagAXMigrateReportAvatarEventCounter_0 = v2.FFlagAXMigrateReportAvatarEventCounter;
return function(v5) --[[ Line: 12 ]] --[[ Name: getAvatarEventCounterNameWithPlatform ]]
    -- upvalues: l_UserInputService_0 (copy), l_isSpatial_0 (copy), l_FFlagAXMigrateReportAvatarEventCounter_0 (copy)
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    if l_isSpatial_0() then
        return "VR" .. v5;
    elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.Android then
        return "Android" .. v5;
    elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS then
        return "IOS" .. v5;
    elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.Windows then
        return "Windows" .. v5;
    elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.OSX then
        return "OSX" .. v5;
    elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.PS4 or l_l_UserInputService_0_Platform_0 == Enum.Platform.PS5 then
        return "PlayStation" .. v5;
    else
        if l_FFlagAXMigrateReportAvatarEventCounter_0 and (l_l_UserInputService_0_Platform_0 == Enum.Platform.XBoxOne or l_l_UserInputService_0_Platform_0 == Enum.Platform.XBox360) then
            v5 = "Xbox-" .. v5;
        end;
        return v5;
    end;
end;