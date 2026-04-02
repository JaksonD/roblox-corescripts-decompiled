return function(v0, v1) --[[ Line: 1 ]]
    local l_status_0, _ = pcall(Instance.new, v1);
    assert(l_status_0, (("%* does not exist. Did you make a typo?"):format(v1)));
    local l_v0_Descendants_0 = v0:GetDescendants();
    table.insert(l_v0_Descendants_0, v0);
    local v5 = {};
    for _, v7 in l_v0_Descendants_0 do
        if v7:IsA(v1) then
            table.insert(v5, v7);
        end;
    end;
    return v5;
end;