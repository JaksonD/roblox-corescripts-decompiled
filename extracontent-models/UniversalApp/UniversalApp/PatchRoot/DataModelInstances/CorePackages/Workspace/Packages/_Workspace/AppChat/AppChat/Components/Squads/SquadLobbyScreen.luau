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
local v15 = {
    v1.SquadLobby, 
    v1.SquadInviteFriends, 
    v1.SquadVoiceReportAbuse
};
if l_FFlagEnablePartyVoiceChangersInLua_0 then
    table.insert(v15, v1.SquadVoiceChangers);
end;
local function v18(v16) --[[ Line: 34 ]]
    -- upvalues: v5 (copy), v7 (copy)
    local l_navigation_0 = v16.navigation;
    return {
        renderRight = function() --[[ Line: 38 ]] --[[ Name: renderRight ]]
            -- upvalues: v5 (ref), v7 (ref), l_navigation_0 (copy)
            return v5.createElement(v7, {
                navigation = l_navigation_0
            });
        end
    };
end;
v9.init = function(v19) --[[ Line: 46 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (copy), v8 (copy), v1 (copy), l_FFlagEnablePartyVoiceChangersInLua_0 (copy), v15 (copy)
    local l_navigation_1 = v19.props.navigation;
    if l_FFlagEnableAppChatFocusableFixes_0 then
        v19.state = {
            isFocused = l_navigation_1.isFocused()
        };
        v19.willFocusSubscription = l_navigation_1.addListener(v8.Events.WillFocus, function() --[[ Line: 52 ]]
            -- upvalues: v19 (copy)
            v19:setState({
                isFocused = true
            });
        end);
        v19.didBlurSubscription = l_navigation_1.addListener(v8.Events.DidBlur, function() --[[ Line: 55 ]]
            -- upvalues: v19 (copy)
            v19:setState({
                isFocused = false
            });
        end);
    end;
    v19.hasNavigatedAwayFromSquad = false;
    v19.navigateToHomePage = function(_) --[[ Line: 62 ]]
        -- upvalues: v19 (copy), v1 (ref)
        local v22 = v19.props.navigation.getScreenProps("navigateToLuaAppPages", {})[v1.Home];
        if v22 then
            v22();
        end;
    end;
    v19.openViewProfile = function(v23) --[[ Line: 72 ]]
        -- upvalues: v19 (copy), v1 (ref)
        local v24 = v19.props.navigation.getScreenProps("navigateToLuaAppPages", {})[v1.ViewUserProfile];
        if v24 then
            v24(v23, {});
        end;
    end;
    v19.openSquadVoiceAbuseReport = function(v25) --[[ Line: 80 ]]
        -- upvalues: v19 (copy), v1 (ref)
        v19.props.navigation.navigate(v1.SquadVoiceReportAbuse, {
            reportData = v25
        });
    end;
    if l_FFlagEnablePartyVoiceChangersInLua_0 then
        v19.openSquadVoiceChangers = function() --[[ Line: 85 ]]
            -- upvalues: v19 (copy), v1 (ref)
            v19.props.navigation.navigate(v1.SquadVoiceChangers);
        end;
    end;
    v19.navigateToSquadInviteFriends = function(v26) --[[ Line: 90 ]]
        -- upvalues: v19 (copy), v1 (ref)
        v19.props.navigation.navigate(v1.SquadInviteFriends, {
            conversationId = v26
        });
    end;
    v19.navigateAwayFromSquad = function() --[[ Line: 94 ]]
        -- upvalues: v19 (copy), v15 (ref)
        if v19.hasNavigatedAwayFromSquad then
            return;
        else
            local v27 = v19.props.navigation._dangerouslyGetParent();
            if v27 then
                local l_state_0 = v27.state;
                if l_state_0 then
                    local l_index_0 = l_state_0.index;
                    local v30 = nil;
                    for v31 = l_index_0, 1, -1 do
                        local v32 = l_state_0.routes[v31];
                        if not table.find(v15, v32.routeName) then
                            if v30 then
                                v19.hasNavigatedAwayFromSquad = true;
                                v19.props.navigation.goBack(v30);
                            end;
                            return;
                        else
                            v30 = v32.key;
                        end;
                    end;
                end;
            end;
            return;
        end;
    end;
end;
v9.willUnmount = function(v33) --[[ Line: 122 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (copy)
    if l_FFlagEnableAppChatFocusableFixes_0 then
        if v33.willFocusSubscription then
            v33.willFocusSubscription:remove();
        end;
        if v33.didBlurSubscription then
            v33.didBlurSubscription:remove();
        end;
    end;
end;
v9.render = function(v34) --[[ Line: 133 ]] --[[ Name: render ]]
    -- upvalues: l_withChatPlacementContext_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v12 (copy), v5 (copy), l_SquadLobby_0 (copy), l_FFlagEnablePartyVoiceChangersInLua_0 (copy), v10 (copy)
    return l_withChatPlacementContext_0(function(v35) --[[ Line: 134 ]]
        -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (ref), v34 (copy), v12 (ref), v5 (ref), l_SquadLobby_0 (ref), l_FFlagEnablePartyVoiceChangersInLua_0 (ref), v10 (ref)
        local v36 = if l_FFlagEnableAppChatFocusableFixes_0 then v34.state.isFocused else v34.props.navigation.isFocused();
        if v12 and not v36 then
            return nil;
        else
            return v5.createElement(l_SquadLobby_0, {
                navigateToHomePage = v34.navigateToHomePage, 
                openViewProfile = v34.openViewProfile, 
                openSquadVoiceAbuseReport = v34.openSquadVoiceAbuseReport, 
                navigateAwayFromSquad = v34.navigateAwayFromSquad, 
                navigateToSquadInviteFriends = v34.navigateToSquadInviteFriends, 
                openSquadVoiceChangers = if l_FFlagEnablePartyVoiceChangersInLua_0 then v34.openSquadVoiceChangers else nil, 
                isInExperience = v10.isPlacementInExperience(v35.chatPlacement), 
                isWideMode = v34.props.isWideMode
            });
        end;
    end);
end;
local v37 = v5.PureComponent:extend("WideSquadLobbyScreen");
v37.navigationOptions = v18;
v37.init = function(_) --[[ Line: 160 ]] --[[ Name: init ]]

end;
v37.render = function(v39) --[[ Line: 162 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v9 (copy), v4 (copy)
    return v5.createElement(v9, v4.Dictionary.union(v39.props, {
        isWideMode = true
    }));
end;
local v40 = v5.PureComponent:extend("CompactSquadLobbyScreen");
v40.navigationOptions = v18;
v40.init = function(_) --[[ Line: 168 ]] --[[ Name: init ]]

end;
v40.render = function(v42) --[[ Line: 169 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v9 (copy), v4 (copy)
    return v5.createElement(v9, v4.Dictionary.union(v42.props, {
        isWideMode = false
    }));
end;
return {
    WideSquadLobbyScreen = v37, 
    CompactSquadLobbyScreen = v40
};