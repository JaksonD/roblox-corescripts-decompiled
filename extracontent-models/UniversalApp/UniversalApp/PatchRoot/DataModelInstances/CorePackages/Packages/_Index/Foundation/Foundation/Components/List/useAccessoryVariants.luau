local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Enums.AccessoryType);
local v2 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v3 = require(l_script_FirstAncestor_0.Utility.composeStyleVariant);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v5 = require(l_script_FirstAncestor_0.Providers.Style.VariantsContext);
local function v10(v6) --[[ Line: 17 ]] --[[ Name: variantsFactory ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v7 = {
        [v1.Icon] = {
            [v2.XSmall] = v6.Size.Size_400, 
            [v2.Small] = v6.Size.Size_500, 
            [v2.Medium] = v6.Size.Size_600, 
            [v2.Large] = v6.Size.Size_600
        }, 
        [v1.Media] = {
            [v2.XSmall] = v6.Size.Size_600, 
            [v2.Small] = v6.Size.Size_800, 
            [v2.Medium] = v6.Size.Size_1000, 
            [v2.Large] = v6.Size.Size_1400
        }, 
        [v1.Avatar] = {
            [v2.XSmall] = v6.Size.Size_600, 
            [v2.Small] = v6.Size.Size_800, 
            [v2.Medium] = v6.Size.Size_1000, 
            [v2.Large] = v6.Size.Size_1400
        }
    };
    local v8 = {
        [v2.XSmall] = v6.Size.Size_600, 
        [v2.Small] = v6.Size.Size_800, 
        [v2.Medium] = v6.Size.Size_1000, 
        [v2.Large] = v6.Size.Size_1400
    };
    local v9 = {
        [v2.XSmall] = v6.Radius.Small, 
        [v2.Small] = v6.Radius.Medium, 
        [v2.Medium] = v6.Radius.Medium, 
        [v2.Large] = v6.Radius.Medium
    };
    return {
        accessorySize = v7, 
        containerSize = v8, 
        cornerRadius = v9
    };
end;
return function(v11, v12, v13) --[[ Line: 60 ]]
    -- upvalues: v5 (copy), v10 (copy), v3 (copy)
    local v14 = v5.useVariants("ListAccessory", v10, v11);
    return v3({
        accessory = {
            Size = UDim2.fromOffset(v14.accessorySize[v13][v12], v14.accessorySize[v13][v12]), 
            cornerRadius = UDim.new(0, v14.cornerRadius[v12])
        }, 
        container = {
            Size = UDim2.fromOffset(v14.containerSize[v12], v14.containerSize[v12])
        }
    });
end;