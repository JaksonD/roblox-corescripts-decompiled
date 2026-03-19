local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v5 = require(l_CorePackages_0.Packages.t);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v7 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local v10 = require(l_Modules_0.LuaApp.openExternalBrowser);
local v11 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v12 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v13 = require(l_Modules_0.LuaApp.AppPage);
local v14 = require(l_Modules_0.LuaApp.Components.ExperienceGuidelines.ExperienceGuidelinesList);
local v15 = require(l_Modules_0.LuaApp.Enum.TransitionAnimation);
local l_PartialPageModal_0 = v8.App.Dialog.Modal.PartialPageModal;
local l_ButtonType_0 = v8.App.Button.Enum.ButtonType;
local l_AgeRecommendationDetails_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).AgeRecommendations.AgeRecommendationDetails;
local v19 = require(l_Modules_0.LuaApp.Flags.ExperienceGuidelinesUrls);
local v20 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum;
local l_GetFFlagUseExternalBrowserForAgeGuidelines10ft_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagUseExternalBrowserForAgeGuidelines10ft;
local v23 = game:DefineFastFlag("FixGuidelinesExplainedClose", false);
local v24 = game:DefineFastFlag("LuaAppFixEdpMaturityConsoleFocus", false);
local v25 = v2.PureComponent:extend("ExperienceGuidelinesExplainedModal");
v25.validateProps = v5.strictInterface({
    ageRecommendations = v5.optional(l_AgeRecommendationDetails_0.validateModel), 
    ageRecommendationHeader = v5.optional(v5.string), 
    hideCloseButton = v5.optional(v5.boolean), 
    universeId = v5.string, 
    localization = v5.table, 
    navigateDown = v5.callback, 
    navigateBack = v5.callback, 
    closeModal = v5.optional(v5.callback), 
    screenSize = v5.Vector2, 
    webViewSupport = v5.boolean, 
    linking = v5.table, 
    useExternalBrowserForAgeGuidelines = v5.optional(v5.boolean)
});
v25.init = function(v26) --[[ Line: 53 ]] --[[ Name: init ]]
    -- upvalues: v19 (copy), v10 (copy), v13 (copy), v15 (copy), l_FocusNavigationEventNameEnum_0 (copy), v20 (copy), v23 (copy)
    local l_FStringExperienceGuidelinesExplainedPageUrl_0 = v19.FStringExperienceGuidelinesExplainedPageUrl;
    v26.onLearnMoreActivated = function() --[[ Line: 56 ]]
        -- upvalues: v26 (copy), v10 (ref), l_FStringExperienceGuidelinesExplainedPageUrl_0 (copy), v13 (ref), v15 (ref)
        if v26.props.useExternalBrowserForAgeGuidelines then
            v10(v26.props.linking, l_FStringExperienceGuidelinesExplainedPageUrl_0);
            return;
        else
            local l_localization_0 = v26.props.localization;
            v26.props.navigateDown({
                name = v13.GenericWebPage, 
                detail = l_FStringExperienceGuidelinesExplainedPageUrl_0, 
                extraProps = {
                    title = if v26.props.ageRecommendationHeader then v26.props.ageRecommendationHeader else l_localization_0:Format("Feature.GameDetails.Label.ContentMaturity"), 
                    transitionAnimation = v15.SlideInFromRight
                }
            });
            return;
        end;
    end;
    v26.closeModal = function() --[[ Line: 74 ]]
        -- upvalues: v26 (copy)
        if v26.props.closeModal then
            v26.props.closeModal();
            return;
        else
            v26.props.navigateBack();
            return;
        end;
    end;
    v26.focusEventHandlers = {
        [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
            handler = v20.onRelease(function(v29) --[[ Line: 84 ]]
                -- upvalues: v23 (ref), v26 (copy)
                if v23 then
                    if not v26.props.hideCloseButton then
                        v26.closeModal();
                        v29:cancel();
                        return;
                    end;
                else
                    v26.closeModal();
                    v29:cancel();
                end;
            end)
        }
    };
end;
v25.render = function(v30) --[[ Line: 99 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_PartialPageModal_0 (copy), l_ButtonType_0 (copy), v14 (copy), v24 (copy)
    local l_localization_1 = v30.props.localization;
    local l_ageRecommendations_0 = v30.props.ageRecommendations;
    local l_screenSize_0 = v30.props.screenSize;
    local v34 = v2.createElement(l_PartialPageModal_0, {
        title = if v30.props.ageRecommendationHeader then v30.props.ageRecommendationHeader else l_localization_1:Format("Feature.GameDetails.Label.ContentMaturity"), 
        screenSize = l_screenSize_0, 
        onCloseClicked = if v30.props.hideCloseButton then nil else v30.closeModal, 
        buttonStackProps = if v30.props.webViewSupport then {
            forcedFillDirection = Enum.FillDirection.Vertical, 
            buttonHeight = 48, 
            buttons = {
                {
                    buttonType = l_ButtonType_0.Secondary, 
                    props = {
                        isDisabled = false, 
                        onActivated = v30.onLearnMoreActivated, 
                        text = l_localization_1:Format("Feature.GameDetails.Label.LearnMore")
                    }
                }
            }
        } else nil
    }, {
        ViewFrame = v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 24), 
                PaddingBottom = UDim.new(0, 24)
            }), 
            DescriptorList = l_ageRecommendations_0 and v2.createElement(v14, {
                ageRecommendations = l_ageRecommendations_0
            })
        })
    });
    return v2.createElement("ImageButton", {
        AutoButtonColor = false, 
        Size = UDim2.new(1, 0, 1, 0), 
        ImageTransparency = 1, 
        BackgroundColor3 = Color3.new(0, 0, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Selectable = if v24 then v30.props.hideCloseButton else false
    }, {
        Content = v34
    });
end;
v25 = v3.connect(function(v35, v36) --[[ Line: 155 ]]
    return {
        screenSize = v35.ScreenSize, 
        ageRecommendations = v35.AgeRecommendations[v36.universeId], 
        ageRecommendationHeader = v35.AgeRecommendationHeaders.headerDisplayName
    };
end, function(v37) --[[ Line: 161 ]]
    -- upvalues: v11 (copy), v12 (copy)
    return {
        navigateDown = function(v38) --[[ Line: 163 ]] --[[ Name: navigateDown ]]
            -- upvalues: v37 (copy), v11 (ref)
            return v37(v11(v38));
        end, 
        navigateBack = function() --[[ Line: 166 ]] --[[ Name: navigateBack ]]
            -- upvalues: v37 (copy), v12 (ref)
            return v37(v12());
        end
    };
end)(v25);
v25 = l_RoactServices_0.connect({
    localization = v7, 
    linking = l_AppLinking_0
})(v25);
return (l_RoactAppPolicy_0.connect(function(v39) --[[ Line: 177 ]]
    -- upvalues: l_GetFFlagUseExternalBrowserForAgeGuidelines10ft_0 (copy)
    local v40 = v39.getWebViewSupport();
    local v41 = if l_GetFFlagUseExternalBrowserForAgeGuidelines10ft_0() then v39.getUseExternalBrowserForAgeGuidelines() else nil;
    return {
        webViewSupport = v40, 
        useExternalBrowserForAgeGuidelines = v41
    };
end)(v25));