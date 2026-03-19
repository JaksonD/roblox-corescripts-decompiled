local l_Parent_0 = script:FindFirstAncestor("ApolloLocalState").Parent;
local v1 = require(l_Parent_0.Cryo);
return function(v2, v3, v4) --[[ Line: 5 ]] --[[ Name: mergeListsWithoutDuplicates ]]
    -- upvalues: v1 (copy)
    if not v3 or #v3 == 0 then
        return v2;
    elseif not v2 or #v2 == 0 then
        return v3;
    else
        local v6 = v1.List.toSet(v1.List.map(v2, function(v5) --[[ Line: 13 ]]
            -- upvalues: v4 (copy)
            if v4 then
                return v5[v4];
            else
                return v5;
            end;
        end));
        local v8 = v1.List.filter(v3, function(v7) --[[ Line: 18 ]]
            -- upvalues: v4 (copy), v6 (copy)
            return not v6[if v4 then v7[v4] else v7];
        end);
        return v1.List.join(table.clone(v2), v8);
    end;
end;