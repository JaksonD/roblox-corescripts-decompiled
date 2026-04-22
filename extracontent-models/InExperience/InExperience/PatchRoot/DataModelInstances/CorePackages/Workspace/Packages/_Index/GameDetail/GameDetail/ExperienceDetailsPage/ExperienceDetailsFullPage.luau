local l_Parent_0 = script:FindFirstAncestor("GameDetail").Parent;
local v1 = require(script.Parent.ExperienceDetailsPageUtils);
local v2 = require(script.Parent.ExperienceDetailsPageConstants);
local v3 = require(script.Parent.fetchExperienceDetailsPage);
local v4 = require(script.Parent.getExperienceDetailsPageKey);
local v5 = require(script.Parent.Fallback.ExperienceDetailsFallbackBannerImage);
local v6 = require(script.Parent.Fallback.ExperienceDetailsFallbackFeed);
local _ = require(l_Parent_0.Navigation);
local v8 = require(l_Parent_0.Foundation);
local v9 = require(l_Parent_0.React);
local l_useTokens_0 = v8.Hooks.useTokens;
local l_AppSessionService_0 = require(l_Parent_0.RoactServiceTags).AppSessionService;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_SessionType_0 = require(l_Parent_0.RobloxAppSessionization).SessionType;
local l_DetailsPageLayout_0 = require(l_Parent_0.AppBlox).DetailsPageLayout;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v17 = require(l_Parent_0.DataHydration);
local v18 = require(l_Parent_0.SduiSharedUtilities);
local l_SduiPageEntryPoint_0 = v18.SduiPageEntryPoint;
local l_SduiFeatureEntryPoint_0 = v18.SduiFeatureEntryPoint;
local l_SduiLoadTimer_0 = v18.SduiLoadTimer;
local l_UiStatus_0 = v18.UiStatus;
local l_useUiStatus_0 = v18.useUiStatus;
local l_CompositionTags_0 = require(l_Parent_0.AppComposition).CompositionTags;
local v25 = require(l_Parent_0.SharedFlags);
local l_FFlagSduiExperienceDetailsSupport_0 = v25.FFlagSduiExperienceDetailsSupport;
local l_FFlagSduiPageEntryUseSharedHooks_0 = v25.FFlagSduiPageEntryUseSharedHooks;
local v28 = game:DefineFastInt("EdpFullBleedOverlapOffset", 180);
local v29 = game:DefineFastInt("EdpBannerBottomVisiblePercent", 20);
return v9.memo(function(v30) --[[ Line: 42 ]] --[[ Name: ExperienceDetailsFullPage ]]
    -- upvalues: v1 (copy), v4 (copy), v9 (copy), l_useNavigation_0 (copy), l_useRoactService_0 (copy), l_AppSessionService_0 (copy), l_useTokens_0 (copy), l_SduiLoadTimer_0 (copy), l_AppPage_0 (copy), l_SessionType_0 (copy), v3 (copy), l_useUiStatus_0 (copy), l_UiStatus_0 (copy), v17 (copy), l_DetailsPageLayout_0 (copy), v28 (copy), v29 (copy), l_SduiFeatureEntryPoint_0 (copy), v2 (copy), v5 (copy), v8 (copy), l_SduiPageEntryPoint_0 (copy), l_FFlagSduiPageEntryUseSharedHooks_0 (copy), l_FFlagSduiExperienceDetailsSupport_0 (copy), l_CompositionTags_0 (copy), v6 (copy)
    local v31 = v1.getUniverseId(v30);
    local v32 = v4(v31);
    local v33 = v9.useRef(nil);
    local v34 = l_useNavigation_0();
    local v35 = l_useRoactService_0(l_AppSessionService_0);
    local v36 = l_useTokens_0();
    local v37 = v1.getFromPropsOrNavigationParams(v30, "referralSource");
    local v38 = v1.getFromPropsOrNavigationParams(v30, "experienceJoinData");
    local v39 = v1.getFromPropsOrNavigationParams(v30, "placeIdOverride");
    local v41 = v9.useMemo(function() --[[ Line: 56 ]]
        -- upvalues: v1 (ref), v30 (copy), l_SduiLoadTimer_0 (ref), l_AppPage_0 (ref)
        local v40 = v1.getFromPropsOrNavigationParams(v30, "pageTimer");
        if v40 then
            return v40;
        else
            return l_SduiLoadTimer_0.createLoadTimer(l_AppPage_0.ExperienceDetail);
        end;
    end, {});
    local v42 = v9.useCallback(function() --[[ Line: 64 ]]
        -- upvalues: v34 (copy), v35 (copy), l_SessionType_0 (ref)
        v34.goBack();
        if v35 then
            v35:RemoveSession(l_SessionType_0.StructuralIdentifier.GameDetailSource);
        end;
    end, {
        v34, 
        v35
    });
    v9.useEffect(function() --[[ Line: 71 ]]
        -- upvalues: v31 (copy), v41 (copy), v3 (ref)
        if v31 and v41 then
            v3(v31, v41);
        end;
    end, {
        v31, 
        v41
    });
    local v43 = l_useUiStatus_0(v32);
    v9.useEffect(function() --[[ Line: 78 ]]
        -- upvalues: v43 (copy), l_UiStatus_0 (ref), v31 (copy), v17 (ref)
        if v43 == l_UiStatus_0.Error and v31 then
            v17.Game.getGameInfoStore(false).getAndFetchGameInfo(v31, function(v44) --[[ Line: 82 ]]
                local v45 = true;
                if v44 ~= nil then
                    v45 = v44.creator == nil;
                end;
                return v45;
            end);
            v17.Game.getAgeRecommendationStore(false).getAndFetchAgeRecommendation(v31);
        end;
    end, {
        v43, 
        v31
    });
    local v46 = v9.useCallback(function() --[[ Line: 89 ]]
        -- upvalues: v31 (copy), v41 (copy), v3 (ref)
        if v31 and v41 then
            v3(v31, v41, true);
        end;
    end, {
        v31, 
        v41
    });
    if v31 == nil then
        return nil;
    else
        return v9.createElement(l_DetailsPageLayout_0.Root, {
            onClose = v42, 
            fullBleedOverlapOffset = v28, 
            bannerBottomVisiblePercent = v29 / 100, 
            fullBleedContent = v9.createElement(l_SduiFeatureEntryPoint_0, {
                appPage = l_AppPage_0.ExperienceDetail, 
                configKey = v32, 
                identifier = v2.EDP_BANNER_IMAGE_IDENTIFIER, 
                loadTimer = v41, 
                Size = UDim2.fromScale(1, 1), 
                loadingSlot = v9.createElement(v5.Skeleton), 
                errorSlot = v9.createElement(v5.Error, {
                    universeId = v31
                })
            })
        }, {
            Header = v9.createElement(l_DetailsPageLayout_0.Header, {
                closeIconName = v8.Enums.IconName.X, 
                backgroundColor = v36.Color.Surface.Surface_300
            }, {
                StickyHeaderContent = v9.createElement(l_SduiFeatureEntryPoint_0, {
                    appPage = l_AppPage_0.ExperienceDetail, 
                    configKey = v32, 
                    identifier = v2.EDP_STICKY_HEADER_IDENTIFIER, 
                    loadTimer = v41, 
                    shouldDisplayLoading = false, 
                    shouldDisplayError = false
                })
            }), 
            Content = v9.createElement(l_DetailsPageLayout_0.Content, {
                scrollingFrameRef = v33
            }, {
                Feed = v9.createElement(l_SduiPageEntryPoint_0, {
                    appPage = l_AppPage_0.ExperienceDetail, 
                    configKey = v32, 
                    identifier = if l_FFlagSduiPageEntryUseSharedHooks_0 then v2.EDP_FEED_IDENTIFIER else v1.getResolvedIdentifier(v32, v2.EDP_FEED_IDENTIFIER_SUFFIX), 
                    pageTimer = v41, 
                    includeNavigationHeaderBar = false, 
                    scrollingFrameRef = v33, 
                    backgroundStyle = v36.Color.None, 
                    disableRootPadding = l_FFlagSduiExperienceDetailsSupport_0 and true or nil, 
                    clipsDescendantsOverride = not l_FFlagSduiExperienceDetailsSupport_0 and nil, 
                    contentTag = l_CompositionTags_0.ContentRegion.Body, 
                    loadingSlot = v9.createElement(v6.Skeleton, {
                        universeId = v31, 
                        launchSource = "ExperienceDetailsPage", 
                        isSmallScreen = false, 
                        referralSource = v37, 
                        experienceJoinData = v38, 
                        placeIdOverride = v39
                    }), 
                    errorSlot = v9.createElement(v6.Error, {
                        universeId = v31, 
                        refresh = v46, 
                        launchSource = "ExperienceDetailsPage", 
                        isSmallScreen = false, 
                        referralSource = v37, 
                        experienceJoinData = v38, 
                        placeIdOverride = v39
                    })
                })
            })
        });
    end;
end);