local l_Parent_0 = script:FindFirstAncestor("HttpRequest").Parent;
local v1 = require(l_Parent_0.Promise);
local v2 = require(script.Parent.HttpRequest);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy), v1 (copy)
    assert(type(v3.requestFunction) == "function", "Expected requestFunction to be a function");
    return function(v4, v5, v6) --[[ Line: 9 ]]
        -- upvalues: v2 (ref), v3 (copy), v1 (ref)
        assert(type(v4) == "string", "Expected url to be a string");
        assert(type(v5) == "string", "Expected requestMethod to be a string");
        assert(not v6 or type(v6) == "table", "Expected options to be a table");
        v5 = string.upper(v5);
        local v7 = v2.new(v3, v4, v5, v6);
        return v1.new(function(v8, v9) --[[ Line: 17 ]]
            -- upvalues: v7 (copy)
            coroutine.wrap(function() --[[ Line: 18 ]]
                -- upvalues: v7 (ref), v8 (copy), v9 (copy)
                v7:start(v8, v9);
            end)();
        end), function() --[[ Line: 23 ]] --[[ Name: cancel ]]
            -- upvalues: v7 (copy)
            v7:cancel();
        end;
    end;
end;