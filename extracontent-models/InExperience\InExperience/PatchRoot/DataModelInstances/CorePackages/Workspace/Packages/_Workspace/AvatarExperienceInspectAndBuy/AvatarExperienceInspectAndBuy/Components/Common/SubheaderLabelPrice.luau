local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_Icon_0 = v3.Icon;
local l_IconSize_0 = v3.Enums.IconSize;
local l_Text_0 = v3.Text;
local l_shouldShowPriceLabel_0 = require(l_script_FirstAncestor_0.Utils.itemDetailsUtils).shouldShowPriceLabel;
local _ = require(l_script_FirstAncestor_0.Enums.PriceStatus);
local l_FFlagAXHideInspectAndBuyPriceIfUnavailable_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXHideInspectAndBuyPriceIfUnavailable;
return function(v10) --[[ Line: 37 ]] --[[ Name: SubheaderLabelPrice ]]
    -- upvalues: l_FFlagAXHideInspectAndBuyPriceIfUnavailable_0 (copy), v2 (copy), l_shouldShowPriceLabel_0 (copy), v3 (copy), l_Text_0 (copy), l_Icon_0 (copy), l_IconSize_0 (copy)
    local v11 = not l_FFlagAXHideInspectAndBuyPriceIfUnavailable_0 or v2.useMemo(function() --[[ Line: 39 ]]
        -- upvalues: l_shouldShowPriceLabel_0 (ref), v10 (copy)
        return l_shouldShowPriceLabel_0(v10.priceStatus);
    end, {
        v10.priceStatus
    });
    return v2.createElement(v3.View, {
        tag = "auto-xy row align-y-center align-x-left gap-xxsmall", 
        LayoutOrder = v10.LayoutOrder
    }, {
        LeftSlotLabel = if v10.subheaderText.leftSlotLabel then v2.createElement(l_Text_0, {
            tag = "auto-xy text-align-x-left text-body-large content-default text-truncate-split", 
            LayoutOrder = 1, 
            Text = v10.subheaderText.leftSlotLabel
        }) else nil, 
        Spacer = if v11 and v10.subheaderText.leftSlotLabel and v10.subheaderText.leftSlotLabel ~= "" then v2.createElement(l_Icon_0, {
            name = "icons/controls/keys/period", 
            size = l_IconSize_0.Small, 
            LayoutOrder = 2
        }) else nil, 
        RightSlotLabel = if v11 and v10.subheaderText.rightSlotPrice then v2.createElement(v3.View, {
            tag = "auto-xy row align-y-center align-x-left gap-xxsmall", 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = 3
        }, {
            Icon = v2.createElement(l_Icon_0, {
                name = "icons/common/robux", 
                size = l_IconSize_0.Small, 
                LayoutOrder = 1
            }), 
            RightSlotLabel = v2.createElement(l_Text_0, {
                tag = "auto-xy text-align-x-left text-body-large content-default text-truncate-split", 
                LayoutOrder = 2, 
                Text = v10.subheaderText.rightSlotPrice
            })
        }) else nil
    });
end;