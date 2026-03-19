local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v3 = require(l_Parent_0.React);
local v4 = require(script.Parent.TileContext);
return function() --[[ Line: 17 ]]
    -- upvalues: v3 (copy), v4 (copy)
    return v3.useContext(v4);
end;