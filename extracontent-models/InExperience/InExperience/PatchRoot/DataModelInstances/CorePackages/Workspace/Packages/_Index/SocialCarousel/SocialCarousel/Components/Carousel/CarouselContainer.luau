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
local l_FFlagLuaAppCompositionSupport_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionSupport;
local l_FFlagCreateConnectionsHub_0 = require(l_Parent_0.SharedFlags).FFlagCreateConnectionsHub;
local l_FFlagRemoveFriendsRenameInfoModal_0 = require(l_Parent_0.SharedFlags).FFlagRemoveFriendsRenameInfoModal;
return function(v16) --[[ Line: 24 ]] --[[ Name: CarouselContainer ]]
    -- upvalues: v8 (copy), v9 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), v2 (copy), l_FFlagCreateConnectionsHub_0 (copy), l_AppPage_0 (copy), l_NavigateDown_0 (copy), l_FFlagRemoveFriendsRenameInfoModal_0 (copy), v5 (copy), l_FFlagLuaAppCompositionSupport_0 (copy)
    local v17 = v8();
    local v18 = v9();
    local v19 = l_useDispatch_0();
    local v20 = l_useNavigation_0();
    local v21 = v2.useRef({
        startIndex = 1, 
        endIndex = 1
    });
    local v22 = v2.useCallback(function() --[[ Line: 31 ]]
        -- upvalues: v17 (copy), l_FFlagCreateConnectionsHub_0 (ref), v20 (copy), l_AppPage_0 (ref), v19 (copy), l_NavigateDown_0 (ref)
        v17.friendsHeaderPressed();
        if l_FFlagCreateConnectionsHub_0 then
            v20.navigate(l_AppPage_0.CoHubMyConnections);
            return;
        else
            v19(l_NavigateDown_0({
                name = l_AppPage_0.ViewFriends
            }));
            return;
        end;
    end, {
        v19, 
        v20
    });
    local v23 = if l_FFlagRemoveFriendsRenameInfoModal_0 then nil else v2.useCallback(function() --[[ Line: 42 ]]
        -- upvalues: v20 (copy), l_AppPage_0 (ref)
        v20.push(l_AppPage_0.FriendsRenameInfoModal);
    end, {
        v20
    });
    local v28 = v2.useCallback(function(v24, v25, v26) --[[ Line: 46 ]]
        -- upvalues: v21 (copy), v18 (copy)
        local l_current_0 = v21.current;
        if l_current_0.startIndex <= v25 and v25 <= l_current_0.endIndex then
            v18.addTileToCollection(v24, v25, v26);
        end;
    end, {
        v18
    });
    return v2.createElement(v5, {
        onActivateHeader = v22, 
        onActivateInfoIcon = if l_FFlagRemoveFriendsRenameInfoModal_0 then nil else v23, 
        onTileContentChanged = v28, 
        appCompositionEnabled = if l_FFlagLuaAppCompositionSupport_0 then v16.appCompositionEnabled else nil
    });
end;