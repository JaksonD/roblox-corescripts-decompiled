local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Parent_0 = script:FindFirstAncestor("AppStartup").Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.React);
local l_AppLinking_0 = require(l_Parent_0.RoactServiceTags).AppLinking;
local l_AppLogging_0 = require(l_Parent_0.RoactServiceTags).AppLogging;
local l_AppStartupMessageService_0 = require(l_Parent_0.RoactServiceTags).AppStartupMessageService;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v14 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigableSurfaceIdentifierEnum_0 = v14.FocusNavigableSurfaceIdentifierEnum;
local l_useAppFocusRoot_0 = v14.useAppFocusRoot;
local l_FFlagAddFocusNavToStartupMsg_0 = require(l_Parent_0.SharedFlags).FFlagAddFocusNavToStartupMsg;
local function v19(v18) --[[ Line: 24 ]] --[[ Name: selectScreenSize ]]
    return v18.ScreenSize;
end;
return function() --[[ Line: 28 ]] --[[ Name: useStartupMessageProps ]]
    -- upvalues: l_useRoactService_0 (copy), l_AppLinking_0 (copy), l_AppLogging_0 (copy), l_AppStartupMessageService_0 (copy), l_useSelector_0 (copy), v19 (copy), l_useDispatch_0 (copy), l_useDesignTokens_0 (copy), v3 (copy), l_useLocalization_0 (copy), v2 (copy), l_LocalizationService_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_FFlagAddFocusNavToStartupMsg_0 (copy), l_useAppFocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy)
    local v20 = l_useRoactService_0(l_AppLinking_0);
    local v21 = l_useRoactService_0(l_AppLogging_0);
    local v22 = l_useRoactService_0(l_AppStartupMessageService_0);
    local v23 = l_useSelector_0(v19);
    local v24 = l_useDispatch_0();
    local v26 = l_useDesignTokens_0(function(v25) --[[ Line: 34 ]]
        return v25.Semantic.Color.Common.Overlay;
    end);
    local v27, v28 = v3.useState(false);
    local v29, v30 = v3.useState(false);
    local v31 = v22:getStartupMessage();
    local v32 = v31 and not v27 or false;
    local v33 = v31 or {};
    local l_titleLocalizationKey_0 = v33.titleLocalizationKey;
    local l_bodyLocalizationKey_0 = v33.bodyLocalizationKey;
    local l_loggingEventName_0 = v33.loggingEventName;
    local v37 = v33.links or {};
    local v39 = l_useLocalization_0(v2.map(v37, function(v38) --[[ Line: 49 ]]
        return v38.localizationKey;
    end));
    local v43 = v2.reduce(v37, function(v40, v41, v42) --[[ Line: 52 ]]
        -- upvalues: v2 (ref), v39 (copy)
        return v2.append(v40, {
            {
                label = v39[v42], 
                url = v41.url
            }
        });
    end, {});
    local l_date_0 = v33.date;
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local v46 = tonumber(v33.date);
    if v46 then
        l_date_0 = DateTime.fromUnixTimestamp(v46):FormatUniversalTime("LL", l_RobloxLocaleId_0);
    end;
    local v47 = l_useLocalization_0({
        titleText = l_titleLocalizationKey_0, 
        bodyText = l_bodyLocalizationKey_0 and {
            l_bodyLocalizationKey_0; 
            date = l_date_0
        }, 
        buttonText = "CommonUI.Messages.Action.Dismiss"
    });
    local v48 = v3.useCallback(function() --[[ Line: 74 ]]
        -- upvalues: v28 (copy)
        v28(true);
    end, {});
    local v52 = v3.useCallback(function(v49, v50) --[[ Line: 78 ]]
        -- upvalues: v20 (copy), v24 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        v20:isURLRegistered(v49):andThen(function(v51) --[[ Line: 79 ]]
            -- upvalues: v20 (ref), v49 (copy), v24 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v50 (copy)
            if v51 then
                v20:detectURL(v49);
                return;
            else
                v24(l_NavigateDown_0({
                    name = l_AppPage_0.GenericWebPage, 
                    detail = v49, 
                    extraProps = {
                        title = v50
                    }
                }));
                return;
            end;
        end);
    end, {
        v24, 
        v20
    });
    local v53 = if l_FFlagAddFocusNavToStartupMsg_0 then l_useAppFocusRoot_0({
        surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, 
        isAutoFocusRoot = true, 
        isFocusable = not v27
    }) else nil;
    v3.useEffect(function() --[[ Line: 102 ]]
        -- upvalues: v29 (copy), v32 (copy), l_loggingEventName_0 (copy), v21 (copy), v30 (copy)
        if not v29 and v32 and l_loggingEventName_0 then
            v21:logEphemeralCounterEvent({
                eventName = l_loggingEventName_0, 
                backends = {
                    "EphemeralCounter"
                }, 
                lastUpdated = {
                    24, 
                    2, 
                    18
                }, 
                description = "Startup Message Displayed Event"
            });
            v30(true);
        end;
    end, {
        v29, 
        v32, 
        l_loggingEventName_0
    });
    return {
        displayStartupMessage = v32, 
        screenSize = v23, 
        message = v33, 
        localizedStrings = v47, 
        localizedLinks = v43, 
        overlayColor = v26, 
        onDismissed = v48, 
        onOpenUrl = v52, 
        focusNavRef = v53
    };
end;