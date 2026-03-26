local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useContactImporterConfiguration_0 = require(l_CorePackages_0.Workspace.Packages.ContactImporter).Utils.useContactImporterConfiguration;
local l_UniversalAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).UniversalAppPolicy;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v11 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagLuaAppCompositionSupport_0 = v11.FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppCompositionAlways_0 = v11.FFlagLuaAppCompositionAlways;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v15 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes);
local l_OmniFeedConstants_0 = v15.OmniFeedConstants;
local l_RoactAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactAnalytics;
local l_AppEventIngestService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppEventIngestService;
local l_SetCurrentToastMessage_0 = require(l_CorePackages_0.Workspace.Packages.ToastRodux).Actions.SetCurrentToastMessage;
local l_OmniFeedProps_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.Personalization.OmniFeed.OmniFeedProps;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v22 = require(l_Modules_0.LuaApp.Thunks.NavigateToUserInfo);
local v23 = require(l_Modules_0.LuaApp.Thunks.NavigateDownToAddFriendsPage);
local v24 = require(l_Modules_0.LuaApp.Components.FriendsCarousel.utils.useNavigateFromAddFriends);
local v25 = require(l_CorePackages_0.Packages.LuaSocialLibrariesDeps);
local l_getDeepValue_0 = v25.SocialLibraries.config({}).Dictionary.getDeepValue;
local l_llama_0 = v25.llama;
local l_getFFlagPYMKAddFriendsEntry_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFFlagPYMKAddFriendsEntry;
local v29 = require(l_Modules_0.Personalization.Flags.getFFlagPYMKShowAddFriendsButton_DEV);
local l_FFlagCreateConnectionsHub_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagCreateConnectionsHub;
local l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 = v15.Constants.GAME_CAROUSEL_SIDE_COMPACT_PADDING;
local l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 = v15.Constants.GAME_CAROUSEL_SIDE_WIDE_PADDING;
local l_PYMKCarouselEntryPoint_0 = require(l_Modules_0.LuaApp.Components.PYMKCarousel.api).PYMKCarouselEntryPoint;
local v35 = {
    renderFriendRecommendationCarousel = function(v34) --[[ Line: 81 ]] --[[ Name: renderFriendRecommendationCarousel ]]
        -- upvalues: v1 (copy), l_PYMKCarouselEntryPoint_0 (copy)
        return v1.createElement(l_PYMKCarouselEntryPoint_0, v34);
    end
};
local v62 = l_RoactServices_0.connect({
    roactAnalytics = l_RoactAnalytics_0, 
    eventIngestService = l_AppEventIngestService_0
})(function(v36) --[[ Line: 86 ]]
    -- upvalues: v3 (copy), v35 (copy), l_OmniFeedProps_0 (copy), l_AppPage_0 (copy), v2 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), l_useDispatch_0 (copy), l_FFlagCreateConnectionsHub_0 (copy), l_useNavigation_0 (copy), v22 (copy), v24 (copy), v23 (copy), l_useContactImporterConfiguration_0 (copy), l_SetCurrentToastMessage_0 (copy), l_FFlagLuaAppCompositionAlways_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_FormFactor_0 (copy), l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 (copy), l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 (copy), l_OmniFeedConstants_0 (copy), v29 (copy), v1 (copy), l_llama_0 (copy), l_getFFlagPYMKAddFriendsEntry_0 (copy)
    local v37 = v3.Dictionary.join(v35, v36);
    local v38 = v37[l_OmniFeedProps_0.key] and v37[l_OmniFeedProps_0.key].appPage or l_AppPage_0.Home;
    local v39 = v37[l_OmniFeedProps_0.key] and v37[l_OmniFeedProps_0.key].feedItemStartRow or nil;
    local v40 = v2.useMemo(function() --[[ Line: 92 ]]
        -- upvalues: v37 (copy), v38 (copy), v39 (copy)
        return {
            sortIndex = v37.sortIndex, 
            appPage = v38, 
            sortId = v37.topicId, 
            startRow = v39 or -1
        };
    end, {
        v37.sortIndex, 
        v38, 
        v37.topicId, 
        v39
    });
    local v41 = if v37[l_OmniFeedProps_0.key] then v37[l_OmniFeedProps_0.key].scrollViewPositionChangedSignal else nil;
    local v43 = l_useSelector_0(function(v42) --[[ Line: 104 ]]
        return v42.FormFactor;
    end);
    local v45 = l_useSelector_0(function(v44) --[[ Line: 108 ]]
        -- upvalues: l_getDeepValue_0 (ref), l_AppPage_0 (ref)
        return l_getDeepValue_0(v44, string.format("OmniRecommendations.%s.recommendationsId", l_AppPage_0.Home)) or {};
    end);
    local v46 = l_useDispatch_0();
    local v47 = if l_FFlagCreateConnectionsHub_0 then l_useNavigation_0() else nil;
    local function v50(v48, v49) --[[ Line: 114 ]]
        -- upvalues: v46 (copy), v22 (ref), v3 (ref)
        v46(v22(v48, {
            profilePeekViewProps = v3.Dictionary.join({
                resetPeekView = true
            }, v49 or {})
        }));
    end;
    local v51 = v24({
        policyIsEnabled = v37.isContactImporterPolicyEnabled
    });
    local function v53(v52) --[[ Line: 121 ]]
        -- upvalues: v51 (copy), l_FFlagCreateConnectionsHub_0 (ref), v47 (copy), l_AppPage_0 (ref), v46 (copy), v23 (ref)
        if v52 then
            v51();
            return;
        elseif l_FFlagCreateConnectionsHub_0 then
            v47.navigate(l_AppPage_0.CoHubAddConnections);
            return;
        else
            v46(v23());
            return;
        end;
    end;
    local l_shouldShowContactImporterModal_0 = l_useContactImporterConfiguration_0({
        policyIsEnabled = v37.isContactImporterPolicyEnabled
    }).shouldShowContactImporterModal;
    local function v56(v55) --[[ Line: 137 ]]
        -- upvalues: v46 (copy), l_SetCurrentToastMessage_0 (ref)
        v46(l_SetCurrentToastMessage_0({
            toastMessage = v55
        }));
    end;
    local v57 = l_FFlagLuaAppCompositionAlways_0 and true or if l_FFlagLuaAppCompositionSupport_0 then v37[l_OmniFeedProps_0.key] and v37[l_OmniFeedProps_0.key].appCompositionEnabled else nil;
    local v58 = if v57 then nil else if v43 == l_FormFactor_0.COMPACT then l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 else l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0;
    local v59 = v37.topicLayoutData or {};
    local v60 = true;
    if v59[l_OmniFeedConstants_0.TopicLayoutDataKeys.PYMKFindFriendsEnabled] ~= "true" then
        v60 = true;
        if v59[l_OmniFeedConstants_0.TopicLayoutDataKeys.PYMKFindFriendsEnabled] ~= true then
            v60 = v29();
        end;
    end;
    local v61 = true;
    if v59[l_OmniFeedConstants_0.TopicLayoutDataKeys.PYMKSeeAllEnabled] ~= "true" then
        v61 = true;
        if v59[l_OmniFeedConstants_0.TopicLayoutDataKeys.PYMKSeeAllEnabled] ~= true then
            v61 = v29();
        end;
    end;
    return v1.createElement("Frame", {
        key = v45, 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        FriendRecommendationCarouselFeedItem = v37.renderFriendRecommendationCarousel({
            findFriendsTileEnabled = v60, 
            seeAllTileEnabled = v61, 
            pageContext = v38, 
            scrollViewPositionChangedSignal = v41, 
            carouselTitle = v37.carouselTitle, 
            openProfilePeekView = v50, 
            sideMargin = v58, 
            showToast = v56, 
            roactAnalytics = l_llama_0.None, 
            diagService = v37.roactAnalytics.Diag, 
            shouldShowContactImporterBadge = if l_getFFlagPYMKAddFriendsEntry_0() then l_shouldShowContactImporterModal_0 else nil, 
            goToAddFriendsPage = if l_getFFlagPYMKAddFriendsEntry_0() then v53 else function() --[[ Line: 183 ]]

            end, 
            eventIngestService = v37.eventIngestService, 
            sortAnalyticsData = v40, 
            appCompositionEnabled = if l_FFlagLuaAppCompositionSupport_0 then v57 else nil
        })
    });
end);
if l_getFFlagPYMKAddFriendsEntry_0() then
    v62 = l_UniversalAppPolicy_0.connect(function(v63) --[[ Line: 197 ]]
        return {
            isContactImporterPolicyEnabled = v63.getContactImporterEnabled()
        };
    end)(v62);
end;
return v62;