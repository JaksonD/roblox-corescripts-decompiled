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
return function(v15) --[[ Line: 28 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), v9 (copy), l_SetHomePageUpsellCardVariation_0 (copy), v10 (copy), l_OpenAmpWizardContainer_0 (copy), v11 (copy), v14 (copy), v13 (copy), v8 (copy), l_AppPage_0 (copy), v12 (copy), l_useSocialOnboardingButtons_0 (copy)
    local v16 = l_useDispatch_0();
    local v17 = l_useNavigation_0();
    local function v19(v18) --[[ Line: 32 ]]
        -- upvalues: v16 (copy), v9 (ref)
        v16(v9({
            toastMessage = v18
        }));
    end;
    local function v20() --[[ Line: 38 ]]
        -- upvalues: v16 (copy), l_SetHomePageUpsellCardVariation_0 (ref)
        v16(l_SetHomePageUpsellCardVariation_0("", "", ""));
    end;
    local function v21() --[[ Line: 42 ]]
        -- upvalues: v16 (copy), v10 (ref)
        v16(v10());
    end;
    local function v24(v22, v23) --[[ Line: 46 ]]
        -- upvalues: v16 (copy), l_OpenAmpWizardContainer_0 (ref)
        v16(l_OpenAmpWizardContainer_0(v22, v23));
    end;
    local function v25() --[[ Line: 50 ]]
        -- upvalues: v16 (copy), v11 (ref), v15 (copy)
        v16(v11({
            source = v15.entryPoint, 
            onClose = function() --[[ Line: 51 ]] --[[ Name: onClose ]]

            end
        }));
    end;
    local function v27(v26) --[[ Line: 54 ]]
        -- upvalues: v16 (copy), v14 (ref)
        v16(v14(v26));
    end;
    local function v28() --[[ Line: 58 ]]
        -- upvalues: v16 (copy), v13 (ref)
        v16(v13());
    end;
    local function v30(v29) --[[ Line: 62 ]]
        -- upvalues: v16 (copy), v8 (ref)
        return v16(v8({
            onSuccess = v29, 
            eventContext = "verificationUpsell", 
            origin = "friendsCarousel", 
            shouldAutofillAndroidPhoneNumberAtLaunch = true, 
            addPhoneTitleKey = "Feature.ContactUpsell.Header.UnlockVoiceChat"
        }, true));
    end;
    local function v31() --[[ Line: 72 ]]
        -- upvalues: v17 (copy), l_AppPage_0 (ref), v15 (copy)
        v17.navigate(l_AppPage_0.UserSearch, {
            shouldShowUserSearchLandingPage = true, 
            entryPoint = v15.entryPoint
        });
    end;
    local function v33(v32) --[[ Line: 79 ]]
        -- upvalues: v16 (copy), v12 (ref)
        v16(v12(v32, {}));
    end;
    return l_useSocialOnboardingButtons_0(v15, {
        openPhoneVerificationModal = v30, 
        openLearnMoreLink = v21, 
        openAmpUpsell = v24, 
        navigateToQRCodePage = v25, 
        navigateToSearchFriends = v31, 
        openProfilePeekView = v33, 
        hideUpsellCard = v20, 
        openDiscoverabilityModal = v27, 
        closeCentralOverlay = v28, 
        showToast = v19
    });
end;