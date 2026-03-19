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
local l_FFlagCreateConnectionsHub_0 = require(l_Parent_0.SharedFlags).FFlagCreateConnectionsHub;
return function(v14, v15, v16, v17) --[[ Line: 28 ]] --[[ Name: useSocialCountsActions ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), v2 (copy), v10 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_Url_0 (copy), v9 (copy), l_FFlagCreateConnectionsHub_0 (copy), l_UrlBuilder_0 (copy)
    local v18 = l_useDispatch_0();
    local v19 = l_useNavigation_0();
    return v2.useMemo(function() --[[ Line: 37 ]]
        -- upvalues: v16 (copy), v10 (ref), v18 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v17 (copy), l_Url_0 (ref), v14 (copy), v9 (ref), v15 (copy), l_FFlagCreateConnectionsHub_0 (ref), v19 (copy), l_UrlBuilder_0 (ref)
        return {
            mutualFriendsCount = function() --[[ Line: 39 ]] --[[ Name: mutualFriendsCount ]]
                -- upvalues: v16 (ref), v10 (ref), v18 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v17 (ref)
                v16.fireAnalyticsEvent(v10.MutualFriendsButton);
                v18(l_NavigateDown_0({
                    name = l_AppPage_0.MutualConnectionList, 
                    extraProps = {
                        mutualFriendIds = v17
                    }
                }));
            end, 
            followersCount = function() --[[ Line: 49 ]] --[[ Name: followersCount ]]
                -- upvalues: v16 (ref), v10 (ref), v18 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_Url_0 (ref), v14 (ref), v9 (ref)
                v16.fireAnalyticsEvent(v10.FollowersButton);
                v18(l_NavigateDown_0({
                    name = l_AppPage_0.GenericWebPage, 
                    detail = ("%*users/%*/friends#!/followers"):format(l_Url_0.BASE_URL, v14), 
                    extraProps = {
                        titleKey = v9.Followers
                    }
                }));
            end, 
            followingsCount = function() --[[ Line: 60 ]] --[[ Name: followingsCount ]]
                -- upvalues: v16 (ref), v10 (ref), v18 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_Url_0 (ref), v14 (ref), v9 (ref)
                v16.fireAnalyticsEvent(v10.FollowingsButton);
                v18(l_NavigateDown_0({
                    name = l_AppPage_0.GenericWebPage, 
                    detail = ("%*users/%*/friends#!/following"):format(l_Url_0.BASE_URL, v14), 
                    extraProps = {
                        titleKey = v9.Following
                    }
                }));
            end, 
            friendsCount = function() --[[ Line: 71 ]] --[[ Name: friendsCount ]]
                -- upvalues: v16 (ref), v10 (ref), v15 (ref), l_FFlagCreateConnectionsHub_0 (ref), v19 (ref), l_AppPage_0 (ref), v18 (ref), l_NavigateDown_0 (ref), l_UrlBuilder_0 (ref), v14 (ref), v9 (ref)
                v16.fireAnalyticsEvent(v10.FriendsButton);
                if v15 then
                    if l_FFlagCreateConnectionsHub_0 then
                        v19.navigate(l_AppPage_0.CoHubMyConnections);
                        return;
                    else
                        v18(l_NavigateDown_0({
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
                    v18(l_NavigateDown_0({
                        name = l_AppPage_0.GenericWebPage, 
                        detail = l_UrlBuilder_0.user.friends({
                            userId = v14
                        }), 
                        extraProps = {
                            titleKey = v9.Connections
                        }
                    }));
                    return;
                end;
            end
        };
    end, {
        v14, 
        v15, 
        v16, 
        v18, 
        v17
    });
end;