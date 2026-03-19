local l_Parent_0 = script:FindFirstAncestor("AmpUpsell").Parent;
local v1 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v4 = require(l_Parent_0.UIBlox);
local l_InteractiveAlert_0 = v4.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local v7 = require(l_Parent_0.Cryo);
local function v9(v8) --[[ Line: 17 ]] --[[ Name: selectScreenSize ]]
    return v8.ScreenSize;
end;
return function(v10) --[[ Line: 21 ]] --[[ Name: VPCConfirmationScreen ]]
    -- upvalues: l_useSelector_0 (copy), v9 (copy), l_useLocalization_0 (copy), v7 (copy), v1 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local l_onAck_0 = v10.onAck;
    local v12 = l_useSelector_0(v9);
    local l_messageStrings_0 = v10.messageStrings;
    local l_parentEmails_0 = v10.parentEmails;
    local v15 = nil;
    v15 = if #l_parentEmails_0 == 1 then l_useLocalization_0(v7.Dictionary.join(l_messageStrings_0, {
        bodyText = {
            l_messageStrings_0.oneParentBody; 
            parentEmail = l_parentEmails_0[1]
        }
    })) else l_useLocalization_0(v7.Dictionary.join(l_messageStrings_0, {
        bodyText = l_messageStrings_0.multipleParentsBody
    }));
    return v1.createElement(l_InteractiveAlert_0, {
        anchorPoint = Vector2.new(0.5, 0.5), 
        position = UDim2.new(0.5, 0, 0.5, 0), 
        screenSize = v12, 
        title = v15.title, 
        bodyText = v15.bodyText, 
        buttonStackInfo = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = l_onAck_0, 
                        text = v15.buttonText
                    }
                }
            }
        }
    });
end;