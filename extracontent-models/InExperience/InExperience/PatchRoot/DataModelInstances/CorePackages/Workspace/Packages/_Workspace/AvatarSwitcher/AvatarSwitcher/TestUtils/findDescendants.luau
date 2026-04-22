return {
    findFirstDescendant = function(v0, v1, v2) --[[ Line: 1 ]] --[[ Name: findFirstDescendant ]]
        for _, v4 in v0:GetDescendants() do
            if v4:IsA(v1) and (v2 == nil or v2(v4)) then
                return v4;
            end;
        end;
        return nil;
    end, 
    findAllDescendants = function(v5, v6) --[[ Line: 14 ]] --[[ Name: findAllDescendants ]]
        local v7 = {};
        for _, v9 in v5:GetDescendants() do
            if v9:IsA(v6) then
                table.insert(v7, v9);
            end;
        end;
        return v7;
    end
};