local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_CorePackages_0.Workspace.Packages.CachedPolicyService);
local v5 = require(l_RobloxGui_0.Modules.Flags.GetFFlagScreenshotHudApi);
return function() --[[ Line: 9 ]]
    -- upvalues: l_UserInputService_0 (copy), v5 (copy), v4 (copy)
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    local v7 = true;
    if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.IOS then
        v7 = l_l_UserInputService_0_Platform_0 == Enum.Platform.Android;
    end;
    local v8 = false;
    if v5() and v7 and not v4:IsSubjectToChinaPolicies() then
        v8 = true;
    end;
    return v8;
end;