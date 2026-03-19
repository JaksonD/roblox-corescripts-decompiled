local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.Cryo).Dictionary;
local v4 = require(l_script_FirstAncestor_0.Logger):new("AbuseReport Analytics");
local v5 = require(l_script_FirstAncestor_0.Analytics.Actions.OnFormCommentUpdated);
local v6 = require(l_script_FirstAncestor_0.Analytics.Actions.OnFormReasonSelected);
local v7 = require(l_script_FirstAncestor_0.Analytics.Actions.OnFormLoaded);
local v8 = {
    interaction_type = 0, 
    context = "Unknown", 
    event_type = "GenericAbuseReportWithReasonAndComment", 
    place_id = 0, 
    accumulated_time_ms = 0, 
    reason_selection = "", 
    reason_change_count = 0, 
    comment_added = false
};
return {
    reducer = v2.createReducer({}, {
        [v7.name] = function(v9, v10) --[[ Line: 37 ]]
            -- upvalues: v4 (copy), l_Dictionary_0 (copy)
            v4:trace("OnFormLoaded");
            return l_Dictionary_0.union(v9, {
                context = v10.context, 
                place_id = v10.place_id, 
                accumulated_time_ms = v10.accumulated_time_ms
            });
        end, 
        [v6.name] = function(v11, v12) --[[ Line: 45 ]]
            -- upvalues: v4 (copy), l_Dictionary_0 (copy)
            v4:trace("OnFormReasonSelected - reason_selection: {}", v12.reason_selection);
            return l_Dictionary_0.union(v11, {
                reason_selection = v12.reason_selection, 
                reason_change_count = v11.reason_change_count + 1
            });
        end, 
        [v5.name] = function(v13, v14) --[[ Line: 52 ]]
            -- upvalues: v4 (copy), l_Dictionary_0 (copy)
            v4:trace("OnFormCommentUpdated - comment_added: {}", v14.comment_added);
            return l_Dictionary_0.union(v13, {
                comment_added = v14.comment_added
            });
        end
    }), 
    initialState = v8
};