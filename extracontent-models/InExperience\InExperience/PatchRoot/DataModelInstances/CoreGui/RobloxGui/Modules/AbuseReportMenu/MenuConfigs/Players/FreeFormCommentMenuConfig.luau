local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v2 = require(l_script_FirstAncestor_0.Components.Constants);
return {
    componentType = "freeComments", 
    getIsVisible = function(_) --[[ Line: 7 ]] --[[ Name: getIsVisible ]]
        return true;
    end, 
    onUpdate = function(v4, _, v6, v7) --[[ Line: 10 ]] --[[ Name: onUpdate ]]
        -- upvalues: v2 (copy)
        v7.analyticsDispatch({
            type = v2.AnalyticsActions.SetCommentAdded, 
            commentAdded = #v4 > 0
        });
        v6({
            type = v2.PlayerMenuActions.UpdateComment, 
            comment = v4
        });
    end, 
    componentName = "FreeComments"
};