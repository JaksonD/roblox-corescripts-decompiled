local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
local v1 = require(l_Parent_0.React);
return function(v2) --[[ Line: 11 ]] --[[ Name: Gradient ]]
    -- upvalues: v1 (copy)
    return v1.createElement("UIGradient", {
        Rotation = v2.fillDirection == Enum.FillDirection.Vertical and 90 or 0, 
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, v2.top and 0 or 1), 
            NumberSequenceKeypoint.new(0.5, v2.top and 0 or 1), 
            NumberSequenceKeypoint.new(0.50001, v2.top and 1 or 0), 
            NumberSequenceKeypoint.new(1, v2.top and 1 or 0)
        })
    });
end;