local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v2 = 0;
return function(v3) --[[ Line: 7 ]] --[[ Name: createMockMessage ]]
    -- upvalues: v2 (ref), l_Dictionary_0 (copy)
    v2 = v2 + 1;
    return l_Dictionary_0.join({
        name = "Foo", 
        id = tostring(v2), 
        userId = "1", 
        text = "Hello, World!", 
        timestamp = v2
    }, v3);
end;