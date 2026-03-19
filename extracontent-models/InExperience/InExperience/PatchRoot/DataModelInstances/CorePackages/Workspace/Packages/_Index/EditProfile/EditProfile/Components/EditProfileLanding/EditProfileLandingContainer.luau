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
local l_NavigationEvents_0 = require(l_Parent_0.RoactNavigation).NavigationEvents;
local v23 = game:DefineFastString("EditProfileIXPLayer", "Social.EditProfilePage");
return function(v24) --[[ Line: 43 ]] --[[ Name: EditProfileLandingContainer ]]
    -- upvalues: l_useLocalUserId_0 (copy), v13 (copy), l_ProfileRefreshSignal_0 (copy), v4 (copy), v20 (copy), v21 (copy), l_useEffect_0 (copy), v19 (copy), v10 (copy), v11 (copy), l_useLocalRobuxBalance_0 (copy), v7 (copy), l_useSignalState_0 (copy), v18 (copy), v8 (copy), l_DataHydrationTypes_0 (copy), v14 (copy), l_NavigationEvents_0 (copy), l_IXPService_0 (copy), v23 (copy), v3 (copy)
    local v25 = l_useLocalUserId_0();
    local v26 = v13();
    local function v27() --[[ Line: 46 ]]
        -- upvalues: l_ProfileRefreshSignal_0 (ref), v24 (copy)
        l_ProfileRefreshSignal_0.notifyProfileRefresh();
        v24.navigation.pop();
    end;
    local v28 = v4.useRef(nil);
    local v29 = {};
    local v30 = v20.useAutoFocus(v29, 0.1);
    local v31 = v4.useContext(v21.FocusNavigationContext);
    l_useEffect_0(function() --[[ Line: 56 ]]
        -- upvalues: v29 (copy), v28 (copy), v31 (copy), v30 (copy)
        v29[1] = v28.current;
        local v32 = nil;
        if v31 and v31.focusedGuiObject:getValue() ~= nil and v30 then
            v32 = v30();
        end;
        return function() --[[ Line: 62 ]]
            -- upvalues: v32 (ref)
            if v32 then
                v32.cancel();
            end;
        end;
    end, {
        v30
    });
    local function v33() --[[ Line: 69 ]]
        -- upvalues: v19 (ref), v24 (copy), v10 (ref)
        v19.sendDisplayNameModalOpened();
        v24.navigation.navigate(v10.Screens.EditProfileSubScreen, {
            screen = v10.Screens.EditDisplayName
        });
    end;
    local function v35(v34) --[[ Line: 76 ]] --[[ Name: showToast ]]
        -- upvalues: v24 (copy), v10 (ref)
        v24.navigation.goBack();
        v24.navigation.navigate(v10.Screens.EditProfileToast, {
            text = v34
        });
    end;
    local v36 = v24.navigation.getParam(v11.EditUserNameWebView);
    local function v37() --[[ Line: 83 ]]
        -- upvalues: v24 (copy), v10 (ref)
        v24.navigation.navigate(v10.Screens.UsernameInsufficientFundsModal);
    end;
    local v38 = l_useLocalRobuxBalance_0();
    local function v39() --[[ Line: 88 ]]
        -- upvalues: v38 (copy), v11 (ref), v36 (copy), v35 (copy), v24 (copy), v10 (ref), v37 (copy), v19 (ref)
        if v38 >= v11.ChangeUsernamePrice then
            v36(v35);
        else
            v24.navigation.navigate(v10.Screens.UsernameInsufficientFundsModal, {
                robux = v11.ChangeUsernamePrice - v38, 
                navigateDownToPurchaseRobux = v37
            });
        end;
        v19.sendEditUsernameOpened();
    end;
    local function v40() --[[ Line: 100 ]]
        -- upvalues: v24 (copy), v10 (ref)
        v24.navigation.navigate(v10.Screens.EditProfileSubScreen, {
            screen = v10.Screens.EditBio
        });
    end;
    local function v41() --[[ Line: 106 ]]
        -- upvalues: v19 (ref), v24 (copy), v10 (ref)
        v19.sendOpenAvatarMarketplace();
        v24.navigation.navigate(v10.Screens.AvatarCatalog);
    end;
    local v42 = v4.useMemo(function() --[[ Line: 111 ]]
        -- upvalues: v7 (ref), v25 (copy)
        return v7.fetchNamesByUserIds({
            (tostring(v25))
        });
    end, {
        v25
    });
    l_useEffect_0(function() --[[ Line: 114 ]]
        -- upvalues: v19 (ref)
        v19.sendEditProfileOpened();
    end, {});
    local v43 = l_useSignalState_0(v42);
    local v44 = not v43 or v43.status ~= "success";
    local v45 = v43 and v43.data and v43.data[1];
    local v46 = if v45 then v45.names.getUsername else v18;
    local v47 = if v45 then v45.names.getDisplayName else v18;
    local v48 = l_useSignalState_0(v46) or "";
    local v49 = l_useSignalState_0(v47) or "";
    local v50 = v8.getDescription(v25);
    local v51 = l_useSignalState_0(v50.status) == l_DataHydrationTypes_0.DataStatus.NotReady;
    local v52 = l_useSignalState_0(v50.data) or "";
    return v14({
        onClose = v27
    }, {
        EditProfileLandingExposureLogger = v4.createElement(l_NavigationEvents_0, {
            onDidFocus = function() --[[ Line: 137 ]] --[[ Name: onDidFocus ]]
                -- upvalues: l_IXPService_0 (ref), v23 (ref)
                l_IXPService_0:LogUserLayerExposure(v23);
            end
        }); 
        v3({
            userId = v25, 
            onClose = v27, 
            username = v48, 
            displayName = v49, 
            areNamesLoading = v44, 
            bioText = v52, 
            isBioLoading = v51, 
            isPolicyEnabled = v26, 
            settingButtonOnActivated = {
                displayName = v33, 
                username = v39, 
                bio = v40, 
                avatar = v41
            }, 
            firstItemRef = v28
        })
    });
end;