local l_script_FirstAncestor_0 = script:FindFirstAncestor("CoreScriptsPlayerFeedback");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusRoot_0 = v4.FocusRoot;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v4.FocusNavigableSurfaceIdentifierEnum;
local v7 = require(script.Parent.PromptConnections);
local v8 = require(l_script_FirstAncestor_0.Components.PlayerFeedbackPrompt);
local v9 = require(l_script_FirstAncestor_0.Components.UnavailablePrompt);
local v10 = {
    PromptFeedback = "PromptFeedback", 
    PromptUnavailable = "PromptUnavailable"
};
local v11 = {
    [v10.PromptFeedback] = v8, 
    [v10.PromptUnavailable] = v9
};
return (v2.memo(function(v12) --[[ Line: 44 ]]
    -- upvalues: v2 (copy), v3 (copy), v11 (copy), v9 (copy), v10 (copy), v7 (copy), l_FocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy)
    local v13, v14 = v2.useState({
        promptType = nil, 
        promptData = nil, 
        promptQueue = {}
    });
    local l_promptData_0 = v13.promptData;
    local l_promptType_0 = v13.promptType;
    local v20 = v2.useCallback(function() --[[ Line: 54 ]]
        -- upvalues: v14 (copy), v3 (ref)
        v14(function(v17) --[[ Line: 55 ]]
            -- upvalues: v3 (ref)
            local v18 = v17.promptQueue or {};
            if not v3.isEmpty(v18) then
                local v19 = v18[1];
                return {
                    promptType = v19.promptType, 
                    promptData = v19.promptData, 
                    promptQueue = v3.List.removeIndex(v18, 1)
                };
            else
                return {
                    promptType = nil, 
                    promptData = {}, 
                    promptQueue = {}
                };
            end;
        end);
    end, {});
    local v21 = nil;
    if l_promptType_0 then
        local v22 = v11[l_promptType_0];
        if v22 then
            v21 = if v22 == v9 then v2.createElement(v22, {
                enableInputDelayed = v12.enableInputDelayed, 
                reason = if l_promptData_0 then l_promptData_0.reason else nil, 
                closePrompt = v20
            }) else v2.createElement(v22, {
                enableInputDelayed = v12.enableInputDelayed, 
                promptData = l_promptData_0, 
                closePrompt = v20
            });
        else
            error(string.format("Unexpected prompt type: %s!", (tostring(l_promptType_0))));
        end;
    end;
    local v25 = v2.useCallback(function() --[[ Line: 95 ]]
        -- upvalues: v14 (copy), v3 (ref), v10 (ref)
        v14(function(v23) --[[ Line: 96 ]]
            -- upvalues: v3 (ref), v10 (ref)
            if v23.promptType ~= nil then
                local v24 = v23.promptQueue or {};
                return {
                    promptType = v23.promptType, 
                    promptData = v23.promptData, 
                    promptQueue = v3.List.join(v24, {
                        {
                            promptType = v10.PromptFeedback, 
                            promptData = {}
                        }
                    })
                };
            else
                return {
                    promptType = v10.PromptFeedback, 
                    promptData = {}, 
                    promptQueue = {}
                };
            end;
        end);
    end, {});
    local v29 = v2.useCallback(function(v26) --[[ Line: 118 ]]
        -- upvalues: v14 (copy), v3 (ref), v10 (ref)
        v14(function(v27) --[[ Line: 119 ]]
            -- upvalues: v3 (ref), v10 (ref), v26 (copy)
            if v27.promptType ~= nil then
                local v28 = v27.promptQueue or {};
                return {
                    promptType = v27.promptType, 
                    promptData = v27.promptData, 
                    promptQueue = v3.List.join(v28, {
                        {
                            promptType = v10.PromptUnavailable, 
                            promptData = {
                                reason = v26
                            }
                        }
                    })
                };
            else
                return {
                    promptType = v10.PromptUnavailable, 
                    promptData = {
                        reason = v26
                    }, 
                    promptQueue = {}
                };
            end;
        end);
    end, {});
    return v2.createElement(v2.Fragment, {}, {
        PromptConnections = v2.createElement(v7, {
            openFeedbackPrompt = v25, 
            openUnavailablePrompt = v29, 
            closePrompt = v20
        }), 
        FocusNavigationCoreScriptsWrapper = if v21 then v2.createElement(l_FocusRoot_0, {
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, 
            isIsolated = true, 
            isAutoFocusRoot = true
        }, {
            Prompt = v21
        }) else v21
    });
end));