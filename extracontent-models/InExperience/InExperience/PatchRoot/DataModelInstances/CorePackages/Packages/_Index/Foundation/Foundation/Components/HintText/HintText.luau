local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.Text);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v5 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
return v2.memo(v2.forwardRef(function(v6, v7) --[[ Line: 18 ]] --[[ Name: HintText ]]
    -- upvalues: v2 (copy), v3 (copy), v5 (copy)
    return v2.createElement(v3, v5(v6, {
        Text = v6.text, 
        tag = {
            ["size-full-0 auto-y text-caption-small text-align-x-left text-align-y-top text-wrap"] = true, 
            ["content-default"] = not v6.hasError, 
            ["content-action-alert"] = v6.hasError
        }, 
        ref = v7
    }));
end));