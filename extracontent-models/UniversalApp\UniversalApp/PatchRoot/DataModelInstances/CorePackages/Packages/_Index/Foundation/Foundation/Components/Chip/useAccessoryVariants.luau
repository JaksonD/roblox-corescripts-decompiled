local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Enums.ChipSize);
local v2 = require(l_script_FirstAncestor_0.Utility.composeStyleVariant);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v4 = require(l_script_FirstAncestor_0.Providers.Style.VariantsContext);
local function v8(v5) --[[ Line: 17 ]] --[[ Name: variantsFactory ]]
    -- upvalues: v1 (copy)
    local v6 = {
        Default = {
            [v1.Small] = UDim2.fromOffset(v5.Size.Size_300, v5.Size.Size_300), 
            [v1.Medium] = UDim2.fromOffset(v5.Size.Size_400, v5.Size.Size_400), 
            [v1.Large] = UDim2.fromOffset(v5.Size.Size_500, v5.Size.Size_500)
        }, 
        Circular = {
            [v1.Small] = UDim2.fromOffset(v5.Size.Size_400, v5.Size.Size_400), 
            [v1.Medium] = UDim2.fromOffset(v5.Size.Size_500, v5.Size.Size_500), 
            [v1.Large] = UDim2.fromOffset(v5.Size.Size_600, v5.Size.Size_600)
        }
    };
    local v7 = {
        Circular = {
            [v1.Small] = UDim.new(0, v5.Size.Size_150), 
            [v1.Medium] = UDim.new(0, v5.Size.Size_200), 
            [v1.Large] = UDim.new(0, v5.Size.Size_250)
        }, 
        Default = {
            [v1.Small] = UDim.new(0, v5.Padding.Small), 
            [v1.Medium] = UDim.new(0, v5.Padding.Medium), 
            [v1.Large] = UDim.new(0, v5.Padding.Medium)
        }
    };
    return {
        textSpacing = {
            Leading = {
                [v1.Small] = UDim.new(0, v5.Padding.XSmall), 
                [v1.Medium] = UDim.new(0, v5.Size.Size_150), 
                [v1.Large] = UDim.new(0, v5.Padding.Small)
            }, 
            Trailing = {
                [v1.Small] = UDim.new(0, v5.Size.Size_150), 
                [v1.Medium] = UDim.new(0, v5.Padding.Small), 
                [v1.Large] = UDim.new(0, v5.Size.Size_250)
            }
        }, 
        accessorySpacing = v7, 
        accessorySize = v6
    };
end;
return function(v9, v10, v11, v12) --[[ Line: 65 ]]
    -- upvalues: v4 (copy), v8 (copy), v2 (copy)
    local v13 = v4.useVariants("ChipAccessory", v8, v9);
    local v14 = v12 and "Circular" or "Default";
    local v15 = v12 and "Leading" or "Trailing";
    return v2({
        accessory = {
            Size = v13.accessorySize[v14][v10], 
            padding = if v11 then {
                left = v13.accessorySpacing[v14][v10], 
                right = v13.textSpacing[v15][v10]
            } else {
                left = v13.textSpacing[v15][v10], 
                right = v13.accessorySpacing[v14][v10]
            }
        }
    });
end;