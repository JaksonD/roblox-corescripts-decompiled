local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v2.Roact;
local l_Logger_0 = v2.Logger;
local l_RoactRodux_0 = v2.RoactRodux;
local l_RoactAppExperiment_0 = v2.RoactAppExperiment;
local v7 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v8 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics);
local v9 = require(l_script_FirstAncestor_0.Navigator);
local v10 = require(l_script_FirstAncestor_0.EnumScreens);
local v11 = require(l_script_FirstAncestor_0.Friends.filterStates);
local l_memoize_0 = v2.memoize;
local l_SocialLibraries_0 = v2.SocialLibraries;
local l_BottomInsetBackground_0 = v2.SocialCommon.Components.BottomInsetBackground;
local l_compose_0 = l_SocialLibraries_0.RoduxTools.compose;
local v16 = require(script.mapStateToProps);
local v17 = require(script.mapDispatchToProps);
local l_withLocalization_0 = v2.withLocalization;
local l_getFStringSocialAddFriendsPageLayer_0 = v2.getFStringSocialAddFriendsPageLayer;
local l_FFlagContactImporterIXPCleanup_0 = require(l_Parent_0.SharedFlags).FFlagContactImporterIXPCleanup;
local l_FFlagFriendsPageAlwaysOpenPPV_0 = require(l_Parent_0.SharedFlags).FFlagFriendsPageAlwaysOpenPPV;
local function v22() --[[ Line: 29 ]]

end;
local v23 = l_Roact_0.PureComponent:extend("FriendsLandingEntryPoint");
v23.defaultProps = {
    renderAndroidBackButtonNavigationHandler = nil, 
    luaAppPages = {}, 
    isLuobu = false, 
    logger = nil, 
    debug_willUnmount = nil
};
v23.init = function(v24) --[[ Line: 45 ]] --[[ Name: init ]]
    -- upvalues: l_Logger_0 (copy), v11 (copy), v10 (copy), v22 (copy), l_memoize_0 (copy), v8 (copy)
    if v24.props.logger then
        l_Logger_0:setParent(v24.props.logger);
    end;
    v24.state = {
        filter = v11.All, 
        topBar = {
            [v10.FriendsLanding] = {
                shouldRenderCenter = false
            }
        }
    };
    v24.localization = {
        pageError = "CommonUI.Messages.Response.PageError"
    };
    v24.setFilterKeys = function(v25) --[[ Line: 63 ]]
        -- upvalues: v24 (copy)
        assert(type(v25) == "string", "Expected value to be a string");
        v24:setState({
            filter = v25
        });
    end;
    v24.showErrorToast = function(v26) --[[ Line: 68 ]]
        -- upvalues: v24 (copy), v10 (ref)
        v24.props.navigation.navigate(v10.GenericToast, {
            toastProps = {
                toastContent = {
                    toastTitle = v26
                }
            }
        });
    end;
    v24.refreshPage = function(v27) --[[ Line: 78 ]]
        -- upvalues: v24 (copy), l_Logger_0 (ref), v22 (ref)
        return v24.props.refreshPageData({
            localUserId = v24.props.localUserId, 
            inactiveFriendsNetworkRequestStatus = v24.props.inactiveFriendsNetworkRequestStatus, 
            onError = function() --[[ Line: 82 ]] --[[ Name: onError ]]
                -- upvalues: v24 (ref), v27 (copy), l_Logger_0 (ref)
                v24.showErrorToast(v27.errorMessage);
                l_Logger_0:info("Refreshing FriendsLanding data failed");
            end, 
            onResolve = v27.onResolve or v22
        });
    end;
    v24.getAnalytics = l_memoize_0(function(v28) --[[ Line: 90 ]]
        -- upvalues: v8 (ref), v24 (copy)
        return v8.Class.new({
            Diag = v24.props.diagService, 
            EventStream = v24.props.eventIngestService
        }, v28, v24.props.getLoadingTimeInfo);
    end);
