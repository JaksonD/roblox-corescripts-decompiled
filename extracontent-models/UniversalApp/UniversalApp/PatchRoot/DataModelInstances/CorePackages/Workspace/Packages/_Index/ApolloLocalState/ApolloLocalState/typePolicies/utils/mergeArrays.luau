local l_Parent_0 = script:FindFirstAncestor("ApolloLocalState").Parent;
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
return function(_, v3, v4) --[[ Line: 6 ]] --[[ Name: mergeArrays ]]
    -- upvalues: l_Array_0 (copy)
    v3 = v3 or {};
    v4 = v4 or {};
    if #v4 == 0 then
        return v3;
    elseif #v3 == 0 then
        return v4;
    else
        return l_Array_0.concat(table.clone(v3), v4);
    end;
end;