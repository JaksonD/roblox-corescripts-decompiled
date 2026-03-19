local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator):FormatByKey("Feature.SettingsHub.Prompt.RestartOnMicAccessChange");
return function(v2) --[[ Line: 14 ]]
    -- upvalues: v1 (copy)
    if v2:GetPlatform() == Enum.Platform.Android then
        return "<b>" .. v1 .. "</b>";
    else
        return nil;
    end;
end;