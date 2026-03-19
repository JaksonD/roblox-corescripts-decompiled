return function(v0, v1, v2) --[[ Line: 1 ]]
    if v1 == nil or v1 == "" then
        return v2 or "";
    elseif v0 then
        return v1 or "";
    else
        return v2 or "";
    end;
end;