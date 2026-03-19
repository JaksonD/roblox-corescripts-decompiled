local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialExperienceJoin");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.Localization);
local v5 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_useLocalization_0 = v4.Hooks.useLocalization;
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
return function(v9) --[[ Line: 21 ]]
    -- upvalues: l_useLocalization_0 (copy), v5 (copy), v2 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local v10 = l_useLocalization_0({
        titleText = v5.UnableToJoin, 
        bodyText = {
            v5.NoExperienceAccess; 
            name = v9.userPrimaryName
        }, 
        confirmButtonText = v5.ViewDetails, 
        cancelButtonText = v5.Cancel
    });
    return v2.createElement(l_InteractiveAlert_0, {
        screenSize = v9.screenSize, 
        title = v10.titleText, 
        bodyText = v10.bodyText, 
        buttonStackInfo = {
            buttons = {
                {
                    buttonType = nil, 
                    props = {
                        text = v10.cancelButtonText, 
                        onActivated = v9.cancel
                    }
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        text = v10.confirmButtonText, 
                        onActivated = v9.openGameDetailsPeekView
                    }
                }
            }
        }
    });
end;