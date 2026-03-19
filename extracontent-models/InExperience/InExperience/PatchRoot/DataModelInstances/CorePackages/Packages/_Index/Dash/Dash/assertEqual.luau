local l_Parent_0 = script.Parent;
return function(v1, v2, v3) --[[ Line: 12 ]] --[[ Name: assertEqual ]]
    -- upvalues: l_Parent_0 (copy)
    if v1 ~= v2 then
        require(l_Parent_0.Error).new("AssertError", v3 or ("Left \"%*\" does not equal right \"%*\""):format(v1, v2)):throw({
            left = v1, 
            right = v2
        });
    end;
end;