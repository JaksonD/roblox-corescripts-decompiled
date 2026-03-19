local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_0.Constants);
local v4 = require(l_Parent_1.Foundation);
local v5 = require(l_Parent_1.Localization);
local _ = require(l_Parent_0.Enums.TouchControlsEnum);
local l_Text_0 = v4.Text;
local l_View_0 = v4.View;
local l_Icon_0 = v4.Icon;
local l_useTokens_0 = v4.Hooks.useTokens;
local l_useLocalization_0 = v5.Hooks.useLocalization;
return function(v12) --[[ Line: 26 ]]
    -- upvalues: l_useTokens_0 (copy), l_useLocalization_0 (copy), v2 (copy), l_View_0 (copy), l_Text_0 (copy), v3 (copy), l_Icon_0 (copy)
    local v13 = l_useTokens_0();
    local v14 = l_useLocalization_0({
        action = v12.action
    });
    local v15 = v2.createElement(l_View_0, {
        tag = "auto-xy padding-x-large padding-y-xsmall radius-large", 
        backgroundStyle = v13.Color.Extended.Gray.Gray_600, 
        LayoutOrder = 1
    }, {
        InnerAction = v2.createElement(l_Text_0, {
            tag = "auto-xy text-align-x-center text-title-small", 
            textStyle = v13.Color.Extended.White.White_100, 
            Text = v14.action
        })
    });
    local v16 = v3.HELP_PAGE.TOUCH_ENUM_TO_ICON[v12.touchInput];
    local v17 = v16 and v2.createElement(l_Icon_0, {
        name = v16, 
        size = v13.Size.Size_1200
    });
    local v18 = v16 and v2.createElement(l_View_0, {
        tag = "auto-xy", 
        LayoutOrder = 2
    }, {
        InnerIcon = v17
    }) or nil;
    return v2.createElement(l_View_0, {
        tag = "align-x-center auto-xy col gap-small", 
        LayoutOrder = v12.layoutOrder
    }, {
        actionComponent = v15, 
        iconComponent = v18
    });
end;