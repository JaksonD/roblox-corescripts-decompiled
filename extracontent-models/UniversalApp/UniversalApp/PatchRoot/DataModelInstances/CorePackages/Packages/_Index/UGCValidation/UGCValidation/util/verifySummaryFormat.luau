return function(v0, v1) --[[ Line: 1 ]] --[[ Name: verifySummaryFormat ]]
    if v0 == nil or typeof(v0) ~= "table" then
        return false;
    else
        local v2 = {};
        for _, v4 in v1 do
            v2[v4] = true;
        end;
        for _, v6 in v1 do
            if v0[v6] == nil or typeof(v0[v6]) ~= "number" then
                return false;
            end;
        end;
        for v7, _ in v0 do
            if not v2[v7] then
                return false;
            end;
        end;
        return true;
    end;
end;