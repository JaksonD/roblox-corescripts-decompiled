local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local _ = l_RobloxGui_0:WaitForChild("Modules");
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_UIBloxInGameConfig_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).UIBloxInGameConfig;
v4.init(l_UIBloxInGameConfig_0);
if game:DefineFastFlag("FeedbackModuleEarlyFontInitialization", false) then
    local l_TextService_0 = game:GetService("TextService");
    local l_GetTextBoundsParams_0 = Instance.new("GetTextBoundsParams");
    l_GetTextBoundsParams_0.Text = "random text";
    l_GetTextBoundsParams_0.Font = Font.fromEnum(Enum.Font.Gotham);
    l_GetTextBoundsParams_0.Size = 19;
    l_GetTextBoundsParams_0.Width = 0;
    local _ = l_TextService_0:GetTextBoundsAsync(l_GetTextBoundsParams_0);
end;
game:GetService("GuiService").NativeClose:Connect(function() --[[ Line: 26 ]] --[[ Name: handleNativeExit ]]
    game:GetService("ExperienceStateCaptureService"):ToggleCaptureMode();
end);
game:WaitForChild("SafetyService");
if game:GetService("SafetyService").IsCaptureModeForReport then
    require(l_CorePackages_0.Workspace.Packages.InGameAssetReporting).initialize();
    return;
else
    require(l_RobloxGui_0.Modules.Feedback).initialize();
    return;
end;