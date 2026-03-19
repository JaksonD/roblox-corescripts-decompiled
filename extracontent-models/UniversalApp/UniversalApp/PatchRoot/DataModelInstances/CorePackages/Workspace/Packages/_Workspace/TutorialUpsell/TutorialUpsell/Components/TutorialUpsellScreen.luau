local l_script_FirstAncestor_0 = script:FindFirstAncestor("TutorialUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_ExperienceService_0 = require(l_Parent_0.ExperienceService).ExperienceService;
local v5 = require(l_Parent_0.LoggingProtocol);
local v6 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v9 = require(l_Parent_0.Foundation);
local l_View_0 = v9.View;
local l_Button_0 = v9.Button;
local l_Image_0 = v9.Image;
local l_Text_0 = v9.Text;
local l_ButtonVariant_0 = v9.Enums.ButtonVariant;
local l_InputSize_0 = v9.Enums.InputSize;
local l_useTokens_0 = v9.Hooks.useTokens;
local v17 = require(l_script_FirstAncestor_0.Constants);
local v18 = require(l_Parent_0.SystemTheme);
local l_SetDarkThemeOverride_0 = v18.Utils.SetDarkThemeOverride;
local l_ClearThemeOverride_0 = v18.Utils.ClearThemeOverride;
local v21 = game:DefineFastInt("TutorialUpsellEventThrottleHundredthsPercent", 0);
local v22 = game:DefineFastString("TutorialUpsellPlaceId", (tostring(v17.TUTORIAL_EXPERIENCE_DEFAULT_PLACE_ID)));
local v23 = game:DefineFastString("TutorialUpsellImageAssetId", (tostring(v17.TUTORIAL_EXPERIENCE_DEFAULT_IMAGE_ASSET_ID)));
return function(v24) --[[ Line: 45 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useTokens_0 (copy), v6 (copy), l_InputSize_0 (copy), v17 (copy), v23 (copy), l_useLocalization_0 (copy), v5 (copy), v21 (copy), l_TelemetryService_0 (copy), l_SetDarkThemeOverride_0 (copy), l_ClearThemeOverride_0 (copy), l_AppPage_0 (copy), l_ExperienceService_0 (copy), v22 (copy), l_View_0 (copy), l_Image_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy)
    local v25 = l_useDispatch_0();
    local v26 = l_useTokens_0();
    local v27, v28 = v6.useState(false);
    local l_Large_0 = l_InputSize_0.Large;
    local v30 = string.format(v17.IMAGE_ASSET_URL_TEMPLATE, v23);
    local v31 = l_useLocalization_0({
        titleLabel = "MobilePlatform.TutorialUpsell.Label.StartWithATutorial", 
        descriptionLabel = "MobilePlatform.TutorialUpsell.Label.TutorialDescription", 
        beginTutorialAction = "MobilePlatform.TutorialUpsell.Action.BeginTutorial", 
        skipAction = "MobilePlatform.TutorialUpsell.Action.Skip"
    });
    local function v33(v32) --[[ Line: 62 ]]
        -- upvalues: v5 (ref), v21 (ref)
        return {
            eventName = v32, 
            backends = {
                v5.TelemetryBackends.EventIngest
            }, 
            throttlingPercentage = v21, 
            lastUpdated = {
                2025, 
                8, 
                20
            }, 
            description = "Tutorial upsell screen event", 
            links = "https://roblox.atlassian.net/browse/MOBAPP-1201"
        };
    end;
    local function v35(v34) --[[ Line: 75 ]]
        -- upvalues: l_TelemetryService_0 (ref), v33 (copy), v17 (ref)
        l_TelemetryService_0:LogEvent(v33(v17.EVENT_BUTTON_CLICK_EVENT), {
            customFields = {
                buttonName = v34
            }
        });
    end;
    v6.useEffect(function() --[[ Line: 83 ]]
        -- upvalues: l_TelemetryService_0 (ref), v33 (copy), v17 (ref)
        l_TelemetryService_0:LogEvent(v33(v17.EVENT_SCREEN_IMPRESSION_EVENT), {});
    end, {});
    v6.useEffect(function() --[[ Line: 97 ]]
        -- upvalues: v27 (copy), l_SetDarkThemeOverride_0 (ref)
        if not v27 then
            l_SetDarkThemeOverride_0();
        end;
    end, {
        v26
    });
    local function _() --[[ Line: 103 ]]
        -- upvalues: v28 (copy), l_ClearThemeOverride_0 (ref)
        v28(true);
        l_ClearThemeOverride_0();
    end;
    local function v37() --[[ Line: 109 ]]
        -- upvalues: v35 (copy), v17 (ref), v25 (copy), v24 (copy), l_AppPage_0 (ref), v28 (copy), l_ClearThemeOverride_0 (ref)
        v35(v17.EVENT_BUTTON_CLICK_EVENT_BTN.SKIP);
        v25(v24.resetNavigationHistory({
            {
                name = l_AppPage_0.Home
            }
        }));
        v28(true);
        l_ClearThemeOverride_0();
    end;
    local function v38() --[[ Line: 115 ]]
        -- upvalues: v35 (copy), v17 (ref), l_ExperienceService_0 (ref), v22 (ref), v25 (copy), v24 (copy), l_AppPage_0 (ref), v28 (copy), l_ClearThemeOverride_0 (ref)
        v35(v17.EVENT_BUTTON_CLICK_EVENT_BTN.START);
        l_ExperienceService_0:LaunchExperience({
            placeId = tonumber(v22)
        }, "TutorialUpsell", function() --[[ Line: 122 ]]
            -- upvalues: v25 (ref), v24 (ref), l_AppPage_0 (ref)
            v25(v24.resetNavigationHistory({
                {
                    name = l_AppPage_0.Home
                }
            }));
        end);
        v28(true);
        l_ClearThemeOverride_0();
    end;
    return v6.createElement(l_View_0, {
        tag = "size-full-full padding-xlarge", 
        backgroundStyle = v26.DarkMode.Surface.Surface_0
    }, {
        Contents = v6.createElement(l_View_0, {
            tag = "col gap-large auto-xy size-full-full padding-y-xlarge", 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            SplashImage = v6.createElement(l_Image_0, {
                tag = "size-full-0 auto-xy fill radius-large", 
                Image = v30, 
                ScaleType = Enum.ScaleType.Crop, 
                LayoutOrder = 1
            }), 
            TextContainer = v6.createElement(l_View_0, {
                tag = "col gap-small auto-y size-full-0 align-x-center", 
                LayoutOrder = 2
            }, {
                Title = v6.createElement(l_Text_0, {
                    tag = "text-heading-large text-wrap text-align-x-left size-full-0 auto-y", 
                    Text = v31.titleLabel
                }), 
                Body = v6.createElement(l_Text_0, {
                    tag = "text-body-large text-wrap text-align-x-left size-full-0 auto-y", 
                    Text = v31.descriptionLabel
                })
            }), 
            ButtonContainer = v6.createElement(l_View_0, {
                tag = "col gap-small auto-y size-full-0 align-x-center position-bottom-center", 
                LayoutOrder = 3
            }, {
                TutorialButton = v6.createElement(l_Button_0, {
                    text = v31.beginTutorialAction, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    onActivated = v38, 
                    size = l_Large_0, 
                    width = UDim.new(1, 0)
                }), 
                SkipButton = v6.createElement(l_Button_0, {
                    text = v31.skipAction, 
                    variant = l_ButtonVariant_0.Standard, 
                    onActivated = v37, 
                    size = l_Large_0, 
                    width = UDim.new(1, 0)
                })
            })
        })
    });
end;