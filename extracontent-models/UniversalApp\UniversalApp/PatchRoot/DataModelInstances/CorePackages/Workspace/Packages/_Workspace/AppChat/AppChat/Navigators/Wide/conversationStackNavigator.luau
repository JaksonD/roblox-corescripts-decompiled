local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RoactNavigation);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(script.Parent.Parent.autoFocusNavigation);
local v5 = require(l_Parent_0.React);
local v6 = require(l_script_FirstAncestor_0.Components.Squads.SquadAddFriendsIconButton);
local v7 = require(l_script_FirstAncestor_0.EnumScreens);
local v8 = require(l_script_FirstAncestor_0.Components.ChatConversation.ChatConversationScreen);
local v9 = require(l_script_FirstAncestor_0.Components.ChatDetails.ChatDetailsScreen);
local v10 = require(l_script_FirstAncestor_0.Components.Squads.SquadInviteFriendsScreen);
local v11 = require(l_script_FirstAncestor_0.Components.Squads.SquadLobbyScreen);
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local l_FFlagEnablePartyQuickStartButton_0 = require(l_Parent_0.SharedFlags).FFlagEnablePartyQuickStartButton;
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local v15 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatDisableAbsorbInputSelectable);
local v16 = require(l_script_FirstAncestor_0.TopBarProvider);
local v17 = require(l_script_FirstAncestor_0.Components.SelectChatMembers.createSystemMenuButton);
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local function v20() --[[ Line: 28 ]] --[[ Name: instantTransitionConfig ]]
    return {
        transitionSpec = {
            frequency = 1000000, 
            dampingRatio = 1
        }
    };
end;
return function(v21, v22) --[[ Line: 37 ]]
    -- upvalues: v3 (copy), l_GetFFlagAppChatRebrandStringUpdates_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v5 (copy), v6 (copy), l_FFlagEnablePartyQuickStartButton_0 (copy), v16 (copy), v7 (copy), l_withLocalization_0 (copy), v17 (copy), v8 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v4 (copy), v9 (copy), v11 (copy), v10 (copy), v15 (copy), v2 (copy), v20 (copy)
    local function v24(_) --[[ Line: 38 ]] --[[ Name: getChatDetailsNavigationOptions ]]
        -- upvalues: v3 (ref), l_GetFFlagAppChatRebrandStringUpdates_0 (ref), l_GetFFlagIsSquadEnabled_0 (ref), v21 (copy)
        return v3.Dictionary.join({
            backButtonEnabled = true, 
            headerText = {
                raw = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Label.Details" or "Feature.Chat.Label.ChatDetails", 
                shouldLocalize = true
            }
        }, v21 or {});
    end;
    local function v27(v25) --[[ Line: 50 ]] --[[ Name: getSquadLobbyNavigationOptions ]]
        -- upvalues: v3 (ref), v5 (ref), v6 (ref), v21 (copy)
        local l_navigation_0 = v25.navigation;
        return v3.Dictionary.join({
            backButtonEnabled = true, 
            renderRight = function() --[[ Line: 54 ]] --[[ Name: renderRight ]]
                -- upvalues: v5 (ref), v6 (ref), l_navigation_0 (copy)
                return v5.createElement(v6, {
                    navigation = l_navigation_0
                });
            end
        }, v21 or {});
    end;
    local function v34(v28) --[[ Line: 62 ]] --[[ Name: getSquadInviteFriendsNavigationOptions ]]
        -- upvalues: l_FFlagEnablePartyQuickStartButton_0 (ref), v5 (ref), v16 (ref), v7 (ref), l_withLocalization_0 (ref), v17 (ref), v3 (ref), v21 (copy)
        local v29 = v28.navigation and v28.navigation.getScreenProps and v28.navigation.getScreenProps("wideMode", false);
        local v30 = {
            backButtonEnabled = true, 
            headerText = if l_FFlagEnablePartyQuickStartButton_0 then {
                raw = "Feature.Squads.Action.Add", 
                shouldLocalize = true
            } else nil
        };
        if v29 then
            v30.renderRight = function() --[[ Line: 78 ]]
                -- upvalues: v5 (ref), v16 (ref), v7 (ref), l_withLocalization_0 (ref), v17 (ref)
                return v5.createElement(v16, {
                    screenName = v7.SquadInviteFriends, 
                    render = function(v31) --[[ Line: 81 ]] --[[ Name: render ]]
                        -- upvalues: v7 (ref), l_withLocalization_0 (ref), v17 (ref)
                        local v32 = v31.getScreenTopBar(v7.SquadInviteFriends);
                        return l_withLocalization_0({
                            systemButtonText = "Feature.Squads.Action.Add"
                        })(function(v33) --[[ Line: 86 ]]
                            -- upvalues: v17 (ref), v32 (copy)
                            return v17({
                                localizedStrings = v33, 
                                isDisabled = not v32.systemButtonEnabled, 
                                onActivated = v32.systemButtonActivated
                            });
                        end);
                    end
                });
            end;
        end;
        return v3.Dictionary.join(v30, v21 or {});
    end;
    local v35 = {
        {
            [v7.ChatConversation] = {
                screen = v8, 
                navigationOptions = v3.Dictionary.join({
                    backButtonEnabled = false, 
                    isRoot = true, 
                    lockIconEnabled = true, 
                    tabBarVisible = true
                }, v21 or {})
            }
        }, 
        {
            [v7.ChatDetails] = {
                screen = if l_FFlagEnableAppChatFocusableFixes_0 then v4(v9) else v9, 
                navigationOptions = if l_FFlagEnableAppChatFocusableFixes_0 then v24 else v3.Dictionary.join({
                    backButtonEnabled = true
                }, v21 or {})
            }
        }
    };
    if l_GetFFlagIsSquadEnabled_0() then
        table.insert(v35, {
            [v7.SquadLobby] = {
                screen = if l_FFlagEnableAppChatFocusableFixes_0 then v4(v11.WideSquadLobbyScreen) else v11.WideSquadLobbyScreen, 
                navigationOptions = if l_FFlagEnableAppChatFocusableFixes_0 then v27 else v3.Dictionary.join({
                    backButtonEnabled = true
                }, v21 or {})
            }
        });
        table.insert(v35, {
            [v7.SquadInviteFriends] = {
                screen = if l_FFlagEnableAppChatFocusableFixes_0 then v4(v10) else v10, 
                navigationOptions = if l_FFlagEnableAppChatFocusableFixes_0 then v34 else v3.Dictionary.join({
                    backButtonEnabled = true, 
                    headerText = if l_FFlagEnablePartyQuickStartButton_0 then {
                        raw = "Feature.Squads.Action.Add", 
                        shouldLocalize = true
                    } else nil
                }, v21 or {})
            }
        });
    end;
    local v36 = {
        tabBarVisible = true
    };
    if v15 then
        v36.absorbInputSelectable = false;
    end;
    return v2.createRobloxStackNavigator(v35, {
        defaultNavigationOptions = v36, 
        transitionConfig = if v22 then v20 else nil
    });
end;