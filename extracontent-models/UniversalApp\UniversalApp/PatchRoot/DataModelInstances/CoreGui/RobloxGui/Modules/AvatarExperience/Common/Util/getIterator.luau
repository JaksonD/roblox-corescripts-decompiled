return function(v0) --[[ Line: 5 ]] --[[ Name: getIterator ]]
    local v1 = 1;
    return {
        getNext = function() --[[ Line: 8 ]] --[[ Name: getNext ]]
            -- upvalues: v0 (copy), v1 (ref)
            local v2 = v0[v1];
            v1 = v1 + 1;
            return v2;
        end
    };
end;