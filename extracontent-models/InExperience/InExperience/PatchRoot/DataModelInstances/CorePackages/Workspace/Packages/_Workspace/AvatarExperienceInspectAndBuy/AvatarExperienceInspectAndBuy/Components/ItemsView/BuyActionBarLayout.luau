local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_Divider_0 = v3.Divider;
local l_DividerOrientation_0 = v3.Enums.DividerOrientation;
local v6 = require(l_script_FirstAncestor_0.Components.Common.BuyActionBar);
return function(v7) --[[ Line: 34 ]] --[[ Name: BuyActionBarLayout ]]
    -- upvalues: v2 (copy), l_Divider_0 (copy), l_DividerOrientation_0 (copy), v6 (copy)
    return v2.createElement("TextButton", {
        Size = v7.Size, 
        Position = v7.Position, 
        AnchorPoint = v7.AnchorPoint, 
        BackgroundTransparency = 1, 
        LayoutOrder = v7.LayoutOrder or 2, 
        BorderSizePixel = 0, 
        ZIndex = v7.ZIndex, 
        Selectable = false, 
        Text = "", 
        AutoButtonColor = false, 
        [v2.Event.Activated] = function() --[[ Line: 46 ]]

        end
    }, {
        TopBorder = if v7.enableTopBorder then v2.createElement(l_Divider_0, {
            orientation = l_DividerOrientation_0.Horizontal, 
            Position = UDim2.new(0, 0, 0, 0)
        }) else nil, 
        BuyActionBar = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingTop = v7.padding, 
                PaddingBottom = v7.padding, 
                PaddingLeft = v7.padding, 
                PaddingRight = v7.padding
            }), 
            BuyActionBar = v2.createElement(v6, v7.buyActionBarProps)
        })
    });
end;