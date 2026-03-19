local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Modules_0 = l_CoreGui_0:WaitForChild("RobloxGui").Modules;
local l_VRGamepadControls_0 = script.Parent.VRGamepadControls;
local v5 = require(l_CorePackages_0.Workspace.Packages.HelpPage);
local v6 = require(l_CorePackages_0.Packages.Foundation);
local l_FoundationProvider_0 = v6.FoundationProvider;
local l_LocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
local v9 = require(l_CorePackages_0.Packages.React);
local v10 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization.new(l_LocalizationService_0.RobloxLocaleId);
local v11 = require(script.Parent.Parent.ControlLayoutContainer);
local l_HelpReactView_0 = v5.HelpReactView;
local l_FFlagHelpPageMountVR_0 = v5.Flags.FFlagHelpPageMountVR;
local _ = nil;
local v15 = nil;
if l_FFlagHelpPageMountVR_0 then
    v15 = require(l_Modules_0.Settings.Integrations).Utils;
end;
if l_FFlagHelpPageMountVR_0 then
    local function v16() --[[ Line: 30 ]] --[[ Name: VRGamepadControlsWrapper ]]
        -- upvalues: v9 (copy), v11 (copy), l_LocalizationProvider_0 (copy), v10 (copy), l_FoundationProvider_0 (copy), v6 (copy), v15 (ref), l_HelpReactView_0 (copy)
        return v9.createElement(v11, {
            titleText = "CoreScripts.InGameMenu.Controls.VrControllerTitle"
        }, {
            Inner = v9.createElement(l_LocalizationProvider_0, {
                localization = v10
            }, {
                FoundationProvider = v9.createElement(l_FoundationProvider_0, {
                    theme = v6.Enums.Theme.Dark, 
                    device = v15.getDeviceType()
                }, {
                    HelpReactView = v9.createElement(l_HelpReactView_0)
                })
            })
        });
    end;
    return v9.memo(v16);
else
    return require(l_VRGamepadControls_0);
end;