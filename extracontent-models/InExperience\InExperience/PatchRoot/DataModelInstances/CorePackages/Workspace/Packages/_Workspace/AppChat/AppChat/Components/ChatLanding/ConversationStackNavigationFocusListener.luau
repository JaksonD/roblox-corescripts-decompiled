local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.EnumScreens);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.FocusNavigationUtils);
local v4 = require(l_Parent_0.InputHandlers);
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.ReactFocusNavigation);
local v7 = require(l_Parent_0.RoactUtils);
local v8 = require(l_Parent_0.SquadsCore);
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local l_FocusNavigationEventNameEnum_0 = v3.FocusNavigationEventNameEnum;
local l_SquadExternalContractContext_0 = v8.SquadExternalContractProvider.SquadExternalContractContext;
local l_SquadPromptType_0 = v8.Enums.SquadPromptType;
local l_leaveSquad_0 = v8.Thunks.leaveSquad;
local l_useCurrentSquadParentChannelId_0 = v8.Hooks.useCurrentSquadParentChannelId;
local l_useDispatch_0 = v7.Hooks.RoactRodux.useDispatch;
local v16 = {
    [Enum.KeyCode.ButtonX] = l_FocusNavigationEventNameEnum_0.SquadJoin, 
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
return function(v17) --[[ Line: 35 ]] --[[ Name: ConversationStackNavigationFocusListener ]]
    -- upvalues: l_useDispatch_0 (copy), v5 (copy), v6 (copy), l_SquadExternalContractContext_0 (copy), l_useCurrentSquadParentChannelId_0 (copy), v1 (copy), l_leaveSquad_0 (copy), l_SquadPromptType_0 (copy), l_mutedError_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v4 (copy), v16 (copy)
    local v18 = l_useDispatch_0();
    local v19 = v5.useContext(v6.FocusNavigationContext);
    local v20 = v5.useContext(l_SquadExternalContractContext_0);
    local v21 = l_useCurrentSquadParentChannelId_0();
    local v25 = v5.useCallback(function(v22) --[[ Line: 41 ]]
        -- upvalues: v17 (copy), v19 (copy)
        local v23 = v17.navigation.getChildNavigation("ConversationStackNavigator");
        if v19 and v23 and v23.state.index == 1 then
            local v24 = v19.focusedGuiObject:getValue();
            if v24 ~= nil and v24:IsDescendantOf(v17.rightContainerRef.current) then
                v19:focusGuiObject(v17.leftContainerRef.current, true);
                v22:cancel();
            end;
        end;
    end, {
        v17.navigation, 
        v17.leftContainerRef, 
        v17.rightContainerRef, 
        v19
    });
    local v30 = v5.useCallback(function(v26) --[[ Line: 54 ]]
        -- upvalues: v17 (copy), v1 (ref), v21 (copy), v18 (copy), l_leaveSquad_0 (ref), l_SquadPromptType_0 (ref), v20 (copy), l_mutedError_0 (ref)
        local v27 = v17.navigation.getChildNavigation("ConversationStackNavigator");
        if v27 and v27.state.index == 1 then
            local v28 = v27.state.routes[1];
            if v28.routeName == v1.ChatConversation and v28.params then
                local l_conversationId_0 = v28.params.conversationId;
                if l_conversationId_0 then
                    if v21 == nil or v21 == l_conversationId_0 then
                        v17.navigation.navigate(v1.SquadLobby, {
                            conversationId = l_conversationId_0
                        });
                    else
                        v18(l_leaveSquad_0(l_SquadPromptType_0.JoinAnotherSquad, v20.setSquadPrompt, function() --[[ Line: 64 ]]
                            -- upvalues: v17 (ref), v1 (ref), l_conversationId_0 (copy)
                            v17.navigation.navigate(v1.SquadLobby, {
                                conversationId = l_conversationId_0
                            });
                        end, v20.squadLocation, true));
                    end;
                    v26:cancel();
                    return;
                else
                    l_mutedError_0("ConversationStackNavigationFocusListener: Missing conversationId for ChatConversation.");
                    return;
                end;
            else
                l_mutedError_0("ConversationStackNavigationFocusListener: Found" .. tostring(v28.routeName) .. " at root.");
            end;
        end;
    end, {
        v21, 
        v18, 
        v17.navigation, 
        v20.setSquadPrompt, 
        v20.squadLocation
    });
    local v31 = v5.useMemo(function() --[[ Line: 86 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v4 (ref), v25 (copy), v30 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v4.onRelease(v25)
            }, 
            [l_FocusNavigationEventNameEnum_0.SquadJoin] = {
                handler = v4.onRelease(v30)
            }
        };
    end, {
        v25, 
        v30
    });
    local v32 = v6.useEventMap(v16);
    local v33 = v6.useEventHandlerMap(v31, v32);
    return v5.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        ref = v33
    }, v17.children);
end;