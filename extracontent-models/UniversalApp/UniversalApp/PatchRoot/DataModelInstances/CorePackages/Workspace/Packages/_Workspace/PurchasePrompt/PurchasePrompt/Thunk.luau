local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Symbols.Symbol);
local v2 = {};
local v3 = v1.named("ThunkTag");
v2.middleware = function(v4) --[[ Line: 16 ]] --[[ Name: middleware ]]
    -- upvalues: v3 (copy)
    v4 = v4 or {};
    return function(v5, v6) --[[ Line: 19 ]]
        -- upvalues: v3 (ref), v4 (ref)
        return function(v7) --[[ Line: 24 ]]
            -- upvalues: v3 (ref), v4 (ref), v6 (copy), v5 (copy)
            if v7[v3] == true then
                local v8 = {};
                for _, v10 in pairs(v7.requiredServices) do
                    local v11 = v4[v10];
                    if v11 == nil then
                        error(("Service with key %s is a dependency but was not provided"):format((tostring(v10))));
                    end;
                    v8[v10] = v11;
                end;
                return v7(v6, v8);
            else
                return v5(v7);
            end;
        end;
    end;
end;
v2.new = function(v12, v13, v14) --[[ Line: 52 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    assert(typeof(v12) == "string", "Bad arg #1: name must be a string");
    local v15 = true;
    if v13 ~= nil then
        v15 = typeof(v13) == "table";
    end;
    assert(v15, "Bad arg #2: requiredServices must be a table or nil");
    assert(typeof(v14) == "function", "Bad arg #3: onInvoke must be a function");
    local v16 = v13 or {};
    return (setmetatable({
        [v3] = true, 
        type = v12, 
        requiredServices = v16
    }, {
        __call = function(_, ...) --[[ Line: 67 ]] --[[ Name: __call ]]
            -- upvalues: v14 (copy)
            return v14(...);
        end
    }));
end;
v2.test = function(v18, v19, v20) --[[ Line: 73 ]] --[[ Name: test ]]
    -- upvalues: v3 (copy)
    local v21 = false;
    if typeof(v18) == "table" then
        v21 = v18[v3] == true;
    end;
    assert(v21, "Test Error - Bad arg #1: Must provide a valid thunk");
    if #v18.requiredServices > 0 then
        for _, v23 in ipairs(v18.requiredServices) do
            assert(v20[v23] ~= nil, "Test Error - Bad arg #3: Missing required service " .. tostring(v23));
        end;
    end;
    return v18(v19, v20);
end;
return v2;