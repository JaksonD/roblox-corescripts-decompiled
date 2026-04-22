local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSocialOnboardingButtons_0 = require(l_CorePackages_0.Workspace.Packages.SocialOnboardingButtons).Hooks.useSocialOnboardingButtons;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_OpenAmpWizardContainer_0 = require(l_CorePackages_0.Workspace.Packages.AmpUpsell).OpenAmpWizardContainer;
local l_SetHomePageUpsellCardVariation_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Actions.SetHomePageUpsellCardVariation;
local v8 = require(l_Modules_0.LuaApp.Thunks.Verification.OpenPhoneUpsellModal);
local v9 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v10 = require(l_Modules_0.LuaApp.Thunks.OpenContactImporterLearnMoreLink);
local v11 = require(l_Modules_0.LuaApp.Thunks.NavigateDownTo3DQRCodePage);
local v12 = require(l_Modules_0.LuaApp.Thunks.OpenProfilePeekView);
local v13 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v14 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForDiscoverabilityUpsell);
local l_FFlagSocialCarouselShareQREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagSocialCarouselShareQREnabled;
return function(v16) --[[ Line: 31 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), v9 (copy), l_SetHomePageUpsellCardVariation_0 (copy), v10 (copy), l_OpenAmpWizardContainer_0 (copy), v11 (copy), l_FFlagSocialCarouselShareQREnabled_0 (copy), v14 (copy), v13 (copy), v8 (copy), l_AppPage_0 (copy), v12 (copy), l_useSocialOnboardingButtons_0 (copy)
    local v17 = l_useDispatch_0();
    local v18 = l_useNavigation_0();
    local function v20(v19) --[[ Line: 35 ]]
        -- upvalues: v17 (copy), v9 (ref)
        v17(v9({
            toastMessage = v19
        }));
    end;
    local function v21() --[[ Line: 41 ]]
        -- upvalues: v17 (copy), l_SetHomePageUpsellCardVariation_0 (ref)
        v17(l_SetHomePageUpsellCardVariation_0("", "", ""));
    end;
    local function v22() --[[ Line: 45 ]]
        -- upvalues: v17 (copy), v10 (ref)
        v17(v10());
    end;
    local function v25(v23, v24) --[[ Line: 49 ]]
        -- upvalues: v17 (copy), l_OpenAmpWizardContainer_0 (ref)
        v17(l_OpenAmpWizardContainer_0(v23, v24));
    end;
    local function v26() --[[ Line: 53 ]]
        -- upvalues: v17 (copy), v11 (ref), v16 (copy), l_FFlagSocialCarouselShareQREnabled_0 (ref)
        v17(v11({
            source = v16.entryPoint, 
            onClose = if l_FFlagSocialCarouselShareQREnabled_0 then nil else function() --[[ Line: 56 ]]

            end
        }));
    end;
    local function v28(v27) --[[ Line: 60 ]]
        -- upvalues: v17 (copy), v14 (ref)
        v17(v14(v27));
    end;
    local function v29() --[[ Line: 64 ]]
        -- upvalues: v17 (copy), v13 (ref)
        v17(v13());
    end;
    local function v31(v30) --[[ Line: 68 ]]
        -- upvalues: v17 (copy), v8 (ref)
        return v17(v8({
            onSuccess = v30, 
            eventContext = "verificationUpsell", 
            origin = "friendsCarousel", 
            shouldAutofillAndroidPhoneNumberAtLaunch = true, 
            addPhoneTitleKey = "Feature.ContactUpsell.Header.UnlockVoiceChat"
        }, true));
    end;
    local function v32() --[[ Line: 78 ]]
        -- upvalues: v18 (copy), l_AppPage_0 (ref), v16 (copy)
        v18.navigate(l_AppPage_0.UserSearch, {
            shouldShowUserSearchLandingPage = true, 
            entryPoint = v16.entryPoint
        });
    end;
    local function v34(v33) --[[ Line: 85 ]]
        -- upvalues: v17 (copy), v12 (ref)
        v17(v12(v33, {}));
    end;
    return l_useSocialOnboardingButtons_0(v16, {
        openPhoneVerificationModal = v31, 
        openLearnMoreLink = v22, 
        openAmpUpsell = v25, 
        navigateToQRCodePage = v26, 
        navigateToSearchFriends = v32, 
        openProfilePeekView = v34, 
        hideUpsellCard = v21, 
        openDiscoverabilityModal = v28, 
        closeCentralOverlay = v29, 
        showToast = v20
    });
end;