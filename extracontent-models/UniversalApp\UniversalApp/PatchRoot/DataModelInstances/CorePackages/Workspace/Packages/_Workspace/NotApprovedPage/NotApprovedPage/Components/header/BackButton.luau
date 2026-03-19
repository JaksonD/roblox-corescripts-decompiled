local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_ButtonSize_0 = v3.Enums.ButtonSize;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_IconButton_0 = v3.IconButton;
local l_IconName_0 = v3.Enums.IconName;
local l_usePageNavigation_0 = require(l_script_FirstAncestor_0.Contexts.PageNavigationContext).usePageNavigation;
return v2.memo(function() --[[ Line: 17 ]] --[[ Name: BackButton ]]
    -- upvalues: l_usePageNavigation_0 (copy), v2 (copy), l_IconButton_0 (copy), l_IconName_0 (copy), l_ButtonVariant_0 (copy), l_ButtonSize_0 (copy)
    local v9 = l_usePageNavigation_0();
    return v2.createElement(l_IconButton_0, {
        icon = l_IconName_0.ChevronLargeLeft, 
        variant = l_ButtonVariant_0.Utility, 
        onActivated = v9.goToPreviousPage, 
        size = l_ButtonSize_0.Medium, 
        testId = "back-button"
    });
end);