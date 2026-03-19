local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.React);
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v4 = require(l_Parent_0.UIBlox);
local l_InteractiveAlert_0 = v4.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
return function(v7) --[[ Line: 21 ]]
    -- upvalues: l_useScreenSize_0 (copy), l_useLocalization_0 (copy), v1 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local v8 = l_useScreenSize_0();
    local v9 = l_useLocalization_0({
        closeButtonText = "Feature.ProfileBadges.action.close"
    });
    return v1.createElement(l_InteractiveAlert_0, {
        screenSize = v8, 
        title = v7.title, 
        bodyText = v7.body, 
        buttonStackInfo = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.Secondary, 
                    props = {
                        onActivated = v7.closeAlert, 
                        text = v7.buttonText or v9.closeButtonText
                    }
                }
            }
        }, 
        onCloseClicked = if v7.showCloseButton then v7.closeAlert else nil
    });
end;