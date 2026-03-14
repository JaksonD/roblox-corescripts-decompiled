local v0 = "id-" .. tostring(math.random(100000, 1000000));
local v1 = 0;
return {
    _TESTING_ONLY_normalize_keys = function() --[[ Line: 9 ]] --[[ Name: _TESTING_ONLY_normalize_keys ]]
        -- upvalues: v0 (ref), v1 (ref)
        v0 = "id-";
        v1 = 0;
    end, 
    generateKey = function() --[[ Line: 15 ]] --[[ Name: generateKey ]]
        -- upvalues: v0 (ref), v1 (ref)
        local v2 = v0 .. tostring(v1);
        v1 = v1 + 1;
        return v2;
    end
};