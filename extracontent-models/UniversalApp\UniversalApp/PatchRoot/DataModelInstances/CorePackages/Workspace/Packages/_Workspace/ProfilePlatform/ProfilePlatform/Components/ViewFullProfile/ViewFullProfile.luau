local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactUtils);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_dependencyArray_0 = v3.Hooks.dependencyArray;
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v8 = require(l_Parent_0.NavigationRodux);
local l_NavigateDown_0 = v8.Thunks.NavigateDown;
local l_NavigateDownToViewUserProfile_0 = v8.Thunks.NavigateDownToViewUserProfile;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_UrlBase_0 = require(l_Parent_0.UrlBuilder).UrlBase;
local v13 = require(l_script_FirstAncestor_0.Common.Constants);
local v14 = require(l_Parent_0.UIBlox);
local l_HorizontalPageMargin_0 = v14.App.Container.HorizontalPageMargin;
local l_Button_0 = v14.App.Button.Button;
local l_ButtonType_0 = v14.App.Button.Enum.ButtonType;
local v18 = require(l_script_FirstAncestor_0.Common.Enums);
local v19 = require(l_script_FirstAncestor_0.Hooks.useProfileJsonComponent);
local v20 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v21 = require(l_script_FirstAncestor_0.Contexts.useProfileAnalyticsContext);
local v22 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v23 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v24 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableCommunityProfilePage);
local v25 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformUpdateUXForNonSocialCommunities);
ViewFullProfile = function(v26) --[[ Line: 37 ]] --[[ Name: ViewFullProfile ]]
    -- upvalues: v25 (copy), v19 (copy), v18 (copy), v20 (copy), v24 (copy), v21 (copy), l_useDispatch_0 (copy), l_useLocalization_0 (copy), v23 (copy), v2 (copy), v22 (copy), l_NavigateDownToViewUserProfile_0 (copy), l_UrlBuilder_0 (copy), l_UrlBase_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_dependencyArray_0 (copy), l_HorizontalPageMargin_0 (copy), v13 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    local v27 = if v25 then v19(v18.Components.ViewFullProfile) or {} else nil;
    local v28 = v20();
    local l_profileId_0 = v28.profileId;
    local v30 = if v24 then v28.profileType else nil;
    local v31 = v21();
    local v32 = l_useDispatch_0();
    local v33 = l_useLocalization_0({
        viewFullProfileLabel = v23.ViewFullProfile, 
        viewCommunityLabel = if v24 then v23.ViewCommunity else nil
    });
    local v34 = if v24 then v2.useMemo(function() --[[ Line: 54 ]]
        -- upvalues: v30 (copy), v18 (ref), v33 (copy), v25 (ref), v27 (copy)
        if v30 == v18.ProfileTypes.User then
            return v33.viewFullProfileLabel;
        else
            if v30 == v18.ProfileTypes.Community then
                if v25 then
                    if v27.type == v18.ViewFullProfileTypes.Profile then
                        return v33.viewFullProfileLabel;
                    elseif v27.type == v18.ViewFullProfileTypes.Community then
                        return v33.viewCommunityLabel;
                    end;
                else
                    return v33.viewCommunityLabel;
                end;
            end;
            return v33.viewFullProfileLabel;
        end;
    end, {
        v33
    }) else nil;
    local v36 = v2.useCallback(function() --[[ Line: 77 ]]
        -- upvalues: v24 (ref), v31 (copy), v22 (ref), v28 (copy), v18 (ref), v30 (copy), v32 (copy), l_NavigateDownToViewUserProfile_0 (ref), l_profileId_0 (copy), v27 (copy), l_UrlBuilder_0 (ref), l_UrlBase_0 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v25 (ref), v23 (ref)
        if v24 then
            v31.fireAnalyticsEvent(v22.ViewPlayerProfileButton, {
                absolutePosition = v28.sourceInfo.homepageCarouselAbsolutePosition, 
                isHomePageCarousel = v28.sourceInfo.source == v18.Sources.HomepageFriendsCarousel, 
                source = v28.sourceInfo.source, 
                isRecommendation = v28.sourceInfo.isRecommendation, 
                recommendationContextType = v28.sourceInfo.recommendationContextType, 
                recommendationRank = v28.sourceInfo.recommendationRank, 
                recommendationSessionId = v28.sourceInfo.recommendationSessionId
            });
            if v30 == v18.ProfileTypes.User then
                v32(l_NavigateDownToViewUserProfile_0(l_profileId_0));
                return;
            elseif v30 == v18.ProfileTypes.Community then
                local v35 = nil;
                v35 = if v27.type == v18.ViewFullProfileTypes.Profile then l_UrlBuilder_0.new({
                    base = l_UrlBase_0.WWW, 
                    path = ("profiles/%*"):format(l_profileId_0)
                })() else l_UrlBuilder_0.user.group({
                    groupId = l_profileId_0
                });
                v32(l_NavigateDown_0({
                    name = l_AppPage_0.GenericWebPage, 
                    detail = v35, 
                    extraProps = {
                        titleKey = if v25 and v27.type == v18.ViewFullProfileTypes.Profile then v23.Profile else v23.Community
                    }
                }));
                return;
            end;
        else
            v31.fireAnalyticsEvent(v22.ViewPlayerProfileButton, {
                absolutePosition = v28.sourceInfo.homepageCarouselAbsolutePosition, 
                isHomePageCarousel = v28.sourceInfo.source == v18.Sources.HomepageFriendsCarousel, 
                source = v28.sourceInfo.source, 
                isRecommendation = v28.sourceInfo.isRecommendation, 
                recommendationContextType = v28.sourceInfo.recommendationContextType, 
                recommendationRank = v28.sourceInfo.recommendationRank, 
                recommendationSessionId = v28.sourceInfo.recommendationSessionId
            });
            v32(l_NavigateDownToViewUserProfile_0(l_profileId_0));
        end;
    end, l_dependencyArray_0(v32, l_profileId_0, v31, v28));
    return v2.createElement(l_HorizontalPageMargin_0, {
        size = UDim2.fromScale(1, 0), 
        backgroundTransparency = 1, 
        layoutOrder = v26.layoutOrder, 
        useAutomaticSizing = true
    }, {
        ViewFullProfileFrame = v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = v26.layoutOrder
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v13.ADDITIONAL_PADDING)
            }), 
            ViewFullProfile = v2.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.Secondary, 
                size = UDim2.new(1, 0, 0, v13.CTA_BUTTON_HEIGHT), 
                onActivated = v36, 
                text = if v24 then v34 else v33.viewFullProfileLabel
            })
        })
    });
end;
return ViewFullProfile;