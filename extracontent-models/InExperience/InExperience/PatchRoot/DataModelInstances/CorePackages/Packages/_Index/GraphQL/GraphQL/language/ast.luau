local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.LuauPolyfill);
local _ = require(script.Parent.source);
local _ = require(script.Parent.tokenKind);
local v4 = {};
v4.__index = v4;
v4.new = function(v5, v6, v7) --[[ Line: 50 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    return (setmetatable({
        start = v5.start, 
        _end = v6._end, 
        startToken = v5, 
        endToken = v6, 
        source = v7
    }, v4));
end;
v4.toJSON = function(v8) --[[ Line: 62 ]] --[[ Name: toJSON ]]
    return {
        start = v8.start, 
        _end = v8._end
    };
end;
local v9 = {};
v9.__index = v9;
v9.new = function(v10, v11, v12, v13, v14, v15, v16) --[[ Line: 138 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy)
    return (setmetatable({
        kind = v10, 
        start = v11, 
        _end = v12, 
        line = v13, 
        column = v14, 
        value = v16, 
        prev = v15, 
        next = nil
    }, v9));
end;
v9.toJSON = function(v17) --[[ Line: 161 ]] --[[ Name: toJSON ]]
    return {
        kind = v17.kind, 
        value = v17.value, 
        line = v17.line, 
        column = v17.column
    };
end;
return {
    Location = v4, 
    Token = v9, 
    isNode = function(v18) --[[ Line: 181 ]] --[[ Name: isNode ]]
        local v19 = false;
        if typeof(v18) == "table" then
            v19 = typeof(v18.kind) == "string";
        end;
        return v19;
    end
};