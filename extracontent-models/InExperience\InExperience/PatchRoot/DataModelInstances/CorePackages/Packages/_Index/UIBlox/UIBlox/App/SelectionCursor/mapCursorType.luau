local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_CursorType_0 = require(l_Parent_0.Foundation).Enums.CursorType;
return function(v2, v3) --[[ Line: 5 ]] --[[ Name: mapCursorType ]]
    -- upvalues: l_CursorType_0 (copy)
    local v4 = tostring(v2);
    return l_CursorType_0[string.gsub(v4, v3 and "CursorKind%." or "CursorType%.", "")];
end;