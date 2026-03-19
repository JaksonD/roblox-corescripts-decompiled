local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RobloxAppEnums);
local v4 = require(l_Parent_0.RoactUtils);
local v5 = require(script.Parent.Carousel);
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v7 = require(l_Parent_0.Navigation);
local v8 = require(l_script_FirstAncestor_0.Analytics.useSocialCarouselAnalytics);
local v9 = require(l_script_FirstAncestor_0.Analytics.useTilesSeenCollection);
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local l_AppPage_0 = v3.AppPage;
local l_useNavigation_0 = v7.useNavigation;
local l_FFlagCreateConnectionsHub_0 = require(l_Parent_0.SharedFlags).FFlagCreateConnectionsHub;
local l_FFlagRemoveFriendsRenameInfoModal_0 = require(l_Parent_0.SharedFlags).FFlagRemoveFriendsRenameInfoModal;
return function() --[[ Line: 19 ]] --[[ Name: CarouselContainer ]]
    -- upvalues: v8 (copy), v9 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), v2 (copy), l_FFlagCreateConnectionsHub_0 (copy), l_AppPage_0 (copy), l_NavigateDown_0 (copy), l_FFlagRemoveFriendsRenameInfoModal_0 (copy), v5 (copy)
    local v15 = v8();
    local v16 = v9();
    local v17 = l_useDispatch_0();
    local v18 = l_useNavigation_0();
    local v19 = v2.useRef({
        startIndex = 1, 
        endIndex = 1
    });
    local v20 = v2.useCallback(function() --[[ Line: 26 ]]
        -- upvalues: v15 (copy), l_FFlagCreateConnectionsHub_0 (ref), v18 (copy), l_AppPage_0 (ref), v17 (copy), l_NavigateDown_0 (ref)
        v15.friendsHeaderPressed();
        if l_FFlagCreateConnectionsHub_0 then
            v18.navigate(l_AppPage_0.CoHubMyConnections);
            return;
        else
            v17(l_NavigateDown_0({
                name = l_AppPage_0.ViewFriends
            }));
            return;
        end;
    end, {
        v17, 
        v18
    });
    local v21 = if l_FFlagRemoveFriendsRenameInfoModal_0 then nil else v2.useCallback(function() --[[ Line: 37 ]]
        -- upvalues: v18 (copy), l_AppPage_0 (ref)
        v18.push(l_AppPage_0.FriendsRenameInfoModal);
    end, {
        v18
    });
    local v26 = v2.useCallback(function(v22, v23, v24) --[[ Line: 41 ]]
        -- upvalues: v19 (copy), v16 (copy)
        local l_current_0 = v19.current;
        if l_current_0.startIndex <= v23 and v23 <= l_current_0.endIndex then
            v16.addTileToCollection(v22, v23, v24);
        end;
    end, {
        v16
    });
    return v2.createElement(v5, {
        onActivateHeader = v20, 
        onActivateInfoIcon = if l_FFlagRemoveFriendsRenameInfoModal_0 then nil else v21, 
        onTileContentChanged = v26
    });
end;