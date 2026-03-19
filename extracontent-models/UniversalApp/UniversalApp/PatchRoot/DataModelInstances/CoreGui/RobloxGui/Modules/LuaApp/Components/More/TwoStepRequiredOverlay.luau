local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_Images_0 = v3.App.ImageSet.Images;
local v7 = require(l_Modules_0.LuaApp.withLocalization);
local v8 = game:DefineFastFlag("AETwoFactorLogOutMessage", false);
return function(v9) --[[ Line: 22 ]] --[[ Name: TwoStepRequiredOverlay ]]
    -- upvalues: v7 (copy), v8 (copy), v2 (copy), l_InteractiveAlert_0 (copy), l_Images_0 (copy), l_ButtonType_0 (copy)
    local l_closePrompt_0 = v9.closePrompt;
    local l_navigateToSecuritySettings_0 = v9.navigateToSecuritySettings;
    return v7({
        title = "Authentication.TwoStepVerification.Title.VerificationRequired", 
        message = v8 and "Authentication.TwoStepVerification.Label.TwoStepRequiredLogout" or "Authentication.TwoStepVerification.Label.TwoStepRequired", 
        cancel = "Feature.Catalog.Action.Cancel", 
        gotoSecurity = "Authentication.TwoStepVerification.Action.GoToSecurity"
    })(function(v12) --[[ Line: 32 ]]
        -- upvalues: v2 (ref), l_InteractiveAlert_0 (ref), l_Images_0 (ref), l_closePrompt_0 (copy), l_ButtonType_0 (ref), l_navigateToSecuritySettings_0 (copy), v9 (copy)
        return v2.createElement(l_InteractiveAlert_0, {
            title = v12.title, 
            titleIcon = l_Images_0["icons/status/error_large"], 
            bodyText = v12.message, 
            buttonStackInfo = {
                buttons = {
                    {
                        props = {
                            onActivated = l_closePrompt_0, 
                            text = v12.cancel
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = l_navigateToSecuritySettings_0, 
                            text = v12.gotoSecurity
                        }
                    }
                }
            }, 
            screenSize = v9.screenSize
        });
    end);
end;