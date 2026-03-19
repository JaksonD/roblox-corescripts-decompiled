local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utils.resetForSquadLobbyForCompactMode);
local v3 = require(l_script_FirstAncestor_0.Utils.resetForSquadLobbyForWideMode);
local v4 = require(l_Parent_0.ArgCheck);
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.Squads);
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local v8 = require(l_script_FirstAncestor_0.TopBarProvider);
local v9 = require(l_script_FirstAncestor_0.Stores.GetTopBarStore);
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatTopBarSignalsStore);
local v11 = require(l_script_FirstAncestor_0.Components.SelectChatMembers.createSystemMenuButton);
local v12 = require(l_script_FirstAncestor_0.EnumScreens);
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local l_NavProps_0 = require(l_script_FirstAncestor_0.Constants).NavProps;
local l_QuickStartSquadInviteFriendsContainer_0 = v6.QuickStartSquadInviteFriendsContainer;
local v16 = v5.PureComponent:extend("QuickStartSquadInviteFriendsScreen");
v16.navigationOptions = function(v17) --[[ Line: 26 ]]
    -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (copy), l_NavProps_0 (copy), v5 (copy), v8 (copy), v12 (copy), v4 (copy), l_withLocalization_0 (copy), v11 (copy)
    local v18 = if l_FFlagEnableAppChatFocusableFixes_0 then v17.navigation and v17.navigation.getScreenProps and v17.navigation.getScreenProps(l_NavProps_0.WIDE_MODE, false) else nil;
    return {
        headerText = {
            raw = "Feature.Squads.Action.Party", 
            shouldLocalize = true
        }, 
        backButtonEnabled = true, 
        renderRight = l_FFlagEnableAppChatFocusableFixes_0 and v18 and function() --[[ Line: 42 ]]
            -- upvalues: v5 (ref), v8 (ref), v12 (ref), v4 (ref), l_withLocalization_0 (ref), v11 (ref)
            return v5.createElement(v8, {
                screenName = v12.QuickStartSquadInviteFriends, 
                render = function(v19) --[[ Line: 45 ]] --[[ Name: render ]]
                    -- upvalues: v12 (ref), v4 (ref), l_withLocalization_0 (ref), v11 (ref)
                    local v20 = v19.getScreenTopBar(v12.QuickStartSquadInviteFriends);
                    v4.isType(v20, "table", "screenTopBar");
                    return l_withLocalization_0({
                        systemButtonText = "Feature.Squads.Action.Start"
                    })(function(v21) --[[ Line: 51 ]]
                        -- upvalues: v11 (ref), v20 (copy)
                        return v11({
                            localizedStrings = v21, 
                            isDisabled = not v20.systemButtonEnabled, 
                            onActivated = v20.systemButtonActivated
                        });
                    end);
                end
            });
        end or nil
    };
end;
v16.init = function(v22) --[[ Line: 65 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (copy), l_NavProps_0 (copy), v3 (copy), v2 (copy), v10 (copy), v9 (copy), v12 (copy), v4 (copy)
    v22.wideMode = if l_FFlagEnableAppChatFocusableFixes_0 then v22.props.navigation.getScreenProps(l_NavProps_0.WIDE_MODE, false) else nil;
    v22.navigateIntoSquadLobby = function(v23) --[[ Line: 70 ]]
        -- upvalues: v22 (copy), v3 (ref), v2 (ref)
        local v24 = v22.props.navigation.getScreenProps("wideMode", false);
        local v25 = v22.props.navigation.getParam("partyAttemptId", nil);
        if v24 then
            v3(v22.props.navigation, v23, {
                squadCreateOrJoinAttemptId = v25
            });
            return;
        else
            v2(v22.props.navigation, v23, {
                squadCreateOrJoinAttemptId = v25
            });
            return;
        end;
    end;
    if l_FFlagEnableAppChatFocusableFixes_0 then
        v22.onSelectedFriendsChanged = function(v26, v27) --[[ Line: 86 ]]
            -- upvalues: v22 (copy), v10 (ref), v9 (ref), v12 (ref), l_NavProps_0 (ref), v4 (ref)
            if not v22.wideMode then
                return;
            elseif v10 then
                v9(false).setScreenTopBar(v12.QuickStartSquadInviteFriends, {
                    systemButtonEnabled = v26, 
                    systemButtonActivated = v27
                });
                return;
            else
                local v28 = v22.props.navigation.getScreenProps(l_NavProps_0.SET_SCREEN_TOP_BAR, nil);
                v4.isNotNil(v28, "setScreenTopBar in screenProps");
                if not v28 then
                    return;
                else
                    v28(v12.QuickStartSquadInviteFriends, {
                        systemButtonEnabled = v26, 
                        systemButtonActivated = v27
                    });
                    return;
                end;
            end;
        end;
    end;
end;
v16.render = function(v29) --[[ Line: 113 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v5 (copy), l_QuickStartSquadInviteFriendsContainer_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy)
    local v30 = v4.isNotNil(v29.props.navigation, "navigation in CreateNewChatScreen");
    local v31 = v30.getScreenProps("topBarHeight", 0);
    local v32 = v30.getScreenProps("wideMode", false);
    local v33 = v29.props.navigation.getParam("partyAttemptId", nil);
    return v5.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, if v32 then -v31 else 0), 
        BackgroundTransparency = 1
    }, {
        v5.createElement(l_QuickStartSquadInviteFriendsContainer_0, {
            navigateIntoSquadLobby = v29.navigateIntoSquadLobby, 
            partyAttemptId = v33, 
            onSelectedFriendsChanged = if l_FFlagEnableAppChatFocusableFixes_0 then v29.onSelectedFriendsChanged else nil, 
            shouldHideFooterButton = if l_FFlagEnableAppChatFocusableFixes_0 then v29.wideMode else nil
        })
    });
end;
if l_FFlagEnableAppChatFocusableFixes_0 then
    v16.didMount = function(v34) --[[ Line: 133 ]] --[[ Name: didMount ]]
        if v34.wideMode then
            v34.onSelectedFriendsChanged(false, nil);
        end;
    end;
end;
return v16;