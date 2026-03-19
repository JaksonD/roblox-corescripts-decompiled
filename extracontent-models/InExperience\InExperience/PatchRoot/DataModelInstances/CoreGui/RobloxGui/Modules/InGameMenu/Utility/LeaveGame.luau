local l_RunService_0 = game:GetService("RunService");
local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Parent_0 = script.Parent.Parent;
local l_GetDefaultQualityLevel_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).GetDefaultQualityLevel;
local v5 = require(l_Parent_0.Utility.SendAnalytics);
local v6 = require(l_Parent_0.Resources.Constants);
return function() --[[ Line: 12 ]]
    -- upvalues: v5 (copy), v6 (copy), l_GuiService_0 (copy), l_RunService_0 (copy), l_GetDefaultQualityLevel_0 (copy)
    v5(v6.AnalyticsInGameMenuName, v6.AnalyticsLeaveGameName, {
        confirmed = v6.AnalyticsConfirmedName
    });
    l_GuiService_0.SelectedCoreObject = nil;
    l_RunService_0.RenderStepped:Wait();
    l_RunService_0.RenderStepped:Wait();
    game:Shutdown();
    settings().Rendering.QualityLevel = l_GetDefaultQualityLevel_0();
end;