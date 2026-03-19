local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent;
local v2 = require(l_Parent_0.StyleContext);
local v3 = require(l_Parent_1.React);
return function() --[[ Line: 13 ]] --[[ Name: useStyleMetadata ]]
    -- upvalues: v3 (copy), v2 (copy)
    return v3.useContext(v2).styleMetadata;
end;