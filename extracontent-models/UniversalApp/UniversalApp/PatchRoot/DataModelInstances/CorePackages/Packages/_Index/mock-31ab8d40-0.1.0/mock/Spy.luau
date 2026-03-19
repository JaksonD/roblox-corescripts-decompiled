local v0 = require(script.Parent.symbols);
local v1 = {};
v1.__index = v1;
local v2 = {};
setmetatable(v2, {
    __mode = "kv"
});
v1.new = function(v3) --[[ Line: 12 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), v1 (copy), v2 (copy)
    local v4 = {
        [v0.Calls] = {}
    };
    setmetatable(v4, v1);
    local function v6(...) --[[ Line: 18 ]]
        -- upvalues: v3 (copy), v4 (copy), v0 (ref)
        local v5 = {
            args = table.pack(...), 
            result = table.pack(v3(...))
        };
        table.insert(v4[v0.Calls], v5);
        return table.unpack(v5.result);
    end;
    v4.inner = v6;
    v2[v6] = v4;
    return v4, v6;
end;
v1.lookup = function(v7) --[[ Line: 33 ]] --[[ Name: lookup ]]
    -- upvalues: v2 (copy)
    return v2[v7];
end;
return v1;