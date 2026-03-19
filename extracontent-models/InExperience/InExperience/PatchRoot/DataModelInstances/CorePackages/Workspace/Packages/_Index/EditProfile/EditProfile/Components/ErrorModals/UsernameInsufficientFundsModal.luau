local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local v6 = require(l_Parent_0.Localization);
local v7 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v8 = require(l_script_FirstAncestor_0.Flags.FFlagEditProfileFixFocusNavigation);
local v9 = require(l_script_FirstAncestor_0.Utils.FocusNavigatorWrapper);
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local l_useLocalization_0 = v6.Hooks.useLocalization;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local v13 = utf8.char(57346);
return function(v14) --[[ Line: 23 ]] --[[ Name: EditDisplayNameErrorModal ]]
    -- upvalues: l_useScreenSize_0 (copy), l_useLocalization_0 (copy), v7 (copy), v13 (copy), l_AppPage_0 (copy), v8 (copy), v9 (copy), v2 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local v15 = l_useScreenSize_0();
    local v16 = v14.navigation.getParam("robux");
    local v17 = l_useLocalization_0({
        cancelButtonText = v7.CancelButtonText, 
        buy = v7.Buy, 
        insufficientFunds = v7.InsufficientFunds, 
        message = {
            v7.InsufficientFundsMessage; 
            icon = v13, 
            rbx = v16
        }
    });
    local function v18() --[[ Line: 33 ]] --[[ Name: onClose ]]
        -- upvalues: v14 (copy)
        v14.navigation.goBack();
    end;
    local function v19() --[[ Line: 37 ]]
        -- upvalues: v14 (copy), l_AppPage_0 (ref)
        v14.navigation.navigate(l_AppPage_0.PurchaseRobux);
    end;
    if v8 then
        return v9({
            onClose = v18
        }, {
            v2.createElement(l_InteractiveAlert_0, {
                screenSize = v15, 
                title = v17.insufficientFunds, 
                bodyText = v17.message, 
                buttonStackInfo = {
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.Secondary, 
                            props = {
                                onActivated = v18, 
                                text = v17.cancelButtonText
                            }
                        }, 
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                onActivated = v19, 
                                text = v17.buy
                            }
                        }
                    }
                }
            })
        });
    else
        return v2.createElement(l_InteractiveAlert_0, {
            screenSize = v15, 
            title = v17.insufficientFunds, 
            bodyText = v17.message, 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            onActivated = v18, 
                            text = v17.cancelButtonText
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v19, 
                            text = v17.buy
                        }
                    }
                }
            }
        });
    end;
end;