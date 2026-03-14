local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RoactNavigation);
local l_SquadQuickStartExperimentation_0 = require(l_Parent_0.SocialExperiments).SquadQuickStartExperimentation;
local v4 = require(l_script_FirstAncestor_0.EnumScreens);
local v5 = require(l_script_FirstAncestor_0.Components.ChatLanding.ChatLandingScreenWithSwitchNavigator);
local v6 = require(l_script_FirstAncestor_0.Components.CreateNewChat.CreateNewChatScreen);
local v7 = require(l_script_FirstAncestor_0.Components.EditChatMembers.EditChatMembersScreen);
local v8 = require(l_script_FirstAncestor_0.Components.Squads.QuickStartSquadInviteFriendsScreen);
local l_script_FirstAncestor_1 = script:FindFirstAncestor("Navigators");
local v10 = require(l_script_FirstAncestor_1.createOverlayTopBarStackNavigator);
local v11 = require(l_script_FirstAncestor_0.Navigators.createOverlayTopBarStackNavigatorWithFocus);
local v12 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatRemoveDynamicRequires);
local l_FFlagEnablePartyQuickStartButton_0 = require(l_Parent_0.SharedFlags).FFlagEnablePartyQuickStartButton;
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local function v17(v15, v16) --[[ Line: 25 ]] --[[ Name: wrapScreenInOverlayNavigator ]]
    -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (copy), v11 (copy), v10 (copy)
    if l_FFlagEnableAppChatFocusableFixes_0 then
        return (v11({
            {
                [v15] = v16
            }
        }));
    else
        return (v10({
            {
                [v15] = v16
            }
        }));
    end;
end;
local v18 = {
    backButtonEnabled = true, 
    tabBarVisible = true, 
    overlayEnabled = true, 
    overlayTransparency = 0.5, 
    absorbInput = true
};
local v19 = {
    {
        [v4.ChatLanding] = {
            screen = v5, 
            navigationOptions = v12() and function() --[[ Line: 53 ]]
                return {
                    backButtonEnabled = false, 
                    tabBarVisible = true
                };
            end or {
                backButtonEnabled = false, 
                tabBarVisible = true
            }
        }
    }, 
    {
        CreateNewChatScreenWrapper = {
            screen = v17(v4.CreateNewChat, v6), 
            navigationOptions = v18
        }
    }, 
    {
        EditChatMembersScreenWrapper = {
            screen = v17(v4.EditChatMembers, v7), 
            navigationOptions = v18
        }
    }
};
if l_SquadQuickStartExperimentation_0.getPartyQuickStartChangesEnabled() and l_FFlagEnablePartyQuickStartButton_0 then
    table.insert(v19, {
        CreatePartyQuickStartWrapper = {
            screen = v17(v4.QuickStartSquadInviteFriends, v8), 
            navigationOptions = v18
        }
    });
end;
return v2.createRobloxStackNavigator(v19, {
    mode = v2.StackPresentationStyle.Overlay
});