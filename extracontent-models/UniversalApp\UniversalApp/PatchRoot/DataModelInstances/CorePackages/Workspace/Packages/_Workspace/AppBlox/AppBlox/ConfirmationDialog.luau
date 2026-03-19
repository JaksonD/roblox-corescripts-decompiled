local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v3 = require(l_Parent_0.Foundation);
local l_Dialog_0 = v3.Dialog;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
return function(v6) --[[ Line: 34 ]]
    -- upvalues: l_useLocalization_0 (copy), v1 (copy), l_Dialog_0 (copy), l_ButtonVariant_0 (copy)
    local v7 = l_useLocalization_0({
        confirmButtonText = "CommonUI.Controls.Action.Confirm", 
        cancelButtonText = "CommonUI.Controls.Action.Cancel"
    });
    return v1.createElement(l_Dialog_0.Root, {
        hasBackdrop = true, 
        disablePortal = v6.disablePortal, 
        onClose = if v6.showCloseButton then v6.onCancel else nil
    }, {
        DialogTitle = v1.createElement(l_Dialog_0.Title, {
            text = v6.title
        }), 
        DialogContent = v1.createElement(l_Dialog_0.Content, nil, {
            DialogText = v1.createElement(l_Dialog_0.Text, {
                Text = v6.body
            })
        }), 
        DialogActions = v1.createElement(l_Dialog_0.Actions, {
            actions = {
                {
                    variant = l_ButtonVariant_0.Emphasis, 
                    text = v6.confirmButtonText or v7.confirmButtonText, 
                    onActivated = v6.onConfirm
                }, 
                {
                    variant = l_ButtonVariant_0.Standard, 
                    text = v6.cancelButtonText or v7.cancelButtonText, 
                    onActivated = v6.onCancel
                }
            }
        })
    });
end;