local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.NavigationRodux);
local v4 = require(l_Parent_0.RoactUtils);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_NavigateDown_0 = v3.Thunks.NavigateDown;
local v9 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v10 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local l_FFlagCreateConnectionsHub_0 = require(l_Parent_0.SharedFlags).FFlagCreateConnectionsHub;
return function(v15, v16, v17, v18) --[[ Line: 29 ]] --[[ Name: useSocialCountsActions ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), v2 (copy), v10 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_Url_0 (copy), v9 (copy), l_FFlagCreateConnectionsHub_0 (copy), l_UrlBuilder_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy)
    local v19 = l_useDispatch_0();
    local v20 = l_useNavigation_0();
    return v2.useMemo(function() --[[ Line: 38 ]]
        -- upvalues: v17 (copy), v10 (ref), v19 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v18 (copy), l_Url_0 (ref), v15 (copy), v9 (ref), v16 (copy), l_FFlagCreateConnectionsHub_0 (ref), v20 (copy), l_UrlBuilder_0 (ref), l_FFlagConnectionsToFriendsRename_0 (ref)
        return {
            mutualFriendsCount = function() --[[ Line: 40 ]] --[[ Name: mutualFriendsCount ]]
                -- upvalues: v17 (ref), v10 (ref), v19 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v18 (ref)
                v17.fireAnalyticsEvent(v10.MutualFriendsButton);
                v19(l_NavigateDown_0({
                    name = l_AppPage_0.MutualConnectionList, 
                    extraProps = {
                        mutualFriendIds = v18
                    }
                }));
            end, 
            followersCount = function() --[[ Line: 50 ]] --[[ Name: followersCount ]]
                -- upvalues: v17 (ref), v10 (ref), v19 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_Url_0 (ref), v15 (ref), v9 (ref)
                v17.fireAnalyticsEvent(v10.FollowersButton);
                v19(l_NavigateDown_0({
                    name = l_AppPage_0.GenericWebPage, 
                    detail = ("%*users/%*/friends#!/followers"):format(l_Url_0.BASE_URL, v15), 
                    extraProps = {
                        titleKey = v9.Followers
                    }
                }));
            end, 
            followingsCount = function() --[[ Line: 61 ]] --[[ Name: followingsCount ]]
                -- upvalues: v17 (ref), v10 (ref), v19 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_Url_0 (ref), v15 (ref), v9 (ref)
                v17.fireAnalyticsEvent(v10.FollowingsButton);
                v19(l_NavigateDown_0({
                    name = l_AppPage_0.GenericWebPage, 
                    detail = ("%*users/%*/friends#!/following"):format(l_Url_0.BASE_URL, v15), 
                    extraProps = {
                        titleKey = v9.Following
                    }
                }));
            end, 
            friendsCount = function() --[[ Line: 72 ]] --[[ Name: friendsCount ]]
                -- upvalues: v17 (ref), v10 (ref), v16 (ref), l_FFlagCreateConnectionsHub_0 (ref), v20 (ref), l_AppPage_0 (ref), v19 (ref), l_NavigateDown_0 (ref), l_UrlBuilder_0 (ref), v15 (ref), l_FFlagConnectionsToFriendsRename_0 (ref), v9 (ref)
                v17.fireAnalyticsEvent(v10.FriendsButton);
                if v16 then
                    if l_FFlagCreateConnectionsHub_0 then
                        v20.navigate(l_AppPage_0.CoHubMyConnections);
                        return;
                    else
                        v19(l_NavigateDown_0({
                            name = l_AppPage_0.ViewFriends, 
                            extraProps = {
                                navigateToFriendsLandingEventStart = {
                                    startPage = l_AppPage_0.ProfilePlatform, 
                                    startTime = os.clock()
                                }
                            }
                        }));
                        return;
                    end;
                else
                    v19(l_NavigateDown_0({
                        name = l_AppPage_0.GenericWebPage, 
                        detail = l_UrlBuilder_0.user.friends({
                            userId = v15
                        }), 
                        extraProps = {
                            titleKey = if l_FFlagConnectionsToFriendsRename_0 then v9.Friends else v9.Connections
                        }
                    }));
                    return;
                end;
            end
        };
    end, {
        v15, 
        v16, 
        v17, 
        v19, 
        v18
    });
end;