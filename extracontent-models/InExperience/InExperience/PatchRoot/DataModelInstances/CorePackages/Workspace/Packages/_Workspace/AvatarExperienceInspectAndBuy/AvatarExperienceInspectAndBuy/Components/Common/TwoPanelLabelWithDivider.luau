local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
return function(v3) --[[ Line: 26 ]] --[[ Name: TwoPanelLabelWithDivider ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.createElement(v2.View, {
        tag = "auto-y size-full-0 padding-top-medium col align-x-left align-y-top gap-small", 
        LayoutOrder = v3.LayoutOrder
    }, {
        LabelContainer = v1.createElement(v2.View, {
            tag = "auto-y size-full-0 row align-x-center align-y-center gap-small flex-x-between", 
            LayoutOrder = 1
        }, {
            LeftLabel = v1.createElement(v2.Text, {
                LayoutOrder = 1, 
                tag = "auto-xy text-title-medium content-default text-align-x-left", 
                Text = v3.labelProps.leftLabel
            }), 
            RightLabel = if type(v3.labelProps.rightLabel) == "string" then v1.createElement(v2.Text, {
                LayoutOrder = 2, 
                tag = "auto-xy text-title-medium content-default text-align-x-right", 
                Text = v3.labelProps.rightLabel
            }) else v3.labelProps.rightLabel
        }), 
        Divider = if v3.showDivider then v1.createElement(v2.Divider, {
            LayoutOrder = 2, 
            Orientation = Enum.FillDirection.Horizontal, 
            Size = UDim2.new(1, 0, 0, 1)
        }) else nil
    });
end;