local l_script_FirstAncestor_0 = script:FindFirstAncestor("AddFriends");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_Contexts_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Contexts;
local l_EventNames_0 = require(l_script_FirstAncestor_0.Analytics).EventNames;
local l_FFlagAddFriendsBannersNewUI_IXP_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsBannersNewUI_IXP;
local _ = require(script.Parent.Types);
return function(v10) --[[ Line: 32 ]] --[[ Name: QRCodeChannel ]]
    -- upvalues: l_useAppPolicy_0 (copy), v2 (copy), l_EventNames_0 (copy), l_AppPage_0 (copy), l_Contexts_0 (copy), l_useLocalization_0 (copy), l_FFlagAddFriendsBannersNewUI_IXP_0 (copy)
    local l_component_0 = v10.component;
    local l_componentUIProps_0 = v10.componentUIProps;
    local l_fireAnalyticsEvent_0 = v10.fireAnalyticsEvent;
    local v15 = l_useAppPolicy_0(function(v14) --[[ Line: 37 ]]
        return v14.getEnableProfileQrCode();
    end);
    local v16 = v2.useCallback(function() --[[ Line: 42 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref), v10 (copy), l_AppPage_0 (ref), l_Contexts_0 (ref)
        l_fireAnalyticsEvent_0(l_EventNames_0.QRCodeBtnClick);
        v10.navigateToLuaAppPages[l_AppPage_0.ProfileQRCodePage]({
            source = l_Contexts_0.AddFriends
        });
    end, {
        v10.navigateToLuaAppPages, 
        l_fireAnalyticsEvent_0
    });
    local v17 = v2.useCallback(function() --[[ Line: 50 ]]
        -- upvalues: l_fireAnalyticsEvent_0 (copy), l_EventNames_0 (ref)
        l_fireAnalyticsEvent_0(l_EventNames_0.QRCodeBtnImpression);
    end, {
        l_fireAnalyticsEvent_0
    });
    local v18 = l_useLocalization_0({
        qrCodeBannerTitle = if l_FFlagAddFriendsBannersNewUI_IXP_0 then nil else "Feature.AddFriends.Title.ShareQRCode", 
        qrCodeBannerText = if l_FFlagAddFriendsBannersNewUI_IXP_0 then nil else "Feature.AddFriends.Label.ShareQRCodeAddConnection", 
        qrCodeTitle = l_FFlagAddFriendsBannersNewUI_IXP_0 and "Feature.AddFriends.Label.MyQRTile" or nil
    });
    if v15 then
        return (v2.createElement(l_component_0, {
            icon = "icons/graphic/scanqr_large", 
            title = if l_FFlagAddFriendsBannersNewUI_IXP_0 then v18.qrCodeTitle else v18.qrCodeBannerTitle, 
            text = if l_FFlagAddFriendsBannersNewUI_IXP_0 then nil else v18.qrCodeBannerText, 
            onActivated = v16, 
            onMounted = v17, 
            componentUIProps = l_componentUIProps_0
        }));
    else
        return nil;
    end;
end;