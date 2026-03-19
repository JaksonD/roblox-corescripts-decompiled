local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.createRefCache);
return function() --[[ Line: 18 ]] --[[ Name: useRefCache ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v3 = v1.useRef(nil);
    if v3.current == nil then
        v3.current = v2();
    end;
    return v3.current;
end;