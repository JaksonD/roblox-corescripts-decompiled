local l_Parent_0 = script:FindFirstAncestor("ApolloLocalState").Parent;
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
return function(v2, v3) --[[ Line: 4 ]]
    -- upvalues: l_Array_0 (copy)
    v2 = v2 or {};
    v3 = v3 or {};
    if #v3 == 0 then
        return v2;
    elseif #v2 == 0 then
        return v3;
    else
        return l_Array_0.concat(table.clone(v2), v3);
    end;
end;