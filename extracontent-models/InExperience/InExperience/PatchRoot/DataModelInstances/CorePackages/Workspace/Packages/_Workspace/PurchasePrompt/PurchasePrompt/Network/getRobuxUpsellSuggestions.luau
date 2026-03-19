local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Promise);
local v3 = require(l_script_FirstAncestor_0.Enums.PurchaseError);
local _ = require(l_script_FirstAncestor_0.Enums.PaymentPlatform);
local v5 = require(l_script_FirstAncestor_0.Utils.paymentPlatformToUpsellPlatform);
local _ = game:GetService("HttpService");
local l_GetUpsellSuggestions_0 = require(l_Parent_0.PurchasePromptDeps).IAPExperience.Api.PaymentsGateway.GetUpsellSuggestions;
local l_UpsellSuggestionsAPIMaxPackages_0 = require(l_Parent_0.SharedFlags).UpsellSuggestionsAPIMaxPackages;
return function(v9, v10, v11, v12, v13, v14, v15) --[[ Line: 15 ]]
    -- upvalues: v5 (copy), v2 (copy), l_GetUpsellSuggestions_0 (copy), l_UpsellSuggestionsAPIMaxPackages_0 (copy), v3 (copy)
    local v16 = v5(v11);
    return (v2.new(function(v17, v18) --[[ Line: 27 ]]
        -- upvalues: l_GetUpsellSuggestions_0 (ref), v16 (copy), v10 (copy), v9 (copy), l_UpsellSuggestionsAPIMaxPackages_0 (ref), v12 (copy), v13 (copy), v14 (copy), v15 (copy), v3 (ref)
        spawn(function() --[[ Line: 29 ]]
            -- upvalues: l_GetUpsellSuggestions_0 (ref), v16 (ref), v10 (ref), v9 (ref), l_UpsellSuggestionsAPIMaxPackages_0 (ref), v12 (ref), v13 (ref), v14 (ref), v15 (ref), v18 (copy), v3 (ref), v17 (copy)
            local v19, v20 = l_GetUpsellSuggestions_0(v16, v10, v9, l_UpsellSuggestionsAPIMaxPackages_0, v12, v13, v14, v15);
            if not v19 then
                return v18(v3.UnknownFailure);
            elseif not v20 or not v20.products or #v20.products == 0 then
                return v18(v3.UnknownFailure);
            else
                return v17(v20);
            end;
        end);
    end));
end;