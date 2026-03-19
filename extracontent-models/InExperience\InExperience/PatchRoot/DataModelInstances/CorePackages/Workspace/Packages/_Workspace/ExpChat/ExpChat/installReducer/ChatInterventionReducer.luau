local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v5 = require(l_Actions_0.ChatTimeoutUpdated);
local v6 = {
    timeoutData = {
        endTimestamp = 0, 
        isEnforced = false
    }
};
return v2.createReducer(v6, {
    [v5.name] = function(v7, v8) --[[ Line: 24 ]] --[[ Name: updateChatTimeoutData ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.join(v7, {
            timeoutData = {
                endTimestamp = v8.endTimestamp, 
                isEnforced = v8.isEnforced
            }
        });
    end
});