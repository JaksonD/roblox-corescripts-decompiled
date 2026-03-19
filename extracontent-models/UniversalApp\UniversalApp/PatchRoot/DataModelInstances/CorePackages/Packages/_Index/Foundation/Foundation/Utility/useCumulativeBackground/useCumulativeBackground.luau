local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v4 = require(l_script_FirstAncestor_0.Utility.useBindable);
return function(v5, v6) --[[ Line: 11 ]] --[[ Name: useCumulativeBackground ]]
    -- upvalues: v4 (copy), v2 (copy)
    local v7 = v4(v5);
    local v8 = v4(v6);
    return v2.joinBindings({
        v7, 
        v8
    }):map(function(v9) --[[ Line: 18 ]]
        return {
            Color3 = v9[2].Color3:Lerp(v9[1].Color3, v9[2].Transparency), 
            Transparency = 0
        };
    end);
end;