local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local v6 = require(l_script_FirstAncestor_0.Hooks.usePlaceholderLocalization);
return function(v7) --[[ Line: 14 ]] --[[ Name: RobloxSubscriptionPriceRow ]]
    -- upvalues: v6 (copy), v2 (copy), l_View_0 (copy), l_Text_0 (copy)
    local v8 = v6({
        price = "Feature.RobloxSubscription.Label.BlackbirdPriceTag"
    });
    return v2.createElement(l_View_0, {
        tag = "row auto-y size-full-0 align-y-center align-x-left gap-small", 
        LayoutOrder = v7.layoutOrder
    }, {
        Price = v2.createElement(l_Text_0, {
            Text = v8.price, 
            tag = "size-full-0 auto-y text-title-medium content-emphasis text-align-x-left"
        })
    });
end;