end;
v23.render = function(v29) --[[ Line: 98 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), l_Roact_0 (copy), v8 (copy), v7 (copy), l_FFlagContactImporterIXPCleanup_0 (copy), l_FFlagFriendsPageAlwaysOpenPPV_0 (copy), v9 (copy), l_BottomInsetBackground_0 (copy)
    return l_withLocalization_0(v29.localization)(function(_) --[[ Line: 99 ]]
        -- upvalues: l_Roact_0 (ref), v8 (ref), v29 (copy), v7 (ref), l_FFlagContactImporterIXPCleanup_0 (ref), l_FFlagFriendsPageAlwaysOpenPPV_0 (ref), v9 (ref), l_BottomInsetBackground_0 (ref)
        return l_Roact_0.createElement(v8.Context.Provider, {
            value = v29.getAnalytics(v29.props.localUserId)
        }, {
            l_Roact_0.createElement(v7.Provider, {
                value = {
                    navigateToLuaAppPages = v29.props.navigateToLuaAppPages, 
                    filter = v29.state.filter, 
                    setFilterKeys = v29.setFilterKeys, 
                    screenSize = v29.props.screenSize, 
                    friendRequestCount = v29.props.friendRequestCount, 
                    totalFriendCount = v29.props.totalFriendCount, 
                    wideMode = v29.props.wideMode, 
                    playerSearchPage = v29.props.luaAppPages.playerSearchPage, 
                    diagService = v29.props.diagService, 
                    eventIngestService = v29.props.eventIngestService, 
                    isLuobu = v29.props.isLuobu, 
                    refreshPage = v29.refreshPage, 
                    friendsRequestEventListener = v29.props.friendsRequestEventListener, 
                    robloxEventReceiver = v29.props.robloxEventReceiver, 
                    contactImporterAndPYMKEnabled = if l_FFlagContactImporterIXPCleanup_0 then nil else v29.props.contactImporterAndPYMKEnabled, 
                    contactImporterExperimentVariant = if l_FFlagContactImporterIXPCleanup_0 then nil else v29.props.contactImporterExperimentVariant, 
                    addFriendsPageSearchbarEnabled = v29.props.addFriendsPageSearchbarEnabled, 
                    openProfilePeekView = v29.props.openProfilePeekView, 
                    openPlayerContextualMenu = if l_FFlagFriendsPageAlwaysOpenPPV_0 then nil else v29.props.openPlayerContextualMenu, 
                    openAmpUpsell = v29.props.openAmpUpsell, 
                    passedNavParams = v29.props.passedNavParams
                }
            }, {
                navigation = l_Roact_0.createElement(v9, {
                    navigation = v29.props.navigation
                }), 
                BottomInsetBackground = l_Roact_0.createElement(l_BottomInsetBackground_0)
            })
        });
    end);
end;
v23.didMount = function(_) --[[ Line: 145 ]] --[[ Name: didMount ]]
    -- upvalues: l_Logger_0 (copy)
    l_Logger_0:info("FriendsLandingEntryPoint mounted");
end;
v23.willUnmount = function(v32) --[[ Line: 149 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_Logger_0 (copy)
    l_Logger_0:info("FriendsLandingEntryPoint unmounted");
    if v32.props.debug_willUnmount then
        v32.props.debug_willUnmount();
    end;
end;
return (l_compose_0(l_RoactRodux_0.connect(v16, v17), l_RoactAppExperiment_0.connectUserLayer({
    l_getFStringSocialAddFriendsPageLayer_0()
}, function(v33, _) --[[ Line: 160 ]]
    -- upvalues: l_getFStringSocialAddFriendsPageLayer_0 (copy)
    return {
        addFriendsPageSearchbarEnabled = (v33[l_getFStringSocialAddFriendsPageLayer_0()] or {}).show_add_friends_page_search_bar
    };
end, false))(v23));