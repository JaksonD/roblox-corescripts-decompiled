local l_Parent_0 = script:FindFirstAncestor("LandingPage").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Dialog_0 = v2.Dialog;
local l_DialogSize_0 = v2.Enums.DialogSize;
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_Orientation_0 = v2.Enums.Orientation;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v8 = require(l_Parent_0.UIBlox);
local l_Button_0 = v8.App.Button.Button;
local l_ButtonType_0 = v8.App.Button.Enum.ButtonType;
local l_StandardButtonSize_0 = v8.App.Button.Enum.StandardButtonSize;
local l_FFlagAccountPickerEnableUIBloxButtons_0 = require(l_Parent_0.SharedFlags).FFlagAccountPickerEnableUIBloxButtons;
local l_GetFFlagEnableManageAccountsRedesign_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableManageAccountsRedesign;
local l_GetFFlagEnableAccountSwitcherSignedOutAccounts_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableAccountSwitcherSignedOutAccounts;
local v15 = game:DefineFastFlag("EnableRemoveCurrentAccount3", false);
return function(v16) --[[ Line: 29 ]] --[[ Name: RemoveAccountDialog ]]
    -- upvalues: l_useLocalization_0 (copy), l_GetFFlagEnableAccountSwitcherSignedOutAccounts_0 (copy), l_GetFFlagEnableManageAccountsRedesign_0 (copy), v15 (copy), v1 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), v2 (copy), l_FFlagAccountPickerEnableUIBloxButtons_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_StandardButtonSize_0 (copy), l_Orientation_0 (copy), l_ButtonVariant_0 (copy)
    local v17 = l_useLocalization_0({
        removeAccount = "Authentication.AccountPicker.Label.RemoveAccount", 
        removeAllAccounts = "Authentication.AccountSwitch.Action.RemoveAllAccounts", 
        cancel = "Authentication.AccountPicker.Label.RemoveAccountCancel", 
        remove = "Authentication.AccountPicker.Label.RemoveAccountRemove", 
        continue = "Authentication.AccountSwitch.Action.Continue", 
        removeAccountDescription = "Authentication.AccountPicker.Label.RemoveAccountDescription", 
        removeAllAccountsDescription = "Authentication.AccountSwitch.Description.RemoveAllAccounts", 
        removeCurrentAccountHeader = "Authentication.AccountSwitch.Header.RemoveCurrentAccount", 
        removeCurrentAccountDescription = "Authentication.AccountSwitch.Description.RemoveCurrentAccount"
    });
    if not l_GetFFlagEnableAccountSwitcherSignedOutAccounts_0() then
        v16.hideAllAccounts = false;
    end;
    local v18 = nil;
    local v19 = nil;
    local v20 = nil;
    if v16.hideAllAccounts and l_GetFFlagEnableManageAccountsRedesign_0() then
        v18 = v17.removeAllAccounts;
        v19 = v17.removeAllAccountsDescription;
        v20 = v17.continue;
    elseif v16.isCurrentUser and l_GetFFlagEnableManageAccountsRedesign_0() and v15 then
        v18 = v17.removeCurrentAccountHeader;
        v19 = v17.removeCurrentAccountDescription;
        v20 = v17.remove;
    else
        v18 = v17.removeAccount;
        v19 = v17.removeAccountDescription;
        v20 = v17.remove;
    end;
    return v1.createElement(l_Dialog_0.Root, {
        size = l_DialogSize_0.Small, 
        hasBackdrop = true, 
        closeOnClickOutside = true, 
        disablePortal = not l_GetFFlagEnableManageAccountsRedesign_0(), 
        onClose = not l_GetFFlagEnableManageAccountsRedesign_0() and function(_) --[[ Line: 66 ]]
            -- upvalues: v16 (copy)
            v16.onClose();
        end or nil
    }, {
        DialogTitle = v1.createElement(l_Dialog_0.Title, {
            text = v18
        }), 
        DialogContent = v1.createElement(l_Dialog_0.Content, nil, {
            DialogView = v1.createElement(v2.View, {
                tag = "col fill auto-xy items-start gap-medium"
            }, {
                DialogText = v1.createElement(l_Dialog_0.Text, {
                    Text = v19, 
                    LayoutOrder = 1
                }), 
                PrimaryButton = l_FFlagAccountPickerEnableUIBloxButtons_0 and v1.createElement(l_Button_0, {
                    text = v20, 
                    buttonType = l_ButtonType_0.Alert, 
                    standardSize = l_StandardButtonSize_0.Small, 
                    onActivated = v16.onRemove, 
                    layoutOrder = 2
                }) or nil, 
                SecondaryButton = l_FFlagAccountPickerEnableUIBloxButtons_0 and v1.createElement(l_Button_0, {
                    text = v17.cancel, 
                    buttonType = l_ButtonType_0.Secondary, 
                    standardSize = l_StandardButtonSize_0.Small, 
                    onActivated = v16.onClose, 
                    layoutOrder = 3
                }) or nil
            })
        }), 
        DialogActions = not l_FFlagAccountPickerEnableUIBloxButtons_0 and v1.createElement(l_Dialog_0.Actions, {
            orientation = l_Orientation_0.Vertical, 
            actions = {
                not l_FFlagAccountPickerEnableUIBloxButtons_0 and {
                    text = v20, 
                    variant = l_ButtonVariant_0.Alert, 
                    onActivated = v16.onRemove
                } or nil, 
                not l_FFlagAccountPickerEnableUIBloxButtons_0 and {
                    text = v17.cancel, 
                    variant = l_ButtonVariant_0.Standard, 
                    onActivated = v16.onClose
                } or nil
            }
        }) or nil
    });
end;