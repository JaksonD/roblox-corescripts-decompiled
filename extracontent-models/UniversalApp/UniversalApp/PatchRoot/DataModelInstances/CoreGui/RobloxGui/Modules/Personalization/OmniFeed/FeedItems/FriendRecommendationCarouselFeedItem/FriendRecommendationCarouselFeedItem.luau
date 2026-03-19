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
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v12 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes);
local l_OmniFeedConstants_0 = v12.OmniFeedConstants;
local l_RoactAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactAnalytics;
local l_AppEventIngestService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppEventIngestService;
local l_SetCurrentToastMessage_0 = require(l_CorePackages_0.Workspace.Packages.ToastRodux).Actions.SetCurrentToastMessage;
local l_OmniFeedProps_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.Personalization.OmniFeed.OmniFeedProps;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v19 = require(l_Modules_0.LuaApp.Thunks.NavigateToUserInfo);
local v20 = require(l_Modules_0.LuaApp.Thunks.NavigateDownToAddFriendsPage);
local v21 = require(l_Modules_0.LuaApp.Components.FriendsCarousel.utils.useNavigateFromAddFriends);
local v22 = require(l_CorePackages_0.Packages.LuaSocialLibrariesDeps);
local l_getDeepValue_0 = v22.SocialLibraries.config({}).Dictionary.getDeepValue;
local l_llama_0 = v22.llama;
local l_getFFlagPYMKAddFriendsEntry_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFFlagPYMKAddFriendsEntry;
local v26 = require(l_Modules_0.Personalization.Flags.getFFlagPYMKShowAddFriendsButton_DEV);
local l_FFlagCreateConnectionsHub_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagCreateConnectionsHub;
local l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 = v12.Constants.GAME_CAROUSEL_SIDE_COMPACT_PADDING;
local l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 = v12.Constants.GAME_CAROUSEL_SIDE_WIDE_PADDING;
local l_PYMKCarouselEntryPoint_0 = require(l_Modules_0.LuaApp.Components.PYMKCarousel.api).PYMKCarouselEntryPoint;
local v32 = {
    renderFriendRecommendationCarousel = function(v31) --[[ Line: 76 ]] --[[ Name: renderFriendRecommendationCarousel ]]
        -- upvalues: v1 (copy), l_PYMKCarouselEntryPoint_0 (copy)
        return v1.createElement(l_PYMKCarouselEntryPoint_0, v31);
    end
};
local v58 = l_RoactServices_0.connect({
    roactAnalytics = l_RoactAnalytics_0, 
    eventIngestService = l_AppEventIngestService_0
})(function(v33) --[[ Line: 81 ]]
    -- upvalues: v3 (copy), v32 (copy), l_OmniFeedProps_0 (copy), l_AppPage_0 (copy), v2 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), l_useDispatch_0 (copy), l_FFlagCreateConnectionsHub_0 (copy), l_useNavigation_0 (copy), v19 (copy), v21 (copy), v20 (copy), l_useContactImporterConfiguration_0 (copy), l_SetCurrentToastMessage_0 (copy), l_FormFactor_0 (copy), l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 (copy), l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 (copy), l_OmniFeedConstants_0 (copy), v26 (copy), v1 (copy), l_llama_0 (copy), l_getFFlagPYMKAddFriendsEntry_0 (copy)
    local v34 = v3.Dictionary.join(v32, v33);
    local v35 = v34[l_OmniFeedProps_0.key] and v34[l_OmniFeedProps_0.key].appPage or l_AppPage_0.Home;
    local v36 = v34[l_OmniFeedProps_0.key] and v34[l_OmniFeedProps_0.key].feedItemStartRow or nil;
    local v37 = v2.useMemo(function() --[[ Line: 87 ]]
        -- upvalues: v34 (copy), v35 (copy), v36 (copy)
        return {
            sortIndex = v34.sortIndex, 
            appPage = v35, 
            sortId = v34.topicId, 
            startRow = v36 or -1
        };
    end, {
        v34.sortIndex, 
        v35, 
        v34.topicId, 
        v36
    });
    local v38 = if v34[l_OmniFeedProps_0.key] then v34[l_OmniFeedProps_0.key].scrollViewPositionChangedSignal else nil;
    local v40 = l_useSelector_0(function(v39) --[[ Line: 99 ]]
        return v39.FormFactor;
    end);
    local v42 = l_useSelector_0(function(v41) --[[ Line: 103 ]]
        -- upvalues: l_getDeepValue_0 (ref), l_AppPage_0 (ref)
        return l_getDeepValue_0(v41, string.format("OmniRecommendations.%s.recommendationsId", l_AppPage_0.Home)) or {};
    end);
    local v43 = l_useDispatch_0();
    local v44 = if l_FFlagCreateConnectionsHub_0 then l_useNavigation_0() else nil;
    local function v47(v45, v46) --[[ Line: 109 ]]
        -- upvalues: v43 (copy), v19 (ref), v3 (ref)
        v43(v19(v45, {
            profilePeekViewProps = v3.Dictionary.join({
                resetPeekView = true
            }, v46 or {})
        }));
    end;
    local v48 = v21({
        policyIsEnabled = v34.isContactImporterPolicyEnabled
    });
    local function v50(v49) --[[ Line: 116 ]]
        -- upvalues: v48 (copy), l_FFlagCreateConnectionsHub_0 (ref), v44 (copy), l_AppPage_0 (ref), v43 (copy), v20 (ref)
        if v49 then
            v48();
            return;
        elseif l_FFlagCreateConnectionsHub_0 then
            v44.navigate(l_AppPage_0.CoHubAddConnections);
            return;
        else
            v43(v20());
            return;
        end;
    end;
    local l_shouldShowContactImporterModal_0 = l_useContactImporterConfiguration_0({
        policyIsEnabled = v34.isContactImporterPolicyEnabled
    }).shouldShowContactImporterModal;
    local function v53(v52) --[[ Line: 132 ]]
        -- upvalues: v43 (copy), l_SetCurrentToastMessage_0 (ref)
        v43(l_SetCurrentToastMessage_0({
            toastMessage = v52
        }));
    end;
    local v54 = if v40 == l_FormFactor_0.COMPACT then l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 else l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0;
    local v55 = v34.topicLayoutData or {};
    local v56 = true;
    if v55[l_OmniFeedConstants_0.TopicLayoutDataKeys.PYMKFindFriendsEnabled] ~= "true" then
        v56 = true;
        if v55[l_OmniFeedConstants_0.TopicLayoutDataKeys.PYMKFindFriendsEnabled] ~= true then
            v56 = v26();
        end;
    end;
    local v57 = true;
    if v55[l_OmniFeedConstants_0.TopicLayoutDataKeys.PYMKSeeAllEnabled] ~= "true" then
        v57 = true;
        if v55[l_OmniFeedConstants_0.TopicLayoutDataKeys.PYMKSeeAllEnabled] ~= true then
            v57 = v26();
        end;
    end;
    return v1.createElement("Frame", {
        key = v42, 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        FriendRecommendationCarouselFeedItem = v34.renderFriendRecommendationCarousel({
            findFriendsTileEnabled = v56, 
            seeAllTileEnabled = v57, 
            pageContext = v35, 
            scrollViewPositionChangedSignal = v38, 
            carouselTitle = v34.carouselTitle, 
            openProfilePeekView = v47, 
            sideMargin = v54, 
            showToast = v53, 
            roactAnalytics = l_llama_0.None, 
            diagService = v34.roactAnalytics.Diag, 
            shouldShowContactImporterBadge = if l_getFFlagPYMKAddFriendsEntry_0() then l_shouldShowContactImporterModal_0 else nil, 
            goToAddFriendsPage = if l_getFFlagPYMKAddFriendsEntry_0() then v50 else function() --[[ Line: 170 ]]

            end, 
            eventIngestService = v34.eventIngestService, 
            sortAnalyticsData = v37
        })
    });
end);
if l_getFFlagPYMKAddFriendsEntry_0() then
    v58 = l_UniversalAppPolicy_0.connect(function(v59) --[[ Line: 183 ]]
        return {
            isContactImporterPolicyEnabled = v59.getContactImporterEnabled()
        };
    end)(v58);
end;
return v58;