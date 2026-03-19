local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_IXPService_0 = game:GetService("IXPService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_script_FirstAncestor_0.Components.EditProfileLanding.EditProfileLanding);
local v4 = require(l_Parent_0.React);
local l_useEffect_0 = v4.useEffect;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v7 = require(l_Parent_0.UserProfiles).Stores.UserProfileStore.get();
local v8 = require(l_script_FirstAncestor_0.Stores.EditProfileStore);
local l_ProfileRefreshSignal_0 = require(l_Parent_0.ProfilePlatformCommon).Signals.ProfileRefreshSignal;
local v10 = require(l_script_FirstAncestor_0.Common.Enums);
local v11 = require(l_script_FirstAncestor_0.Common.Constants);
local l_useLocalRobuxBalance_0 = require(l_Parent_0.RobloxAppHooks).useLocalRobuxBalance;
local v13 = require(l_script_FirstAncestor_0.Hooks.useRealNamesInDisplayNamesEnabled);
local v14 = require(l_script_FirstAncestor_0.Utils.FocusNavigatorWrapper);
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local v16 = require(l_Parent_0.Signals);
local l_DataHydrationTypes_0 = require(l_Parent_0.DataHydration).DataHydrationTypes;
local v18 = v16.createSignal("");
local v19 = require(l_script_FirstAncestor_0.Analytics.AnalyticsServiceV2);
local v20 = require(l_Parent_0.FocusNavigationUtils);
local v21 = require(l_Parent_0.ReactFocusNavigation);
local v22 = require(l_script_FirstAncestor_0.Flags.FFlagEditProfileNavigateToProfilePictureEditor);
local l_NavigationEvents_0 = require(l_Parent_0.RoactNavigation).NavigationEvents;
local v24 = game:DefineFastString("EditProfileIXPLayer", "Social.EditProfilePage");
return function(v25) --[[ Line: 46 ]] --[[ Name: EditProfileLandingContainer ]]
    -- upvalues: l_useLocalUserId_0 (copy), v13 (copy), l_ProfileRefreshSignal_0 (copy), v4 (copy), v20 (copy), v21 (copy), l_useEffect_0 (copy), v19 (copy), v10 (copy), v11 (copy), l_useLocalRobuxBalance_0 (copy), v22 (copy), v7 (copy), l_useSignalState_0 (copy), v18 (copy), v8 (copy), l_DataHydrationTypes_0 (copy), v14 (copy), l_NavigationEvents_0 (copy), l_IXPService_0 (copy), v24 (copy), v3 (copy)
    local v26 = l_useLocalUserId_0();
    local v27 = v13();
    local function v28() --[[ Line: 49 ]]
        -- upvalues: l_ProfileRefreshSignal_0 (ref), v25 (copy)
        l_ProfileRefreshSignal_0.notifyProfileRefresh();
        v25.navigation.pop();
    end;
    local v29 = v4.useRef(nil);
    local v30 = {};
    local v31 = v20.useAutoFocus(v30, 0.1);
    local v32 = v4.useContext(v21.FocusNavigationContext);
    l_useEffect_0(function() --[[ Line: 59 ]]
        -- upvalues: v30 (copy), v29 (copy), v32 (copy), v31 (copy)
        v30[1] = v29.current;
        local v33 = nil;
        if v32 and v32.focusedGuiObject:getValue() ~= nil and v31 then
            v33 = v31();
        end;
        return function() --[[ Line: 65 ]]
            -- upvalues: v33 (ref)
            if v33 then
                v33.cancel();
            end;
        end;
    end, {
        v31
    });
    local function v34() --[[ Line: 72 ]]
        -- upvalues: v19 (ref), v25 (copy), v10 (ref)
        v19.sendDisplayNameModalOpened();
        v25.navigation.navigate(v10.Screens.EditProfileSubScreen, {
            screen = v10.Screens.EditDisplayName
        });
    end;
    local function v36(v35) --[[ Line: 79 ]] --[[ Name: showToast ]]
        -- upvalues: v25 (copy), v10 (ref)
        v25.navigation.goBack();
        v25.navigation.navigate(v10.Screens.EditProfileToast, {
            text = v35
        });
    end;
    local v37 = v25.navigation.getParam(v11.EditUserNameWebView);
    local function v38() --[[ Line: 86 ]]
        -- upvalues: v25 (copy), v10 (ref)
        v25.navigation.navigate(v10.Screens.UsernameInsufficientFundsModal);
    end;
    local v39 = l_useLocalRobuxBalance_0();
    local function v40() --[[ Line: 91 ]]
        -- upvalues: v39 (copy), v11 (ref), v37 (copy), v36 (copy), v25 (copy), v10 (ref), v38 (copy), v19 (ref)
        if v39 >= v11.ChangeUsernamePrice then
            v37(v36);
        else
            v25.navigation.navigate(v10.Screens.UsernameInsufficientFundsModal, {
                robux = v11.ChangeUsernamePrice - v39, 
                navigateDownToPurchaseRobux = v38
            });
        end;
        v19.sendEditUsernameOpened();
    end;
    local function v41() --[[ Line: 103 ]]
        -- upvalues: v25 (copy), v10 (ref)
        v25.navigation.navigate(v10.Screens.EditProfileSubScreen, {
            screen = v10.Screens.EditBio
        });
    end;
    local function v42() --[[ Line: 109 ]]
        -- upvalues: v19 (ref), v22 (ref), v25 (copy), v10 (ref)
        v19.sendOpenAvatarMarketplace();
        if v22 then
            v25.navigation.navigate(v10.Screens.ProfilePictureEditorCamera);
            return;
        else
            v25.navigation.navigate(v10.Screens.AvatarCatalog);
            return;
        end;
    end;
    local v43 = v4.useMemo(function() --[[ Line: 118 ]]
        -- upvalues: v7 (ref), v26 (copy)
        return v7.fetchNamesByUserIds({
            (tostring(v26))
        });
    end, {
        v26
    });
    l_useEffect_0(function() --[[ Line: 121 ]]
        -- upvalues: v19 (ref)
        v19.sendEditProfileOpened();
    end, {});
    local v44 = l_useSignalState_0(v43);
    local v45 = not v44 or v44.status ~= "success";
    local v46 = v44 and v44.data and v44.data[1];
    local v47 = if v46 then v46.names.getUsername else v18;
    local v48 = if v46 then v46.names.getDisplayName else v18;
    local v49 = l_useSignalState_0(v47) or "";
    local v50 = l_useSignalState_0(v48) or "";
    local v51 = v8.getDescription(v26);
    local v52 = l_useSignalState_0(v51.status) == l_DataHydrationTypes_0.DataStatus.NotReady;
    local v53 = l_useSignalState_0(v51.data) or "";
    return v14({
        onClose = v28
    }, {
        EditProfileLandingExposureLogger = v4.createElement(l_NavigationEvents_0, {
            onDidFocus = function() --[[ Line: 144 ]] --[[ Name: onDidFocus ]]
                -- upvalues: l_IXPService_0 (ref), v24 (ref)
                l_IXPService_0:LogUserLayerExposure(v24);
            end
        }); 
        v3({
            userId = v26, 
            onClose = v28, 
            username = v49, 
            displayName = v50, 
            areNamesLoading = v45, 
            bioText = v53, 
            isBioLoading = v52, 
            isPolicyEnabled = v27, 
            settingButtonOnActivated = {
                displayName = v34, 
                username = v40, 
                bio = v41, 
                avatar = v42
            }, 
            firstItemRef = v29
        })
    });
end;