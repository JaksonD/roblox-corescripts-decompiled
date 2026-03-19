local l_Parent_0 = script:FindFirstAncestor("VerifiedParentalConsentDialog").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_InteractiveAlert_0 = v2.App.Dialog.Alert.InteractiveAlert;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
return function(v6) --[[ Line: 21 ]] --[[ Name: AlertPrompt ]]
    -- upvalues: l_useLocalization_0 (copy), v1 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local v7 = l_useLocalization_0({
        GoToSettings = "Common.VerifiedParentalConsent.Action.GoToSettings", 
        Cancel = "Common.VerifiedParentalConsent.Action.Cancel", 
        Close = "Common.VerifiedParentalConsent.Action.Close"
    });
    return v1.createElement(l_InteractiveAlert_0, {
        title = v6.title, 
        titleIcon = v6.titleIcon, 
        bodyText = v6.bodyText, 
        buttonStackInfo = {
            buttons = (function() --[[ Line: 33 ]]
                -- upvalues: v6 (copy), l_ButtonType_0 (ref), v7 (copy)
                if v6.isActionable then
                    return {
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                onActivated = if v6.onAction then v6.onAction else v6.onDismiss, 
                                text = v7.GoToSettings
                            }
                        }, 
                        {
                            props = {
                                onActivated = v6.onDismiss, 
                                text = v7.Cancel
                            }
                        }
                    };
                else
                    return {
                        {
                            props = {
                                onActivated = v6.onDismiss, 
                                text = v7.Close
                            }
                        }
                    };
                end;
            end)()
        }, 
        position = UDim2.fromScale(0.5, 0.5), 
        screenSize = v6.screenSize, 
        middleContent = v6.middleContent
    });
end;