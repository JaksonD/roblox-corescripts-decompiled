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
local v13 = require(l_Parent_0.SharedFlags);
local l_FFlagConnectionsToFriendsRename_0 = v13.FFlagConnectionsToFriendsRename;
local l_FStringCanAccessTrustedContactsAmpNameSpace_0 = v13.FStringCanAccessTrustedContactsAmpNameSpace;
local l_FStringIsVerified18PlusAmpFeature_0 = v13.FStringIsVerified18PlusAmpFeature;
return function(v17) --[[ Line: 32 ]] --[[ Name: TrustedContactsEducationBanner ]]
    -- upvalues: v11 (copy), l_useNavigation_0 (copy), v12 (copy), v2 (copy), l_AccessResponseEnum_0 (copy), l_AmpApiProvider_0 (copy), l_FStringIsVerified18PlusAmpFeature_0 (copy), l_FStringCanAccessTrustedContactsAmpNameSpace_0 (copy), v10 (copy), l_AppPage_0 (copy), l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), v9 (copy), v6 (copy)
    local v18 = v11();
    local v19 = l_useNavigation_0();
    local v20, v21, v22 = v12();
    local v23 = nil;
    local v24 = nil;
    local v25, v26 = v2.useState(l_AccessResponseEnum_0.Pending);
    v23 = v25;
    v24 = v26;
    v2.useEffect(function() --[[ Line: 40 ]]
        -- upvalues: l_AmpApiProvider_0 (ref), l_FStringIsVerified18PlusAmpFeature_0 (ref), l_FStringCanAccessTrustedContactsAmpNameSpace_0 (ref), v24 (ref)
        local v27 = l_AmpApiProvider_0.upsellFeatureAccess(l_FStringIsVerified18PlusAmpFeature_0, {}, l_FStringCanAccessTrustedContactsAmpNameSpace_0);
        v24(v27.access);
    end, {});
    v25 = v2.useCallback(function() --[[ Line: 45 ]]
        -- upvalues: v18 (copy), v10 (ref), v19 (copy), l_AppPage_0 (ref), v21 (copy)
        v18(v10.TrustedContactsEducationalBannerClick);
        v19.push(l_AppPage_0.TrustedContactsEducationModal);
        v21();
    end, {
        v19, 
        v21, 
        v18
    });
    v26 = v2.useCallback(function() --[[ Line: 52 ]]
        -- upvalues: v18 (copy), v10 (ref), v21 (copy)
        v18(v10.TrustedContactsEducationalBannerClose);
        v21();
    end, {
        v21, 
        v18
    });
    local v28 = v2.useCallback(function() --[[ Line: 58 ]]
        -- upvalues: v18 (copy), v10 (ref), v22 (copy)
        v18(v10.TrustedContactsEducationalBannerImpression);
        v22();
    end, {
        v22, 
        v18
    });
    local v29 = l_useLocalization_0({
        title = "Feature.Friends.TCEducation.Title", 
        bodyText = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.TFEducation.Banner.Text" or "Feature.Friends.TCEducation.Banner.Text", 
        bodyText18Plus = l_FFlagConnectionsToFriendsRename_0 and "Feature.Friends.TFEducation.Modal.TextIntro.EighteenPlus" or "Feature.Friends.TCEducation.Modal.TextIntro.EighteenPlus", 
        learnMoreLink = "Feature.Friends.LinkText.LearnMore"
    });
    return if v20 then v2.createElement(v9, {
        layoutOrder = v17.layoutOrder, 
        maxWidth = v17.maxWidth, 
        onBannerMounted = v28, 
        isLoading = v23 == l_AccessResponseEnum_0.Pending, 
        bannerTitle = v29.title, 
        bannerText = if v23 == l_AccessResponseEnum_0.Granted then v29.bodyText18Plus else v29.bodyText, 
        titleFont = "text-heading-small", 
        textFont = "text-body-medium", 
        rightCornerButtonIcon = v6.Enums.IconName.X, 
        rightCornerButtonActivated = v26, 
        bigBottomButton = {
            text = v29.learnMoreLink, 
            onActivated = v25
        }
    }) else nil;
end;