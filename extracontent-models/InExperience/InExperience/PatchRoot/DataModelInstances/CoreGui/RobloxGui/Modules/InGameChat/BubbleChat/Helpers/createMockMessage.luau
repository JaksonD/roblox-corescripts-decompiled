local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = 0;
return function(v3) --[[ Line: 7 ]] --[[ Name: createMockMessage ]]
    -- upvalues: v2 (ref), v1 (copy)
    v2 = v2 + 1;
    return v1.Dictionary.join({
        name = "Foo", 
        id = tostring(v2), 
        userId = "1", 
        text = "Hello, World!", 
        timestamp = v2
    }, v3);
end;