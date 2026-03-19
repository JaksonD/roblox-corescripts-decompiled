local l_Parent_0 = script:FindFirstAncestor("EditProfile").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Text_0 = v2.Text;
local l_View_0 = v2.View;
local l_IconButton_0 = v2.IconButton;
local l_IconName_0 = v2.Enums.IconName;
local l_IconSize_0 = v2.Enums.IconSize;
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
return function(v9) --[[ Line: 22 ]] --[[ Name: EditProfileHeaderBar ]]
    -- upvalues: v1 (copy), l_View_0 (copy), l_IconButton_0 (copy), l_IconName_0 (copy), l_IconSize_0 (copy), l_ButtonVariant_0 (copy), l_Text_0 (copy)
    return v1.createElement(l_View_0, {
        tag = "row size-full-0 auto-y gap-small flex-between align-y-center margin-small bg-transparent"
    }, {
        HeaderBar = v1.createElement(l_View_0, {
            tag = "row align-y-center size-0-1800 auto-x gap-small"
        }, {
            BackButton = v1.createElement(l_IconButton_0, {
                icon = l_IconName_0.ChevronLargeLeft, 
                size = l_IconSize_0.Medium, 
                variant = l_ButtonVariant_0.Utility, 
                onActivated = v9.onClose, 
                isCircular = true, 
                LayoutOrder = 1
            }), 
            HeaderText = v1.createElement(l_Text_0, {
                tag = "text-heading-small auto-xy", 
                Text = v9.headerText, 
                LayoutOrder = 2
            })
        }), 
        SaveButton = if v9.onSave then v1.createElement(l_IconButton_0, {
            icon = l_IconName_0.CheckLarge, 
            size = l_IconSize_0.Medium, 
            variant = l_ButtonVariant_0.Utility, 
            onActivated = v9.onSave, 
            isDisabled = v9.isLoading or v9.isDisabled == true, 
            isCircular = true
        }) else nil
    });
end;