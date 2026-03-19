local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Text_0 = v2.Text;
local l_View_0 = v2.View;
local l_Image_0 = v2.Image;
local l_useTokens_0 = v2.Hooks.useTokens;
return function(v7) --[[ Line: 19 ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_View_0 (copy), l_Image_0 (copy), l_Text_0 (copy)
    local l_Emphasis_0 = l_useTokens_0().LightMode.Content.Emphasis;
    local v9 = Color3.fromRGB(239, 215, 140);
    return v1.createElement(l_View_0, {
        LayoutOrder = v7.LayoutOrder, 
        tag = "radius-circle padding-small row gap-xsmall align-y-center align-x-center auto-xy", 
        backgroundStyle = {
            Color3 = v9, 
            Transparency = 0
        }
    }, {
        Icon = if v7.Icon then v1.createElement(l_Image_0, {
            LayoutOrder = 1, 
            Image = v7.Icon, 
            imageStyle = l_Emphasis_0, 
            tag = "size-300"
        }) else nil, 
        Text = v1.createElement(l_Text_0, {
            LayoutOrder = 2, 
            Text = v7.Text, 
            textStyle = l_Emphasis_0, 
            tag = "text-caption-small content-emphasis text-align-x-center auto-xy"
        })
    });
end;