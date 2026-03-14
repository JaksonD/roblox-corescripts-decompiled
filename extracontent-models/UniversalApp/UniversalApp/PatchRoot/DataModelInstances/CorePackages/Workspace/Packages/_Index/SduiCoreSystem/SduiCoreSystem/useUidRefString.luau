local l_Parent_0 = script:FindFirstAncestor("SduiCoreSystem").Parent;
local v1 = require(l_Parent_0.React);
local v2 = 0;
local function _() --[[ Line: 8 ]] --[[ Name: getNextUidKey ]]
    -- upvalues: v2 (ref)
    v2 = v2 + 1;
    return (tostring(v2));
end;
return function() --[[ Line: 13 ]] --[[ Name: useUidRefString ]]
    -- upvalues: v1 (copy), v2 (ref)
    local v4 = v1.useRef(nil);
    if v4.current == nil then
        v2 = v2 + 1;
        v4.current = tostring(v2);
    end;
    return v4;
end;