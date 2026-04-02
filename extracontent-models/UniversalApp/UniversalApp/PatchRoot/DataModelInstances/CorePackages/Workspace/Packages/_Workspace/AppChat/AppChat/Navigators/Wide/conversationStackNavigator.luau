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
local v16 = require(l_script_FirstAncestor_0.Flags.FFlagDebugAppChatEnableDomLocators);
local v17 = require(l_script_FirstAncestor_0.Utils.DomLocators);
local v18 = require(l_script_FirstAncestor_0.TopBarProvider);
local v19 = require(l_script_FirstAncestor_0.Components.SelectChatMembers.createSystemMenuButton);
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local function v22() --[[ Line: 30 ]] --[[ Name: instantTransitionConfig ]]
    return {
        transitionSpec = {
            frequency = 1000000, 
            dampingRatio = 1
        }
    };
end;
return function(v23, v24) --[[ Line: 39 ]]
    -- upvalues: v3 (copy), l_GetFFlagAppChatRebrandStringUpdates_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v16 (copy), v17 (copy), v5 (copy), v6 (copy), l_FFlagEnablePartyQuickStartButton_0 (copy), v18 (copy), v7 (copy), l_withLocalization_0 (copy), v19 (copy), v8 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v4 (copy), v9 (copy), v11 (copy), v10 (copy), v15 (copy), v2 (copy), v22 (copy)
    local function v26(_) --[[ Line: 40 ]] --[[ Name: getChatDetailsNavigationOptions ]]
        -- upvalues: v3 (ref), l_GetFFlagAppChatRebrandStringUpdates_0 (ref), l_GetFFlagIsSquadEnabled_0 (ref), v16 (ref), v17 (ref), v23 (copy)
        return v3.Dictionary.join({
            backButtonEnabled = true, 
            headerText = {
                raw = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Label.Details" or "Feature.Chat.Label.ChatDetails", 
                shouldLocalize = true
            }, 
            backButtonTestId = if v16 then v17.chatDetailsTopBarActionButton("back") else nil
        }, v23 or {});
    end;
    local function v29(v27) --[[ Line: 55 ]] --[[ Name: getSquadLobbyNavigationOptions ]]
        -- upvalues: v3 (ref), v5 (ref), v6 (ref), v23 (copy)
        local l_navigation_0 = v27.navigation;
        return v3.Dictionary.join({
            backButtonEnabled = true, 
            renderRight = function() --[[ Line: 59 ]] --[[ Name: renderRight ]]
                -- upvalues: v5 (ref), v6 (ref), l_navigation_0 (copy)
                return v5.createElement(v6, {
                    navigation = l_navigation_0
                });
            end
        }, v23 or {});
    end;
    local function v36(v30) --[[ Line: 67 ]] --[[ Name: getSquadInviteFriendsNavigationOptions ]]
        -- upvalues: l_FFlagEnablePartyQuickStartButton_0 (ref), v5 (ref), v18 (ref), v7 (ref), l_withLocalization_0 (ref), v19 (ref), v3 (ref), v23 (copy)
        local v31 = v30.navigation and v30.navigation.getScreenProps and v30.navigation.getScreenProps("wideMode", false);
        local v32 = {
            backButtonEnabled = true, 
            headerText = if l_FFlagEnablePartyQuickStartButton_0 then {
                raw = "Feature.Squads.Action.Add", 
                shouldLocalize = true
            } else nil
        };
        if v31 then
            v32.renderRight = function() --[[ Line: 83 ]]
                -- upvalues: v5 (ref), v18 (ref), v7 (ref), l_withLocalization_0 (ref), v19 (ref)
                return v5.createElement(v18, {
                    screenName = v7.SquadInviteFriends, 
                    render = function(v33) --[[ Line: 86 ]] --[[ Name: render ]]
                        -- upvalues: v7 (ref), l_withLocalization_0 (ref), v19 (ref)
                        local v34 = v33.getScreenTopBar(v7.SquadInviteFriends);
                        return l_withLocalization_0({
                            systemButtonText = "Feature.Squads.Action.Add"
                        })(function(v35) --[[ Line: 91 ]]
                            -- upvalues: v19 (ref), v34 (copy)
                            return v19({
                                localizedStrings = v35, 
                                isDisabled = not v34.systemButtonEnabled, 
                                onActivated = v34.systemButtonActivated
                            });
                        end);
                    end
                });
            end;
        end;
        return v3.Dictionary.join(v32, v23 or {});
    end;
    local v37 = {
        {
            [v7.ChatConversation] = {
                screen = v8, 
                navigationOptions = v3.Dictionary.join({
                    backButtonEnabled = false, 
                    isRoot = true, 
                    lockIconEnabled = true, 
                    tabBarVisible = true
                }, v23 or {})
            }
        }, 
        {
            [v7.ChatDetails] = {
                screen = if l_FFlagEnableAppChatFocusableFixes_0 then v4(v9) else v9, 
                navigationOptions = if l_FFlagEnableAppChatFocusableFixes_0 then v26 else v3.Dictionary.join({
                    backButtonEnabled = true
                }, v23 or {})
            }
        }
    };
    if l_GetFFlagIsSquadEnabled_0() then
        table.insert(v37, {
            [v7.SquadLobby] = {
                screen = if l_FFlagEnableAppChatFocusableFixes_0 then v4(v11.WideSquadLobbyScreen) else v11.WideSquadLobbyScreen, 
                navigationOptions = if l_FFlagEnableAppChatFocusableFixes_0 then v29 else v3.Dictionary.join({
                    backButtonEnabled = true
                }, v23 or {})
            }
        });
        table.insert(v37, {
            [v7.SquadInviteFriends] = {
                screen = if l_FFlagEnableAppChatFocusableFixes_0 then v4(v10) else v10, 
                navigationOptions = if l_FFlagEnableAppChatFocusableFixes_0 then v36 else v3.Dictionary.join({
                    backButtonEnabled = true, 
                    headerText = if l_FFlagEnablePartyQuickStartButton_0 then {
                        raw = "Feature.Squads.Action.Add", 
                        shouldLocalize = true
                    } else nil
                }, v23 or {})
            }
        });
    end;
    local v38 = {
        tabBarVisible = true
    };
    if v15 then
        v38.absorbInputSelectable = false;
    end;
    return v2.createRobloxStackNavigator(v37, {
        defaultNavigationOptions = v38, 
        transitionConfig = if v24 then v22 else nil
    });
end;