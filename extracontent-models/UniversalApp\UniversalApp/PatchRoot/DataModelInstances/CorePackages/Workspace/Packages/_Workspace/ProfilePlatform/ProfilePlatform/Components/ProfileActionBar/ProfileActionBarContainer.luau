local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v5 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v6 = require(l_Parent_0.Navigation);
local v7 = require(l_Parent_0.ReactFocusNavigation);
local v8 = require(l_Parent_0.FocusNavigationUtils);
local v9 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v10 = require(l_script_FirstAncestor_0.Components.ProfileActionBar.useMapJsonToProfileActions);
local v11 = require(l_script_FirstAncestor_0.Components.ProfileActionBar.ProfileActionBar);
local l_useNavigation_0 = v6.useNavigation;
local v13 = require(l_script_FirstAncestor_0.Common.Enums);
local v14 = require(l_script_FirstAncestor_0.Common.Constants);
local v15 = require(l_script_FirstAncestor_0.Contexts.useProfileAnalyticsContext);
local v16 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_useEffectOnMount_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnMount;
local v18 = require(l_Parent_0.SocialStopwatch);
local v19 = require(l_script_FirstAncestor_0.Analytics.LoadingStagesExtension);
local l_useFocusGuiObject_0 = v7.useFocusGuiObject;
local l_useLastInputMode_0 = v8.useLastInputMode;
local v22 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableTransferTooltip);
local v23 = require(l_script_FirstAncestor_0.Flags.GetFIntProfilePlatformCurrencyTransferTooltipMaxImpressions);
return function(v24) --[[ Line: 39 ]] --[[ Name: ProfileActionBarContainer ]]
    -- upvalues: v9 (copy), l_useNavigation_0 (copy), l_useFocusGuiObject_0 (copy), l_useLastInputMode_0 (copy), v15 (copy), v3 (copy), v16 (copy), v14 (copy), v13 (copy), v10 (copy), l_useLocalization_0 (copy), v5 (copy), v22 (copy), v23 (copy), l_AppStorageService_0 (copy), l_useEffectOnMount_0 (copy), v18 (copy), v19 (copy), v11 (copy)
    local l_profileId_0 = v9().profileId;
    local v26 = l_useNavigation_0();
    local v27 = l_useFocusGuiObject_0();
    local v28 = l_useLastInputMode_0();
    local v29 = v15();
    local v30, v31 = v3.useState(false);
    local v32 = v3.useRef(nil);
    local v33 = v3.useRef(nil);
    local v34 = v3.useRef(nil);
    local v36 = v3.useCallback(function() --[[ Line: 51 ]]
        -- upvalues: v30 (copy), v34 (copy), v29 (copy), v16 (ref), v14 (ref), v31 (copy), v32 (copy), v26 (copy), v13 (ref)
        if v30 then
            if v34 and v34.current then
                v34.current();
            end;
            return;
        else
            v29.fireAnalyticsEvent(v16.ContextualMenuButton);
            local v35 = {
                [v14.Navigation.ON_CLOSE] = function() --[[ Line: 62 ]]
                    -- upvalues: v31 (ref)
                    v31(false);
                end, 
                [v14.Navigation.GET_ROOT_ELEMENT_REF] = function() --[[ Line: 65 ]]
                    -- upvalues: v32 (ref)
                    return v32.current;
                end, 
                [v14.Navigation.ON_DISMISS_REF] = v34
            };
            v26.navigate(v13.Screens.ContextualMenu, v35);
            v31(true);
            return;
        end;
    end, {
        v26, 
        v30
    });
    v3.useEffect(function() --[[ Line: 76 ]]
        -- upvalues: v33 (copy), v28 (copy), v27 (copy)
        if v33.current and v28 == "Focus" then
            v27(v33.current);
        end;
    end, {
        v33.current, 
        v28
    });
    local v37, v38, v39 = v10(l_profileId_0);
    local v40 = l_useLocalization_0({
        plusMoreMenuTooltipTitle = v5.CurrencyTransferTooltipTitle, 
        plusMoreMenuTooltipBody = v5.CurrencyTransferTooltipBody
    });
    local v41, v42 = v3.useState(false);
    local v43 = v3.useRef(false);
    local l_game_EngineFeature_0 = game:GetEngineFeature("CurrencyTransferProfileActionTooltipStorageKey");
    v3.useEffect(function() --[[ Line: 93 ]]
        -- upvalues: v22 (ref), v39 (copy), v43 (copy), l_game_EngineFeature_0 (copy), v23 (ref), l_AppStorageService_0 (ref), v42 (copy)
        if not v22 or not v39 or v43.current then
            return;
        else
            if l_game_EngineFeature_0 then
                local v45 = v23();
                local v46 = tonumber(l_AppStorageService_0:GetItem("CurrencyTransferProfileActionTooltipImpressionsCount")) or 0;
                if v45 <= v46 then
                    return;
                else
                    l_AppStorageService_0:SetItem("CurrencyTransferProfileActionTooltipImpressionsCount", (tostring(v46 + 1)));
                    l_AppStorageService_0:Flush();
                end;
            end;
            v43.current = true;
            v42(true);
            return;
        end;
    end, {
        v39, 
        l_game_EngineFeature_0
    });
    local v48 = v3.useCallback(function() --[[ Line: 118 ]]
        -- upvalues: l_game_EngineFeature_0 (copy), v23 (ref), l_AppStorageService_0 (ref), v42 (copy)
        if l_game_EngineFeature_0 then
            local v47 = v23();
            l_AppStorageService_0:SetItem("CurrencyTransferProfileActionTooltipImpressionsCount", (tostring(v47)));
            l_AppStorageService_0:Flush();
        end;
        v42(false);
    end, {
        l_game_EngineFeature_0
    });
    local v49 = v3.useMemo(function() --[[ Line: 128 ]]
        -- upvalues: v40 (copy), v48 (copy)
        return {
            plusMoreMenuTooltipTitle = v40.plusMoreMenuTooltipTitle, 
            plusMoreMenuTooltipBody = v40.plusMoreMenuTooltipBody, 
            onPlusMoreMenuTooltipClose = v48
        };
    end, {
        v40.plusMoreMenuTooltipTitle, 
        v40.plusMoreMenuTooltipBody, 
        v48
    });
    l_useEffectOnMount_0(function() --[[ Line: 138 ]]
        -- upvalues: v18 (ref), v29 (copy), v16 (ref), v19 (ref)
        local v50 = v18.Stopwatch.get(v18.Events.ProfileOpened);
        v29.fireAnalyticsEvent(v16.ProfileLoadingStage, {
            statValue = if v50 then v50.timeElapsed else nil, 
            status = v19.CTALoaded, 
            isProfilePlatform = true
        });
    end);
    return v3.createElement(v11, {
        isContextualMenuOpen = v30, 
        layoutOrder = v24.layoutOrder, 
        openContextualMenu = if v38 then v36 else nil, 
        profileActions = v37, 
        primaryButtonRef = v33, 
        moreButtonRef = v32, 
        showPlusMoreMenuTooltip = v41, 
        upsellTooltipProps = v49
    });
end;