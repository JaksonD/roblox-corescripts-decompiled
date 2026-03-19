local l_Parent_0 = script:FindFirstAncestor("FocusNavigationUtils").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Cryo);
local v3 = {
    Size = UDim2.fromScale(1, 1), 
    BackgroundTransparency = 1, 
    SelectionGroup = true
};
local v4 = {
    SelectionBehaviorRight = Enum.SelectionBehavior.Stop, 
    SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
    SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
    SelectionBehaviorUp = Enum.SelectionBehavior.Stop
};
return v1.forwardRef(function(v5, v6) --[[ Line: 26 ]] --[[ Name: BaseFocusRoot ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), v1 (copy)
    local v7 = v2.Dictionary.join(v3, v5.frameProps or {}, {
        ref = v6
    });
    if v5.isIsolated then
        v7 = v2.Dictionary.union(v4, v7);
    end;
    return v1.createElement("Frame", v7, v5.children);
end);