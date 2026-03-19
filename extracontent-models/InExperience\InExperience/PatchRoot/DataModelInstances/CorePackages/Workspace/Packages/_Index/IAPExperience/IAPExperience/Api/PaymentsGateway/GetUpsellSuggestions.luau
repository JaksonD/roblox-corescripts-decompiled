local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Url_0 = require(l_Parent_1.Http).Url;
local l_IXPServiceWrapper_0 = require(l_Parent_1.IXPServiceWrapper).IXPServiceWrapper;
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_HttpService_0 = game:GetService("HttpService");
local v6 = require(l_Parent_0.Utility.logger);
local _ = require(l_Parent_0.Api.PaymentsGateway.GetUpsellSuggestionsTypes);
local v8 = require(l_Parent_0.Flags.FStringIXPLayerMobileUpsell);
local v9 = l_Url_0.APIS_URL .. "payments-gateway/v1/products/get-upsell-suggestions";
local v10 = game:DefineFastFlag("EnableUpsellVirtualItemBadge", false);
return function(v11, v12, v13, v14, v15, v16, v17, v18) --[[ Line: 21 ]]
    -- upvalues: v10 (copy), v6 (copy), l_IXPServiceWrapper_0 (copy), v8 (copy), v9 (copy), l_HttpRbxApiService_0 (copy), l_HttpService_0 (copy)
    local v19 = nil;
    if v10 then
        v6.debug({
            message = "Virtual item flag is on"
        });
        local l_l_IXPServiceWrapper_0_LayerData_0 = l_IXPServiceWrapper_0:GetLayerData(v8);
        v6.debug({
            message = "Layer data", 
            layerData = l_l_IXPServiceWrapper_0_LayerData_0
        });
        if l_l_IXPServiceWrapper_0_LayerData_0 and l_l_IXPServiceWrapper_0_LayerData_0.badgingV2Variant then
            v19 = l_l_IXPServiceWrapper_0_LayerData_0.badgingV2Variant;
            l_IXPServiceWrapper_0:LogUserLayerExposure(v8);
        end;
    end;
    local v21 = {
        upsell_platform = v11, 
        user_robux_balance = v12, 
        attempt_robux_amount = v13, 
        max_packages = v14, 
        virtual_item_badge_variant = v19
    };
    if v15 ~= nil then
        v21.item_product_id = v15;
    end;
    if v16 ~= nil then
        v21.item_name = v16;
    end;
    if v17 ~= nil then
        v21.universe_id = v17;
    end;
    if v18 ~= nil then
        v21.analytic_id = v18;
    end;
    v6.debug({
        message = "Making GetUpsellSuggestions API Call", 
        url = v9, 
        data = v21
    });
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 76 ]]
        -- upvalues: l_HttpRbxApiService_0 (ref), v9 (ref), l_HttpService_0 (ref), v21 (copy)
        return l_HttpRbxApiService_0:PostAsyncFullUrl(v9, l_HttpService_0:JSONEncode(v21));
    end);
    v6.debug({
        message = "GetUpsellSuggestions API Response", 
        response = l_result_0, 
        success = l_status_0
    });
    if not l_status_0 then
        return false, nil;
    else
        local v24 = l_HttpService_0:JSONDecode(l_result_0);
        local v25 = {
            products = {}, 
            virtualItemBadgeType = v24.virtual_item_badge_type
        };
        for v26, v27 in ipairs(v24.products) do
            v25.products[v26] = {
                productId = v27.roblox_product_id, 
                providerId = v27.provider_product_id, 
                productName = v27.roblox_product_name, 
                robuxAmount = v27.robux_amount, 
                robuxAmountBeforeBonus = v27.robux_amount_before_bonus, 
                price = v27.price, 
                badgeType = v27.badge_type
            };
        end;
        return true, v25;
    end;
end;