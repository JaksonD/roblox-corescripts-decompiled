local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactRodux);
local v4 = require(l_Parent_0.SharedFlags);
local v5 = require(l_Parent_0.Squads);
local v6 = require(l_Parent_0.ArgCheck);
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local v8 = require(l_script_FirstAncestor_0.TopBarProvider);
local v9 = require(l_script_FirstAncestor_0.Stores.GetTopBarStore);
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatTopBarSignalsStore);
local v11 = require(l_script_FirstAncestor_0.Components.SelectChatMembers.createSystemMenuButton);
local v12 = require(l_script_FirstAncestor_0.EnumScreens);
local l_FFlagEnablePartyQuickStartButton_0 = v4.FFlagEnablePartyQuickStartButton;
local l_FFlagEnableAppChatFocusableFixes_0 = v4.FFlagEnableAppChatFocusableFixes;
local l_NavProps_0 = require(l_script_FirstAncestor_0.Constants).NavProps;
local l_SquadInviteFriends_0 = v5.SquadInviteFriends;
local l_SquadInviteFriendsContainer_0 = v5.SquadInviteFriendsContainer;
local v18 = v2.PureComponent:extend("SquadInviteFriendsScreen");
if not l_FFlagEnablePartyQuickStartButton_0 then
    v18.navigationOptions = function(_) --[[ Line: 30 ]]
        return {
            headerText = {
                raw = "Feature.Squads.Label.InviteToSquad", 
                shouldLocalize = true
            }
        };
    end;
end;
local function v25(v20) --[[ Line: 40 ]] --[[ Name: navigationOptions ]]
    -- upvalues: l_NavProps_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v2 (copy), v8 (copy), v12 (copy), l_withLocalization_0 (copy), v11 (copy)
    local v21 = v20.navigation and v20.navigation.getScreenProps and v20.navigation.getScreenProps(l_NavProps_0.WIDE_MODE, false);
    if not l_FFlagEnableAppChatFocusableFixes_0 or not v21 then
        return {};
    else
        return {
            renderRight = function() --[[ Line: 50 ]] --[[ Name: renderRight ]]
                -- upvalues: v2 (ref), v8 (ref), v12 (ref), l_withLocalization_0 (ref), v11 (ref)
                return v2.createElement(v8, {
                    screenName = v12.SquadInviteFriends, 
                    render = function(v22) --[[ Line: 53 ]] --[[ Name: render ]]
                        -- upvalues: v12 (ref), l_withLocalization_0 (ref), v11 (ref)
                        local v23 = v22.getScreenTopBar(v12.SquadInviteFriends);
                        return l_withLocalization_0({
                            systemButtonText = "Feature.Squads.Action.Add"
                        })(function(v24) --[[ Line: 58 ]]
                            -- upvalues: v11 (ref), v23 (copy)
                            return v11({
                                localizedStrings = v24, 
                                isDisabled = not v23.systemButtonEnabled, 
                                onActivated = v23.systemButtonActivated
                            });
                        end);
                    end
                });
            end
        };
    end;
end;
v18.navigationOptions = v25;
if l_FFlagEnableAppChatFocusableFixes_0 then
    v18.init = function(v26) --[[ Line: 74 ]] --[[ Name: init ]]
        -- upvalues: l_NavProps_0 (copy), v10 (copy), v9 (copy), v12 (copy), v6 (copy)
        v26.wideMode = v26.props.navigation.getScreenProps(l_NavProps_0.WIDE_MODE, false);
        v26.onSelectedFriendsChanged = function(v27, v28) --[[ Line: 77 ]]
            -- upvalues: v26 (copy), v10 (ref), v9 (ref), v12 (ref), l_NavProps_0 (ref), v6 (ref)
            if not v26.wideMode then
                return;
            elseif v10 then
                v9(false).setScreenTopBar(v12.SquadInviteFriends, {
                    systemButtonEnabled = v27, 
                    systemButtonActivated = v28
                });
                return;
            else
                local v29 = v26.props.navigation.getScreenProps(l_NavProps_0.SET_SCREEN_TOP_BAR, nil);
                v6.isNotNil(v29, "setScreenTopBar in screenProps");
                if not v29 then
                    return;
                else
                    v29(v12.SquadInviteFriends, {
                        systemButtonEnabled = v27, 
                        systemButtonActivated = v28
                    });
                    return;
                end;
            end;
        end;
    end;
end;
v18.render = function(v30) --[[ Line: 104 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_FFlagEnablePartyQuickStartButton_0 (copy), l_SquadInviteFriendsContainer_0 (copy), l_SquadInviteFriends_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy)
    return v2.createElement(if l_FFlagEnablePartyQuickStartButton_0 then l_SquadInviteFriendsContainer_0 else l_SquadInviteFriends_0, {
        participants = v30.props.participants, 
        onSelectedFriendsChanged = if l_FFlagEnableAppChatFocusableFixes_0 and v30.wideMode then v30.onSelectedFriendsChanged else nil, 
        shouldHideFooterButton = if l_FFlagEnableAppChatFocusableFixes_0 then v30.wideMode else nil
    });
end;
if l_FFlagEnableAppChatFocusableFixes_0 then
    v18.didMount = function(v31) --[[ Line: 118 ]] --[[ Name: didMount ]]
        if v31.wideMode then
            v31.onSelectedFriendsChanged(false, nil);
        end;
    end;
end;
v18 = v3.connect(function(v32, v33) --[[ Line: 125 ]]
    local v34 = v33.navigation.getParam("conversationId");
    local v35 = v32.ChatAppReducer.Conversations[v34];
    return {
        participants = v35 and v35.participants or nil
    };
end)(v18);
if l_FFlagEnableAppChatFocusableFixes_0 then
    v18.navigationOptions = v25;
end;
return v18;