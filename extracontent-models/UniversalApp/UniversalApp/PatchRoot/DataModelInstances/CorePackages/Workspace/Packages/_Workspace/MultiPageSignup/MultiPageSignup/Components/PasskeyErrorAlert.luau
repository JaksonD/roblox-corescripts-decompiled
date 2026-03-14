local l_Parent_0 = script:FindFirstAncestor("MultiPageSignup").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.UIBlox);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
return function(v8) --[[ Line: 17 ]]
    -- upvalues: l_useLocalization_0 (copy), l_useDesignTokens_0 (copy), v1 (copy), v2 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local v9 = l_useLocalization_0({
        passkeyErrorTitle = "Authentication.SignUp.Header.PleaseTryAgain", 
        passkeyErrorDescription = "Authentication.SignUp.Description.PasskeyTryAgain", 
        passkeyErrorButtonText = "Authentication.SignUp.Action.StartOver"
    });
    local v10 = l_useDesignTokens_0();
    return v1.createElement(v2.View, {
        tag = "auto-y size-full-0 anchor-center-center position-center-center gui-object-defaults", 
        ZIndex = 10
    }, {
        v1.createElement(l_InteractiveAlert_0, {
            title = v9.passkeyErrorTitle, 
            bodyText = v9.passkeyErrorDescription, 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimaryContextual, 
                        props = {
                            onActivated = v8.onActivated, 
                            text = v9.passkeyErrorButtonText
                        }
                    }
                }, 
                buttonHeight = v10.Global.Space_600
            }, 
            position = UDim2.fromScale(0.5, 0.5), 
            screenSize = Vector2.new(400, nil)
        })
    });
end;