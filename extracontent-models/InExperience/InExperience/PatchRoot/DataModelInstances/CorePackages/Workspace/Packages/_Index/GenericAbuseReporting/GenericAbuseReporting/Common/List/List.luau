local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.Foundation);
local v2 = require(l_Parent_0.React);
local l_View_0 = v1.View;
local v4 = require(script.Parent.ListContext);
return v2.memo(v2.forwardRef(function(v5, v6) --[[ Line: 19 ]] --[[ Name: List ]]
    -- upvalues: v2 (copy), l_View_0 (copy), v4 (copy)
    local v8 = v2.useCallback(function(v7) --[[ Line: 20 ]]
        -- upvalues: v5 (copy)
        v5.onValueChanged(v7);
    end, {
        v5.onValueChanged
    });
    return v2.createElement(l_View_0, {
        tag = "size-full-0 auto-y col", 
        LayoutOrder = v5.layoutOrder, 
        ref = v6
    }, {
        ListContext = v2.createElement(v4.Provider, {
            value = {
                value = v5.value, 
                onValueChanged = v8
            }
        }, v5.children)
    });
end));