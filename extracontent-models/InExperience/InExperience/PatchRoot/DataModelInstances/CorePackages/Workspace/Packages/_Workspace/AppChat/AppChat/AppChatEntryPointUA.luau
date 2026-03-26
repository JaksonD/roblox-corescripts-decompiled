local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppBlox);
local v3 = require(l_Parent_0.AppCommonLib);
local v4 = require(l_Parent_0.AppTabBarRodux);
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_Parent_0.Navigation);
local v7 = require(l_Parent_0.React);
local v8 = require(l_Parent_0.RoactServiceTags);
local v9 = require(l_Parent_0.RoactUtils);
local v10 = require(l_Parent_0.RobloxAppHooks);
local v11 = require(l_Parent_0.SharedFlags);
local v12 = require(l_Parent_0.SocialCommon);
local v13 = require(l_Parent_0.SquadsCore);
local v14 = require(l_Parent_0.UIBlox);
local v15 = require(l_Parent_0.UniversalAppPolicy);
local l_AppNotificationService_0 = v8.AppNotificationService;
local l_FullscreenPageWithSafeArea_0 = v2.FullscreenPageWithSafeArea;
local l_SetTabBarVisibleFromChat_0 = v4.Thunks.SetTabBarVisibleFromChat;
local l_Signal_0 = v3.Signal;
local l_SquadAppChatEventReceiver_0 = v13.SquadAppChatEventReceiver;
local l_dependencyArray_0 = v9.Hooks.dependencyArray;
local l_useAppPolicy_0 = v15.useAppPolicy;
local l_useCallback_0 = v7.useCallback;
local l_useDispatch_0 = v9.Hooks.RoactRodux.useDispatch;
local l_useEarlyIsFocused_0 = v6.useEarlyIsFocused;
local l_useEffect_0 = v7.useEffect;
local l_useMemo_0 = v7.useMemo;
local l_useNavigation_0 = v6.useNavigation;
local l_useRoactService_0 = v10.useRoactService;
local l_useSelector_0 = v9.Hooks.RoactRodux.useSelector;
local l_useState_0 = v7.useState;
local l_useStyle_0 = v14.Core.Style.useStyle;
local l_useIsWideMode_0 = v12.Hooks.useIsWideMode;
local v34 = require(l_script_FirstAncestor_0.AppChatEntryPoint);
local v35 = require(l_script_FirstAncestor_0.Components.EventReceivers.ChatEventReceiver);
local v36 = require(l_script_FirstAncestor_0.Components.ExternalNavigationHandler.Container);
local v37 = require(l_script_FirstAncestor_0.Actions.ToggleChatPaused);
local v38 = require(l_script_FirstAncestor_0.Hooks.useExternalNavigationByScreen);
local v39 = require(l_script_FirstAncestor_0.Hooks.useAppChatIsWideMode);
local l_FFlagSquadAppChatRTNFix_0 = v11.FFlagSquadAppChatRTNFix;
local v41 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatInExpSelectChatMembersMobileHeight);
local l_FFlagRemoveDependencyArrayAntipattern_0 = v11.FFlagRemoveDependencyArrayAntipattern;
local v43 = {};
AppChatEntryPointUA = function(v44) --[[ Line: 65 ]] --[[ Name: AppChatEntryPointUA ]]
    -- upvalues: v5 (copy), v43 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), l_useEarlyIsFocused_0 (copy), v41 (copy), v39 (copy), l_useIsWideMode_0 (copy), l_useNavigation_0 (copy), l_useAppPolicy_0 (copy), l_useState_0 (copy), v38 (copy), l_useRoactService_0 (copy), l_AppNotificationService_0 (copy), l_useMemo_0 (copy), l_Signal_0 (copy), l_useCallback_0 (copy), l_SetTabBarVisibleFromChat_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_useSelector_0 (copy), l_useEffect_0 (copy), v37 (copy), v7 (copy), l_FullscreenPageWithSafeArea_0 (copy), v34 (copy), v36 (copy), v35 (copy), l_FFlagSquadAppChatRTNFix_0 (copy), l_SquadAppChatEventReceiver_0 (copy)
    local v45 = v5.Dictionary.join(v43, v44);
    local v46 = l_useStyle_0();
    local v47 = l_useDispatch_0();
    local v48 = l_useEarlyIsFocused_0();
    local v49 = if v41 then v39(false) else l_useIsWideMode_0();
    local v50 = l_useNavigation_0();
    local v52 = l_useAppPolicy_0(function(v51) --[[ Line: 75 ]]
        return {
            shouldSystemBarUsuallyBePresent = v51.getShouldSystemBarUsuallyBePresent()
        };
    end);
    local v53, v54 = l_useState_0(0);
    local v55, v56 = v38();
    local v57 = l_useRoactService_0(l_AppNotificationService_0);
    local v58 = l_useMemo_0(function() --[[ Line: 85 ]]
        -- upvalues: l_Signal_0 (ref)
        return l_Signal_0.new();
    end);
    local v59 = l_useMemo_0(function() --[[ Line: 89 ]]
        -- upvalues: v45 (copy), v57 (copy)
        return v45.RobloxEventReceiver.new(v57);
    end);
    local v61 = l_useCallback_0(function(v60) --[[ Line: 94 ]]
        -- upvalues: v47 (copy), l_SetTabBarVisibleFromChat_0 (ref), v52 (copy)
        v47(l_SetTabBarVisibleFromChat_0(v60 or v52.shouldSystemBarUsuallyBePresent));
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v47, 
        v52.shouldSystemBarUsuallyBePresent
    } else l_dependencyArray_0(v47, v52.shouldSystemBarUsuallyBePresent));
    local v62 = l_useMemo_0(function() --[[ Line: 102 ]]
        return {};
    end);
    local v64 = l_useSelector_0(function(v63) --[[ Line: 106 ]]
        return v63.NotificationBadgeCounts.TopBarNotificationIcon;
    end);
    l_useEffect_0(function() --[[ Line: 111 ]]
        -- upvalues: v47 (copy), v37 (ref), v48 (copy)
        v47(v37(not v48));
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v48, 
        v47
    } else l_dependencyArray_0(v48, v47));
    return v7.createElement(v7.Fragment, {}, {
        FullscreenPageWithSafeArea = v7.createElement(l_FullscreenPageWithSafeArea_0, {
            BackgroundColor3 = v46.Theme.BackgroundDefault.Color, 
            BackgroundTransparency = v46.Theme.BackgroundDefault.Transparency, 
            includeStatusBar = true
        }, {
            AppChatEntryPoint = v7.createElement(v34, {
                setActiveConversationId = v54, 
                updateExternalNavigationForScreen = v56, 
                navigateToLuaAppPages = v62, 
                rnBypassActionSignal = v58, 
                notificationCount = v64, 
                setTabBarVisible = v61, 
                isVisible = v48, 
                wideMode = v49, 
                navigation = v50
            })
        }), 
        ExternalNavigationHandler = v7.createElement(v36, {
            navigationByScreen = v55
        }), 
        ChatEventReceiver = v7.createElement(v35, {
            robloxEventReceiver = v59, 
            rnBypassActionSignal = v58, 
            activeConversationId = tostring(v53)
        }), 
        SquadAppChatEventReceiver = if l_FFlagSquadAppChatRTNFix_0 then v7.createElement(l_SquadAppChatEventReceiver_0) else nil
    });
end;
return AppChatEntryPointUA;