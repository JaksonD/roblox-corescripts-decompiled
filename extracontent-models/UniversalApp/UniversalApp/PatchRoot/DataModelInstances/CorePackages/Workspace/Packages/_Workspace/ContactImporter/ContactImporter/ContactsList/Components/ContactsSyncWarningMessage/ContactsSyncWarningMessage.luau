local l_Parent_0 = script:FindFirstAncestor("ContactImporter").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Text_0 = v2.Text;
local l_View_0 = v2.View;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
return function(v6) --[[ Line: 16 ]] --[[ Name: ContactsSyncWarningMessage ]]
    -- upvalues: l_useLocalization_0 (copy), v1 (copy), l_View_0 (copy), l_Text_0 (copy)
    local v7 = l_useLocalization_0({
        message = "Feature.Contacts.Message.ContactsSyncWarning"
    });
    return v1.createElement(l_View_0, {
        LayoutOrder = v6.layoutOrder, 
        tag = "size-full-0 auto-y margin-y-small"
    }, {
        text = v1.createElement(l_Text_0, {
            tag = "auto-y size-full-0 text-align-x-left text-wrap radius-medium bg-action-alert padding-medium stroke-emphasis", 
            Text = v7.message
        })
    });
end;