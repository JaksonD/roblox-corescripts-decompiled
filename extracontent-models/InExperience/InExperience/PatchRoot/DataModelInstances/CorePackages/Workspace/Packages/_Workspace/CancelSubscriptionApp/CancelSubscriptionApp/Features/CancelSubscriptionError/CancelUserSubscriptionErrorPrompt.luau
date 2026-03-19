local l_script_FirstAncestor_0 = script:FindFirstAncestor("CancelSubscriptionApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v7 = v3.App.ImageSet.Images["icons/status/error_large"];
local l_useScreenSize_0 = require(l_Parent_0.EconomyCommonCoreScriptHooks).useScreenSize;
local v9 = require(l_script_FirstAncestor_0.Enums.ErrorStateEnum);
local v10 = {
    [v9.Expiring] = "CoreScripts.CancelUserSubscriptionPrompt.ExpiringPrompt.Heading", 
    [v9.Unsubscribed] = "CoreScripts.CancelUserSubscriptionPrompt.UnsubscribedPrompt.Heading", 
    [v9.ErrorCancelling] = "CoreScripts.CancelUserSubscriptionPrompt.ErrorCancellingPrompt.Heading"
};
local v11 = {
    [v9.Expiring] = "CoreScripts.CancelUserSubscriptionPrompt.ExpiringPrompt.Body", 
    [v9.Unsubscribed] = "CoreScripts.CancelUserSubscriptionPrompt.UnsubscribedPrompt.Body", 
    [v9.ErrorCancelling] = "CoreScripts.CancelUserSubscriptionPrompt.ErrorCancellingPrompt.Body"
};
return function(v12) --[[ Line: 30 ]] --[[ Name: CancelUserSubscriptionErrorPrompt ]]
    -- upvalues: l_useLocalization_0 (copy), v10 (copy), v11 (copy), v2 (copy), l_InteractiveAlert_0 (copy), v7 (copy), l_ButtonType_0 (copy), l_useScreenSize_0 (copy)
    local v13 = l_useLocalization_0({
        heading = v10[v12.errorState], 
        bodyText = v11[v12.errorState], 
        buttonText = "CoreScripts.CancelUserSubscriptionPrompt.Error.ButtonText"
    });
    return v2.createElement(l_InteractiveAlert_0, {
        title = v13.heading, 
        titleIcon = v7, 
        bodyText = v13.bodyText, 
        buttonStackInfo = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v12.onDismiss or function() --[[ Line: 46 ]]

                        end, 
                        text = v13.buttonText, 
                        delayInputSeconds = 0.75, 
                        [v2.Tag] = "data-testid=CancelSubscriptionApp_OkButton"
                    }, 
                    isDefaultChild = true
                }
            }
        }, 
        position = UDim2.fromScale(0.5, 0.5), 
        screenSize = l_useScreenSize_0()
    });
end;