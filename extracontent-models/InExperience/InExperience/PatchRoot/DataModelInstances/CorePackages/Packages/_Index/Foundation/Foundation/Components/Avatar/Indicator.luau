local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.Image);
local v4 = require(l_script_FirstAncestor_0.Enums.IndicatorShape);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v6 = require(l_script_FirstAncestor_0.Components.View);
local v7 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v8 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v9 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v10 = require(l_script_FirstAncestor_0.Enums.IndicatorVariant);
local v11 = require(script.Parent.useIndicatorVariants);
local v12 = {
    shape = v4.Circle, 
    variant = v10.Success
};
return v2.memo(function(v13) --[[ Line: 30 ]] --[[ Name: Indicator ]]
    -- upvalues: v9 (copy), v12 (copy), v7 (copy), v11 (copy), v2 (copy), v3 (copy), v6 (copy), v8 (copy)
    local v14 = v9(v13, v12);
    local v15 = v7();
    local v16 = v11(v15, v14.shape, v14.variant, v14.size);
    return v2.createElement(if v16.indicator.Image then v3 else v6, v8(v14, v16.indicator));
end);