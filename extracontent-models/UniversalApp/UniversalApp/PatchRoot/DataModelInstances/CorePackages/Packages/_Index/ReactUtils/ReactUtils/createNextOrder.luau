return function() --[[ Line: 2 ]] --[[ Name: createNextOrder ]]
    local v0 = 0;
    return function() --[[ Line: 5 ]]
        -- upvalues: v0 (ref)
        v0 = v0 + 1;
        return v0;
    end;
end;