local v0 = require(script.Parent.symbols);
local v1 = require(script.Parent.isAMagicMock);
local v2 = {};
v2.__index = v2;
v2.__call = function(v3, ...) --[[ Line: 9 ]]
    return v3.inner(...);
end;
local v4 = {};
setmetatable(v4, {
    __mode = "kv"
});
v2.new = function(v5) --[[ Line: 16 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), v2 (copy), v4 (copy)
    local v6 = {
        [v0.isSpy] = true, 
        [v0.Calls] = {}
    };
    setmetatable(v6, v2);
    local function v8(...) --[[ Line: 23 ]]
        -- upvalues: v5 (copy), v6 (copy), v0 (ref)
        local v7 = {
            args = table.pack(...), 
            result = table.pack(v5(...))
        };
        table.insert(v6[v0.Calls], v7);
        return table.unpack(v7.result);
    end;
    v6.inner = v8;
    v4[v8] = v6;
    return v6, v8;
end;
v2.lookup = function(v9) --[[ Line: 38 ]] --[[ Name: lookup ]]
    -- upvalues: v4 (copy)
    return v4[v9];
end;
v2.is = function(v10) --[[ Line: 42 ]] --[[ Name: is ]]
    -- upvalues: v1 (copy), v0 (copy)
    if not v1(v10) then
        local v11 = false;
        if type(v10) == "table" then
            v11 = v10[v0.isSpy] ~= nil;
        end;
        return v11;
    else
        return false;
    end;
end;
return v2;