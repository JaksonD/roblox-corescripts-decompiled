local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local l_Tokens_0 = v2.App.Style.Tokens;
local l_Constants_0 = v2.App.Style.Constants;
local l_DeviceType_0 = l_Constants_0.DeviceType;
local v6 = require(l_RobloxGui_0.Modules.TenFootInterface);
return function(v7, v8) --[[ Line: 11 ]]
    -- upvalues: v6 (copy), l_DeviceType_0 (copy), l_Tokens_0 (copy), l_Constants_0 (copy)
    local v9 = if v6:IsEnabled() then l_DeviceType_0.Console else v7 or l_DeviceType_0.DefaultDeviceType;
    return l_Tokens_0.getFoundationTokens(v9, v8 or l_Constants_0.DefaultThemeName);
end;