local v0 = require(script.Parent.Symbol);
local v1 = {};
local v2 = v0.named("ThunkTag");
v1.middleware = function(v3) --[[ Line: 15 ]] --[[ Name: middleware ]]
    -- upvalues: v2 (copy)
    v3 = v3 or {};
    return function(v4, v5) --[[ Line: 18 ]]
        -- upvalues: v2 (ref), v3 (ref)
        return function(v6) --[[ Line: 23 ]]
            -- upvalues: v2 (ref), v3 (ref), v5 (copy), v4 (copy)
            if v6[v2] == true then
                local v7 = {};
                for _, v9 in pairs(v6.requiredServices) do
                    local v10 = v3[v9];
                    if v10 == nil then
                        error(("Service with key %s is a dependency but was not provided"):format(v9));
                    end;
                    v7[v9] = v10;
                end;
                return v6(v5, v7);
            else
                return v4(v6);
            end;
        end;
    end;
end;
v1.new = function(v11, v12, v13) --[[ Line: 51 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    assert(typeof(v11) == "string", "Bad arg #1: name must be a string");
    local v14 = true;
    if v12 ~= nil then
        v14 = typeof(v12) == "table";
    end;
    assert(v14, "Bad arg #2: requiredServices must be a table or nil");
    assert(typeof(v13) == "function", "Bad arg #3: onInvoke must be a function");
    local v15 = v12 or {};
    return (setmetatable({
        [v2] = true, 
        type = v11, 
        requiredServices = v15
    }, {
        __call = function(_, ...) --[[ Line: 66 ]] --[[ Name: __call ]]
            -- upvalues: v13 (copy)
            v13(...);
        end
    }));
end;
v1.test = function(v17, v18, v19) --[[ Line: 72 ]] --[[ Name: test ]]
    -- upvalues: v2 (copy)
    local v20 = false;
    if typeof(v17) == "table" then
        v20 = v17[v2] == true;
    end;
    assert(v20, "Test Error - Bad arg #1: Must provide a valid thunk");
    if #v17.requiredServices > 0 then
        for _, v22 in ipairs(v17.requiredServices) do
            assert(v19[v22] ~= nil, "Test Error - Bad arg #3: Missing required service " .. tostring(v22));
        end;
    end;
    return v17(v18, v19);
end;
return v1;