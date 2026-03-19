local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactIs);
local v4 = require(l_script_FirstAncestor_0.Utility.getTestIdTag);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v6 = require(l_script_FirstAncestor_0.Utility.Flags);
local function v8(v7) --[[ Line: 16 ]] --[[ Name: getAspectRatio ]]
    -- upvalues: v6 (copy), v3 (copy)
    if v6.FoundationFixAspectRatioBindingHandling then
        if v3.isBinding(v7) or typeof(v7) == "number" then
            return {
                AspectRatio = v7, 
                AspectType = nil, 
                DominantAxis = nil
            };
        else
            return {
                AspectRatio = v7.AspectRatio, 
                AspectType = v7.AspectType, 
                DominantAxis = v7.DominantAxis
            };
        end;
    elseif typeof(v7) == "table" then
        return {
            AspectRatio = v7.AspectRatio, 
            AspectType = v7.AspectType, 
            DominantAxis = v7.DominantAxis
        };
    else
        return {
            AspectRatio = v7, 
            AspectType = nil, 
            DominantAxis = nil
        };
    end;
end;
return v2.memo(function(v9) --[[ Line: 60 ]] --[[ Name: AspectRatio ]]
    -- upvalues: v8 (copy), v2 (copy), v4 (copy)
    local v10 = v8(v9.value);
    return v2.createElement("UIAspectRatioConstraint", {
        AspectRatio = v10.AspectRatio, 
        AspectType = v10.AspectType, 
        DominantAxis = v10.DominantAxis, 
        [v2.Tag] = v4(v9.testId)
    });
end);