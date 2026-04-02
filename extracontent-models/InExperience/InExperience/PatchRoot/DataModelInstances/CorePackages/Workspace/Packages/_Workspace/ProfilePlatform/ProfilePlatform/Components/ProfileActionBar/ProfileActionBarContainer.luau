local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Navigation);
local v4 = require(l_Parent_0.ReactFocusNavigation);
local v5 = require(l_Parent_0.FocusNavigationUtils);
local v6 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v7 = require(l_script_FirstAncestor_0.Components.ProfileActionBar.useMapJsonToProfileActions);
local v8 = require(l_script_FirstAncestor_0.Hooks.useProfileJsonComponent);
local v9 = require(l_script_FirstAncestor_0.Components.ProfileActionBar.ProfileActionBar);
local v10 = require(l_script_FirstAncestor_0.Components.ProfileActionBar.ProfileActionBarWithTransferTooltip);
local l_useNavigation_0 = v3.useNavigation;
local v12 = require(l_script_FirstAncestor_0.Common.Enums);
local v13 = require(l_script_FirstAncestor_0.Common.Constants);
local l_FFlagProfilePlatformEnableCurrencyTransfer_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer;
local v15 = require(l_script_FirstAncestor_0.Contexts.useProfileAnalyticsContext);
local v16 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_useEffectOnMount_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnMount;
local v18 = require(l_Parent_0.SocialStopwatch);
local v19 = require(l_script_FirstAncestor_0.Analytics.LoadingStagesExtension);
local l_useFocusGuiObject_0 = v4.useFocusGuiObject;
local l_useLastInputMode_0 = v5.useLastInputMode;
local v22 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableTransferTooltip);
return function(v23) --[[ Line: 36 ]] --[[ Name: ProfileActionBarContainer ]]
    -- upvalues: v6 (copy), l_useNavigation_0 (copy), l_useFocusGuiObject_0 (copy), l_useLastInputMode_0 (copy), v15 (copy), v2 (copy), v16 (copy), v13 (copy), v12 (copy), v7 (copy), v22 (copy), v8 (copy), l_FFlagProfilePlatformEnableCurrencyTransfer_0 (copy), l_useEffectOnMount_0 (copy), v18 (copy), v19 (copy), v10 (copy), v9 (copy)
    local l_profileId_0 = v6().profileId;
    local v25 = l_useNavigation_0();
    local v26 = l_useFocusGuiObject_0();
    local v27 = l_useLastInputMode_0();
    local v28 = v15();
    local v29, v30 = v2.useState(false);
    local v31 = v2.useRef(nil);
    local v32 = v2.useRef(nil);
    local v33 = v2.useRef(nil);
    local v35 = v2.useCallback(function() --[[ Line: 48 ]]
        -- upvalues: v29 (copy), v33 (copy), v28 (copy), v16 (ref), v13 (ref), v30 (copy), v31 (copy), v25 (copy), v12 (ref)
        if v29 then
            if v33 and v33.current then
                v33.current();
            end;
            return;
        else
            v28.fireAnalyticsEvent(v16.ContextualMenuButton);
            local v34 = {
                [v13.Navigation.ON_CLOSE] = function() --[[ Line: 59 ]]
                    -- upvalues: v30 (ref)
                    v30(false);
                end, 
                [v13.Navigation.GET_ROOT_ELEMENT_REF] = function() --[[ Line: 62 ]]
                    -- upvalues: v31 (ref)
                    return v31.current;
                end, 
                [v13.Navigation.ON_DISMISS_REF] = v33
            };
            v25.navigate(v12.Screens.ContextualMenu, v34);
            v30(true);
            return;
        end;
    end, {
        v25, 
        v29
    });
    v2.useEffect(function() --[[ Line: 73 ]]
        -- upvalues: v32 (copy), v27 (copy), v26 (copy)
        if v32.current and v27 == "Focus" then
            v26(v32.current);
        end;
    end, {
        v32.current, 
        v27
    });
    local v36, v37 = v7(l_profileId_0);
    local v38 = nil;
    if v22 then
        local v39 = v8(v12.Components.Actions) or {};
        v38 = l_FFlagProfilePlatformEnableCurrencyTransfer_0 and v39.contextual ~= nil and table.find(v39.contextual, v12.ProfileActions.CurrencyTransfer) ~= nil;
    end;
    l_useEffectOnMount_0(function() --[[ Line: 88 ]]
        -- upvalues: v18 (ref), v28 (copy), v16 (ref), v19 (ref)
        local v40 = v18.Stopwatch.get(v18.Events.ProfileOpened);
        v28.fireAnalyticsEvent(v16.ProfileLoadingStage, {
            statValue = if v40 then v40.timeElapsed else nil, 
            status = v19.CTALoaded, 
            isProfilePlatform = true
        });
    end);
    if v22 and v38 then
        return (v2.createElement(v10, {
            isContextualMenuOpen = v29, 
            layoutOrder = v23.layoutOrder, 
            openContextualMenu = if v37 then v35 else nil, 
            profileActions = v36, 
            primaryButtonRef = v32, 
            moreButtonRef = v31
        }));
    else
        return (v2.createElement(v9, {
            isContextualMenuOpen = v29, 
            layoutOrder = v23.layoutOrder, 
            openContextualMenu = if v37 then v35 else nil, 
            profileActions = v36, 
            primaryButtonRef = v32, 
            moreButtonRef = v31
        }));
    end;
end;