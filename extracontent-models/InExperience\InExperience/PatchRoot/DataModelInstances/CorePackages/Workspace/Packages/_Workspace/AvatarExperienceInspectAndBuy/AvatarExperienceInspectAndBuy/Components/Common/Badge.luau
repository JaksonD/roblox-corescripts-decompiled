local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v2.Hooks.useTokens;
local l_IconSize_0 = v2.Enums.IconSize;
return function(v5) --[[ Line: 32 ]] --[[ Name: Badge ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), v2 (copy), l_IconSize_0 (copy)
    local v6 = l_useTokens_0();
    return v1.createElement(v2.View, {
        tag = "auto-xy row align-x-center align-y-center bg-surface-300 radius-circle padding-small gap-xsmall", 
        BorderSizePixel = 0, 
        LayoutOrder = v5.LayoutOrder, 
        Text = "", 
        onActivated = v5.onActivated
    }, {
        Icon = v1.createElement(v2.Icon, {
            name = v5.icon, 
            variant = v5.iconVariant, 
            size = l_IconSize_0.Medium, 
            style = v6.Color.Content.Default, 
            LayoutOrder = 1
        }), 
        Text = if v5.text then v1.createElement(v2.Text, {
            tag = "text-caption-large content-emphasis text-align-x-left auto-xy text-truncate-none", 
            Text = v5.text, 
            textStyle = v6.Color.Content.Default, 
            LayoutOrder = 2
        }) else nil
    });
end;