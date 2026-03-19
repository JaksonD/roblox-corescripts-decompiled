local l_Parent_0 = script:FindFirstAncestor("CancelSubscriptionApp").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_InteractiveAlert_0 = v2.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useScreenSize_0 = require(l_Parent_0.EconomyCommonCoreScriptHooks).useScreenSize;
local v7 = {
    heading = "CoreScripts.CancelUserSubscriptionPrompt.RequestPrompt.Heading", 
    bodyText = "CoreScripts.CancelUserSubscriptionPrompt.RequestPrompt.Body", 
    noButtonText = "CoreScripts.CancelUserSubscriptionPrompt.RequestPrompt.DontCancelButton", 
    yesButtonText = "CoreScripts.CancelUserSubscriptionPrompt.RequestPrompt.YesCancelButton"
};
return function(v8) --[[ Line: 24 ]] --[[ Name: CancelUserSubscriptionRequestPrompt ]]
    -- upvalues: l_useLocalization_0 (copy), v7 (copy), v1 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy), l_useScreenSize_0 (copy)
    local v9 = l_useLocalization_0(v7);
    local v10 = v9.bodyText:gsub("{date}", v8.expirationDate);
    return v1.createElement(l_InteractiveAlert_0, {
        title = v9.heading, 
        bodyText = v10, 
        buttonStackInfo = {
            forcedFillDirection = Enum.FillDirection.Horizontal, 
            buttons = {
                {
                    props = {
                        onActivated = v8.onCancel or function() --[[ Line: 35 ]]

                        end, 
                        text = v9.noButtonText, 
                        delayInputSeconds = 0.75, 
                        [v1.Tag] = "data-testid=CancelSubscriptionApp_DontCancelButton"
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v8.onConfirm or function() --[[ Line: 45 ]]

                        end, 
                        text = v9.yesButtonText, 
                        delayInputSeconds = 0.75, 
                        [v1.Tag] = "data-testid=CancelSubscriptionApp_YesCancelButton"
                    }, 
                    isDefaultChild = false
                }
            }
        }, 
        position = UDim2.fromScale(0.5, 0.5), 
        screenSize = l_useScreenSize_0()
    });
end;