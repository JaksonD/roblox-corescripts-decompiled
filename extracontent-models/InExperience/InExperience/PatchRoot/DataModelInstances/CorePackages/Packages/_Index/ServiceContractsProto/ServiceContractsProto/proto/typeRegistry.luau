local v0 = {};
v0.__index = v0;
local _ = require(script.Parent.message);
v0.new = function(v2) --[[ Line: 14 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v3 = {};
    for _, v5 in v2 do
        v3[v5.descriptor.fullName] = v5;
    end;
    return (setmetatable({
        _types = v3
    }, v0));
end;
v0.findMessage = function(v6, v7) --[[ Line: 26 ]] --[[ Name: findMessage ]]
    return v6._types[v7];
end;
v0.register = function(v8, v9) --[[ Line: 30 ]] --[[ Name: register ]]
    v8._types[v9.descriptor.fullName] = v9;
end;
local v10 = v0.new({});
return {
    TypeRegistry = v0, 
    default = v10
};