local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utility.Logger);
local v3 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Components.Types);
return v3.createContext({
    anchor = nil, 
    setAnchor = function(_) --[[ Line: 11 ]] --[[ Name: setAnchor ]]
        -- upvalues: v2 (copy)
        v2:warning("No PopoverProvider found for Popover");
    end, 
    isOpen = false, 
    testId = ""
});