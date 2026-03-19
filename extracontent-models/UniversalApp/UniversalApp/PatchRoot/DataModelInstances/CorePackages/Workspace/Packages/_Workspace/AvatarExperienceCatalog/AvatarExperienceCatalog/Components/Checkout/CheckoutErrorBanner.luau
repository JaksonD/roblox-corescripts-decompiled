local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCatalog").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
return v1.memo(function(v4) --[[ Line: 14 ]] --[[ Name: CheckoutErrorBanner ]]
    -- upvalues: l_useLocalization_0 (copy), v1 (copy), v2 (copy)
    local v5 = l_useLocalization_0({
        checkoutErrorTitleSingular = "Feature.Catalog.Title.Checkout.PurchaseFailedSingular", 
        checkoutErrorTitlePlural = {
            "Feature.Catalog.Title.Checkout.PurchaseFailedPlural"; 
            count = v4.erroredItemCount
        }, 
        checkoutErrorDescription = "Feature.Catalog.Message.Checkout.PurchaseFailed"
    });
    return v1.createElement(v2.View, {
        tag = "size-full-0 auto-y row gap-medium bg-surface-200 items-center radius-medium padding-large", 
        testId = "CheckoutErrorBanner"
    }, {
        CheckoutErrorIcon = v1.createElement(v2.Icon, {
            name = v2.Enums.IconName.TriangleExclamation, 
            variant = v2.Enums.IconVariant.Filled, 
            size = v2.Enums.InputSize.Large
        }), 
        CheckoutTextRows = v1.createElement(v2.View, {
            tag = "size-full-0 col gap-small fill auto-y"
        }, {
            CheckoutErrorTitle = v1.createElement(v2.Text, {
                tag = "size-full-0 auto-y text-wrap fill text-label-medium text-align-x-left content-emphasis", 
                Text = if v4.erroredItemCount == 1 then v5.checkoutErrorTitleSingular else v5.checkoutErrorTitlePlural
            }), 
            CheckoutErrorDescription = v1.createElement(v2.Text, {
                tag = "size-full-0 auto-y text-wrap fill text-body-medium text-align-x-left content-default", 
                Text = v5.checkoutErrorDescription
            })
        })
    });
end);