local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utility.Logger);
local v3 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Enums.CursorType);
local _ = require(l_script_FirstAncestor_0.Components.Types);
return (v3.createContext({
    refCache = {}, 
    setMountedCursors = function(_) --[[ Line: 12 ]] --[[ Name: setMountedCursors ]]
        -- upvalues: v2 (copy)
        v2:warning("No Cursor Provider found");
    end, 
    getCursor = function(_) --[[ Line: 15 ]] --[[ Name: getCursor ]]
        -- upvalues: v2 (copy)
        v2:warning("No Cursor Provider found");
    end
}));