local l_script_FirstAncestor_0 = script:FindFirstAncestor("GamePlayButton");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_ApiFetchGameDetails_0 = require(l_Parent_0.GameDetailRodux).GameDetails.ApiFetchGameDetails;
local l_FetchGamePlayabilityAndProductInfo_0 = require(l_Parent_0.GameDetailRodux).FetchGamePlayabilityAndProductInfo;
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
local v6 = require(l_Parent_0.Promise);
local v7 = require(l_script_FirstAncestor_0.FiatPaidAccessPostPreparePurchaseRequest);
local v8 = require(l_script_FirstAncestor_0.OpenFiatPurchasePage);
local v9 = {};
local function _(v10) --[[ Line: 16 ]]
    return "luaapp.fiatpaidaccess.prepare-purchase." .. v10;
end;
v9.GetFetchingStatus = function(v12, v13) --[[ Line: 20 ]] --[[ Name: GetFetchingStatus ]]
    -- upvalues: l_PerformFetch_0 (copy)
    return l_PerformFetch_0.GetStatus(v12, "luaapp.fiatpaidaccess.prepare-purchase." .. v13);
end;
v9.Fetch = function(v14, v15, v16, v17) --[[ Line: 24 ]] --[[ Name: Fetch ]]
    -- upvalues: l_PerformFetch_0 (copy), v7 (copy), l_HttpService_0 (copy), v8 (copy), l_ApiFetchGameDetails_0 (copy), l_FetchGamePlayabilityAndProductInfo_0 (copy), v6 (copy)
    return l_PerformFetch_0.Single("luaapp.fiatpaidaccess.prepare-purchase." .. v16, function(v18) --[[ Line: 25 ]]
        -- upvalues: v7 (ref), v14 (copy), v15 (copy), v17 (copy), l_HttpService_0 (ref), v8 (ref), l_ApiFetchGameDetails_0 (ref), v16 (copy), l_FetchGamePlayabilityAndProductInfo_0 (ref), v6 (ref)
        return v7(v14, v15, v17):andThen(function(v19) --[[ Line: 27 ]]
            -- upvalues: l_HttpService_0 (ref), v18 (copy), v8 (ref), l_ApiFetchGameDetails_0 (ref), v14 (ref), v16 (ref), l_FetchGamePlayabilityAndProductInfo_0 (ref), v6 (ref)
            local v20 = v19 and v19.responseBody and v19.responseBody.checkoutUrl;
            if v20 then
                local v21 = l_HttpService_0:JSONDecode(v20);
                if v21 and v21.checkoutUrl then
                    v18:dispatch(v8(v21.checkoutUrl, function() --[[ Line: 34 ]]
                        -- upvalues: v18 (ref), l_ApiFetchGameDetails_0 (ref), v14 (ref), v16 (ref), l_FetchGamePlayabilityAndProductInfo_0 (ref)
                        v18:dispatch(l_ApiFetchGameDetails_0.Fetch(v14, {
                            v16
                        }));
                        v18:dispatch(l_FetchGamePlayabilityAndProductInfo_0.Fetch(v14, v16));
                    end));
                    return v6.resolve(v19);
                end;
            end;
            return v6.reject("Invalid Response");
        end);
    end);
end;
return v9;