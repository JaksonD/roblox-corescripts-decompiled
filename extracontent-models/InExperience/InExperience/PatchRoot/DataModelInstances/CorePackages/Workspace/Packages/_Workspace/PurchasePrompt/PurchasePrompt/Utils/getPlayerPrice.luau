local _ = script.Parent.Parent;
return function(v1, v2, v3) --[[ Line: 4 ]]
    if v3 and v3 > 0 then
        return v3;
    elseif v2 then
        if v1.premiumPrice ~= nil then
            return v1.premiumPrice;
        else
            return v1.price;
        end;
    else
        return v1.price;
    end;
end;