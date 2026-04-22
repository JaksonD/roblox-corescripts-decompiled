local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.EnumScreens);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.SharedFlags);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.React);
local l_SquadLobby_0 = require(l_Parent_0.Squads).SquadLobby;
local v7 = require(script.Parent.SquadAddFriendsIconButton);
local v8 = require(l_Parent_0.RoactNavigation);
local v9 = v5.PureComponent:extend("SquadLobbyScreen");
local v10 = require(l_script_FirstAncestor_0.Contexts.ChatPlacementContext);
local l_withChatPlacementContext_0 = v10.withChatPlacementContext;
local v12 = require(l_script_FirstAncestor_0.Flags.FFlagRenderSquadLobbyOnlyWhenVisible);
local l_FFlagEnablePartyVoiceChangersInLua_0 = v3.FFlagEnablePartyVoiceChangersInLua;
local l_FFlagEnableAppChatFocusableFixes_0 = v3.FFlagEnableAppChatFocusableFixes;
local v15 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatTopBarConfigDriven);
local v16 = require(l_script_FirstAncestor_0.Stores.GetTopBarStore);
local v17 = {
    v1.SquadLobby, 
    v1.SquadInviteFriends, 
    v1.SquadVoiceReportAbuse
};
if l_FFlagEnablePartyVoiceChangersInLua_0 then
    table.insert(v17, v1.SquadVoiceChangers);
end;
local function v20(v18) --[[ Line: 36 ]]
    -- upvalues: v5 (copy), v7 (copy)
    local l_navigation_0 = v18.navigation;
    return {
        renderRight = function() --[[ Line: 40 ]] --[[ Name: renderRight ]]
            -- upvalues: v5 (ref), v7 (ref), l_navigation_0 (copy)
            return v5.createElement(v7, {
                navigation = l_navigation_0
            });
        end
    };
end;
v9.init = function(v21) --[[ Line: 48 ]] --[[ Name: init ]]
    -- upvalues: v15 (copy), v16 (copy), v1 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v8 (copy), l_FFlagEnablePartyVoiceChangersInLua_0 (copy), v17 (copy)
    local l_navigation_1 = v21.props.navigation;
    if v15() then
        v16(false).setScreenTopBar(v1.SquadLobby, {
            backButtonEnabled = true
        });
    end;
    if l_FFlagEnableAppChatFocusableFixes_0 then
        v21.state = {
            isFocused = l_navigation_1.isFocused()
        };
        v21.willFocusSubscription = l_navigation_1.addListener(v8.Events.WillFocus, function() --[[ Line: 60 ]]
            -- upvalues: v21 (copy)
            v21:setState({
                isFocused = true
            });
        end);
        v21.didBlurSubscription = l_navigation_1.addListener(v8.Events.DidBlur, function() --[[ Line: 63 ]]
            -- upvalues: v21 (copy)
            v21:setState({
                isFocused = false
            });
        end);
    end;
    v21.hasNavigatedAwayFromSquad = false;
    v21.navigateToHomePage = function(_) --[[ Line: 70 ]]
        -- upvalues: v21 (copy), v1 (ref)
        local v24 = v21.props.navigation.getScreenProps("navigateToLuaAppPages", {})[v1.Home];
        if v24 then
            v24();
        end;
    end;
    v21.openViewProfile = function(v25) --[[ Line: 80 ]]
        -- upvalues: v21 (copy), v1 (ref)
        local v26 = v21.props.navigation.getScreenProps("navigateToLuaAppPages", {})[v1.ViewUserProfile];
        if v26 then
            v26(v25, {});
        end;
    end;
    v21.openSquadVoiceAbuseReport = function(v27) --[[ Line: 88 ]]
        -- upvalues: v21 (copy), v1 (ref)
        v21.props.navigation.navigate(v1.SquadVoiceReportAbuse, {
            reportData = v27
        });
    end;
    if l_FFlagEnablePartyVoiceChangersInLua_0 then
        v21.openSquadVoiceChangers = function() --[[ Line: 93 ]]
            -- upvalues: v21 (copy), v1 (ref)
            v21.props.navigation.navigate(v1.SquadVoiceChangers);
        end;
    end;
    v21.navigateToSquadInviteFriends = function(v28) --[[ Line: 98 ]]
        -- upvalues: v21 (copy), v1 (ref)
        v21.props.navigation.navigate(v1.SquadInviteFriends, {
            conversationId = v28
        });
    end;
    v21.navigateAwayFromSquad = function() --[[ Line: 102 ]]
        -- upvalues: v21 (copy), v17 (ref)
        if v21.hasNavigatedAwayFromSquad then
            return;
        else
            local v29 = v21.props.navigation._dangerouslyGetParent();
            if v29 then
                local l_state_0 = v29.state;
                if l_state_0 then
                    local l_index_0 = l_state_0.index;
                    local v32 = nil;
                    for v33 = l_index_0, 1, -1 do
                        local v34 = l_state_0.routes[v33];
                        if not table.find(v17, v34.routeName) then
                            if v32 then
                                v21.hasNavigatedAwayFromSquad = true;
                                v21.props.navigation.goBack(v32);
                            end;
                            return;
                        else
                            v32 = v34.key;
                        end;
                    end;
                end;
            end;
            return;
        end;
    end;
