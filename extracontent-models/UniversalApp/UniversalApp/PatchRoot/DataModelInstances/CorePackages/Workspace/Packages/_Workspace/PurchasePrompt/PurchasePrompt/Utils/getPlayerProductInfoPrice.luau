local _ = script.Parent.Parent;
return function(v1, v2) --[[ Line: 5 ]]
    if v2 then
        if v1.PremiumPriceInRobux ~= nil then
            return v1.PremiumPriceInRobux;
        else
            return v1.PriceInRobux or 0;
        end;
    else
        return v1.PriceInRobux or 0;
    end;
end;