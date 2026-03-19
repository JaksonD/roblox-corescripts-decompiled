local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Enums.InputSize);
return require(l_Parent_0.React).createContext({
    onAccordionItemActivated = nil, 
    itemSize = v2.Medium, 
    testId = ""
});