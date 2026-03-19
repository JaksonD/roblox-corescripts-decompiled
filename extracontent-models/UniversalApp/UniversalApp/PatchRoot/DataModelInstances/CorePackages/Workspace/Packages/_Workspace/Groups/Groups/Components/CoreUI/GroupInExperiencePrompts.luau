local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.Cryo);
local l_useState_0 = v2.useState;
local v5 = require(l_Parent_0.Components.CoreUI.PromptConnections);
local v6 = require(l_Parent_0.Components.CoreUI.GroupJoinPrompt);
local v7 = require(l_Parent_1.FocusNavigationUtils);
local l_FocusRoot_0 = v7.FocusRoot;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v7.FocusNavigableSurfaceIdentifierEnum;
local _ = require(l_Parent_0.Common.Types);
local v11 = {
    PromptJoinGroup = "PromptJoinGroup"
};
local v12 = {
    [v11.PromptJoinGroup] = v6
};
return function(v13) --[[ Line: 54 ]]
    -- upvalues: l_useState_0 (copy), v2 (copy), v3 (copy), v12 (copy), v11 (copy), v5 (copy), l_FocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy)
    local v14, v15 = l_useState_0({
        promptType = nil, 
        promptData = nil, 
        data = nil, 
        callbacks = nil, 
        promptQueue = {}
    });
    local l_promptData_0 = v14.promptData;
    local l_promptType_0 = v14.promptType;
    local l_data_0 = v14.data;
    local l_callbacks_0 = v14.callbacks;
    local v20 = v2.useCallback(function() --[[ Line: 68 ]]
        -- upvalues: v3 (ref), v14 (copy), v15 (copy)
        if not v3.isEmpty(v14.promptQueue) then
            v15(v3.Dictionary.join(v14, {
                promptType = v14.promptQueue[1].promptType, 
                promptData = v14.promptQueue[1].promptData, 
                data = v14.promptQueue[1].data, 
                callbacks = v14.promptQueue[1].callbacks, 
                promptQueue = v3.List.removeIndex(v14.promptQueue, 1)
            }));
            return;
        else
            v15({
                promptType = nil, 
                promptData = nil, 
                data = nil, 
                callbacks = nil, 
                promptQueue = {}
            });
            return;
        end;
    end, {
        v14, 
        v15
    });
    local v21 = nil;
    if l_promptType_0 then
        local v22 = v12[l_promptType_0];
        if v22 then
            v21 = v2.createElement(v22, {
                enableInputDelayed = v13.enableInputDelayed, 
                groupId = if l_promptData_0 then l_promptData_0.groupId else nil, 
                data = l_data_0, 
                onJoin = if l_callbacks_0 then l_callbacks_0.onJoin else nil, 
                onClose = if l_callbacks_0 then l_callbacks_0.onClose else nil
            });
        else
            error((("Unexpected prompt type: %*!"):format(l_promptType_0)));
        end;
    end;
    local v26 = v2.useCallback(function(v23, v24, v25) --[[ Line: 105 ]]
        -- upvalues: v14 (copy), v15 (copy), v3 (ref), v11 (ref)
        if v14.promptType ~= nil then
            v15(v3.Dictionary.join(v14, {
                promptQueue = v3.List.join(v14.promptQueue, {
                    {
                        promptType = v11.PromptJoinGroup, 
                        promptData = {
                            groupId = v23
                        }, 
                        data = v24, 
                        callbacks = v25
                    }
                })
            }));
            return;
        else
            v15({
                promptType = v11.PromptJoinGroup, 
                promptData = {
                    groupId = v23
                }, 
                data = v24, 
                callbacks = v25, 
                promptQueue = {}
            });
            return;
        end;
    end, {
        v14, 
        v15
    });
    return v2.createElement(v2.Fragment, {}, {
        PromptConnections = v2.createElement(v5, {
            openGroupJoinPrompt = v26, 
            closePrompt = v20
        }), 
        FocusNavigationCoreScriptsWrapper = if v21 then v2.createElement(l_FocusRoot_0, {
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, 
            isIsolated = true, 
            isAutoFocusRoot = true
        }, {
            Prompt = v21
        }) else nil
    });
end;