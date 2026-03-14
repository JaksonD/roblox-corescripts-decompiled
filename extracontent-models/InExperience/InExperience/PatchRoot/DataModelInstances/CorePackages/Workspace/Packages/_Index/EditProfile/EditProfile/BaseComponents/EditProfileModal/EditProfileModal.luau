local l_Parent_0 = script:FindFirstAncestor("EditProfile").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Dialog_0 = v2.Dialog;
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
return function(v6) --[[ Line: 19 ]]
    -- upvalues: l_useLocalization_0 (copy), v1 (copy), l_Dialog_0 (copy), l_ButtonVariant_0 (copy)
    local v7 = l_useLocalization_0({
        title = v6.titleKey, 
        saveButtonText = v6.saveKey
    });
    return v1.createElement(l_Dialog_0.Root, {
        onClose = v6.onClose
    }, {
        Title = v1.createElement(l_Dialog_0.Title, {
            text = v7.title, 
            LayoutOrder = 1
        }), 
        Content = v1.createElement(l_Dialog_0.Content, {
            LayoutOrder = 2
        }, v6.component), 
        Actions = v1.createElement(l_Dialog_0.Actions, {
            LayoutOrder = 3, 
            actions = {
                {
                    text = v7.saveButtonText, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    isLoading = v6.isLoading, 
                    isDisabled = v6.isDisabled, 
                    onActivated = v6.onSave
                }
            }
        })
    });
end;