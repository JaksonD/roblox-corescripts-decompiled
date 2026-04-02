return function(v0, v1) --[[ Line: 1 ]]
    local l_v0_Descendants_0 = v0:GetDescendants();
    table.insert(l_v0_Descendants_0, v0);
    local v3 = {};
    for _, v5 in l_v0_Descendants_0 do
        if v5.Name == v1 then
            table.insert(v3, v5);
        end;
    end;
    return v3;
end;