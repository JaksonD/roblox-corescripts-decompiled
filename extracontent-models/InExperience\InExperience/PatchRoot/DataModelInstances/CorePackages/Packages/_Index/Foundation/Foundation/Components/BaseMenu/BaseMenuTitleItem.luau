local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.Text);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v5 = require(l_script_FirstAncestor_0.Components.View);
local v6 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v7 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local _ = require(l_script_FirstAncestor_0.Enums.ControlState);
local _ = require(l_script_FirstAncestor_0.Enums.InputSize);
local v10 = require(script.Parent.useBaseMenuItemVariants);
return v2.memo(v2.forwardRef(function(v11, v12) --[[ Line: 28 ]] --[[ Name: BaseMenuTitleItem ]]
    -- upvalues: v6 (copy), v10 (copy), v2 (copy), v5 (copy), v7 (copy), v3 (copy)
    local v13 = v6();
    local v14 = v10(v13, v11.size, false);
    return v2.createElement(v5, v7(v11, {
        tag = v14.container.tag, 
        ref = v12
    }), v2.createElement(v3, {
        Text = v11.text, 
        tag = v14.title.tag
    }));
end));