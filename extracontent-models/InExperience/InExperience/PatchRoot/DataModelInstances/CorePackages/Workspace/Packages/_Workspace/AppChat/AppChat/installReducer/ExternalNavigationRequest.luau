local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Rodux);
local v4 = require(l_script_FirstAncestor_0.Actions.NavigateIntoChat);
local v5 = require(l_script_FirstAncestor_0.Actions.CompleteExternalNavigationIntoChat);
local v6 = {
    screen = nil, 
    params = nil, 
    requestId = 0, 
    completedRequestId = 0
};
return v3.createReducer(v6, {
    [v4.name] = function(v7, v8) --[[ Line: 18 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v7, {
            screen = v8.screen, 
            params = v8.params, 
            requestId = v7.requestId + 1
        });
    end, 
    [v5.name] = function(v9, v10) --[[ Line: 26 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v9, {
            completedRequestId = v10.requestId
        });
    end
});