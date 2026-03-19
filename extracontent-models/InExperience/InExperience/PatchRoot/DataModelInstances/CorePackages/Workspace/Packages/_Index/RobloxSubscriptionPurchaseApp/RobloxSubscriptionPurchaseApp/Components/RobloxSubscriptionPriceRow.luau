local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_script_FirstAncestor_0.Store.RobloxSubscriptionStore);
local v5 = require(l_Parent_0.SignalsReact);
local _ = require(l_script_FirstAncestor_0.Models.GetRobloxSubscriptionProductsModel);
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local v9 = require(l_script_FirstAncestor_0.Hooks.usePlaceholderLocalization);
return function(v10) --[[ Line: 19 ]] --[[ Name: RobloxSubscriptionPriceRow ]]
    -- upvalues: v4 (copy), v5 (copy), v9 (copy), v2 (copy), l_View_0 (copy), l_Text_0 (copy)
    local v11 = v4.get();
    local v12 = v5.useSignalState(v11.getRobloxSubscriptionProduct);
    local v13 = v12 and v12.LocalizedPriceDisplayString;
    local v14 = v12 and v12.PeriodType;
    local v15 = v14 and string.lower(v14);
    if not v13 or not v14 then
        return nil;
    else
        local v16 = v9({
            price = {
                "Feature.RobloxSubscription.Label.BlackbirdPriceTag"; 
                price = v13, 
                periodType = v15
            }
        });
        return v2.createElement(l_View_0, {
            tag = "row auto-y size-full-0 align-y-center align-x-left gap-small", 
            LayoutOrder = v10.layoutOrder
        }, {
            Price = v2.createElement(l_Text_0, {
                Text = v16.price, 
                tag = "size-full-0 auto-y text-title-medium content-emphasis text-align-x-left"
            })
        });
    end;
end;