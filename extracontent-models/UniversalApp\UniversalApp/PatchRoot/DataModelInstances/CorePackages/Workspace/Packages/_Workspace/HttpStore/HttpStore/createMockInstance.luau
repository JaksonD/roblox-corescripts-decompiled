local l_Parent_0 = script.Parent.Parent;
local l_createMockHttpStore_0 = require(l_Parent_0.InternalHttpStore).createMockHttpStore;
return function() --[[ Line: 67 ]] --[[ Name: createMockInstance ]]
    -- upvalues: l_createMockHttpStore_0 (copy)
    local v2 = l_createMockHttpStore_0();
    return {
        get = function() --[[ Line: 72 ]] --[[ Name: get ]]
            -- upvalues: v2 (copy)
            return v2;
        end, 
        _create = function() --[[ Line: 75 ]] --[[ Name: _create ]]
            -- upvalues: v2 (copy)
            return v2;
        end, 
        _dispose = function() --[[ Line: 78 ]] --[[ Name: _dispose ]]
            -- upvalues: v2 (copy)
            v2.reset();
        end, 
        setResponse = v2.setResponse, 
        reset = v2.reset, 
        mockStore = v2
    };
end;