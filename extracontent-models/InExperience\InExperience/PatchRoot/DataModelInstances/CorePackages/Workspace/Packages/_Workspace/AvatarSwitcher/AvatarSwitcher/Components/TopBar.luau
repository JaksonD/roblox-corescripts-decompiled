local l_Parent_0 = script:FindFirstAncestor("AvatarSwitcher").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
return function(v4) --[[ Line: 13 ]] --[[ Name: TopBar ]]
    -- upvalues: l_useLocalization_0 (copy), v1 (copy), v2 (copy)
    local v5 = l_useLocalization_0({
        headerText = "Feature.AvatarSwitcher.Heading.SwitchAvatar"
    });
    return (v1.createElement(v2.View, {
        tag = "size-full-1200 row align-y-center gap-medium padding-x-medium"
    }, {
        CloseButton = v1.createElement(v2.Image, {
            tag = "size-600 radius-small", 
            Image = "icons/navigation/close", 
            onActivated = v4.onClose
        }), 
        HeaderText = v1.createElement(v2.Text, {
            tag = "auto-x text-title-large", 
            Text = v5.headerText, 
            LayoutOrder = 2
        })
    }));
end;