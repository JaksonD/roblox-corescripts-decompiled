local l_Parent_0 = script:FindFirstAncestor("AvatarSwitcher").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_DividerOrientation_0 = v2.Enums.DividerOrientation;
local l_FFlagAXAvatarTimeoutFlowIE_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXAvatarTimeoutFlowIE;
return function(v5) --[[ Line: 24 ]] --[[ Name: HorizontalLayout ]]
    -- upvalues: v1 (copy), v2 (copy), l_FFlagAXAvatarTimeoutFlowIE_0 (copy), l_DividerOrientation_0 (copy)
    return (v1.createElement(v2.View, {
        tag = "size-full-full"
    }, {
        LeftPanel = v1.createElement(v2.View, {
            tag = l_FFlagAXAvatarTimeoutFlowIE_0 and "col" or nil, 
            Size = UDim2.fromScale(0.67, 1)
        }, {
            Header = if l_FFlagAXAvatarTimeoutFlowIE_0 then v1.createElement(v2.View, {
                tag = "auto-y size-full-0 shrink-0 padding-bottom-small", 
                LayoutOrder = 1
            }, {
                HeaderSlot = v5.headerSlot
            }) else v5.headerSlot, 
            LeftItemContainer = v1.createElement(v2.View, if l_FFlagAXAvatarTimeoutFlowIE_0 then {
                tag = "size-full-0 fill", 
                LayoutOrder = 2
            } else {
                tag = "position-bottom-left anchor-bottom-left", 
                Size = UDim2.new(1, 0, 1, -(v5.headerHeight or 0))
            }, {
                LeftItem = v5.leftItemSlot
            })
        }), 
        RightPanel = v1.createElement(v2.View, {
            tag = "position-top-right anchor-top-right", 
            Size = UDim2.fromScale(0.32999999999999996, 1)
        }, {
            RightItem = v5.rightItemSlot
        }), 
        Divider = v1.createElement(v2.Divider, {
            Position = UDim2.fromScale(0.67, 0), 
            ZIndex = 2, 
            orientation = l_DividerOrientation_0.Vertical
        })
    }));
end;