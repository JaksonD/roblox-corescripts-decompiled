local l_Parent_0 = script:FindFirstAncestor("PlayerFeedback").Parent;
local v1 = require(script.Parent.Parent.Constants);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.t);
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local v5 = v3.optional(v3.strictInterface({
    categoryType = v3.optional(v3.string), 
    value = v3.optional(v3.string)
}));
local function _(v6) --[[ Line: 12 ]] --[[ Name: gamePlayerFeedbackEvent ]]
    -- upvalues: v5 (copy), l_mutedError_0 (copy), v2 (copy), v1 (copy)
    return function(v7, v8, v9) --[[ Line: 13 ]]
        -- upvalues: v5 (ref), l_mutedError_0 (ref), v2 (ref), v1 (ref), v6 (copy)
        local v10, v11 = v5(v9);
        if not v10 then
            l_mutedError_0(v11);
        end;
        local v12 = {
            placeId = v8
        };
        if v9 then
            v12 = v2.Dictionary.join(v12, v9);
        end;
        v7:sendEventDeferred(v1.Context.GamePlayerFeedback, v6, v12);
    end;
end;
local v14 = {};
local l_ClickPlayerFeedbackPromptCta_0 = v1.EventNames.ClickPlayerFeedbackPromptCta;
local l_l_ClickPlayerFeedbackPromptCta_0_0 = l_ClickPlayerFeedbackPromptCta_0 --[[ copy: 10 -> 11 ]];
v14.ClickPlayerFeedbackPromptCta = function(v17, v18, v19) --[[ Line: 13 ]]
    -- upvalues: v5 (copy), l_mutedError_0 (copy), v2 (copy), v1 (copy), l_l_ClickPlayerFeedbackPromptCta_0_0 (copy)
    local v20, v21 = v5(v19);
    if not v20 then
        l_mutedError_0(v21);
    end;
    local v22 = {
        placeId = v18
    };
    if v19 then
        v22 = v2.Dictionary.join(v22, v19);
    end;
    v17:sendEventDeferred(v1.Context.GamePlayerFeedback, l_l_ClickPlayerFeedbackPromptCta_0_0, v22);
end;
l_ClickPlayerFeedbackPromptCta_0 = v1.EventNames.PlayerFeedbackPromptMounted;
local l_l_ClickPlayerFeedbackPromptCta_0_1 = l_ClickPlayerFeedbackPromptCta_0 --[[ copy: 10 -> 12 ]];
v14.PlayerFeedbackPromptMounted = function(v24, v25, v26) --[[ Line: 13 ]]
    -- upvalues: v5 (copy), l_mutedError_0 (copy), v2 (copy), v1 (copy), l_l_ClickPlayerFeedbackPromptCta_0_1 (copy)
    local v27, v28 = v5(v26);
    if not v27 then
        l_mutedError_0(v28);
    end;
    local v29 = {
        placeId = v25
    };
    if v26 then
        v29 = v2.Dictionary.join(v29, v26);
    end;
    v24:sendEventDeferred(v1.Context.GamePlayerFeedback, l_l_ClickPlayerFeedbackPromptCta_0_1, v29);
end;
l_ClickPlayerFeedbackPromptCta_0 = v1.EventNames.DismissPlayerFeedbackPrompt;
local l_l_ClickPlayerFeedbackPromptCta_0_2 = l_ClickPlayerFeedbackPromptCta_0 --[[ copy: 10 -> 13 ]];
v14.DismissPlayerFeedbackPrompt = function(v31, v32, v33) --[[ Line: 13 ]]
    -- upvalues: v5 (copy), l_mutedError_0 (copy), v2 (copy), v1 (copy), l_l_ClickPlayerFeedbackPromptCta_0_2 (copy)
    local v34, v35 = v5(v33);
    if not v34 then
        l_mutedError_0(v35);
    end;
    local v36 = {
        placeId = v32
    };
    if v33 then
        v36 = v2.Dictionary.join(v36, v33);
    end;
    v31:sendEventDeferred(v1.Context.GamePlayerFeedback, l_l_ClickPlayerFeedbackPromptCta_0_2, v36);
