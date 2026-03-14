local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v3 = require(l_Parent_0.FoundationImages);
return function(v4, v5) --[[ Line: 9 ]] --[[ Name: getScaledSlice ]]
    -- upvalues: v3 (copy)
    local v6 = v3.getResolutionScale();
    if v4 then
        local v7 = v4.Min * v6;
        local v8 = v4.Max * v6;
        v4 = Rect.new(v7, v8);
        v5 = (v5 or 1) / v6;
    end;
    return {
        center = v4, 
        scale = v5
    };
end;