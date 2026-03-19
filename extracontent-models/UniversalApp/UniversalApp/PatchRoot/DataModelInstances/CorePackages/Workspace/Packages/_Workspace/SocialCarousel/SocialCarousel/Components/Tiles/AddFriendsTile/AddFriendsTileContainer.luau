local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.RoactUtils);
local v5 = require(l_Parent_0.NavigationRodux);
local v6 = require(l_Parent_0.RobloxAppEnums);
local v7 = require(l_Parent_0.Navigation);
local l_AppPage_0 = v6.AppPage;
local l_NavigateDown_0 = v5.Thunks.NavigateDown;
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = v7.useNavigation;
local v12 = require(script.Parent.AddFriendsTile);
local v13 = require(l_script_FirstAncestor_0.Analytics.useSocialCarouselAnalytics);
local v14 = require(l_script_FirstAncestor_0.Contexts.useSocialCarouselContext);
local v15 = require(l_script_FirstAncestor_0.Common.Constants);
local v16 = require(l_script_FirstAncestor_0.Hooks.useNewFriendRequestsCount);
local l_FFlagCreateConnectionsHub_0 = require(l_Parent_0.SharedFlags).FFlagCreateConnectionsHub;
return function(v18) --[[ Line: 26 ]] --[[ Name: AddFriendsTileContainer ]]
    -- upvalues: l_useNavigation_0 (copy), l_useDispatch_0 (copy), v13 (copy), v14 (copy), v16 (copy), v3 (copy), l_FFlagCreateConnectionsHub_0 (copy), l_AppPage_0 (copy), l_NavigateDown_0 (copy), v15 (copy), v12 (copy), v2 (copy)
    local v19 = l_useNavigation_0();
    local v20 = l_useDispatch_0();
    local v21 = v13();
    local v22 = v14();
    local v23 = v16();
    local v24 = v3.useCallback(function() --[[ Line: 32 ]]
        -- upvalues: v21 (copy), v18 (copy), l_FFlagCreateConnectionsHub_0 (ref), v19 (copy), l_AppPage_0 (ref), v20 (copy), l_NavigateDown_0 (ref)
        v21.addFriendsPressed(v18.index);
        if l_FFlagCreateConnectionsHub_0 then
            v19.navigate(l_AppPage_0.CoHubAddConnections);
            return;
        else
            v20(l_NavigateDown_0({
                name = l_AppPage_0.AddFriendsPage
            }));
            return;
        end;
    end, {
        v20, 
        v19
    });
    v3.useEffect(function() --[[ Line: 41 ]]
        -- upvalues: v22 (copy), v15 (ref)
        v22.onSuccessfulRender(v15.ANALYTICS.UI_LOADING_EVENTS.ADD_FRIENDS);
    end, {});
    return v3.createElement(v12, v2.Dictionary.join(v18, {
        onActivated = v24, 
        badge = v23
    }));
end;