local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.ReactRoblox);
local v3 = require(l_Parent_0.Foundation);
local function v6(v4, v5) --[[ Line: 8 ]]
    -- upvalues: v1 (copy), v3 (copy)
    return v1.createElement(v3.View, {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        ZIndex = 5, 
        ref = v5, 
        selectionGroup = {
            SelectionBehaviorUp = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorRight = Enum.SelectionBehavior.Stop
        }
    }, v4);
end;
return function(v7, v8, v9) --[[ Line: 23 ]] --[[ Name: wrapForReactPortal ]]
    -- upvalues: v2 (copy), v6 (copy)
    return v2.createPortal(v6(v7, v9), v8);
end;