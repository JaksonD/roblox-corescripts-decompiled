return function(v0) --[[ Line: 1 ]] --[[ Name: createSpy ]]
    local v1 = {
        callCount = 0, 
        values = {}, 
        valuesLength = 0
    };
    v1.value = function(...) --[[ Line: 8 ]]
        -- upvalues: v1 (copy), v0 (copy)
        v1.callCount = v1.callCount + 1;
        v1.values = {
            ...
        };
        v1.valuesLength = select("#", ...);
        if v0 ~= nil then
            return v0(...);
        else
            return;
        end;
    end;
    v1.assertCalledWith = function(_, ...) --[[ Line: 18 ]]
        -- upvalues: v1 (copy)
        local v3 = select("#", ...);
        assert(v1.valuesLength, v3, "length of expected values differs from stored values");
        for v4 = 1, v3 do
            local v5 = select(v4, ...);
            assert(v1.values[v4], v5, "value differs");
        end;
    end;
    setmetatable(v1, {
        __index = function(_, v7) --[[ Line: 30 ]] --[[ Name: __index ]]
            error(("%q is not a valid member of spy"):format(v7));
        end
    });
    return v1;
end;