local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.FocusController);
return function() --[[ Line: 19 ]] --[[ Name: useRootFocusController ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v3 = v1.useRef(nil);
    if v3.current == nil then
        v3.current = v2.createPublicApiWrapper();
    end;
    return v3.current;
end;