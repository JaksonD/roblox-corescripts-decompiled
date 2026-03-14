local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceUIKit").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Icon_0 = v2.Icon;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_IconSize_0 = v2.Enums.IconSize;
return function(v6) --[[ Line: 9 ]] --[[ Name: ItemCardIcon ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_Icon_0 (copy), l_IconSize_0 (copy)
    local v7 = l_useTokens_0();
    return v1.createElement(l_Icon_0, {
        name = v6.icon, 
        style = v6.iconStyle or v7.Color.Content.Emphasis, 
        size = l_IconSize_0.Small, 
        LayoutOrder = v6.LayoutOrder, 
        testId = ("icon-%*"):format(v6.icon)
    });
end;