return function(v0, v1) --[[ Line: 4 ]] --[[ Name: makeActionCreator ]]
    assert(type(v0) == "string", "Bad argument #1: Expected a string name for the action creator");
    assert(type(v1) == "function", "Bad argument #2: Expected a function that creates action objects");
    return (setmetatable({
        name = v0
    }, {
        __call = function(_, ...) --[[ Line: 12 ]] --[[ Name: __call ]]
            -- upvalues: v1 (copy), v0 (copy)
            local v3 = v1(...);
            assert(type(v3) == "table", "Invalid action: An action creator must return a table");
            v3.type = v0;
            return v3;
        end
    }));
end;