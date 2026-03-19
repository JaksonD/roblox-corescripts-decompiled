local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChatIntervention");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v5 = require(l_Actions_0.UpdateShowChatFeedbackModalAction);
local v6 = require(l_Actions_0.UpdateShowChatFeedbackPillAction);
local v7 = require(l_Actions_0.UpdateShowChatNudgeModalAction);
local v8 = require(l_Actions_0.UpdateShowChatTimeoutModalAction);
local v9 = {
    isShowChatFeedbackModal = false, 
    isShowChatFeedbackPill = false, 
    isShowChatNudgeModal = false, 
    isShowChatTimeoutModal = false
};
return v2.createReducer(v9, {
    [v5.name] = function(v10, v11) --[[ Line: 35 ]] --[[ Name: setIsShowChatFeedbackModal ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.set(v10, "isShowChatFeedbackModal", v11.isShow);
    end, 
    [v6.name] = function(v12, v13) --[[ Line: 39 ]] --[[ Name: setIsShowChatFeedbackPill ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.set(v12, "isShowChatFeedbackPill", v13.isShow);
    end, 
    [v7.name] = function(v14, v15) --[[ Line: 31 ]] --[[ Name: setIsShowChatNudgeModal ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.set(v14, "isShowChatNudgeModal", v15.isShow);
    end, 
    [v8.name] = function(v16, v17) --[[ Line: 27 ]] --[[ Name: setIsShowChatTimeoutModal ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.set(v16, "isShowChatTimeoutModal", v17.isShow);
    end
});