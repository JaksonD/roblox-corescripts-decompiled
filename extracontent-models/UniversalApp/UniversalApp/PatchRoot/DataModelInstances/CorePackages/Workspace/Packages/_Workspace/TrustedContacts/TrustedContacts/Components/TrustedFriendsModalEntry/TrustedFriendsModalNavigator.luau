local l_script_FirstAncestor_0 = script:FindFirstAncestor("TrustedContacts");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RoactNavigation);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
return (v2.createRobloxStackNavigator({
    {
        [l_AppPage_0.TrustedFriendsUserModal] = {
            getScreen = function() --[[ Line: 11 ]] --[[ Name: getScreen ]]
                -- upvalues: l_script_FirstAncestor_0 (copy)
                return require(l_script_FirstAncestor_0.Components.TrustedContactsModal).Screen;
            end, 
            navigationOptions = {
                renderUnderlyingPage = true, 
                disableBackButton = true, 
                overlayEnabled = true
            }
        }
    }, 
    {
        [l_AppPage_0.TrustedFriendsVPCPrologue] = {
            getScreen = function() --[[ Line: 23 ]] --[[ Name: getScreen ]]
                -- upvalues: l_script_FirstAncestor_0 (copy)
                return require(l_script_FirstAncestor_0.Components.TrustedFriendsVPCPrologue).Screen;
            end, 
            navigationOptions = {
                renderUnderlyingPage = true, 
                disableBackButton = true, 
                overlayEnabled = true
            }
        }
    }
}, {
    initialRouteName = l_AppPage_0.TrustedFriendsUserModal, 
    keepVisitedScreensMounted = false, 
    backBehavior = v2.BackBehavior.History
}));