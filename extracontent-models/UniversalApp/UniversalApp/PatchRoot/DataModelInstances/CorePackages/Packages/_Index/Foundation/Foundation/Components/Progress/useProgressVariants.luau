local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Enums.ProgressSize);
local v2 = require(l_script_FirstAncestor_0.Utility.composeStyleVariant);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v4 = require(l_script_FirstAncestor_0.Providers.Style.VariantsContext);
local function v6(v5) --[[ Line: 14 ]] --[[ Name: variantsFactory ]]
    -- upvalues: v1 (copy)
    return {
        sizes = {
            [v1.Small] = {
                bar = {
                    height = v5.Size.Size_50
                }, 
                circle = {
                    size = v5.Size.Size_400
                }
            }, 
            [v1.Medium] = {
                bar = {
                    height = v5.Size.Size_100
                }, 
                circle = {
                    size = v5.Size.Size_800
                }
            }, 
            [v1.Large] = {
                bar = {
                    height = v5.Size.Size_150
                }, 
                circle = {
                    size = v5.Size.Size_1300, 
                    labelFont = v5.Typography.LabelMedium
                }
            }
        }
    };
end;
return function(v7, v8) --[[ Line: 46 ]]
    -- upvalues: v4 (copy), v6 (copy), v2 (copy)
    local v9 = v4.useVariants("Progress", v6, v7);
    return v2(v9.sizes[v8]);
end;