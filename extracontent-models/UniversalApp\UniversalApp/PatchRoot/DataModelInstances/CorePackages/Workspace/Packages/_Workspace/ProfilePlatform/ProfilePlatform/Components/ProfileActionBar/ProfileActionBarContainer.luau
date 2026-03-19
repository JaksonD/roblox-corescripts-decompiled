local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Navigation);
local v4 = require(l_Parent_0.ReactFocusNavigation);
local v5 = require(l_Parent_0.FocusNavigationUtils);
local v6 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v7 = require(l_script_FirstAncestor_0.Components.ProfileActionBar.useMapJsonToProfileActions);
local v8 = require(l_script_FirstAncestor_0.Components.ProfileActionBar.ProfileActionBar);
local l_useNavigation_0 = v3.useNavigation;
local v10 = require(l_script_FirstAncestor_0.Common.Enums);
local v11 = require(l_script_FirstAncestor_0.Common.Constants);
local v12 = require(l_script_FirstAncestor_0.Contexts.useProfileAnalyticsContext);
local v13 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_useEffectOnMount_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnMount;
local v15 = require(l_Parent_0.SocialStopwatch);
local v16 = require(l_script_FirstAncestor_0.Analytics.LoadingStagesExtension);
local l_useFocusGuiObject_0 = v4.useFocusGuiObject;
local l_useLastInputMode_0 = v5.useLastInputMode;
return function(v19) --[[ Line: 28 ]] --[[ Name: ProfileActionBarContainer ]]
    -- upvalues: v6 (copy), l_useNavigation_0 (copy), l_useFocusGuiObject_0 (copy), l_useLastInputMode_0 (copy), v12 (copy), v2 (copy), v13 (copy), v11 (copy), v10 (copy), v7 (copy), l_useEffectOnMount_0 (copy), v15 (copy), v16 (copy), v8 (copy)
    local l_profileId_0 = v6().profileId;
    local v21 = l_useNavigation_0();
    local v22 = l_useFocusGuiObject_0();
    local v23 = l_useLastInputMode_0();
    local v24 = v12();
    local v25, v26 = v2.useState(false);
    local v27 = v2.useRef(nil);
    local v28 = v2.useRef(nil);
    local v29 = v2.useRef(nil);
    local v31 = v2.useCallback(function() --[[ Line: 40 ]]
        -- upvalues: v25 (copy), v29 (copy), v24 (copy), v13 (ref), v11 (ref), v26 (copy), v27 (copy), v21 (copy), v10 (ref)
        if v25 then
            if v29 and v29.current then
                v29.current();
            end;
            return;
        else
            v24.fireAnalyticsEvent(v13.ContextualMenuButton);
            local v30 = {
                [v11.Navigation.ON_CLOSE] = function() --[[ Line: 51 ]]
                    -- upvalues: v26 (ref)
                    v26(false);
                end, 
                [v11.Navigation.GET_ROOT_ELEMENT_REF] = function() --[[ Line: 54 ]]
                    -- upvalues: v27 (ref)
                    return v27.current;
                end, 
                [v11.Navigation.ON_DISMISS_REF] = v29
            };
            v21.navigate(v10.Screens.ContextualMenu, v30);
            v26(true);
            return;
        end;
    end, {
        v21, 
        v25
    });
    v2.useEffect(function() --[[ Line: 65 ]]
        -- upvalues: v28 (copy), v23 (copy), v22 (copy)
        if v28.current and v23 == "Focus" then
            v22(v28.current);
        end;
    end, {
        v28.current, 
        v23
    });
    local v32, v33 = v7(l_profileId_0);
    l_useEffectOnMount_0(function() --[[ Line: 73 ]]
        -- upvalues: v15 (ref), v24 (copy), v13 (ref), v16 (ref)
        local v34 = v15.Stopwatch.get(v15.Events.ProfileOpened);
        v24.fireAnalyticsEvent(v13.ProfileLoadingStage, {
            statValue = if v34 then v34.timeElapsed else nil, 
            status = v16.CTALoaded, 
            isProfilePlatform = true
        });
    end);
    return v2.createElement(v8, {
        isContextualMenuOpen = v25, 
        layoutOrder = v19.layoutOrder, 
        openContextualMenu = if v33 then v31 else nil, 
        profileActions = v32, 
        primaryButtonRef = v28, 
        moreButtonRef = v27
    });
end;