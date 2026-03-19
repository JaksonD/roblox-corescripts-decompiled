local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v3.Hooks.useTokens;
local l_shouldShowPriceLabel_0 = require(l_script_FirstAncestor_0.Utils.itemDetailsUtils).shouldShowPriceLabel;
local _ = v3.Enums.ButtonVariant;
local _ = require(l_script_FirstAncestor_0.Enums.PriceStatus);
local l_FFlagAXHideInspectAndBuyPriceIfUnavailable_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXHideInspectAndBuyPriceIfUnavailable;
return function(v9) --[[ Line: 57 ]] --[[ Name: BuyActionBar ]]
    -- upvalues: l_useTokens_0 (copy), l_FFlagAXHideInspectAndBuyPriceIfUnavailable_0 (copy), v2 (copy), l_shouldShowPriceLabel_0 (copy), v3 (copy)
    local v10 = l_useTokens_0();
    local v11 = not l_FFlagAXHideInspectAndBuyPriceIfUnavailable_0 or v2.useMemo(function() --[[ Line: 61 ]]
        -- upvalues: l_shouldShowPriceLabel_0 (ref), v9 (copy)
        return l_shouldShowPriceLabel_0(v9.priceStatus);
    end, {
        v9.priceStatus
    });
    return v2.createElement(v3.View, {
        tag = "size-full col gap-xsmall align-x-center padding-x-large padding-bottom-medium", 
        LayoutOrder = 1
    }, {
        InfoFrame = if v9.priceLabel then v2.createElement(v3.View, {
            tag = "size-full-800 row flex-x-between align-y-center gap-small", 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            PriceDescriptionLabel = v2.createElement(v3.Text, {
                tag = "auto-xy text-title-medium content-emphasis text-truncate-end", 
                Text = if v11 then v9.priceLabel.leftLabel else "", 
                LayoutOrder = 1
            }), 
            RobuxLabel = if v11 then v2.createElement(v3.View, {
                tag = "auto-xy row align-x-left align-y-center gap-xsmall", 
                LayoutOrder = 2
            }, {
                PriceText = v2.createElement(v3.Text, {
                    tag = "auto-xy text-body-large content-emphasis text-truncate-end", 
                    Text = v9.priceLabel.priceInRobux, 
                    LayoutOrder = 2
                }), 
                Robux = v2.createElement(v3.Icon, {
                    name = "robux", 
                    style = v10.Color.ActionStandard.Foreground, 
                    size = v3.Enums.IconSize.Small, 
                    LayoutOrder = 1
                })
            }) else nil
        }) else nil, 
        PurchaseButton = v2.createElement(v3.Button, {
            size = v3.Enums.InputSize.Medium, 
            fillBehavior = v3.Enums.FillBehavior.Fill, 
            width = UDim.new(1, 0), 
            text = v9.purchaseButtonProps.purchaseButtonText, 
            variant = v9.purchaseButtonProps.variant, 
            isDisabled = v9.purchaseButtonProps.isDisabled, 
            onActivated = v9.purchaseButtonProps.onPurchase, 
            LayoutOrder = 2
        })
    });
end;