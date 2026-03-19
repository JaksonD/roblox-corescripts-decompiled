local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Icon_0 = v2.Icon;
local l_View_0 = v2.View;
local l_useTokens_0 = v2.Hooks.useTokens;
local v6 = UDim2.fromOffset(1, 1);
return function(v7) --[[ Line: 25 ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_View_0 (copy), l_Icon_0 (copy), v6 (copy)
    local v8 = l_useTokens_0();
    return v1.createElement(l_View_0, {
        tag = "size-full-0 bg-action-subtle auto-y padding-x-large padding-y-small row flex-between", 
        ZIndex = v7.ZIndex
    }, {
        BackButton = v1.createElement(l_View_0, {
            onActivated = v7.onBackActivated, 
            tag = "radius-medium auto-xy padding-medium bg-action-subtle"
        }, {
            BackIcon = v1.createElement(l_Icon_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                name = "icons/navigation/pushBack", 
                Position = UDim2.fromScale(0.5, 0.5), 
                style = v8.Color.ActionEmphasis.Foreground, 
                ZIndex = 2
            }), 
            BackIconShadow = v1.createElement(l_Icon_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                name = "icons/navigation/pushBack", 
                Position = UDim2.fromScale(0.5, 0.5) + v6, 
                style = v8.Color.Common.Shadow, 
                ZIndex = 1
            })
        }), 
        MoreButton = if not v7.isPlaceholderPost then v1.createElement(l_View_0, {
            onActivated = v7.onMoreActivated, 
            tag = "radius-medium auto-xy padding-medium bg-action-subtle"
        }, {
            MoreIcon = v1.createElement(l_Icon_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                name = v7.isContextualMenuOpen and "icons/menu/more_on" or "icons/menu/more_off", 
                Position = UDim2.fromScale(0.5, 0.5), 
                style = v8.Color.ActionEmphasis.Foreground, 
                ZIndex = 2
            }), 
            MoreIconShadow = v1.createElement(l_Icon_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                name = v7.isContextualMenuOpen and "icons/menu/more_on" or "icons/menu/more_off", 
                Position = UDim2.fromScale(0.5, 0.5) + v6, 
                style = v8.Color.Common.Shadow, 
                ZIndex = 1
            })
        }) else nil
    });
end;