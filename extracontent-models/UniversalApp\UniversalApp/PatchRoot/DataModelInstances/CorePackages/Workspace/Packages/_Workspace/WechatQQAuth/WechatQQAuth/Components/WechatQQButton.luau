local l_Parent_0 = script:FindFirstAncestor("WechatQQAuth").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_View_0 = v2.View;
local l_Image_0 = v2.Image;
local l_Text_0 = v2.Text;
return function(v6) --[[ Line: 22 ]] --[[ Name: WechatQQButton ]]
    -- upvalues: v1 (copy), l_View_0 (copy), l_Image_0 (copy), l_Text_0 (copy)
    return v1.createElement(l_View_0, {
        tag = "size-full-1200 row align-y-center radius-medium padding-medium", 
        LayoutOrder = v6.layoutOrder or 1, 
        onActivated = v6.onActivated, 
        backgroundStyle = {
            Color3 = Color3.fromHex(v6.backgroundColor), 
            Transparency = 0
        }
    }, {
        IconContainer = v1.createElement(l_View_0, {
            tag = "row align-x-right align-y-center", 
            Size = UDim2.new(0.4, 0, 1, 0), 
            LayoutOrder = 1
        }, {
            ButtonIcon = v1.createElement(l_Image_0, {
                tag = "gui-object-defaults size-900-900", 
                Image = v6.iconImage
            })
        }), 
        TextContainer = v1.createElement(l_View_0, {
            tag = "row align-x-left align-y-center padding-left-small", 
            Size = UDim2.new(0.6, 0, 1, 0), 
            LayoutOrder = 2
        }, {
            ButtonText = v1.createElement(l_Text_0, {
                tag = "auto-xy text-align-x-left text-align-y-center text-body-large content-action-over-media", 
                Text = v6.text
            })
        })
    });
end;