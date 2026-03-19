local l_ContentProvider_0 = game:GetService("ContentProvider");
return function(v1, v2) --[[ Line: 3 ]] --[[ Name: getSubscriptionPurchaseUrl ]]
    -- upvalues: l_ContentProvider_0 (copy)
    local l_BaseUrl_0 = l_ContentProvider_0.BaseUrl;
    if v2 then
        return string.format("%supgrades/paymentmethods?ctx=subscription&type=Blackbird&id=%s&paymentSessionId=%s", l_BaseUrl_0, v1, v2);
    else
        return string.format("%supgrades/paymentmethods?ctx=subscription&type=Blackbird&id=%s", l_BaseUrl_0, v1);
    end;
end;