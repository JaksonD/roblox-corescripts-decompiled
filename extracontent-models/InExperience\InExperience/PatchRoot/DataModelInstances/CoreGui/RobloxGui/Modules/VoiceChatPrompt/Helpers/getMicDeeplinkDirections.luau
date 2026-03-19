local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v2 = v1:FormatByKey("Feature.SettingsHub.Prompt.AndroidWithDeeplink");
local v3 = v1:FormatByKey("Feature.SettingsHub.Prompt.WindowsWithDeeplink");
local v4 = v1:FormatByKey("Feature.SettingsHub.Prompt.AndroidWithoutDeeplink");
local v5 = v1:FormatByKey("Feature.SettingsHub.Prompt.WindowsWithoutDeeplink");
return function(v6, v7) --[[ Line: 12 ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy), v5 (copy)
    local l_v7_Platform_0 = v7:GetPlatform();
    if l_v7_Platform_0 == Enum.Platform.Android then
        if v6 then
            return v2;
        else
            return v4;
        end;
    elseif l_v7_Platform_0 == Enum.Platform.Windows then
        if v6 then
            return v3;
        else
            return v5;
        end;
    else
        return nil;
    end;
end;