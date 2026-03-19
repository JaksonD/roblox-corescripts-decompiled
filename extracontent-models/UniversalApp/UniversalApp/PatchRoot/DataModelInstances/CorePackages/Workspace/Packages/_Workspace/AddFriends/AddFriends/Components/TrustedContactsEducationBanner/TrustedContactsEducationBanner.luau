local l_script_FirstAncestor_0 = script:FindFirstAncestor("AddFriends");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v6 = require(l_Parent_0.Foundation);
local l_AmpApiProvider_0 = require(l_Parent_0.AmpUpsell).AmpApiProvider;
local l_AccessResponseEnum_0 = require(l_Parent_0.AmpUpsell).AmpEnums.AccessResponseEnum;
local v9 = require(l_script_FirstAncestor_0.Components.AddFriendsGenericBanner);
local v10 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v11 = require(l_script_FirstAncestor_0.Analytics.useFireAnalyticsEvent);
local v12 = require(script.Parent.useShowTrustedContactsEducationBanner);
local l_FStringCanAccessTrustedContactsAmpNameSpace_0 = require(l_Parent_0.SharedFlags).FStringCanAccessTrustedContactsAmpNameSpace;
local l_FStringIsVerified18PlusAmpFeature_0 = require(l_Parent_0.SharedFlags).FStringIsVerified18PlusAmpFeature;
return function(v15) --[[ Line: 30 ]] --[[ Name: TrustedContactsEducationBanner ]]
    -- upvalues: v11 (copy), l_useNavigation_0 (copy), v12 (copy), v2 (copy), l_AccessResponseEnum_0 (copy), l_AmpApiProvider_0 (copy), l_FStringIsVerified18PlusAmpFeature_0 (copy), l_FStringCanAccessTrustedContactsAmpNameSpace_0 (copy), v10 (copy), l_AppPage_0 (copy), l_useLocalization_0 (copy), v9 (copy), v6 (copy)
    local v16 = v11();
    local v17 = l_useNavigation_0();
    local v18, v19, v20 = v12();
    local v21 = nil;
    local v22 = nil;
    local v23, v24 = v2.useState(l_AccessResponseEnum_0.Pending);
    v21 = v23;
    v22 = v24;
    v2.useEffect(function() --[[ Line: 38 ]]
        -- upvalues: l_AmpApiProvider_0 (ref), l_FStringIsVerified18PlusAmpFeature_0 (ref), l_FStringCanAccessTrustedContactsAmpNameSpace_0 (ref), v22 (ref)
        local v25 = l_AmpApiProvider_0.upsellFeatureAccess(l_FStringIsVerified18PlusAmpFeature_0, {}, l_FStringCanAccessTrustedContactsAmpNameSpace_0);
        v22(v25.access);
    end, {});
    v23 = v2.useCallback(function() --[[ Line: 43 ]]
        -- upvalues: v16 (copy), v10 (ref), v17 (copy), l_AppPage_0 (ref), v19 (copy)
        v16(v10.TrustedContactsEducationalBannerClick);
        v17.push(l_AppPage_0.TrustedContactsEducationModal);
        v19();
    end, {
        v17, 
        v19, 
        v16
    });
    v24 = v2.useCallback(function() --[[ Line: 50 ]]
        -- upvalues: v16 (copy), v10 (ref), v19 (copy)
        v16(v10.TrustedContactsEducationalBannerClose);
        v19();
    end, {
        v19, 
        v16
    });
    local v26 = v2.useCallback(function() --[[ Line: 56 ]]
        -- upvalues: v16 (copy), v10 (ref), v20 (copy)
        v16(v10.TrustedContactsEducationalBannerImpression);
        v20();
    end, {
        v20, 
        v16
    });
    local v27 = l_useLocalization_0({
        title = "Feature.Friends.TCEducation.Title", 
        bodyText = "Feature.Friends.TCEducation.Banner.Text", 
        bodyText18Plus = "Feature.Friends.TCEducation.Modal.TextIntro.EighteenPlus", 
        learnMoreLink = "Feature.Friends.LinkText.LearnMore"
    });
    return if v18 then v2.createElement(v9, {
        layoutOrder = v15.layoutOrder, 
        maxWidth = v15.maxWidth, 
        onBannerMounted = v26, 
        isLoading = v21 == l_AccessResponseEnum_0.Pending, 
        bannerTitle = v27.title, 
        bannerText = if v21 == l_AccessResponseEnum_0.Granted then v27.bodyText18Plus else v27.bodyText, 
        titleFont = "text-heading-small", 
        textFont = "text-body-medium", 
        rightCornerButtonIcon = v6.Enums.IconName.X, 
        rightCornerButtonActivated = v24, 
        bigBottomButton = {
            text = v27.learnMoreLink, 
            onActivated = v23
        }
    }) else nil;
end;