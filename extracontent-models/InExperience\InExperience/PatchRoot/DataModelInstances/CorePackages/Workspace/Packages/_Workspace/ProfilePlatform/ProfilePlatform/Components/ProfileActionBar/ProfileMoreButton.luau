local l_Parent_0 = script:FindFirstAncestor("ProfilePlatform").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_IconButton_0 = v2.IconButton;
local l_IconSize_0 = v2.Enums.IconSize;
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_IconName_0 = v2.Enums.IconName;
return function(v7) --[[ Line: 20 ]] --[[ Name: ProfileMoreButton ]]
    -- upvalues: v1 (copy), l_IconButton_0 (copy), l_IconName_0 (copy), l_IconSize_0 (copy), l_ButtonVariant_0 (copy)
    return v1.createElement(l_IconButton_0, {
        LayoutOrder = v7.layoutOrder, 
        icon = l_IconName_0.ThreeDotsHorizontal, 
        isDisabled = v7.isDisabled, 
        onActivated = v7.onActivated, 
        size = l_IconSize_0.Medium, 
        ref = v7.buttonRef, 
        variant = l_ButtonVariant_0.Standard
    });
end;