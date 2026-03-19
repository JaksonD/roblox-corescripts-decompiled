local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.Cryo);
local l_useState_0 = v2.useState;
local v5 = require(l_Parent_0.Components.CoreUI.PromptConnections);
local v6 = require(l_Parent_0.Components.CoreUI.RsvpPrompt);
local v7 = require(l_Parent_1.FocusNavigationUtils);
local l_FocusRoot_0 = v7.FocusRoot;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v7.FocusNavigableSurfaceIdentifierEnum;
local v10 = {
    PromptRsvp = "PromptRsvp"
};
local v11 = {
    [v10.PromptRsvp] = v6
};
return function(v12) --[[ Line: 49 ]]
    -- upvalues: l_useState_0 (copy), v2 (copy), v3 (copy), v11 (copy), v10 (copy), v5 (copy), l_FocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy)
    local v13, v14 = l_useState_0({
        promptType = nil, 
        promptData = nil, 
        promptQueue = {}
    });
    local l_promptData_0 = v13.promptData;
    local l_promptType_0 = v13.promptType;
    local v17 = v2.useCallback(function() --[[ Line: 59 ]]
        -- upvalues: v3 (ref), v13 (copy), v14 (copy)
        if not v3.isEmpty(v13.promptQueue) then
            v14(v3.Dictionary.join(v13, {
                promptType = v13.promptQueue[1].promptType, 
                promptData = v13.promptQueue[1].promptData, 
                promptQueue = v3.List.removeIndex(v13.promptQueue, 1)
            }));
            return;
        else
            v14({
                promptType = nil, 
                promptData = {}, 
                promptQueue = {}
            });
            return;
        end;
    end, {
        v13, 
        v14
    });
    local v18 = nil;
    if l_promptType_0 then
        local v19 = v11[l_promptType_0];
        if v19 then
            v18 = v2.createElement(v19, {
                enableInputDelayed = v12.enableInputDelayed, 
                promptData = l_promptData_0, 
                closePrompt = v17, 
                overrideUseWideMode = v12.overrideUseWideMode
            });
        else
            error((("Unexpected prompt type: %*!"):format(l_promptType_0)));
        end;
    end;
    local v22 = v2.useCallback(function(v20, v21) --[[ Line: 90 ]]
        -- upvalues: v13 (copy), v14 (copy), v3 (ref), v10 (ref)
        if v13.promptType ~= nil then
            v14(v3.Dictionary.join(v13, {
                promptQueue = v3.List.join(v13.promptQueue, {
                    {
                        promptType = v10.PromptRsvp, 
                        promptData = {
                            eventId = v20, 
                            eventDetails = v21
                        }
                    }
                })
            }));
            return;
        else
            v14({
                promptType = v10.PromptRsvp, 
                promptData = {
                    eventId = v20, 
                    eventDetails = v21
                }, 
                promptQueue = {}
            });
            return;
        end;
    end, {
        v13, 
        v14
    });
    return v2.createElement(v2.Fragment, {}, {
        PromptConnections = v2.createElement(v5, {
            openRsvpPrompt = v22, 
            closePrompt = v17
        }), 
        FocusNavigationCoreScriptsWrapper = if v18 then v2.createElement(l_FocusRoot_0, {
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, 
            isIsolated = true, 
            isAutoFocusRoot = true
        }, {
            Prompt = v18
        }) else nil
    });
end;