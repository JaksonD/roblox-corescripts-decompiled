local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Parent_0 = script:FindFirstAncestor("AbuseReporting").Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = {};
v3.__index = v3;
local v4 = {
    selectItemCount = 0, 
    backButtonClickCount = 0, 
    isSeenSummaryPage = false
};
local v5 = {
    ABANDONED_TREE_BASED_REPORT = "TreeBasedAbuseReportAbandoned", 
    SUBMIT_TREE_BASED_REPORT = "TreeBasedAbuseReportSubmitted"
};
v3.new = function(v6, v7) --[[ Line: 40 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v3 (copy)
    return (setmetatable({
        _target = v6, 
        _context = v7, 
        _state = table.clone(v4)
    }, v3));
end;
v3._sendEvent = function(v8, v9, v10) --[[ Line: 52 ]] --[[ Name: _sendEvent ]]
    -- upvalues: v2 (copy), l_RbxAnalyticsService_0 (copy)
    if v8._target and v8._context then
        local v11 = v2.Dictionary.join({
            platform = v8._target, 
            dialogEntryPoint = v8._context
        }, v8._state, v10 or {});
        l_RbxAnalyticsService_0:SendEventDeferred(v8._target, v8._context, v9, v11);
    end;
end;
v3.onBackButtonPressed = function(v12) --[[ Line: 62 ]] --[[ Name: onBackButtonPressed ]]
    local l__state_0 = v12._state;
    l__state_0.backButtonClickCount = l__state_0.backButtonClickCount + 1;
end;
v3.onSingleListItemSelected = function(v14) --[[ Line: 66 ]] --[[ Name: onSingleListItemSelected ]]
    local l__state_1 = v14._state;
    l__state_1.selectItemCount = l__state_1.selectItemCount + 1;
end;
v3.onSubmissionPageMount = function(v16) --[[ Line: 70 ]] --[[ Name: onSubmissionPageMount ]]
    v16._state.isSeenSummaryPage = true;
end;
v3.onReportSubmitted = function(v17) --[[ Line: 74 ]] --[[ Name: onReportSubmitted ]]
    -- upvalues: v5 (copy)
    v17:_sendEvent(v5.SUBMIT_TREE_BASED_REPORT);
end;
v3.onReportAbandoned = function(v18) --[[ Line: 78 ]] --[[ Name: onReportAbandoned ]]
    -- upvalues: v5 (copy)
    v18:_sendEvent(v5.ABANDONED_TREE_BASED_REPORT);
end;
return v3;