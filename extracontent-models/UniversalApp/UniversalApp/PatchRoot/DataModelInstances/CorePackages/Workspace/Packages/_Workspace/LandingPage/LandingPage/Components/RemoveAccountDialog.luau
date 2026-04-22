local l_Parent_0 = script:FindFirstAncestor("LandingPage").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Dialog_0 = v2.Dialog;
local l_DialogSize_0 = v2.Enums.DialogSize;
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_Orientation_0 = v2.Enums.Orientation;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_GetFFlagEnableManageAccountsRedesign_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableManageAccountsRedesign;
local l_GetFFlagEnableAccountSwitcherSignedOutAccounts_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableAccountSwitcherSignedOutAccounts;
local v10 = game:DefineFastFlag("EnableRemoveCurrentAccount3", false);
return function(v11) --[[ Line: 24 ]] --[[ Name: RemoveAccountDialog ]]
    -- upvalues: l_useLocalization_0 (copy), l_GetFFlagEnableAccountSwitcherSignedOutAccounts_0 (copy), l_GetFFlagEnableManageAccountsRedesign_0 (copy), v10 (copy), v1 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), v2 (copy), l_Orientation_0 (copy), l_ButtonVariant_0 (copy)
    local v12 = l_useLocalization_0({
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
        v11.hideAllAccounts = false;
    end;
    local v13 = nil;
    local v14 = nil;
    local v15 = nil;
    if v11.hideAllAccounts and l_GetFFlagEnableManageAccountsRedesign_0() then
        v13 = v12.removeAllAccounts;
        v14 = v12.removeAllAccountsDescription;
        v15 = v12.continue;
    elseif v11.isCurrentUser and l_GetFFlagEnableManageAccountsRedesign_0() and v10 then
        v13 = v12.removeCurrentAccountHeader;
        v14 = v12.removeCurrentAccountDescription;
        v15 = v12.remove;
    else
        v13 = v12.removeAccount;
        v14 = v12.removeAccountDescription;
        v15 = v12.remove;
    end;
    return v1.createElement(l_Dialog_0.Root, {
        size = l_DialogSize_0.Small, 
        hasBackdrop = true, 
        closeOnClickOutside = true, 
        disablePortal = not l_GetFFlagEnableManageAccountsRedesign_0(), 
        onClose = not l_GetFFlagEnableManageAccountsRedesign_0() and function(_) --[[ Line: 61 ]]
            -- upvalues: v11 (copy)
            v11.onClose();
        end or nil
    }, {
        DialogTitle = v1.createElement(l_Dialog_0.Title, {
            text = v13
        }), 
        DialogContent = v1.createElement(l_Dialog_0.Content, nil, {
            DialogView = v1.createElement(v2.View, {
                tag = "col fill auto-xy items-start gap-medium"
            }, {
                DialogText = v1.createElement(l_Dialog_0.Text, {
                    Text = v14, 
                    LayoutOrder = 1
                })
            })
        }), 
        DialogActions = v1.createElement(l_Dialog_0.Actions, {
            orientation = l_Orientation_0.Vertical, 
            actions = {
                {
                    text = v15, 
                    variant = l_ButtonVariant_0.Alert, 
                    onActivated = v11.onRemove
                }, 
                {
                    text = v12.cancel, 
                    variant = l_ButtonVariant_0.Standard, 
                    onActivated = v11.onClose
                }
            }
        })
    });
end;