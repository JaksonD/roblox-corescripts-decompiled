local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_SquadQuickStartExperimentation_0 = require(l_Parent_0.SocialExperiments).SquadQuickStartExperimentation;
local v3 = require(l_script_FirstAncestor_0.EnumScreens);
local v4 = require(l_script_FirstAncestor_0.Components.ChatLanding.ChatLandingScreen);
local v5 = require(l_script_FirstAncestor_0.Components.ChatConversation.ChatConversationScreen);
local v6 = require(l_script_FirstAncestor_0.Components.ChatDetails.ChatDetailsScreen);
local v7 = require(l_script_FirstAncestor_0.Components.CreateNewChat.CreateNewChatScreen);
local v8 = require(l_script_FirstAncestor_0.Components.EditChatMembers.EditChatMembersScreen);
local v9 = require(l_script_FirstAncestor_0.Components.Squads.SquadInviteFriendsScreen);
local v10 = require(l_script_FirstAncestor_0.Components.Squads.SquadLobbyScreen);
local v11 = require(l_script_FirstAncestor_0.Components.Squads.QuickStartSquadInviteFriendsScreen);
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local v13 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatRemoveDynamicRequires);
local l_FFlagEnablePartyQuickStartButton_0 = require(l_Parent_0.SharedFlags).FFlagEnablePartyQuickStartButton;
local v15 = {
    {
        [v3.ChatLanding] = {
            screen = v4, 
            navigationOptions = v13() and function() --[[ Line: 26 ]]
                return {
                    isRoot = true, 
                    backButtonEnabled = false, 
                    tabBarVisible = true
                };
            end or {
                isRoot = true, 
                backButtonEnabled = false, 
                tabBarVisible = true
            }
        }
    }, 
    {
        [v3.ChatConversation] = {
            screen = v5, 
            navigationOptions = {
                backButtonEnabled = true, 
                tabBarVisible = false, 
                lockIconEnabled = true, 
                absorbInput = false
            }
        }
    }, 
    {
        [v3.ChatDetails] = {
            screen = v6, 
            navigationOptions = {
                backButtonEnabled = true, 
                tabBarVisible = false
            }
        }
    }, 
    {
        [v3.CreateNewChat] = {
            screen = v7, 
            navigationOptions = {
                backButtonEnabled = true, 
                tabBarVisible = false
            }
        }
    }, 
    {
        [v3.EditChatMembers] = {
            screen = v8, 
            navigationOptions = {
                backButtonEnabled = true, 
                tabBarVisible = false
            }
        }
    }
};
if l_GetFFlagIsSquadEnabled_0() then
    table.insert(v15, {
        [v3.SquadLobby] = {
            screen = v10.CompactSquadLobbyScreen, 
            navigationOptions = {
                backButtonEnabled = true, 
                tabBarVisible = false
            }
        }
    });
    if l_SquadQuickStartExperimentation_0.getPartyQuickStartChangesEnabled() and l_FFlagEnablePartyQuickStartButton_0 then
        table.insert(v15, {
            [v3.QuickStartSquadInviteFriends] = {
                screen = v11, 
                navigationOptions = {
                    backButtonEnabled = true, 
                    tabBarVisible = false
                }
            }
        });
    end;
    table.insert(v15, {
        [v3.SquadInviteFriends] = {
            screen = v9, 
            navigationOptions = {
                backButtonEnabled = true, 
                tabBarVisible = false, 
                headerText = if l_FFlagEnablePartyQuickStartButton_0 then {
                    raw = "Feature.Squads.Action.Add", 
                    shouldLocalize = true
                } else nil
            }
        }
    });
end;
return v15;