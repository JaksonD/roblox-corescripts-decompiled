local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.UIBlox);
local l_ButtonType_0 = v1.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v1.App.Dialog.Alert.InteractiveAlert;
local v4 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v5 = require(l_CorePackages_0.Packages.React);
return function(v6) --[[ Line: 19 ]] --[[ Name: LeaveCreationAlert ]]
    -- upvalues: v5 (copy), l_InteractiveAlert_0 (copy), v4 (copy), l_ButtonType_0 (copy)
    return v5.createElement(l_InteractiveAlert_0, {
        title = v4:FormatByKey("CoreScripts.PublishAvatarPrompt.LeaveCreationTitle"), 
        bodyText = v4:FormatByKey("CoreScripts.PublishCommon.UnsavedWarning"), 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v6.closePrompt, 
                        text = v4:FormatByKey("CoreScripts.PublishCommon.Leave")
                    }, 
                    isDefaultChild = false
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v6.cancelClosePrompt, 
                        text = v4:FormatByKey("CoreScripts.PublishCommon.Stay")
                    }, 
                    isDefaultChild = true
                }
            }
        }, 
        position = UDim2.fromScale(0.5, 0.5), 
        screenSize = v6.screenSize
    });
end;