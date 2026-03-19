return function(v0, v1) --[[ Line: 10 ]] --[[ Name: includes ]]
    if v1 == nil then
        return false;
    else
        for _, v3 in v0 do
            if v3 == v1 then
                return true;
            end;
        end;
        return false;
    end;
end;