local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_getAvatarEventCounterNameWithPlatform_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).getAvatarEventCounterNameWithPlatform;
local v4 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
return function(v5, v6) --[[ Line: 12 ]] --[[ Name: reportAvatarEventCounter ]]
    -- upvalues: v4 (copy), l_getAvatarEventCounterNameWithPlatform_0 (copy), l_UserInputService_0 (copy)
    if v4() then
        v6 = l_getAvatarEventCounterNameWithPlatform_0(v6);
    else
        local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
        if l_l_UserInputService_0_Platform_0 == Enum.Platform.Android then
            v6 = "Android" .. v6;
        elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS then
            v6 = "IOS" .. v6;
        elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.Windows then
            v6 = "Windows" .. v6;
        elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.OSX then
            v6 = "OSX" .. v6;
        elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.PS4 or l_l_UserInputService_0_Platform_0 == Enum.Platform.PS5 then
            v6 = "PlayStation" .. v6;
        end;
    end;
    v5.Diag:reportCounter(v6, 1);
end;