end;
v9.willUnmount = function(v35) --[[ Line: 130 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (copy)
    if l_FFlagEnableAppChatFocusableFixes_0 then
        if v35.willFocusSubscription then
            v35.willFocusSubscription:remove();
        end;
        if v35.didBlurSubscription then
            v35.didBlurSubscription:remove();
        end;
    end;
end;
v9.render = function(v36) --[[ Line: 141 ]] --[[ Name: render ]]
    -- upvalues: l_withChatPlacementContext_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v12 (copy), v5 (copy), l_SquadLobby_0 (copy), l_FFlagEnablePartyVoiceChangersInLua_0 (copy), v10 (copy)
    return l_withChatPlacementContext_0(function(v37) --[[ Line: 142 ]]
        -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (ref), v36 (copy), v12 (ref), v5 (ref), l_SquadLobby_0 (ref), l_FFlagEnablePartyVoiceChangersInLua_0 (ref), v10 (ref)
        local v38 = if l_FFlagEnableAppChatFocusableFixes_0 then v36.state.isFocused else v36.props.navigation.isFocused();
        if v12 and not v38 then
            return nil;
        else
            return v5.createElement(l_SquadLobby_0, {
                navigateToHomePage = v36.navigateToHomePage, 
                openViewProfile = v36.openViewProfile, 
                openSquadVoiceAbuseReport = v36.openSquadVoiceAbuseReport, 
                navigateAwayFromSquad = v36.navigateAwayFromSquad, 
                navigateToSquadInviteFriends = v36.navigateToSquadInviteFriends, 
                openSquadVoiceChangers = if l_FFlagEnablePartyVoiceChangersInLua_0 then v36.openSquadVoiceChangers else nil, 
                isInExperience = v10.isPlacementInExperience(v37.chatPlacement), 
                isWideMode = v36.props.isWideMode
            });
        end;
    end);
end;
local v39 = v5.PureComponent:extend("WideSquadLobbyScreen");
v39.navigationOptions = v20;
v39.init = function(_) --[[ Line: 168 ]] --[[ Name: init ]]

end;
v39.render = function(v41) --[[ Line: 170 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v9 (copy), v4 (copy)
    return v5.createElement(v9, v4.Dictionary.union(v41.props, {
        isWideMode = true
    }));
end;
local v42 = v5.PureComponent:extend("CompactSquadLobbyScreen");
v42.navigationOptions = v20;
v42.init = function(_) --[[ Line: 176 ]] --[[ Name: init ]]

end;
v42.render = function(v44) --[[ Line: 177 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v9 (copy), v4 (copy)
    return v5.createElement(v9, v4.Dictionary.union(v44.props, {
        isWideMode = false
    }));
end;
return {
    WideSquadLobbyScreen = v39, 
    CompactSquadLobbyScreen = v42
};