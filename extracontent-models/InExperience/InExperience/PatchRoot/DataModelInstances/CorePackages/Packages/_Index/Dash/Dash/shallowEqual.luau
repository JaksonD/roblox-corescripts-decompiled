return function(v0, v1) --[[ Line: 8 ]] --[[ Name: shallowEqual ]]
    if v0 == v1 then
        return true;
    elseif typeof(v0) ~= "table" or typeof(v1) ~= "table" or #v0 ~= #v1 then
        return false;
    elseif v0 == nil or v1 == nil then
        return false;
    else
        for v2, v3 in v0 do
            if v1[v2] ~= v3 then
                return false;
            end;
        end;
        for v4, v5 in v1 do
            if v0[v4] ~= v5 then
                return false;
            end;
        end;
        return true;
    end;
end;