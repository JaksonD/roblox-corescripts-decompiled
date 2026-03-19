local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactIs);
local v4 = require(l_script_FirstAncestor_0.Utility.getTestIdTag);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local function v7(v6) --[[ Line: 14 ]] --[[ Name: getAspectRatio ]]
    -- upvalues: v3 (copy)
    if v3.isBinding(v6) or typeof(v6) == "number" then
        return {
            AspectRatio = v6, 
            AspectType = nil, 
            DominantAxis = nil
        };
    else
        return {
            AspectRatio = v6.AspectRatio, 
            AspectType = v6.AspectType, 
            DominantAxis = v6.DominantAxis
        };
    end;
end;
return v2.memo(function(v8) --[[ Line: 41 ]] --[[ Name: AspectRatio ]]
    -- upvalues: v7 (copy), v2 (copy), v4 (copy)
    local v9 = v7(v8.value);
    return v2.createElement("UIAspectRatioConstraint", {
        AspectRatio = v9.AspectRatio, 
        AspectType = v9.AspectType, 
        DominantAxis = v9.DominantAxis, 
        [v2.Tag] = v4(v8.testId)
    });
end);