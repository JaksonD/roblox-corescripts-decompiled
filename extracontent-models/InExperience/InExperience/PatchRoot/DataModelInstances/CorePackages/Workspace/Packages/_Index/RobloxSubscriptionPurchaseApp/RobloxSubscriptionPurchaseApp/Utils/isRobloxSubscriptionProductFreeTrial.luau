return function(v0) --[[ Line: 4 ]] --[[ Name: isRobloxSubscriptionProductFreeTrial ]]
    if not v0 then
        return false;
    else
        local l_EligibleOffers_0 = v0.EligibleOffers;
        local v2 = l_EligibleOffers_0 and l_EligibleOffers_0[1];
        local v3 = false;
        if v2 ~= nil then
            v3 = v2.OfferType == "FreeTrial";
        end;
        return v3;
    end;
end;