local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.Foundation);
local v2 = require(l_Parent_0.React);
local l_Empty_0 = v1.Empty;
local l_Sheet_0 = v1.Sheet;
return v2.memo(function() --[[ Line: 10 ]] --[[ Name: DynamicReportV2Error ]]
    -- upvalues: v2 (copy), l_Sheet_0 (copy), l_Empty_0 (copy)
    return v2.createElement(v2.Fragment, nil, {
        Content = v2.createElement(l_Sheet_0.Content, {}, {
            v2.createElement(l_Empty_0, {})
        })
    });
end);