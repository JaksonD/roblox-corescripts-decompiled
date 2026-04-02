local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.Text);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v5 = require(l_script_FirstAncestor_0.Components.View);
local _ = require(l_script_FirstAncestor_0.Enums.InputSize);
local v7 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v8 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v9 = require(script.Parent.useSegmentedControlVariants);
return v2.memo(v2.forwardRef(function(v10, v11) --[[ Line: 31 ]] --[[ Name: Segment ]]
    -- upvalues: v7 (copy), v9 (copy), v2 (copy), v5 (copy), v8 (copy), v3 (copy)
    local v12 = v7();
    local v13 = v9(v12, v10.size);
    return v2.createElement(v5, v8(v10, {
        tag = v13.segment.tag, 
        onActivated = function() --[[ Line: 39 ]] --[[ Name: onActivated ]]
            -- upvalues: v10 (copy)
            v10.onActivated(v10.id);
        end, 
        ref = v11
    }), {
        Text = v2.createElement(v3, {
            tag = v13.text.tag, 
            Text = v10.text
        })
    });
end));