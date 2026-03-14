local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RoactNavigation);
local v3 = require(l_script_FirstAncestor_0.EnumScreens);
local v4 = require(l_script_FirstAncestor_0.Components.ChatConversation.EmptyConversationScreen);
local v5 = require(script.Parent.ConversationStackNavigatorConnector);
return (v2.createRobloxSwitchNavigator({
    {
        [v3.EmptyConversation] = {
            screen = v4, 
            navigationOptions = {
                headerText = {
                    raw = "testing", 
                    shouldLocalize = false
                }, 
                backButtonEnabled = false, 
                isRoot = true, 
                tabBarVisible = true
            }
        }
    }, 
    {
        ConversationStackNavigator = v5
    }
}));