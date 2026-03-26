local l_Parent_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent;
local v1 = require(l_Parent_0.React);
local v2 = {
    ["Feature.RobloxSubscription.Action.Subscribe"] = "Lorem", 
    ["Feature.RobloxSubscription.Title.GetBlackbird"] = "Lorem ipsum dolor sit amet", 
    ["Feature.RobloxSubscription.Label.BlackbirdVTDiscountFirst"] = "{discountPercent}% Lorem ipsum dolor sit amet", 
    ["Feature.RobloxSubscription.Label.BlackbirdVTDiscountSecond"] = "{discountPercent}% Lorem ipsum dolor {periodIndex} {periodType} sit amet", 
    ["Feature.RobloxSubscription.Label.BlackbirdTr"] = "Lorem ipsum dolor sit amet", 
    ["Feature.RobloxSubscription.Label.BlackbirdFPS"] = "Lorem ipsum dolor sit amet", 
    ["Feature.RobloxSubscription.Label.BlackbirdUpsellBanner"] = "Tempus {discountPercentage}% leo eu aenean", 
    ["Feature.RobloxSubscription.Label.BlackbirdPriceTag"] = "{price}/{periodType}", 
    ["Feature.RobloxSubscription.Label.FreeTrialText"] = "sit amet dolor", 
    ["Feature.RobloxSubscription.Label.BlackbirdPSDiscount"] = "Lorem ipsum dolor sit amet"
};
return function(v3) --[[ Line: 27 ]] --[[ Name: usePlaceholderLocalization ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.useMemo(function() --[[ Line: 28 ]]
        -- upvalues: v3 (copy), v2 (ref)
        local v4 = {};
        for v5, v6 in pairs(v3) do
            local v7 = if typeof(v6) == "table" then v6[1] else v6;
            local v8 = v2[v7] or v7;
            if typeof(v6) == "table" then
                for v9, v10 in pairs(v6) do
                    if typeof(v9) == "string" then
                        v8 = string.gsub(v8, "{" .. v9 .. "}", function() --[[ Line: 36 ]]
                            -- upvalues: v10 (copy)
                            return (tostring(v10));
                        end);
                    end;
                end;
            end;
            v4[v5] = v8;
        end;
        return v4;
    end, {
        v3
    });
end;