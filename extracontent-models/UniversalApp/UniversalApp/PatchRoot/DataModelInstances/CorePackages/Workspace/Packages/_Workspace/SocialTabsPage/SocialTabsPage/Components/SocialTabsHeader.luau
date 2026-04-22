local l_Parent_0 = script:FindFirstAncestor("SocialTabsPage").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_View_0 = v2.View;
local l_Text_0 = v2.Text;
local l_IconButton_0 = v2.IconButton;
local l_IconName_0 = v2.Enums.IconName;
local l_IconSize_0 = v2.Enums.IconSize;
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
return function(v10) --[[ Line: 20 ]] --[[ Name: SocialTabsHeader ]]
    -- upvalues: l_useNavigation_0 (copy), v1 (copy), l_View_0 (copy), l_IconButton_0 (copy), l_IconName_0 (copy), l_IconSize_0 (copy), l_ButtonVariant_0 (copy), l_Text_0 (copy)
    local v11 = l_useNavigation_0();
    local v12 = v1.useCallback(function() --[[ Line: 23 ]]
        -- upvalues: v11 (copy)
        v11.goBack();
    end, {
        v11
    });
    return v1.createElement(l_View_0, {
        tag = "row align-y-center gap-small size-full-0 auto-y padding-x-xlarge bg-surface-0", 
        LayoutOrder = v10.layoutOrder
    }, {
        BackButton = v1.createElement(l_IconButton_0, {
            icon = l_IconName_0.ChevronLargeLeft, 
            size = l_IconSize_0.Medium, 
            variant = l_ButtonVariant_0.Utility, 
            onActivated = v12, 
            LayoutOrder = 1
        }), 
        Title = v1.createElement(l_Text_0, {
            tag = "fill auto-y text-heading-medium text-align-x-left text-truncate-end content-emphasis", 
            LayoutOrder = 2, 
            Text = v10.title or ""
        })
    });
end;