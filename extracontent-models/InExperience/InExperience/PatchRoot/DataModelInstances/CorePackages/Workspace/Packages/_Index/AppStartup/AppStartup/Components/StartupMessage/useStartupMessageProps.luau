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
local function v15(v14) --[[ Line: 17 ]] --[[ Name: selectScreenSize ]]
    return v14.ScreenSize;
end;
return function() --[[ Line: 21 ]] --[[ Name: useStartupMessageProps ]]
    -- upvalues: l_useRoactService_0 (copy), l_AppLinking_0 (copy), l_AppLogging_0 (copy), l_AppStartupMessageService_0 (copy), l_useSelector_0 (copy), v15 (copy), l_useDispatch_0 (copy), l_useDesignTokens_0 (copy), v3 (copy), l_useLocalization_0 (copy), v2 (copy), l_LocalizationService_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy)
    local v16 = l_useRoactService_0(l_AppLinking_0);
    local v17 = l_useRoactService_0(l_AppLogging_0);
    local v18 = l_useRoactService_0(l_AppStartupMessageService_0);
    local v19 = l_useSelector_0(v15);
    local v20 = l_useDispatch_0();
    local v22 = l_useDesignTokens_0(function(v21) --[[ Line: 27 ]]
        return v21.Semantic.Color.Common.Overlay;
    end);
    local v23, v24 = v3.useState(false);
    local v25, v26 = v3.useState(false);
    local v27 = v18:getStartupMessage();
    local v28 = v27 and not v23 or false;
    local v29 = v27 or {};
    local l_titleLocalizationKey_0 = v29.titleLocalizationKey;
    local l_bodyLocalizationKey_0 = v29.bodyLocalizationKey;
    local l_loggingEventName_0 = v29.loggingEventName;
    local v33 = v29.links or {};
    local v35 = l_useLocalization_0(v2.map(v33, function(v34) --[[ Line: 42 ]]
        return v34.localizationKey;
    end));
    local v39 = v2.reduce(v33, function(v36, v37, v38) --[[ Line: 45 ]]
        -- upvalues: v2 (ref), v35 (copy)
        return v2.append(v36, {
            {
                label = v35[v38], 
                url = v37.url
            }
        });
    end, {});
    local l_date_0 = v29.date;
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local v42 = tonumber(v29.date);
    if v42 then
        l_date_0 = DateTime.fromUnixTimestamp(v42):FormatUniversalTime("LL", l_RobloxLocaleId_0);
    end;
    local v43 = l_useLocalization_0({
        titleText = l_titleLocalizationKey_0, 
        bodyText = l_bodyLocalizationKey_0 and {
            l_bodyLocalizationKey_0; 
            date = l_date_0
        }, 
        buttonText = "CommonUI.Messages.Action.Dismiss"
    });
    local v44 = v3.useCallback(function() --[[ Line: 67 ]]
        -- upvalues: v24 (copy)
        v24(true);
    end, {});
    local v48 = v3.useCallback(function(v45, v46) --[[ Line: 71 ]]
        -- upvalues: v16 (copy), v20 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        v16:isURLRegistered(v45):andThen(function(v47) --[[ Line: 72 ]]
            -- upvalues: v16 (ref), v45 (copy), v20 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v46 (copy)
            if v47 then
                v16:detectURL(v45);
                return;
            else
                v20(l_NavigateDown_0({
                    name = l_AppPage_0.GenericWebPage, 
                    detail = v45, 
                    extraProps = {
                        title = v46
                    }
                }));
                return;
            end;
        end);
    end, {
        v20, 
        v16
    });
    v3.useEffect(function() --[[ Line: 87 ]]
        -- upvalues: v25 (copy), v28 (copy), l_loggingEventName_0 (copy), v17 (copy), v26 (copy)
        if not v25 and v28 and l_loggingEventName_0 then
            v17:logEphemeralCounterEvent({
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
            v26(true);
        end;
    end, {
        v25, 
        v28, 
        l_loggingEventName_0
    });
    return {
        displayStartupMessage = v28, 
        screenSize = v19, 
        message = v29, 
        localizedStrings = v43, 
        localizedLinks = v39, 
        overlayColor = v22, 
        onDismissed = v44, 
        onOpenUrl = v48
    };
end;