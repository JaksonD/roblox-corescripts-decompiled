local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.class);
local v3 = require(l_Parent_0.format);
local v4 = require(l_Parent_0.join);
local v8 = v2("Error", function(v5, v6, v7) --[[ Line: 18 ]]
    return {
        name = v5, 
        message = v6 or "An error occurred", 
        tags = v7 or {}
    };
end);
v8.toString = function(v9) --[[ Line: 26 ]] --[[ Name: toString ]]
    -- upvalues: v3 (copy)
    return v3("{}: {}\n{}", v9.name, v3(v9.message, v9.tags), v9.stack);
end;
v8.joinTags = function(v10, v11) --[[ Line: 36 ]] --[[ Name: joinTags ]]
    -- upvalues: v8 (copy), v4 (copy)
    return v8.new(v10.name, v10.message, v4(v10.tags, v11 or {}));
end;
v8.throw = function(v12, v13) --[[ Line: 49 ]] --[[ Name: throw ]]
    local v14 = v12:joinTags(v13);
    v14.stack = debug.traceback();
    error(v14);
end;
return v8;