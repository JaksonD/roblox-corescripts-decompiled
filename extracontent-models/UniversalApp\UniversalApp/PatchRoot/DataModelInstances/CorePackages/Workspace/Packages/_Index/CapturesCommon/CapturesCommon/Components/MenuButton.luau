local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Foundation);
local v2 = require(l_Parent_0.React);
local l_View_0 = v1.View;
local l_Button_0 = v1.Button;
local l_ButtonSize_0 = v1.Enums.ButtonSize;
local l_ButtonVariant_0 = v1.Enums.ButtonVariant;
return function(v7) --[[ Line: 22 ]]
    -- upvalues: v2 (copy), l_View_0 (copy), l_Button_0 (copy), l_ButtonSize_0 (copy), l_ButtonVariant_0 (copy)
    return v2.createElement(l_View_0, {
        AnchorPoint = v7.AnchorPoint, 
        LayoutOrder = v7.LayoutOrder, 
        Position = v7.Position, 
        tag = "bg-action-subtle align-x-center align-y-center auto-xy padding-bottom-medium"
    }, {
        ShowMoreButton = v2.createElement(l_Button_0, {
            onActivated = v7.onActivated, 
            size = l_ButtonSize_0.Small, 
            text = v7.text, 
            variant = l_ButtonVariant_0.Subtle
        })
    });
end;