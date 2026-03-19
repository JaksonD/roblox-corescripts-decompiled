return function() --[[ Line: 4 ]] --[[ Name: createUniqueKey ]]
    local v0 = {};
    return function(v1) --[[ Line: 7 ]]
        -- upvalues: v0 (copy)
        if v0[v1] == nil then
            v0[v1] = 1;
            return v1;
        else
            local v2;
            repeat
                v2 = v0;
                v2[v1] = v2[v1] + 1;
                v2 = ("%*_%*"):format(v1, v0[v1]);
            until v0[v2] == nil;
            return v2;
        end;
    end;
end;