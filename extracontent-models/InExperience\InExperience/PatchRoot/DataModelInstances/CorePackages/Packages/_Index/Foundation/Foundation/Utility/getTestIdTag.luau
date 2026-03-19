return function(v0, v1) --[[ Line: 9 ]] --[[ Name: getTestIdTag ]]
    if v0 == nil then
        return nil;
    elseif v1 then
        return (("data-testid=%*--%*"):format(v0, v1));
    else
        return (("data-testid=%*"):format(v0));
    end;
end;