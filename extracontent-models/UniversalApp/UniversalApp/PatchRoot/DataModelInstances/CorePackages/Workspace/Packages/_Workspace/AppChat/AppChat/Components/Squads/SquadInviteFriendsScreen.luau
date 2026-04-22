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
local v15 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatTopBarConfigDriven);
local l_NavProps_0 = require(l_script_FirstAncestor_0.Constants).NavProps;
local l_SquadInviteFriends_0 = v5.SquadInviteFriends;
local l_SquadInviteFriendsContainer_0 = v5.SquadInviteFriendsContainer;
local v19 = v2.PureComponent:extend("SquadInviteFriendsScreen");
if not l_FFlagEnablePartyQuickStartButton_0 then
    v19.navigationOptions = function(_) --[[ Line: 31 ]]
        return {
            headerText = {
                raw = "Feature.Squads.Label.InviteToSquad", 
                shouldLocalize = true
            }
        };
    end;
end;
local function v26(v21) --[[ Line: 41 ]] --[[ Name: navigationOptions ]]
    -- upvalues: v15 (copy), l_NavProps_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v2 (copy), v8 (copy), v12 (copy), l_withLocalization_0 (copy), v11 (copy)
    if v15() then
        return {};
    else
        local v22 = v21.navigation and v21.navigation.getScreenProps and v21.navigation.getScreenProps(l_NavProps_0.WIDE_MODE, false);
        if not l_FFlagEnableAppChatFocusableFixes_0 or not v22 then
            return {};
        else
            return {
                renderRight = function() --[[ Line: 55 ]] --[[ Name: renderRight ]]
                    -- upvalues: v2 (ref), v8 (ref), v12 (ref), l_withLocalization_0 (ref), v11 (ref)
                    return v2.createElement(v8, {
                        screenName = v12.SquadInviteFriends, 
                        render = function(v23) --[[ Line: 58 ]] --[[ Name: render ]]
                            -- upvalues: v12 (ref), l_withLocalization_0 (ref), v11 (ref)
                            local v24 = v23.getScreenTopBar(v12.SquadInviteFriends);
                            return l_withLocalization_0({
                                systemButtonText = "Feature.Squads.Action.Add"
                            })(function(v25) --[[ Line: 63 ]]
                                -- upvalues: v11 (ref), v24 (copy)
                                return v11({
                                    localizedStrings = v25, 
                                    isDisabled = not v24.systemButtonEnabled, 
                                    onActivated = v24.systemButtonActivated
                                });
                            end);
                        end
                    });
                end
            };
        end;
    end;
end;
v19.navigationOptions = v26;
if l_FFlagEnableAppChatFocusableFixes_0 then
    v19.init = function(v27) --[[ Line: 79 ]] --[[ Name: init ]]
        -- upvalues: l_NavProps_0 (copy), v15 (copy), v9 (copy), v12 (copy), l_FFlagEnablePartyQuickStartButton_0 (copy), v10 (copy), v6 (copy)
        v27.wideMode = v27.props.navigation.getScreenProps(l_NavProps_0.WIDE_MODE, false);
        if v15() then
            v9(false).setScreenTopBar(v12.SquadInviteFriends, {
                headerText = if l_FFlagEnablePartyQuickStartButton_0 then {
                    raw = "Feature.Squads.Action.Add", 
                    shouldLocalize = true
                } else nil, 
                backButtonEnabled = true, 
                systemButtonText = "Feature.Squads.Action.Add"
            });
        end;
        v27.onSelectedFriendsChanged = function(v28, v29) --[[ Line: 95 ]]
            -- upvalues: v27 (copy), v10 (ref), v9 (ref), v12 (ref), l_NavProps_0 (ref), v6 (ref)
            if not v27.wideMode then
                return;
            elseif v10 then
                v9(false).setScreenTopBar(v12.SquadInviteFriends, {
                    systemButtonEnabled = v28, 
                    systemButtonActivated = v29
                });
                return;
            else
                local v30 = v27.props.navigation.getScreenProps(l_NavProps_0.SET_SCREEN_TOP_BAR, nil);
                v6.isNotNil(v30, "setScreenTopBar in screenProps");
                if not v30 then
                    return;
                else
                    v30(v12.SquadInviteFriends, {
                        systemButtonEnabled = v28, 
                        systemButtonActivated = v29
                    });
                    return;
                end;
            end;
        end;
    end;
end;
v19.render = function(v31) --[[ Line: 122 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_FFlagEnablePartyQuickStartButton_0 (copy), l_SquadInviteFriendsContainer_0 (copy), l_SquadInviteFriends_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy)
    return v2.createElement(if l_FFlagEnablePartyQuickStartButton_0 then l_SquadInviteFriendsContainer_0 else l_SquadInviteFriends_0, {
        participants = v31.props.participants, 
        onSelectedFriendsChanged = if l_FFlagEnableAppChatFocusableFixes_0 and v31.wideMode then v31.onSelectedFriendsChanged else nil, 
        shouldHideFooterButton = if l_FFlagEnableAppChatFocusableFixes_0 then v31.wideMode else nil
    });
end;
if l_FFlagEnableAppChatFocusableFixes_0 then
    v19.didMount = function(v32) --[[ Line: 136 ]] --[[ Name: didMount ]]
        if v32.wideMode then
            v32.onSelectedFriendsChanged(false, nil);
        end;
    end;
end;
v19 = v3.connect(function(v33, v34) --[[ Line: 143 ]]
    local v35 = v34.navigation.getParam("conversationId");
    local v36 = v33.ChatAppReducer.Conversations[v35];
    return {
        participants = v36 and v36.participants or nil
    };
end)(v19);
if l_FFlagEnableAppChatFocusableFixes_0 then
    v19.navigationOptions = v26;
end;
return v19;