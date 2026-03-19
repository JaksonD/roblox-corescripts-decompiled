local l_Parent_0 = script:FindFirstAncestor("GameCollections").Parent;
local v1 = require(l_Parent_0.React);
local l_useTriggerFeedback_0 = require(l_Parent_0.InteractionFeedback).useTriggerFeedback;
return function() --[[ Line: 8 ]] --[[ Name: useTriggerGameTileFeedbackCallbacks ]]
    -- upvalues: l_useTriggerFeedback_0 (copy), v1 (copy)
    local v3 = l_useTriggerFeedback_0();
    local v4 = v1.useRef(nil);
    return v1.useCallback(function(v5) --[[ Line: 11 ]]
        -- upvalues: v4 (copy), v3 (copy)
        local l_GuiState_0 = v5.GuiState;
        if v4.current == Enum.GuiState.Press then
            v3("Default", "Release");
        end;
        if l_GuiState_0 == Enum.GuiState.Hover then
            v3("Default", "Hover");
        end;
        if l_GuiState_0 == Enum.GuiState.Press then
            v3("Default", "Press");
        end;
        v4.current = l_GuiState_0;
    end, {
        v3, 
        v4
    }), (v1.useCallback(function() --[[ Line: 25 ]]
        -- upvalues: v4 (copy), v3 (copy)
        if v4.current == Enum.GuiState.Press then
            v3("Default", "Release");
        end;
        v4.current = Enum.GuiState.Idle;
    end, {
        v3, 
        v4
    }));
end;