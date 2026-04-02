local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.Foundation);
local v2 = require(l_Parent_0.React);
local l_FFlagAbuseReportMenuV2_0 = require(l_Parent_0.SharedFlags).FFlagAbuseReportMenuV2;
local l_View_0 = v1.View;
local v5 = require(script.Parent.ListContext);
return v2.memo(v2.forwardRef(function(v6, v7) --[[ Line: 22 ]] --[[ Name: List ]]
    -- upvalues: v2 (copy), l_View_0 (copy), l_FFlagAbuseReportMenuV2_0 (copy), v5 (copy)
    local v9 = v2.useCallback(function(v8) --[[ Line: 23 ]]
        -- upvalues: v6 (copy)
        v6.onValueChanged(v8);
    end, {
        v6.onValueChanged
    });
    return v2.createElement(l_View_0, {
        tag = if l_FFlagAbuseReportMenuV2_0 and v6.tag then v6.tag else "size-full-0 auto-y col", 
        LayoutOrder = v6.layoutOrder, 
        ref = v7
    }, {
        ListContext = v2.createElement(v5.Provider, {
            value = {
                value = v6.value, 
                onValueChanged = v9
            }
        }, v6.children)
    });
end));