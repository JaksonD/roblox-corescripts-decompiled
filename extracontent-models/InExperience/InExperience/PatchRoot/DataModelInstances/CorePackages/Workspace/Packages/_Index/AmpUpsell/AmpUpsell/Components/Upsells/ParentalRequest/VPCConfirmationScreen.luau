local l_script_FirstAncestor_0 = script:FindFirstAncestor("AmpUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v5 = require(l_Parent_0.UIBlox);
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local v8 = require(l_Parent_0.Cryo);
local v9 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableFoundationUIVPCUpsell);
local v10 = require(l_Parent_0.Foundation);
local l_Dialog_0 = v10.Dialog;
local l_DialogSize_0 = v10.Enums.DialogSize;
local l_ButtonVariant_0 = v10.Enums.ButtonVariant;
local function v15(v14) --[[ Line: 23 ]] --[[ Name: selectScreenSize ]]
    return v14.ScreenSize;
end;
return function(v16) --[[ Line: 27 ]] --[[ Name: VPCConfirmationScreen ]]
    -- upvalues: l_useSelector_0 (copy), v15 (copy), l_useLocalization_0 (copy), v8 (copy), v9 (copy), v2 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_ButtonVariant_0 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local l_onAck_0 = v16.onAck;
    local v18 = l_useSelector_0(v15);
    local l_messageStrings_0 = v16.messageStrings;
    local l_parentEmails_0 = v16.parentEmails;
    local v21 = nil;
    v21 = if #l_parentEmails_0 == 1 then l_useLocalization_0(v8.Dictionary.join(l_messageStrings_0, {
        bodyText = {
            l_messageStrings_0.oneParentBody; 
            parentEmail = l_parentEmails_0[1]
        }
    })) else l_useLocalization_0(v8.Dictionary.join(l_messageStrings_0, {
        bodyText = l_messageStrings_0.multipleParentsBody
    }));
    if v9() then
        return v2.createElement(l_Dialog_0.Root, {
            size = l_DialogSize_0.Small, 
            onClose = l_onAck_0
        }, {
            DialogTitle = v2.createElement(l_Dialog_0.Title, {
                text = v21.title
            }), 
            DialogContent = v2.createElement(l_Dialog_0.Content, {
                LayoutOrder = 2
            }, {
                DialogText = v2.createElement(l_Dialog_0.Text, {
                    Text = v21.bodyText
                })
            }), 
            DialogActions = v2.createElement(l_Dialog_0.Actions, {
                LayoutOrder = 3, 
                actions = {
                    {
                        text = v21.buttonText, 
                        variant = l_ButtonVariant_0.Standard, 
                        onActivated = l_onAck_0
                    }
                }
            })
        });
    else
        return v2.createElement(l_InteractiveAlert_0, {
            anchorPoint = Vector2.new(0.5, 0.5), 
            position = UDim2.new(0.5, 0, 0.5, 0), 
            screenSize = v18, 
            title = v21.title, 
            bodyText = v21.bodyText, 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = l_onAck_0, 
                            text = v21.buttonText
                        }
                    }
                }
            }
        });
    end;
end;