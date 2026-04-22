local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Text_0 = v2.Text;
local l_View_0 = v2.View;
local l_Icon_0 = v2.Icon;
local l_IconSize_0 = v2.Enums.IconSize;
local l_useTokens_0 = v2.Hooks.useTokens;
return function(v8) --[[ Line: 20 ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_View_0 (copy), l_Icon_0 (copy), l_IconSize_0 (copy), l_Text_0 (copy)
    local l_White_100_0 = l_useTokens_0().Color.Extended.White.White_100;
    return v1.createElement(l_View_0, {
        LayoutOrder = v8.LayoutOrder, 
        tag = "row align-x-center align-y-center gap-xsmall size-600 auto-x padding-x-small radius-circle bg-shift-300"
    }, {
        Icon = if v8.iconName then v1.createElement(l_Icon_0, {
            LayoutOrder = 1, 
            name = v8.iconName, 
            size = l_IconSize_0.XSmall, 
            iconStyle = l_White_100_0
        }) else nil, 
        Text = v1.createElement(l_Text_0, {
            LayoutOrder = 2, 
            Text = v8.Text, 
            textStyle = l_White_100_0, 
            tag = "auto-xy text-caption-small text-align-x-center content-emphasis"
        })
    });
end;