local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Enums.Orientation);
return v2.createContext({
    value = nil, 
    onValueChanged = function(_) --[[ Line: 10 ]] --[[ Name: onValueChanged ]]
        warn("No OptionSelectorGroupProvider found for OptionSelectorGroup");
    end, 
    orientation = v3.Vertical, 
    Selectable = true, 
    testId = ""
});