end;
l_ClickPlayerFeedbackPromptCta_0 = v1.EventNames.PlayerFeedbackFormModalMounted;
local l_l_ClickPlayerFeedbackPromptCta_0_3 = l_ClickPlayerFeedbackPromptCta_0 --[[ copy: 10 -> 14 ]];
v14.PlayerFeedbackFormModalMounted = function(v38, v39, v40) --[[ Line: 13 ]]
    -- upvalues: v5 (copy), l_mutedError_0 (copy), v2 (copy), v1 (copy), l_l_ClickPlayerFeedbackPromptCta_0_3 (copy)
    local v41, v42 = v5(v40);
    if not v41 then
        l_mutedError_0(v42);
    end;
    local v43 = {
        placeId = v39
    };
    if v40 then
        v43 = v2.Dictionary.join(v43, v40);
    end;
    v38:sendEventDeferred(v1.Context.GamePlayerFeedback, l_l_ClickPlayerFeedbackPromptCta_0_3, v43);
end;
l_ClickPlayerFeedbackPromptCta_0 = v1.EventNames.DismissPlayerFeedbackFormModal;
local l_l_ClickPlayerFeedbackPromptCta_0_4 = l_ClickPlayerFeedbackPromptCta_0 --[[ copy: 10 -> 15 ]];
v14.DismissPlayerFeedbackFormModal = function(v45, v46, v47) --[[ Line: 13 ]]
    -- upvalues: v5 (copy), l_mutedError_0 (copy), v2 (copy), v1 (copy), l_l_ClickPlayerFeedbackPromptCta_0_4 (copy)
    local v48, v49 = v5(v47);
    if not v48 then
        l_mutedError_0(v49);
    end;
    local v50 = {
        placeId = v46
    };
    if v47 then
        v50 = v2.Dictionary.join(v50, v47);
    end;
    v45:sendEventDeferred(v1.Context.GamePlayerFeedback, l_l_ClickPlayerFeedbackPromptCta_0_4, v50);
end;
l_ClickPlayerFeedbackPromptCta_0 = v1.EventNames.ClickPlayerFeedbackFormModalDisclaimer;
local l_l_ClickPlayerFeedbackPromptCta_0_5 = l_ClickPlayerFeedbackPromptCta_0 --[[ copy: 10 -> 16 ]];
v14.ClickPlayerFeedbackFormModalDisclaimer = function(v52, v53, v54) --[[ Line: 13 ]]
    -- upvalues: v5 (copy), l_mutedError_0 (copy), v2 (copy), v1 (copy), l_l_ClickPlayerFeedbackPromptCta_0_5 (copy)
    local v55, v56 = v5(v54);
    if not v55 then
        l_mutedError_0(v56);
    end;
    local v57 = {
        placeId = v53
    };
    if v54 then
        v57 = v2.Dictionary.join(v57, v54);
    end;
    v52:sendEventDeferred(v1.Context.GamePlayerFeedback, l_l_ClickPlayerFeedbackPromptCta_0_5, v57);
end;
l_ClickPlayerFeedbackPromptCta_0 = v1.EventNames.ClickPlayerFeedbackFormAbuseReportPrompt;
local l_l_ClickPlayerFeedbackPromptCta_0_6 = l_ClickPlayerFeedbackPromptCta_0 --[[ copy: 10 -> 17 ]];
v14.ClickPlayerFeedbackFormAbuseReportPrompt = function(v59, v60, v61) --[[ Line: 13 ]]
    -- upvalues: v5 (copy), l_mutedError_0 (copy), v2 (copy), v1 (copy), l_l_ClickPlayerFeedbackPromptCta_0_6 (copy)
    local v62, v63 = v5(v61);
    if not v62 then
        l_mutedError_0(v63);
    end;
    local v64 = {
        placeId = v60
    };
    if v61 then
        v64 = v2.Dictionary.join(v64, v61);
    end;
    v59:sendEventDeferred(v1.Context.GamePlayerFeedback, l_l_ClickPlayerFeedbackPromptCta_0_6, v64);
