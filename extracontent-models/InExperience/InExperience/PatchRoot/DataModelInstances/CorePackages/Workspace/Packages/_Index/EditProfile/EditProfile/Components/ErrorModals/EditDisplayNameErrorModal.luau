local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local v6 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local v9 = require(l_script_FirstAncestor_0.Flags.FFlagEditProfileFixFocusNavigation);
local v10 = require(l_script_FirstAncestor_0.Hooks.useDisplayNameText);
local v11 = require(l_script_FirstAncestor_0.Utils.FocusNavigatorWrapper);
return function(v12) --[[ Line: 19 ]] --[[ Name: EditDisplayNameErrorModal ]]
    -- upvalues: l_useScreenSize_0 (copy), v10 (copy), l_useLocalization_0 (copy), v6 (copy), v9 (copy), v11 (copy), v2 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local v13 = l_useScreenSize_0();
    local v14 = v10();
    local v15 = l_useLocalization_0({
        OK = v6.OK
    });
    local function v16() --[[ Line: 26 ]] --[[ Name: onClose ]]
        -- upvalues: v12 (copy)
        v12.navigation.goBack();
    end;
    if v9 then
        return v11({
            onClose = v16
        }, {
            v2.createElement(l_InteractiveAlert_0, {
                screenSize = v13, 
                title = v14.displayNameEditMessage, 
                bodyText = v14.displayNameCoolDownMessage, 
                buttonStackInfo = {
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                onActivated = v16, 
                                text = v15.OK
                            }
                        }
                    }
                }
            })
        });
    else
        return v2.createElement(l_InteractiveAlert_0, {
            screenSize = v13, 
            title = v14.displayNameEditMessage, 
            bodyText = v14.displayNameCoolDownMessage, 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v16, 
                            text = v15.OK
                        }
                    }
                }
            }
        });
    end;
end;