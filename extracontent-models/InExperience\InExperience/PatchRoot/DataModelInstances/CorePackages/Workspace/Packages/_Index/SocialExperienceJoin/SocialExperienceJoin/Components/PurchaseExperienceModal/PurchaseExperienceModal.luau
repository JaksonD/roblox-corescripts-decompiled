local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialExperienceJoin");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Localization);
local v4 = require(l_Parent_0.UIBlox);
local l_useLocalization_0 = v3.Hooks.useLocalization;
local l_InteractiveAlert_0 = v4.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local v8 = require(l_script_FirstAncestor_0.Common.TextKeys);
return function(v9) --[[ Line: 22 ]]
    -- upvalues: l_useLocalization_0 (copy), v8 (copy), v2 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local v10 = l_useLocalization_0({
        titleText = v8.PurchaseExperienceModalTitle, 
        bodyText = {
            v8.PurchaseExperienceModalBody; 
            gameName = v9.experienceName, 
            X = v9.price
        }, 
        confirmButtonText = v8.Unlock, 
        cancelButtonText = v8.Cancel, 
        successToastTitle = v8.SuccessPurchaseToastTitle, 
        successToastMessage = {
            v8.SuccessPurchaseToastMessage; 
            gameName = v9.experienceName, 
            price = v9.price
        }
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
                        onActivated = v9.cancelPurchase
                    }
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        text = v10.confirmButtonText, 
                        onActivated = v9.purchaseExperience
                    }
                }
            }
        }
    });
end;