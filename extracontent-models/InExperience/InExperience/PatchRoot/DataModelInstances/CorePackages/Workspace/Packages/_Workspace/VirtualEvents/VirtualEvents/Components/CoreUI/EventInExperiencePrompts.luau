local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.Cryo);
local l_useState_0 = v3.useState;
local v6 = require(l_Parent_0.Components.CoreUI.PromptConnections);
local v7 = require(l_Parent_0.Components.CoreUI.RsvpPrompt);
local v8 = require(l_Parent_1.FocusNavigationUtils);
local l_FocusRoot_0 = v8.FocusRoot;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v8.FocusNavigableSurfaceIdentifierEnum;
local v11 = game:DefineFastFlag("FixFocusWhenInGameMenuIsOpen", false);
local v12 = {
    PromptRsvp = "PromptRsvp"
};
local v13 = {
    [v12.PromptRsvp] = v7
};
return function(v14) --[[ Line: 52 ]]
    -- upvalues: l_useState_0 (copy), v3 (copy), v4 (copy), v13 (copy), v12 (copy), v11 (copy), l_GuiService_0 (copy), v6 (copy), l_FocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy)
    local v15, v16 = l_useState_0({
        promptType = nil, 
        promptData = nil, 
        promptQueue = {}
    });
    local l_promptData_0 = v15.promptData;
    local l_promptType_0 = v15.promptType;
    local v19 = v3.useCallback(function() --[[ Line: 62 ]]
        -- upvalues: v4 (ref), v15 (copy), v16 (copy)
        if not v4.isEmpty(v15.promptQueue) then
            v16(v4.Dictionary.join(v15, {
                promptType = v15.promptQueue[1].promptType, 
                promptData = v15.promptQueue[1].promptData, 
                promptQueue = v4.List.removeIndex(v15.promptQueue, 1)
            }));
            return;
        else
            v16({
                promptType = nil, 
                promptData = {}, 
                promptQueue = {}
            });
            return;
        end;
    end, {
        v15, 
        v16
    });
    local v20 = nil;
    if l_promptType_0 then
        local v21 = v13[l_promptType_0];
        if v21 then
            v20 = v3.createElement(v21, {
                enableInputDelayed = v14.enableInputDelayed, 
                promptData = l_promptData_0, 
                closePrompt = v19, 
                overrideUseWideMode = v14.overrideUseWideMode
            });
        else
            error((("Unexpected prompt type: %*!"):format(l_promptType_0)));
        end;
    end;
    local v24 = v3.useCallback(function(v22, v23) --[[ Line: 93 ]]
        -- upvalues: v15 (copy), v16 (copy), v4 (ref), v12 (ref)
        if v15.promptType ~= nil then
            v16(v4.Dictionary.join(v15, {
                promptQueue = v4.List.join(v15.promptQueue, {
                    {
                        promptType = v12.PromptRsvp, 
                        promptData = {
                            eventId = v22, 
                            eventDetails = v23
                        }
                    }
                })
            }));
            return;
        else
            v16({
                promptType = v12.PromptRsvp, 
                promptData = {
                    eventId = v22, 
                    eventDetails = v23
                }, 
                promptQueue = {}
            });
            return;
        end;
    end, {
        v15, 
        v16
    });
    local v25 = nil;
    local v26 = nil;
    if v11 then
        local v27, v28 = v3.useState(l_GuiService_0.MenuIsOpen);
        v25 = v27;
        v26 = v28;
        v3.useEffect(function() --[[ Line: 123 ]]
            -- upvalues: v20 (ref), v26 (ref), l_GuiService_0 (ref)
            if not v20 then
                return;
            else
                v26(l_GuiService_0.MenuIsOpen);
                local v29 = l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 131 ]]
                    -- upvalues: v26 (ref)
                    v26(true);
                end);
                local v30 = l_GuiService_0.MenuClosed:Connect(function() --[[ Line: 134 ]]
                    -- upvalues: v26 (ref)
                    v26(false);
                end);
                return function() --[[ Line: 137 ]]
                    -- upvalues: v29 (copy), v30 (copy)
                    v29:Disconnect();
                    v30:Disconnect();
                end;
            end;
        end, {
            v20
        });
    end;
    return v3.createElement(v3.Fragment, {}, {
        PromptConnections = v3.createElement(v6, {
            openRsvpPrompt = v24, 
            closePrompt = v19
        }), 
        FocusNavigationCoreScriptsWrapper = if v20 then v3.createElement(l_FocusRoot_0, {
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, 
            isIsolated = true, 
            isAutoFocusRoot = true, 
            isFocusable = if v11 then not v25 else nil
        }, {
            Prompt = v20
        }) else nil
    });
end;