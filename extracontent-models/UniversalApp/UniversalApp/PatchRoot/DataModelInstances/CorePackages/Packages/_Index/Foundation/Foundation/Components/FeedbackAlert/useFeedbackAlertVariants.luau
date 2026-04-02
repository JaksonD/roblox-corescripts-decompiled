local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v2 = require(l_script_FirstAncestor_0.Enums.AlertSeverity);
local v3 = require(l_script_FirstAncestor_0.Utility.composeStyleVariant);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v5 = require(l_script_FirstAncestor_0.Providers.Style.VariantsContext);
local function v8(_, v7) --[[ Line: 34 ]] --[[ Name: createSeverityStyles ]]
    return {
        icon = {
            style = v7
        }, 
        stroke = {
            Color = v7.Color3, 
            Transparency = v7.Transparency, 
            Thickness = 1
        }, 
        backgroundStyle = {
            Color3 = v7.Color3, 
            Transparency = 0.95
        }
    };
end;
local function v12(v9) --[[ Line: 49 ]] --[[ Name: variantsFactory ]]
    -- upvalues: v2 (copy), v8 (copy)
    local v10 = {
        container = {
            tag = "col align-x-left align-y-center gap-medium size-full-0 auto-y padding-large radius-medium"
        }, 
        headerRow = {
            tag = "row align-y-center gap-medium size-full-0 auto-y"
        }, 
        title = {
            tag = "shrink auto-xy text-title-medium text-truncate-split content-emphasis"
        }, 
        subtitle = {
            tag = "shrink auto-xy text-body-medium text-truncate-split content-default"
        }, 
        description = {
            tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left text-truncate-split content-default"
        }, 
        link = {
            tag = "shrink auto-xy text-body-medium text-truncate-split content-emphasis"
        }
    };
    local v11 = {
        [v2.Info] = v8(v9, v9.Color.System.Emphasis), 
        [v2.Warning] = v8(v9, v9.Color.System.Warning), 
        [v2.Success] = v8(v9, v9.Color.System.Success), 
        [v2.Error] = v8(v9, v9.Color.System.Alert)
    };
    return {
        common = v10, 
        severity = v11
    };
end;
return function(v13, v14) --[[ Line: 81 ]]
    -- upvalues: v5 (copy), v12 (copy), v3 (copy)
    local v15 = v5.useVariants("FeedbackAlert", v12, v13);
    return v3(v15.common, v15.severity[v14]);
end;