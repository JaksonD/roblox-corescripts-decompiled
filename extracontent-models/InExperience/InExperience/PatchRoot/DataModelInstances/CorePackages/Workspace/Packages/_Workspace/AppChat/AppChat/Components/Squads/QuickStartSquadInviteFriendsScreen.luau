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
local v14 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatTopBarConfigDriven);
local l_NavProps_0 = require(l_script_FirstAncestor_0.Constants).NavProps;
local l_QuickStartSquadInviteFriendsContainer_0 = v6.QuickStartSquadInviteFriendsContainer;
local v17 = v5.PureComponent:extend("QuickStartSquadInviteFriendsScreen");
v17.navigationOptions = function(v18) --[[ Line: 27 ]]
    -- upvalues: v14 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_NavProps_0 (copy), v5 (copy), v8 (copy), v12 (copy), v4 (copy), l_withLocalization_0 (copy), v11 (copy)
    if v14() then
        return {
            backButtonEnabled = true
        };
    else
        local v19 = if l_FFlagEnableAppChatFocusableFixes_0 then v18.navigation and v18.navigation.getScreenProps and v18.navigation.getScreenProps(l_NavProps_0.WIDE_MODE, false) else nil;
        return {
            headerText = {
                raw = "Feature.Squads.Action.Party", 
                shouldLocalize = true
            }, 
            backButtonEnabled = true, 
            renderRight = l_FFlagEnableAppChatFocusableFixes_0 and v19 and function() --[[ Line: 49 ]]
                -- upvalues: v5 (ref), v8 (ref), v12 (ref), v4 (ref), l_withLocalization_0 (ref), v11 (ref)
                return v5.createElement(v8, {
                    screenName = v12.QuickStartSquadInviteFriends, 
                    render = function(v20) --[[ Line: 52 ]] --[[ Name: render ]]
                        -- upvalues: v12 (ref), v4 (ref), l_withLocalization_0 (ref), v11 (ref)
                        local v21 = v20.getScreenTopBar(v12.QuickStartSquadInviteFriends);
                        v4.isType(v21, "table", "screenTopBar");
                        return l_withLocalization_0({
                            systemButtonText = "Feature.Squads.Action.Start"
                        })(function(v22) --[[ Line: 58 ]]
                            -- upvalues: v11 (ref), v21 (copy)
                            return v11({
                                localizedStrings = v22, 
                                isDisabled = not v21.systemButtonEnabled, 
                                onActivated = v21.systemButtonActivated
                            });
                        end);
                    end
                });
            end or nil
        };
    end;
end;
v17.init = function(v23) --[[ Line: 72 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (copy), l_NavProps_0 (copy), v14 (copy), v9 (copy), v12 (copy), v3 (copy), v2 (copy), v10 (copy), v4 (copy)
    v23.wideMode = if l_FFlagEnableAppChatFocusableFixes_0 then v23.props.navigation.getScreenProps(l_NavProps_0.WIDE_MODE, false) else nil;
    if v14() then
        v9(false).setScreenTopBar(v12.QuickStartSquadInviteFriends, {
            headerText = {
                raw = "Feature.Squads.Action.Party", 
                shouldLocalize = true
            }, 
            backButtonEnabled = true, 
            systemButtonText = "Feature.Squads.Action.Start"
        });
    end;
    v23.navigateIntoSquadLobby = function(v24) --[[ Line: 88 ]]
        -- upvalues: v23 (copy), l_NavProps_0 (ref), v3 (ref), v2 (ref)
        local v25 = v23.props.navigation.getScreenProps(l_NavProps_0.WIDE_MODE, false);
        local v26 = v23.props.navigation.getParam("partyAttemptId", nil);
        if v25 then
            v3(v23.props.navigation, v24, {
                squadCreateOrJoinAttemptId = v26
            });
            return;
        else
            v2(v23.props.navigation, v24, {
                squadCreateOrJoinAttemptId = v26
            });
            return;
        end;
    end;
    if l_FFlagEnableAppChatFocusableFixes_0 then
        v23.onSelectedFriendsChanged = function(v27, v28) --[[ Line: 104 ]]
            -- upvalues: v23 (copy), v10 (ref), v9 (ref), v12 (ref), l_NavProps_0 (ref), v4 (ref)
            if not v23.wideMode then
                return;
            elseif v10 then
                v9(false).setScreenTopBar(v12.QuickStartSquadInviteFriends, {
                    systemButtonEnabled = v27, 
                    systemButtonActivated = v28
                });
                return;
            else
                local v29 = v23.props.navigation.getScreenProps(l_NavProps_0.SET_SCREEN_TOP_BAR, nil);
                v4.isNotNil(v29, "setScreenTopBar in screenProps");
                if not v29 then
                    return;
                else
                    v29(v12.QuickStartSquadInviteFriends, {
                        systemButtonEnabled = v27, 
                        systemButtonActivated = v28
                    });
                    return;
                end;
            end;
        end;
    end;
end;
v17.render = function(v30) --[[ Line: 131 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v5 (copy), l_QuickStartSquadInviteFriendsContainer_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy)
    local v31 = v4.isNotNil(v30.props.navigation, "navigation in CreateNewChatScreen");
    local v32 = v31.getScreenProps("topBarHeight", 0);
    local v33 = v31.getScreenProps("wideMode", false);
    local v34 = v30.props.navigation.getParam("partyAttemptId", nil);
    return v5.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, if v33 then -v32 else 0), 
        BackgroundTransparency = 1
    }, {
        v5.createElement(l_QuickStartSquadInviteFriendsContainer_0, {
            navigateIntoSquadLobby = v30.navigateIntoSquadLobby, 
            partyAttemptId = v34, 
            onSelectedFriendsChanged = if l_FFlagEnableAppChatFocusableFixes_0 then v30.onSelectedFriendsChanged else nil, 
            shouldHideFooterButton = if l_FFlagEnableAppChatFocusableFixes_0 then v30.wideMode else nil
        })
    });
end;
if l_FFlagEnableAppChatFocusableFixes_0 then
    v17.didMount = function(v35) --[[ Line: 151 ]] --[[ Name: didMount ]]
        if v35.wideMode then
            v35.onSelectedFriendsChanged(false, nil);
        end;
    end;
end;
return v17;