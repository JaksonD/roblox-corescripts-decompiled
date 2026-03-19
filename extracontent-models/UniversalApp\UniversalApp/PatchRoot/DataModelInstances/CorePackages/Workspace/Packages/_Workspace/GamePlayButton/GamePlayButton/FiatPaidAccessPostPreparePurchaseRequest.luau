local l_script_FirstAncestor_0 = script:FindFirstAncestor("GamePlayButton");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v4, v5, v6) --[[ Line: 21 ]] --[[ Name: FiatPaidAccessPostPreparePurchaseRequest ]]
    -- upvalues: l_Url_0 (copy), l_HttpService_0 (copy)
    return v4(string.format("%s/fiat-paid-access-service/v1/purchase", l_Url_0.APIS_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            expected_base_price_id = v6, 
            root_place_id = v5
        })
    });
end;