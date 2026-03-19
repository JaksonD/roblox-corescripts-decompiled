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
local v24 = v2.PureComponent:extend("ExperienceGuidelinesExplainedModal");
v24.validateProps = v5.strictInterface({
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
v24.init = function(v25) --[[ Line: 52 ]] --[[ Name: init ]]
    -- upvalues: v19 (copy), v10 (copy), v13 (copy), v15 (copy), l_FocusNavigationEventNameEnum_0 (copy), v20 (copy), v23 (copy)
    local l_FStringExperienceGuidelinesExplainedPageUrl_0 = v19.FStringExperienceGuidelinesExplainedPageUrl;
    v25.onLearnMoreActivated = function() --[[ Line: 55 ]]
        -- upvalues: v25 (copy), v10 (ref), l_FStringExperienceGuidelinesExplainedPageUrl_0 (copy), v13 (ref), v15 (ref)
        if v25.props.useExternalBrowserForAgeGuidelines then
            v10(v25.props.linking, l_FStringExperienceGuidelinesExplainedPageUrl_0);
            return;
        else
            local l_localization_0 = v25.props.localization;
            v25.props.navigateDown({
                name = v13.GenericWebPage, 
                detail = l_FStringExperienceGuidelinesExplainedPageUrl_0, 
                extraProps = {
                    title = if v25.props.ageRecommendationHeader then v25.props.ageRecommendationHeader else l_localization_0:Format("Feature.GameDetails.Label.ContentMaturity"), 
                    transitionAnimation = v15.SlideInFromRight
                }
            });
            return;
        end;
    end;
    v25.closeModal = function() --[[ Line: 73 ]]
        -- upvalues: v25 (copy)
        if v25.props.closeModal then
            v25.props.closeModal();
            return;
        else
            v25.props.navigateBack();
            return;
        end;
    end;
    v25.focusEventHandlers = {
        [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
            handler = v20.onRelease(function(v28) --[[ Line: 83 ]]
                -- upvalues: v23 (ref), v25 (copy)
                if v23 then
                    if not v25.props.hideCloseButton then
                        v25.closeModal();
                        v28:cancel();
                        return;
                    end;
                else
                    v25.closeModal();
                    v28:cancel();
                end;
            end)
        }
    };
end;
v24.render = function(v29) --[[ Line: 98 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_PartialPageModal_0 (copy), l_ButtonType_0 (copy), v14 (copy)
    local l_localization_1 = v29.props.localization;
    local l_ageRecommendations_0 = v29.props.ageRecommendations;
    local l_screenSize_0 = v29.props.screenSize;
    local v33 = v2.createElement(l_PartialPageModal_0, {
        title = if v29.props.ageRecommendationHeader then v29.props.ageRecommendationHeader else l_localization_1:Format("Feature.GameDetails.Label.ContentMaturity"), 
        screenSize = l_screenSize_0, 
        onCloseClicked = if v29.props.hideCloseButton then nil else v29.closeModal, 
        buttonStackProps = if v29.props.webViewSupport then {
            forcedFillDirection = Enum.FillDirection.Vertical, 
            buttonHeight = 48, 
            buttons = {
                {
                    buttonType = l_ButtonType_0.Secondary, 
                    props = {
                        isDisabled = false, 
                        onActivated = v29.onLearnMoreActivated, 
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
        Selectable = v29.props.hideCloseButton
    }, {
        Content = v33
    });
end;
v24 = v3.connect(function(v34, v35) --[[ Line: 154 ]]
    return {
        screenSize = v34.ScreenSize, 
        ageRecommendations = v34.AgeRecommendations[v35.universeId], 
        ageRecommendationHeader = v34.AgeRecommendationHeaders.headerDisplayName
    };
end, function(v36) --[[ Line: 160 ]]
    -- upvalues: v11 (copy), v12 (copy)
    return {
        navigateDown = function(v37) --[[ Line: 162 ]] --[[ Name: navigateDown ]]
            -- upvalues: v36 (copy), v11 (ref)
            return v36(v11(v37));
        end, 
        navigateBack = function() --[[ Line: 165 ]] --[[ Name: navigateBack ]]
            -- upvalues: v36 (copy), v12 (ref)
            return v36(v12());
        end
    };
end)(v24);
v24 = l_RoactServices_0.connect({
    localization = v7, 
    linking = l_AppLinking_0
})(v24);
return (l_RoactAppPolicy_0.connect(function(v38) --[[ Line: 176 ]]
    -- upvalues: l_GetFFlagUseExternalBrowserForAgeGuidelines10ft_0 (copy)
    local v39 = v38.getWebViewSupport();
    local v40 = if l_GetFFlagUseExternalBrowserForAgeGuidelines10ft_0() then v38.getUseExternalBrowserForAgeGuidelines() else nil;
    return {
        webViewSupport = v39, 
        useExternalBrowserForAgeGuidelines = v40
    };
end)(v24));