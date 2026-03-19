return function(v0, v1, v2) --[[ Line: 22 ]] --[[ Name: get ]]
    if v0 == nil then
        return v2;
    else
        local l_v0_0 = v0;
        for _, v5 in v1 do
            if type(l_v0_0) ~= "table" then
                return v2;
            else
                l_v0_0 = l_v0_0[v5];
                if l_v0_0 == nil then
                    return v2;
                end;
            end;
        end;
        return l_v0_0;
    end;
end;