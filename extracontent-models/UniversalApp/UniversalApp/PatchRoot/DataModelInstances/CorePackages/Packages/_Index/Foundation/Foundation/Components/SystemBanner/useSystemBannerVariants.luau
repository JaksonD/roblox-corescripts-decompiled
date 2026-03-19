local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v2 = require(l_script_FirstAncestor_0.Enums.ColorMode);
local v3 = require(l_script_FirstAncestor_0.Enums.AlertVariant);
local v4 = require(l_script_FirstAncestor_0.Enums.AlertSeverity);
local v5 = require(l_script_FirstAncestor_0.Utility.composeStyleVariant);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v7 = require(l_script_FirstAncestor_0.Providers.Style.VariantsContext);
local function v10(v8, v9) --[[ Line: 31 ]] --[[ Name: createStandardVariantStyles ]]
    -- upvalues: v2 (copy)
    return {
        container = {
            tag = "bg-shift-200", 
            colorMode = v2.Color
        }, 
        title = {
            style = v8.Color.Content.Emphasis
        }, 
        description = {
            style = v8.Color.Content.Default
        }, 
        icon = {
            style = v9
        }
    };
end;
local function v14(v11, v12, v13) --[[ Line: 43 ]] --[[ Name: createEmphasisVariantStyles ]]
    return {
        container = {
            tag = v12, 
            colorMode = v13
        }, 
        title = {
            style = v11[v13].Content.Emphasis
        }, 
        description = {
            style = v11[v13].Content.Default
        }, 
        icon = {
            style = v11[v13].Content.Emphasis
        }
    };
end;
local function v18(v15) --[[ Line: 55 ]] --[[ Name: variantsFactory ]]
    -- upvalues: v3 (copy), v4 (copy), v10 (copy), v14 (copy), v2 (copy)
    local v16 = {
        container = {
            tag = "size-full-0 auto-y row padding-y-large padding-x-medium gap-medium"
        }, 
        title = {
            tag = "text-align-x-left text-wrap auto-xy text-title-medium padding-y-xxsmall"
        }, 
        description = {
            tag = "text-align-x-left text-wrap auto-xy text-body-medium text-wrap"
        }
    };
    local v17 = {
        [v3.Standard] = {
            [v4.Info] = v10(v15, v15.Color.System.Emphasis), 
            [v4.Warning] = v10(v15, v15.Color.System.Warning), 
            [v4.Success] = v10(v15, v15.Color.System.Success), 
            [v4.Error] = v10(v15, v15.Color.System.Alert)
        }, 
        [v3.Emphasis] = {
            [v4.Info] = v14(v15, "bg-system-emphasis", v2.DarkMode), 
            [v4.Warning] = v14(v15, "bg-system-warning", v2.LightMode), 
            [v4.Success] = v14(v15, "bg-system-success", v2.LightMode), 
            [v4.Error] = v14(v15, "bg-system-alert", v2.DarkMode)
        }
    };
    return {
        common = v16, 
        severity = v17
    };
end;
return function(v19, v20, v21) --[[ Line: 86 ]]
    -- upvalues: v7 (copy), v18 (copy), v5 (copy)
    local v22 = v7.useVariants("SystemBanner", v18, v19);
    return v5(v22.common, v22.severity[v20][v21]);
end;