end;
l_ClickPlayerFeedbackPromptCta_0 = v1.EventNames.TogglePlayerFeedbackFormModalReason;
local l_l_ClickPlayerFeedbackPromptCta_0_7 = l_ClickPlayerFeedbackPromptCta_0 --[[ copy: 10 -> 18 ]];
v14.TogglePlayerFeedbackFormModalReason = function(v66, v67, v68) --[[ Line: 13 ]]
    -- upvalues: v5 (copy), l_mutedError_0 (copy), v2 (copy), v1 (copy), l_l_ClickPlayerFeedbackPromptCta_0_7 (copy)
    local v69, v70 = v5(v68);
    if not v69 then
        l_mutedError_0(v70);
    end;
    local v71 = {
        placeId = v67
    };
    if v68 then
        v71 = v2.Dictionary.join(v71, v68);
    end;
    v66:sendEventDeferred(v1.Context.GamePlayerFeedback, l_l_ClickPlayerFeedbackPromptCta_0_7, v71);
end;
l_ClickPlayerFeedbackPromptCta_0 = v1.EventNames.FocusPlayerFeedbackFormModalComment;
local l_l_ClickPlayerFeedbackPromptCta_0_8 = l_ClickPlayerFeedbackPromptCta_0 --[[ copy: 10 -> 19 ]];
v14.FocusPlayerFeedbackFormModalComment = function(v73, v74, v75) --[[ Line: 13 ]]
    -- upvalues: v5 (copy), l_mutedError_0 (copy), v2 (copy), v1 (copy), l_l_ClickPlayerFeedbackPromptCta_0_8 (copy)
    local v76, v77 = v5(v75);
    if not v76 then
        l_mutedError_0(v77);
    end;
    local v78 = {
        placeId = v74
    };
    if v75 then
        v78 = v2.Dictionary.join(v78, v75);
    end;
    v73:sendEventDeferred(v1.Context.GamePlayerFeedback, l_l_ClickPlayerFeedbackPromptCta_0_8, v78);
end;
l_ClickPlayerFeedbackPromptCta_0 = v1.EventNames.ClickPlayerFeedbackFormModalSubmit;
local l_l_ClickPlayerFeedbackPromptCta_0_9 = l_ClickPlayerFeedbackPromptCta_0 --[[ copy: 10 -> 20 ]];
v14.ClickPlayerFeedbackFormModalSubmit = function(v80, v81, v82) --[[ Line: 13 ]]
    -- upvalues: v5 (copy), l_mutedError_0 (copy), v2 (copy), v1 (copy), l_l_ClickPlayerFeedbackPromptCta_0_9 (copy)
    local v83, v84 = v5(v82);
    if not v83 then
        l_mutedError_0(v84);
    end;
    local v85 = {
        placeId = v81
    };
    if v82 then
        v85 = v2.Dictionary.join(v85, v82);
    end;
    v80:sendEventDeferred(v1.Context.GamePlayerFeedback, l_l_ClickPlayerFeedbackPromptCta_0_9, v85);
end;
l_ClickPlayerFeedbackPromptCta_0 = v1.EventNames.SubmitPlayerFeedbackFailCommentValidation;
v14.SubmitPlayerFeedbackFailCommentValidation = function(v86, v87, v88) --[[ Line: 13 ]]
    -- upvalues: v5 (copy), l_mutedError_0 (copy), v2 (copy), v1 (copy), l_ClickPlayerFeedbackPromptCta_0 (copy)
    local v89, v90 = v5(v88);
    if not v89 then
        l_mutedError_0(v90);
    end;
    local v91 = {
        placeId = v87
    };
    if v88 then
        v91 = v2.Dictionary.join(v91, v88);
    end;
    v86:sendEventDeferred(v1.Context.GamePlayerFeedback, l_ClickPlayerFeedbackPromptCta_0, v91);
end;
return v14;