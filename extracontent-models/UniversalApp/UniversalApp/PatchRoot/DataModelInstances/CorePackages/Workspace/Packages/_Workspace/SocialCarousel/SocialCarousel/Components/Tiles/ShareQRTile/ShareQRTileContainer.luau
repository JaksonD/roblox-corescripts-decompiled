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
local l_NavigateBack_0 = v5.Thunks.NavigateBack;
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = v7.useNavigation;
local v13 = require(script.Parent.ShareQRTile);
local v14 = require(l_script_FirstAncestor_0.Analytics.useSocialCarouselAnalytics);
local v15 = require(l_script_FirstAncestor_0.Contexts.useSocialCarouselContext);
local v16 = require(l_script_FirstAncestor_0.Common.Constants);
local l_FFlagSocialCarouselShareQRBackToAddFriends_0 = require(l_Parent_0.SharedFlags).FFlagSocialCarouselShareQRBackToAddFriends;
local l_FFlagCreateConnectionsHub_0 = require(l_Parent_0.SharedFlags).FFlagCreateConnectionsHub;
return function(v19) --[[ Line: 28 ]] --[[ Name: ShareQRTileContainer ]]
    -- upvalues: l_useNavigation_0 (copy), l_useDispatch_0 (copy), v14 (copy), v15 (copy), v3 (copy), l_FFlagSocialCarouselShareQRBackToAddFriends_0 (copy), l_NavigateBack_0 (copy), l_FFlagCreateConnectionsHub_0 (copy), l_AppPage_0 (copy), l_NavigateDown_0 (copy), v16 (copy), v13 (copy), v2 (copy)
    local v20 = l_useNavigation_0();
    local v21 = l_useDispatch_0();
    local v22 = v14();
    local v23 = v15();
    local v25 = v3.useCallback(function() --[[ Line: 35 ]]
        -- upvalues: v22 (copy), v19 (copy), l_FFlagSocialCarouselShareQRBackToAddFriends_0 (ref), v21 (copy), l_NavigateBack_0 (ref), l_FFlagCreateConnectionsHub_0 (ref), v20 (copy), l_AppPage_0 (ref), l_NavigateDown_0 (ref), v23 (copy), v16 (ref)
        v22.shareQRPressed(v19.index);
        local v24 = nil;
        if l_FFlagSocialCarouselShareQRBackToAddFriends_0 then
            v24 = function() --[[ Line: 39 ]]
                -- upvalues: v21 (ref), l_NavigateBack_0 (ref), l_FFlagCreateConnectionsHub_0 (ref), v20 (ref), l_AppPage_0 (ref), l_NavigateDown_0 (ref)
                v21(l_NavigateBack_0(true));
                if l_FFlagCreateConnectionsHub_0 then
                    v20.navigate(l_AppPage_0.CoHubAddConnections);
                    return;
                else
                    v21(l_NavigateDown_0({
                        name = l_AppPage_0.AddFriendsPage
                    }));
                    return;
                end;
            end;
        end;
        if v23.navigateToQRCodePage then
            v23.navigateToQRCodePage({
                source = v16.ANALYTICS.SRC.HOMEPAGE_FRIENDS_CAROUSEL, 
                onClose = v24
            });
        end;
    end, {
        v21, 
        v20, 
        v19.index, 
        v22.shareQRPressed, 
        v23.navigateToQRCodePage
    });
    v3.useEffect(function() --[[ Line: 66 ]]
        -- upvalues: v23 (copy), v16 (ref)
        v23.onSuccessfulRender(v16.ANALYTICS.UI_LOADING_EVENTS.SHARE_QR);
    end, {});
    return v3.createElement(v13, v2.Dictionary.join(v19, {
        onActivated = v25
    }));
end;