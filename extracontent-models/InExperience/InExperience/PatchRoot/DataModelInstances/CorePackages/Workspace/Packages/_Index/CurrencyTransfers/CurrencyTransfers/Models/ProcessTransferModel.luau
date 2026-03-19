local l_Parent_0 = script:FindFirstAncestor("CurrencyTransfers").Parent;
local v1 = require(l_Parent_0.t);
local v2 = {};
v2.new = function(v3) --[[ Line: 11 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    assert(v2.isValid(v3));
    v2.__index = v2;
    setmetatable(v3, v2);
    return v3;
end;
v2.mock = function(v4) --[[ Line: 23 ]] --[[ Name: mock ]]
    -- upvalues: v2 (copy)
    local v5 = v4 or {};
    return (v2.new({
        success = v5.success or true
    }));
end;
v2.format = function(v6) --[[ Line: 33 ]] --[[ Name: format ]]
    -- upvalues: v2 (copy)
    return (v2.new({
        success = v6.success
    }));
end;
v2.isValid = v1.strictInterface({
    success = v1.boolean
});
return v2;