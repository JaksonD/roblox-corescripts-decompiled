local l_Parent_0 = script:FindFirstAncestor("AvatarSwitcher").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_FFlagAXAvatarTimeoutFlowIE_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXAvatarTimeoutFlowIE;
return function(v4) --[[ Line: 19 ]] --[[ Name: SingleItemLayout ]]
    -- upvalues: v1 (copy), v2 (copy), l_FFlagAXAvatarTimeoutFlowIE_0 (copy)
    return (v1.createElement(v2.View, {
        tag = l_FFlagAXAvatarTimeoutFlowIE_0 and "size-full-full col" or "size-full-full"
    }, {
        Header = if l_FFlagAXAvatarTimeoutFlowIE_0 then v1.createElement(v2.View, {
            tag = "auto-y size-full-0 shrink-0 padding-bottom-small", 
            LayoutOrder = 1
        }, {
            HeaderSlot = v4.headerSlot
        }) else v4.headerSlot, 
        Content = v1.createElement(v2.View, if l_FFlagAXAvatarTimeoutFlowIE_0 then {
            tag = "size-full-0 fill", 
            LayoutOrder = 2
        } else {
            Size = UDim2.new(1, 0, 1, -(v4.headerHeight or 0)), 
            Position = UDim2.fromOffset(0, v4.headerHeight or 0)
        }, {
            ContentSlot = v4.contentSlot
        })
    }));
end;