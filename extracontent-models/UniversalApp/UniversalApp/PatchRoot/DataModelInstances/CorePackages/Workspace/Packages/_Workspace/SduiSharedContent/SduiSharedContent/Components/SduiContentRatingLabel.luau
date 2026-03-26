local l_Parent_0 = script:FindFirstAncestor("SduiSharedContent").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local _ = require(l_Parent_0.SduiCompat);
local l_Text_0 = v2.Text;
local l_Image_0 = v2.Image;
local l_View_0 = v2.View;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_useScaledValue_0 = v2.Hooks.useScaledValue;
return v1.memo(function(v9) --[[ Line: 28 ]] --[[ Name: SduiContentRatingLabel ]]
    -- upvalues: l_useScaledValue_0 (copy), l_useTokens_0 (copy), v1 (copy), l_View_0 (copy), v2 (copy), l_Image_0 (copy), l_Text_0 (copy)
    local v10 = l_useScaledValue_0(v9.width or 450);
    local v11 = l_useTokens_0();
    return v1.createElement(l_View_0, {
        tag = "padding-medium gap-large radius-medium row align-y-center stroke-default size-full-0 auto-y", 
        onActivated = v9.onActivated, 
        stateLayer = {
            affordance = v2.Enums.StateLayerAffordance.None
        }, 
        LayoutOrder = v9.layoutOrder
    }, {
        SizeConstraint = v1.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(v10, 1e999), 
            MinSize = Vector2.new(0, v11.Size.Size_1700)
        }), 
        RatingImage = if v9.image then v1.createElement(l_Image_0, {
            Image = v9.image, 
            tag = "size-1700-1700", 
            ScaleType = Enum.ScaleType.Fit, 
            LayoutOrder = 1
        }) else nil, 
        RatingText = v1.createElement(l_Text_0, {
            Text = v9.displayText or "", 
            tag = "fill auto-y text-wrap text-align-x-left", 
            LayoutOrder = 2, 
            fontStyle = v9.fontStyle
        })
    });
end);