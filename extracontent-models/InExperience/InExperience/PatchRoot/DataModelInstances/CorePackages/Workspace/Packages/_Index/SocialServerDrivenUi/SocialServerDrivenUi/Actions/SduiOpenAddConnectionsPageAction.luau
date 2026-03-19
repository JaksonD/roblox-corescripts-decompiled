local l_Parent_0 = script:FindFirstAncestor("SocialServerDrivenUi").Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local _ = require(l_Parent_0.SduiCoreSystem);
local l_FFlagCreateConnectionsHub_0 = require(l_Parent_0.SharedFlags).FFlagCreateConnectionsHub;
return function(_, _, v7, _) --[[ Line: 14 ]]
    -- upvalues: l_FFlagCreateConnectionsHub_0 (copy), l_AppPage_0 (copy), l_NavigateDown_0 (copy)
    if l_FFlagCreateConnectionsHub_0 then
        v7.dependencies.getNavigation().navigate(l_AppPage_0.CoHubAddConnections);
        return;
    else
        v7.dependencies.dispatch(l_NavigateDown_0({
            name = l_AppPage_0.AddFriendsPage
        }));
        return;
    end;
end;