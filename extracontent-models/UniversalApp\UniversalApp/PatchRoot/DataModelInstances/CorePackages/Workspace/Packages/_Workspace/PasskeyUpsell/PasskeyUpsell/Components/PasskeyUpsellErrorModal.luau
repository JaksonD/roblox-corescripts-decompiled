local l_Parent_0 = script:FindFirstAncestor("PasskeyUpsell").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v4 = require(l_Parent_0.AuthAnalytics);
local l_authModalShown_0 = v4.Events.authModalShown;
local l_EventStreamConstants_0 = v4.EventStreamConstants;
local l_InteractiveAlert_0 = v2.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
return function(v11) --[[ Line: 26 ]]
    -- upvalues: l_useLocalization_0 (copy), l_useStyle_0 (copy), l_useSelector_0 (copy), l_authModalShown_0 (copy), l_EventStreamConstants_0 (copy), v1 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local v12 = l_useLocalization_0({
        passkeyErrorTitle = "Authentication.Passkey.Label.UpsellErrorTitle", 
        passkeyErrorDescription = "Authentication.Passkey.Description.Error", 
        passkeyTryAgainLaterText = "Authentication.Passkey.Action.TryAgainLaterAcknowledgement", 
        passkeyTryAgainNowText = "Authentication.Passkey.Action.TryAgainNowAcknowledgement"
    });
    local v13 = l_useStyle_0();
    local v15 = l_useSelector_0(function(v14) --[[ Line: 35 ]]
        return v14.GlobalGuiInset.top;
    end);
    local v17 = l_useSelector_0(function(v16) --[[ Line: 39 ]]
        return v16.ScreenSize;
    end);
    l_authModalShown_0(l_EventStreamConstants_0.Context.PasskeyUpsellErrorModalShown, l_EventStreamConstants_0.State.Success);
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v17.Y - v15), 
        BackgroundColor3 = v13.Theme.Overlay.Color, 
        BackgroundTransparency = 0.5
    }, {
        v1.createElement(l_InteractiveAlert_0, {
            title = v12.passkeyErrorTitle, 
            bodyText = v12.passkeyErrorDescription, 
            buttonStackInfo = {
                buttons = {
                    {
                        props = {
                            buttonType = l_ButtonType_0.Secondary, 
                            onActivated = v11.onCancel, 
                            text = v12.passkeyTryAgainLaterText
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimaryContextual, 
                        props = {
                            onActivated = v11.onTryAgain, 
                            text = v12.passkeyTryAgainNowText
                        }
                    }
                }, 
                buttonHeight = 40
            }, 
            anchorPoint = Vector2.new(0.5, 0.5), 
            position = UDim2.new(0.5, 0, 0.5, 0), 
            screenSize = v17
        })
    });
end;