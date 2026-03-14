local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v4 = require(l_Parent_1.CapturesCommon);
local l_CloseCentralOverlay_0 = require(l_Parent_1.CentralOverlay).Thunks.CloseCentralOverlay;
local v6 = require(l_Parent_1.GenericAbuseReporting);
local v7 = require(l_Parent_1.Http);
local v8 = require(l_Parent_1.LuaSocialLibrariesDeps);
local v9 = require(l_Parent_1.NavigationRodux);
local v10 = require(l_Parent_1.React);
local l_RoactAppPolicy_0 = require(l_Parent_1.UniversalAppPolicy).RoactAppPolicy;
local v12 = require(l_Parent_1.RoactRodux);
local v13 = require(l_Parent_1.RoactUtils);
local v14 = require(l_Parent_1.RobloxAppEnums);
local v15 = require(l_Parent_1.Style);
local v16 = require(l_Parent_0.Analytics.AnalyticsService);
local l_AppFeaturePolicies_0 = require(l_Parent_1.UniversalAppPolicy).AppFeaturePolicies;
local l_AppPage_0 = v14.AppPage;
local v19 = require(l_Parent_0.Constants);
local v20 = require(l_Parent_0.createStore);
local v21 = require(l_Parent_0.Components.Feed);
local v22 = require(l_Parent_0.App.FeedContext);
local l_getDeepValue_0 = v8.SocialLibraries.config({}).Dictionary.getDeepValue;
local l_GetExperiencesDetails_0 = require(l_Parent_0.App.Networking).NetworkingGames.GetExperiencesDetails;
local v25 = require(l_Parent_0.Utils.getUniverseIds);
local l_Localization_0 = require(l_Parent_1.RobloxAppLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_1.Localization).LocalizationProvider;
local l_NavigateBack_0 = v9.Thunks.NavigateBack;
local l_NavigateDown_0 = v9.Thunks.NavigateDown;
local v30 = require(l_Parent_0.App.Networking);
local l_onViewportSizeChanged_0 = v4.Utils.onViewportSizeChanged;
local v32 = require(l_Parent_0.Thunks.OpenAppItemDetails);
local v33 = require(l_Parent_1.RobloxAppNavigation);
local v34 = require(l_Parent_0.Actions.ScreenSizeChanged);
local v35 = require(l_Parent_0.Analytics.setupFireEvent);
local l_StyleProviderWithDefaultTheme_0 = v15.StyleProviderWithDefaultTheme;
local _ = require(l_Parent_0.Types);
local l_Url_0 = v7.Url;
local v39 = require(l_Parent_1.Foundation);
local l_FoundationProvider_0 = v39.FoundationProvider;
local l_AbuseVector_0 = v6.Enums.AbuseVector;
local l_OpenDynamicAbuseReport_0 = v6.Thunks.OpenDynamicAbuseReport;
local l_useCallback_0 = v10.useCallback;
local l_useDispatch_0 = v13.Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v10.useEffect;
local l_useNavigationProps_0 = v33.useNavigationProps;
local l_useState_0 = v10.useState;
local v48 = require(l_Parent_0.Flags.FIntContentFeedInitialPostLoadLimit);
local l_FFlagEnableAbuseReportRevampFlow_0 = require(l_Parent_1.SharedFlags).FFlagEnableAbuseReportRevampFlow;
local v50 = game:DefineFastFlag("EnableAbuseReportRevampPost", false);
local v51 = v20();
return function() --[[ Line: 62 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useState_0 (copy), l_useNavigationProps_0 (copy), l_useEffect_0 (copy), v51 (copy), v30 (copy), v48 (copy), l_getDeepValue_0 (copy), v25 (copy), l_GetExperiencesDetails_0 (copy), l_onViewportSizeChanged_0 (copy), v34 (copy), l_useCallback_0 (copy), v35 (copy), v16 (copy), v19 (copy), v10 (copy), l_NavigateBack_0 (copy), l_FFlagEnableAbuseReportRevampFlow_0 (copy), v50 (copy), l_OpenDynamicAbuseReport_0 (copy), l_AbuseVector_0 (copy), l_CloseCentralOverlay_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_Url_0 (copy), l_HttpService_0 (copy), v32 (copy), v12 (copy), v22 (copy), l_RoactAppPolicy_0 (copy), l_AppFeaturePolicies_0 (copy), l_FoundationProvider_0 (copy), v39 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_StyleProviderWithDefaultTheme_0 (copy), v21 (copy)
    local v52 = l_useDispatch_0();
    local v53, v54 = l_useState_0(false);
    local v55, v56 = l_useState_0(false);
    local v60 = l_useNavigationProps_0(function(_, v58, _) --[[ Line: 68 ]]
        return {
            onNavigateBackCallback = v58.onNavigateBackCallback, 
            postId = v58.postId, 
            userId = tostring(v58.userId)
        };
    end);
    l_useEffect_0(function() --[[ Line: 76 ]]
        -- upvalues: v51 (ref), v30 (ref), v48 (ref), v60 (copy), l_getDeepValue_0 (ref), v25 (ref), l_GetExperiencesDetails_0 (ref), v54 (copy)
        v51:dispatch(v30.ContentSharingNetworking.GetPostsByPostId.API({
            limit = v48, 
            postId = v60.postId, 
            userId = v60.userId
        })):andThen(function() --[[ Line: 83 ]]
            -- upvalues: l_getDeepValue_0 (ref), v51 (ref), v60 (ref), v25 (ref), l_GetExperiencesDetails_0 (ref)
            local v61 = l_getDeepValue_0(v51:getState(), "ContentSharing.byUserId." .. v60.userId .. ".posts") or {};
            local v62 = v25(v61);
            v51:dispatch(l_GetExperiencesDetails_0.API(v62));
        end):catch(function() --[[ Line: 91 ]]
            -- upvalues: v54 (ref)
            v54(true);
        end);
    end, {
        v60.postId, 
        v60.userId
    });
    l_useEffect_0(function() --[[ Line: 97 ]]
        -- upvalues: l_onViewportSizeChanged_0 (ref), v51 (ref), v34 (ref)
        return (l_onViewportSizeChanged_0(function(v63) --[[ Line: 98 ]]
            -- upvalues: v51 (ref), v34 (ref)
            v51:dispatch(v34(v63));
        end));
    end, {});
    local v64 = l_useCallback_0(v35({
        analytics = v16, 
        infoForAllEvents = {
            creatorUserId = v60.userId, 
            source = v19.AnalyticsSource
        }
    }), {
        v60.userId
    });
    local v66 = v10.useCallback(function(v65) --[[ Line: 116 ]]
        -- upvalues: v60 (copy), v52 (copy), l_NavigateBack_0 (ref)
        if v60.onNavigateBackCallback ~= nil then
            v60.onNavigateBackCallback(v65);
        end;
        v52(l_NavigateBack_0());
    end, {
        v60.onNavigateBackCallback
    });
    local v68 = v10.useCallback(function(v67) --[[ Line: 123 ]]
        -- upvalues: l_FFlagEnableAbuseReportRevampFlow_0 (ref), v50 (ref), v52 (copy), l_OpenDynamicAbuseReport_0 (ref), l_AbuseVector_0 (ref), l_CloseCentralOverlay_0 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v19 (ref), l_Url_0 (ref), l_HttpService_0 (ref)
        if l_FFlagEnableAbuseReportRevampFlow_0 and v50 then
            v52(l_OpenDynamicAbuseReport_0({
                abuseVector = l_AbuseVector_0.ContentPostScreenshot, 
                targetId = v67, 
                onClose = function() --[[ Line: 128 ]] --[[ Name: onClose ]]
                    -- upvalues: v52 (ref), l_CloseCentralOverlay_0 (ref)
                    v52(l_CloseCentralOverlay_0());
                end
            }));
            return;
        else
            v52(l_NavigateDown_0({
                name = l_AppPage_0.GenericWebPage, 
                detail = string.format(v19.AbuseReportUrl, l_Url_0.BASE_URL, l_HttpService_0:UrlEncode(v67)), 
                extraProps = {
                    titleKey = "Feature.Catalog.Action.Report"
                }
            }, nil));
            return;
        end;
    end, {});
    local v70 = v10.useCallback(function(v69) --[[ Line: 143 ]]
        -- upvalues: v52 (copy), v32 (ref)
        v52(v32(v69));
    end, {});
    return v10.createElement(v12.StoreProvider, {
        store = v51
    }, {
        ContextProvider = v10.createElement(v22.Provider, {
            value = {
                fireAnalyticsEvent = v64, 
                isZooming = v55, 
                navigateBack = v66, 
                navigateToItemDetailPage = v70, 
                navigateToReportPage = v68, 
                setIsZooming = v56
            }
        }, {
            PolicyProvider = v10.createElement(l_RoactAppPolicy_0.Provider, {
                policy = {
                    l_AppFeaturePolicies_0
                }
            }, {
                FoundationProvider = v10.createElement(l_FoundationProvider_0, {
                    theme = v39.Enums.Theme.Dark, 
                    DONOTUSE_colorUpdate = true
                }, {
                    LocalizationProvider = v10.createElement(l_LocalizationProvider_0, {
                        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
                    }, {
                        StyleProvider = v10.createElement(l_StyleProviderWithDefaultTheme_0, {
                            withDarkTheme = true
                        }, {
                            Feed = v10.createElement(v21, {
                                creatorUserId = v60.userId, 
                                initialPostId = v60.postId, 
                                initialPostsCallFailed = v53
                            })
                        })
                    })
                })
            })
        })
    });
end;