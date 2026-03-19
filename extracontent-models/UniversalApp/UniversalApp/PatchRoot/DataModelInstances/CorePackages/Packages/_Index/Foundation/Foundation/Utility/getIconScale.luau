local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.FoundationImages);
local l_Images_0 = v3.Images;
local v5 = require(l_script_FirstAncestor_0.Utility.isBuilderIcon);
local v6 = require(l_script_FirstAncestor_0.Enums.IconSize);
local v7 = {
    [v6.Small] = {
        Vector2.new(16, 16), 
        Vector2.new(18, 18)
    }, 
    [v6.Medium] = {
        Vector2.new(28, 28), 
        Vector2.new(36, 36)
    }, 
    [v6.Large] = {
        Vector2.new(48, 48)
    }
};
local v8 = v3.getResolutionScale();
local v9 = {
    Small = {
        [v6.XSmall] = 0.66667, 
        [v6.Small] = 0.88889, 
        [v6.Medium] = 1.11111, 
        [v6.Large] = 1.33333
    }, 
    Medium = {
        [v6.XSmall] = 0.45, 
        [v6.Small] = 0.600003, 
        [v6.Medium] = 0.749997, 
        [v6.Large] = 0.9
    }, 
    Large = {
        [v6.XSmall] = 0.24545699999999998, 
        [v6.Small] = 0.327276, 
        [v6.Medium] = 0.40909500000000004, 
        [v6.Large] = 0.490905
    }
};
return function(v10, v11) --[[ Line: 55 ]] --[[ Name: useIcon ]]
    -- upvalues: v5 (copy), l_Images_0 (copy), v8 (copy), v6 (copy), v2 (copy), v7 (copy), v9 (copy)
    if not v10 or v5(v10) then
        return nil, 1;
    else
        local v12 = l_Images_0[v10];
        if not v12 then
            return nil, 1;
        else
            local v13 = Vector2.new(v12.ImageRectSize.X / v8, v12.ImageRectSize.Y / v8);
            local l_Medium_0 = v6.Medium;
            if v2.includes(v7[v6.Small], v13) then
                l_Medium_0 = v6.Small;
            elseif v2.includes(v7[v6.Medium], v13) then
                l_Medium_0 = v6.Medium;
            elseif v2.includes(v7[v6.Large], v13) then
                l_Medium_0 = v6.Large;
            end;
            return v13, v9[l_Medium_0][v11];
        end;
    end;
end;