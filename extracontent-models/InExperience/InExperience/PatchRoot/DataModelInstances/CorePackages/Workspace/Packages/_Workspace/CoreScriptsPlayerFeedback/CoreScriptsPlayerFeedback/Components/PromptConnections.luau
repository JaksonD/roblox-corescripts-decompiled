local l_Parent_0 = script:FindFirstAncestor("CoreScriptsPlayerFeedback").Parent;
local v1 = require(l_Parent_0.ReactUtils);
local v2 = require(l_Parent_0.React);
local l_useEventConnection_0 = v1.useEventConnection;
local v5 = v2.memo(function(v4) --[[ Line: 16 ]]
    -- upvalues: l_useEventConnection_0 (copy)
    l_useEventConnection_0(v4.event, v4.handler);
    return nil;
end);
return (v2.memo(function(v6) --[[ Line: 21 ]]
    -- upvalues: v2 (copy), v5 (copy)
    local l_SocialService_0 = game:GetService("SocialService");
    local v8 = v2.useCallback(function() --[[ Line: 24 ]]
        -- upvalues: v6 (copy)
        v6.openFeedbackPrompt();
    end, {
        v6.openFeedbackPrompt
    });
    local v10 = v2.useCallback(function(v9) --[[ Line: 28 ]]
        -- upvalues: v6 (copy)
        if v6.openUnavailablePrompt then
            v6.openUnavailablePrompt(v9);
        end;
    end, {
        v6.openUnavailablePrompt
    });
    local v11 = nil;
    local v12 = nil;
    if l_SocialService_0 then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 38 ]]
            -- upvalues: l_SocialService_0 (copy)
            return l_SocialService_0.ShowPromptFeedbackSubmission;
        end);
        if l_status_0 then
            v11 = l_result_0;
        end;
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 45 ]]
            -- upvalues: l_SocialService_0 (copy)
            return l_SocialService_0.ShowPromptFeedbackUnavailable;
        end);
        l_status_0 = l_status_1;
        l_result_0 = l_result_1;
        if l_status_0 then
            v12 = l_result_0;
        end;
    end;
    return v2.createElement(v2.Fragment, {}, {
        Show = v11 and v2.createElement(v5, {
            event = v11, 
            handler = v8
        }) or nil, 
        Unavailable = v12 and v2.createElement(v5, {
            event = v12, 
            handler = v10
        }) or nil
    });
end));