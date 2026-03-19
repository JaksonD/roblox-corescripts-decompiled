local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialOnboardingButtons");
local v1 = require(l_script_FirstAncestor_0.Analytics);
local l_EventNames_0 = v1.EventNames;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_Images_0 = require(l_Parent_0.UIBlox).App.ImageSet.Images;
local l_getContactImporterParams_0 = require(l_Parent_0.ContactImporter).Utils.getContactImporterParams;
local v10 = require(l_Parent_0.SocialModalsCommon);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v12 = require(l_Parent_0.AppStartup);
local l_useLaunchContext_0 = v12.Hooks.useLaunchContext;
local l_LaunchContext_0 = v12.Enums.LaunchContext;
local l_EnumScreens_0 = v10.EnumScreens;
local v16 = require(l_script_FirstAncestor_0.Enums.SocialOnboardingButtonsEnum);
local v17 = require(l_script_FirstAncestor_0.Experiments.SocialOnboardingButtonsIXP);
local v18 = require(l_script_FirstAncestor_0.Hooks.useSocialOnboardingButtonsColors);
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local v20 = l_Images_0[game:DefineFastString("FindContactsIcon_v3", "icons/actions/friend_sort/find_contacts")];
local v21 = l_Images_0[game:DefineFastString("MyQRCodeIcon_v3", "icons/actions/friend_sort/qr_code")];
local v22 = l_Images_0[game:DefineFastString("SearchPeopleIcon_v3", "icons/actions/friend_sort/search_people")];
local v23 = l_Images_0[game:DefineFastString("UnlockVoiceIcon_v3", "icons/actions/friend_sort/unlock_voice")];
local v24 = l_Images_0[game:DefineFastString("MyProfileIcon_v3", "icons/actions/friend_sort/my_profile")];
local v25 = l_Images_0[game:DefineFastString("AddFriendsIcon_v3", "icons/actions/friend_sort/add_friends")];
return function(v26, v27) --[[ Line: 71 ]]
    -- upvalues: l_useLocalUserId_0 (copy), l_useNavigation_0 (copy), l_useLaunchContext_0 (copy), l_useLocalization_0 (copy), v17 (copy), v18 (copy), v4 (copy), v1 (copy), l_useSelector_0 (copy), l_useAppPolicy_0 (copy), l_getContactImporterParams_0 (copy), l_EventNames_0 (copy), l_EnumScreens_0 (copy), v16 (copy), v21 (copy), v22 (copy), v23 (copy), v24 (copy), v20 (copy), v25 (copy), l_LaunchContext_0 (copy)
    local v28 = l_useLocalUserId_0();
    local v29 = l_useNavigation_0();
    local v30 = l_useLaunchContext_0();
    local v31 = l_useLocalization_0({
        addFriends = "Feature.Friends.Feature.Friends.Heading.AddFriends", 
        searchPeople = "Feature.Friends.Label.SearchPeople", 
        findContacts = "Feature.Contacts.Label.FindContacts", 
        unlockVoice = "Feature.Friends.Label.UnlockVoice", 
        myProfile = "Feature.Friends.Label.MyProfile", 
        shareQRCode = "Feature.AddFriends.Label.MyQrCode"
    });
    local v32 = v17.useSocialOnboardingBtnsEnabled();
    local v33, v34, v35 = v18();
    local v36 = v17.useSocialOnboardingBtnsOrder();
    local v37 = v17.useSocialOnboardingBtnsHideAfterSignup();
    local v38 = v4.useMemo(function() --[[ Line: 92 ]]
        -- upvalues: v1 (ref), v26 (copy)
        return v1.getAnalytics(v26.entryPoint)().fireAnalyticsEvent;
    end, {
        v26, 
        v1
    });
    local v42 = l_useSelector_0(function(v39) --[[ Line: 97 ]]
        local l_HomePageUpsellCardVariation_0 = v39.HomePageUpsellCardVariation;
        local v41 = false;
        if l_HomePageUpsellCardVariation_0 ~= nil then
            v41 = false;
            if l_HomePageUpsellCardVariation_0.upsellCardType ~= nil then
                v41 = l_HomePageUpsellCardVariation_0.upsellCardType ~= "";
            end;
        end;
        return v41;
    end);
    local v44 = l_useAppPolicy_0(function(v43) --[[ Line: 104 ]]
        return {
            contactImporterEnabled = v43.getContactImporterEnabled(), 
            upsellVoiceForPhoneVerification = v43.getUpsellVoiceForPhoneVerification()
        };
    end);
    local v45 = l_useSelector_0(l_getContactImporterParams_0);
    local v46 = v45.hasOSPermissions or false;
    local v47 = v45.isDiscoverabilityUnset or false;
    local v48 = v45.isPhoneVerified or false;
    local l_contactImporterEnabled_0 = v44.contactImporterEnabled;
    local v50 = v44.upsellVoiceForPhoneVerification and not v48 and not v42;
    local v53 = v4.useCallback(function() --[[ Line: 119 ]]
        -- upvalues: v38 (copy), l_EventNames_0 (ref), v46 (copy), v27 (copy), v47 (copy), v48 (copy), v29 (copy), l_EnumScreens_0 (ref)
        v38(l_EventNames_0.FindContactsBtn);
        local v51 = not v46;
        local v52 = {
            isFromAddFriendsPage = false, 
            openLearnMoreLink = v27.openLearnMoreLink, 
            showToast = v27.showToast, 
            isDiscoverabilityUnset = v47, 
            isPhoneVerified = v48, 
            openAmpUpsell = v27.openAmpUpsell, 
            isFromSocialOnboardingButtons = true
        };
        if v51 then
            v29.navigate(l_EnumScreens_0.ContactImporter, v52);
            return;
        else
            v29.navigate(l_EnumScreens_0.ContactsList, v52);
            return;
        end;
    end, {
        v27, 
        v47, 
        v48, 
        v29, 
        v38
    });
    local v54 = v4.useCallback(function() --[[ Line: 138 ]]
        -- upvalues: v27 (copy), v26 (copy)
        v27.hideUpsellCard();
        v27.openDiscoverabilityModal({
            showToast = v27.showToast, 
            openLearnMoreLink = v27.openLearnMoreLink, 
            isStandaloneDiscoverabilityModal = true, 
            entryPoint = v26.entryPoint, 
            onClose = v27.closeCentralOverlay, 
            navigateOnActivated = v27.closeCentralOverlay
        });
    end, {
        v27, 
        v26
    });
    local v62, v63 = v4.useMemo(function() --[[ Line: 151 ]]
        -- upvalues: v38 (copy), l_EventNames_0 (ref), v27 (copy), v16 (ref), v31 (copy), v21 (ref), v33 (copy), v34 (copy), v35 (copy), v22 (ref), v50 (copy), v54 (copy), v23 (ref), v28 (copy), v24 (ref), l_contactImporterEnabled_0 (copy), v20 (ref), v53 (copy), v36 (copy), v25 (ref)
        local v55 = {};
        local function v56() --[[ Line: 156 ]]
            -- upvalues: v38 (ref), l_EventNames_0 (ref), v27 (ref)
            v38(l_EventNames_0.MyQRCodeBtn);
            v27.navigateToQRCodePage();
        end;
        v55[v16.ShareQRCodeBtn] = {
            id = v16.ShareQRCodeBtn, 
            text = v31.shareQRCode, 
            icon = v21, 
            onActivated = v56, 
            backgroundColor = v33.myQRCode, 
            iconColor = v34, 
            extraId = v35
        };
        local function v57() --[[ Line: 173 ]]
            -- upvalues: v38 (ref), l_EventNames_0 (ref), v27 (ref)
            v38(l_EventNames_0.SearchPeopleBtn);
            v27.navigateToSearchFriends();
        end;
        v55[v16.SearchFriendsBtn] = {
            id = v16.SearchFriendsBtn, 
            text = v31.searchPeople, 
            icon = v22, 
            onActivated = v57, 
            backgroundColor = v33.searchPeople, 
            iconColor = v34, 
            extraId = v35
        };
        if v50 then
            local function v58() --[[ Line: 191 ]]
                -- upvalues: v38 (ref), l_EventNames_0 (ref), v27 (ref), v54 (ref)
                v38(l_EventNames_0.UnlockVoiceBtn);
                v27.openPhoneVerificationModal(v54);
            end;
            v55[v16.UnlockVoiceBtn] = {
                id = v16.UnlockVoiceBtn, 
                text = v31.unlockVoice, 
                icon = v23, 
                onActivated = v58, 
                backgroundColor = v33.unlockVoice, 
                iconColor = v34, 
                extraId = v35
            };
        end;
        local function v59() --[[ Line: 209 ]]
            -- upvalues: v38 (ref), l_EventNames_0 (ref), v27 (ref), v28 (ref)
            v38(l_EventNames_0.MyProfileBtn);
            v27.openProfilePeekView((tostring(v28)));
        end;
        if v28 then
            v55[v16.CompleteProfileBtn] = {
                id = v16.CompleteProfileBtn, 
                text = v31.myProfile, 
                icon = v24, 
                onActivated = v59, 
                backgroundColor = v33.myProfile, 
                iconColor = v34, 
                extraId = v35
            };
        end;
        if l_contactImporterEnabled_0 then
            v55[v16.FindContactsBtn] = {
                id = v16.FindContactsBtn, 
                text = v31.findContacts, 
                icon = v20, 
                onActivated = v53, 
                backgroundColor = v33.findContacts, 
                iconColor = v34, 
                extraId = v35
            };
        end;
        local v60 = {};
        for v61 in string.gmatch(v36 or "", "([^,]+)") do
            if v55[v61] then
                table.insert(v60, v55[v61]);
            end;
        end;
        return v60, {
            id = v16.AddFriendsBtn, 
            icon = v25, 
            backgroundColor = v33.addFriends, 
            iconColor = v34, 
            extraId = v35
        };
    end, {
        v26, 
        v27, 
        l_contactImporterEnabled_0, 
        v50, 
        v54, 
        v53, 
        v31, 
        v38, 
        v33, 
        v34, 
        v35, 
        v36
    });
    if v32 then
        if v37 and v30 == l_LaunchContext_0.SignUp then
            return nil, v63;
        else
            return v62, v63;
        end;
    else
        return nil, nil;
    end;
end;