local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v2.Hooks.useTokens;
return (v1.forwardRef(function(v4, v5) --[[ Line: 29 ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), v2 (copy)
    local v6 = l_useTokens_0();
    return v1.createElement(v2.View, {
        tag = "size-full row flex-between", 
        Size = v4.Size, 
        ZIndex = v4.ZIndex, 
        LayoutOrder = v4.LayoutOrder, 
        NextSelectionUp = v4.NextSelectionUp, 
        NextSelectionDown = v4.NextSelectionDown, 
        backgroundStyle = v6.Color.Surface.Surface_0, 
        ref = v5, 
        padding = if v4.padding then {
            left = UDim.new(0, v4.padding.left or 0), 
            right = UDim.new(0, v4.padding.right or 0), 
            top = UDim.new(0, v4.padding.top or 0), 
            bottom = UDim.new(0, v4.padding.bottom or 0)
        } else nil
    }, {
        Title = v1.createElement(v2.Text, {
            Text = v4.text or "", 
            tag = "auto-xy text-align-x-left text-heading-small", 
            LayoutOrder = 1
        }), 
        CloseButton = v1.createElement(v2.View, {
            tag = "auto-xy", 
            stateLayer = {
                affordance = v2.Enums.StateLayerAffordance.None
            }, 
            onActivated = v4.onClose, 
            LayoutOrder = 2
        }, {
            ButtonImage = v1.createElement(v2.Image, {
                Image = "icons/navigation/close", 
                imageStyle = v6.Color.Content.Emphasis, 
                tag = "size-600-600"
            })
        })
    });
end));