local l_script_FirstAncestor_0 = script:FindFirstAncestor("PasskeyUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RoactAppExperiment);
local l_AppBtidLayers_0 = require(l_Parent_0.ExperimentLayers).AppBtidLayers;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.RoactUtils);
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v5.Hooks.RoactRodux.useSelector;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v10 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v10.Core.Style.useStyle;
local l_Images_0 = v10.App.ImageSet.Images;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local v15 = require(l_script_FirstAncestor_0.Thunks.HandlePasskeyRegistration);
local v16 = require(script.Parent.PasskeyUpsellErrorModal);
local v17 = require(script.Parent.PasskeyUpsellSuccessScreen);
local v18 = require(script.Parent.PasskeyUpsellHeaderContainer);
local v19 = require(script.Parent.PasskeyUpsellButtonContainer);
local v20 = require(l_Parent_0.Foundation);
local l_SetCurrentToastMessage_0 = require(l_Parent_0.ToastRodux).Actions.SetCurrentToastMessage;
local l_View_0 = v20.View;
local l_Image_0 = v20.Image;
local l_Text_0 = v20.Text;
local l_useTokens_0 = v20.Hooks.useTokens;
local l_FullscreenPageWithSafeArea_0 = require(l_Parent_0.AppBlox).FullscreenPageWithSafeArea;
local l_ScrollView_0 = v20.ScrollView;
local l_ScrollBarVisibility_0 = v20.Enums.ScrollBarVisibility;
local v29 = require(l_script_FirstAncestor_0.Utils.UpdateCooldown);
local v30 = require(l_Parent_0.AuthAnalytics);
local l_authModalShown_0 = v30.Events.authModalShown;
local l_authPageload_0 = v30.Events.authPageload;
local l_authButtonClick_0 = v30.Events.authButtonClick;
local l_EventStreamConstants_0 = v30.EventStreamConstants;
local v35 = require(l_script_FirstAncestor_0.Enums.PasskeyUpsellSource);
local l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 = require(l_Parent_0.SharedFlags).FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment;
return function(v37) --[[ Line: 66 ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), l_useTokens_0 (copy), v4 (copy), l_useSelector_0 (copy), v2 (copy), l_AppBtidLayers_0 (copy), v35 (copy), l_authPageload_0 (copy), l_EventStreamConstants_0 (copy), l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 (copy), l_AppPage_0 (copy), v29 (copy), l_authButtonClick_0 (copy), v15 (copy), l_authModalShown_0 (copy), l_SetCurrentToastMessage_0 (copy), l_Images_0 (copy), l_View_0 (copy), l_Image_0 (copy), l_Text_0 (copy), l_withLocalization_0 (copy), l_FullscreenPageWithSafeArea_0 (copy), v17 (copy), v18 (copy), l_ScrollView_0 (copy), l_ScrollBarVisibility_0 (copy), v19 (copy), v16 (copy)
    local v38 = l_useRoactService_0(l_RoactNetworking_0);
    local v39 = l_useStyle_0();
    local v40 = l_useDispatch_0();
    local v41 = l_useTokens_0();
    local v42, v43 = v4.useState(false);
    local v44, v45 = v4.useState(false);
    local v47 = l_useSelector_0(function(v46) --[[ Line: 74 ]]
        return v46.ScreenSize;
    end);
    local function v50(v48) --[[ Line: 84 ]] --[[ Name: determineScrollViewSize ]]
        -- upvalues: v47 (copy)
        if not v48 then
            return UDim2.fromScale(1, 0.5);
        else
            local v49 = math.clamp(math.pow(v47.Y / 640, 3) * 100, 75, v47.Y);
            return UDim2.new(1, 0, 0, v49);
        end;
    end;
    local v53 = v2.useBrowserTrackerExperiment({
        l_AppBtidLayers_0.LoginLayer
    }, function(v51) --[[ Line: 97 ]]
        -- upvalues: l_AppBtidLayers_0 (ref)
        local v52 = v51[l_AppBtidLayers_0.LoginLayer] or {};
        return {
            shouldShowToastNotification = v52.shouldShowPasskeyUpsellToastNotification, 
            shouldShowSuccessScreen = v52.shouldShowPasskeyUpsellSuccessScreen, 
            shouldRenderGraphic = v52.shouldRenderPasskeyUpsellGraphic
        };
    end);
    local v54 = v37.source or v35.Login;
    l_authPageload_0(l_EventStreamConstants_0.Context.PasskeyUpsellScreen, nil, nil, v54);
    local function v57(v55, v56) --[[ Line: 112 ]]
        -- upvalues: l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 (ref), v54 (copy), v35 (ref), v37 (copy), v40 (copy), l_AppPage_0 (ref), v29 (ref), v38 (copy), l_authButtonClick_0 (ref)
        if l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v54 == v35.AddAuthMethodPage and v37.onDismiss then
            v37.onDismiss();
        else
            v40(v37.resetNavigationHistory({
                {
                    name = l_AppPage_0.Home
                }
            }));
            v29(v38, v40);
        end;
        l_authButtonClick_0(v55, v56, nil, nil, nil, v54);
    end;
    local function v59() --[[ Line: 124 ]]
        -- upvalues: v15 (ref), v38 (copy), l_authModalShown_0 (ref), l_EventStreamConstants_0 (ref), v54 (copy), l_authPageload_0 (ref), l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 (ref), v35 (ref), v37 (copy), v53 (copy), v40 (copy), l_AppPage_0 (ref), l_SetCurrentToastMessage_0 (ref), v41 (copy), l_Images_0 (ref), v45 (copy), v43 (copy)
        v15(v38):andThen(function(v58) --[[ Line: 125 ]]
            -- upvalues: l_authModalShown_0 (ref), l_EventStreamConstants_0 (ref), v54 (ref), l_authPageload_0 (ref), l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 (ref), v35 (ref), v37 (ref), v53 (ref), v40 (ref), l_AppPage_0 (ref), l_SetCurrentToastMessage_0 (ref), v41 (ref), l_Images_0 (ref), v45 (ref)
            if not v58 then
                l_authModalShown_0(l_EventStreamConstants_0.Context.PasskeyUpsellErrorModalShown, l_EventStreamConstants_0.State.RegisterCredentialsError, nil, v54);
                return;
            else
                l_authPageload_0(l_EventStreamConstants_0.Context.PasskeyUpsellScreen, l_EventStreamConstants_0.State.PasskeyRegistrationComplete, nil, v54);
                if l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v54 == v35.AddAuthMethodPage then
                    v37.resetNavigationHistory(nil);
                    return;
                elseif v53.shouldShowToastNotification then
                    v40(v37.resetNavigationHistory({
                        {
                            name = l_AppPage_0.Home
                        }
                    }));
                    v40(l_SetCurrentToastMessage_0({
                        toastMessage = "Authentication.Passkey.Label.UpsellToastTitle", 
                        toastIconColorStyle = {
                            Color = v41.Color.Extended.Green.Green_500.Color3, 
                            Transparency = 0
                        }, 
                        toastIcon = l_Images_0["icons/common/check_contained_fill"], 
                        slideIn = true
                    }));
                    l_authModalShown_0(l_EventStreamConstants_0.Context.PasskeyUpsellToastShown, l_EventStreamConstants_0.State.Success, nil, v54);
                    return;
                else
                    if v53.shouldShowSuccessScreen then
                        task.wait(0.2);
                        v45(true);
                    end;
                    return;
                end;
            end;
        end):catch(function() --[[ Line: 171 ]]
            -- upvalues: l_authModalShown_0 (ref), l_EventStreamConstants_0 (ref), v54 (ref), v43 (ref)
            l_authModalShown_0(l_EventStreamConstants_0.Context.PasskeyUpsellErrorModalShown, l_EventStreamConstants_0.State.Unknown, nil, v54);
            v43(true);
        end);
    end;
    local function v65(v60, v61, v62) --[[ Line: 182 ]] --[[ Name: IconAndText ]]
        -- upvalues: v4 (ref), l_View_0 (ref), l_Image_0 (ref), v41 (copy), l_Text_0 (ref)
        local v63 = 32;
        local v64 = "";
        if v60 == "icons/common/eye_slash" then
            v63 = 24;
            v64 = " padding-left-xsmall";
        end;
        return v4.createElement(l_View_0, {
            tag = "row gap-medium size-full-0 auto-y text-wrap padding-right-xxlarge" .. v64, 
            LayoutOrder = v62
        }, {
            Icon = v4.createElement(l_Image_0, {
                Size = UDim2.new(0, v63, 0, v63), 
                BackgroundTransparency = 1, 
                imageStyle = {
                    Color3 = v41.Color.Content.Default.Color3
                }, 
                Image = v60, 
                LayoutOrder = 1
            }), 
            RowText = v4.createElement(l_Text_0, {
                Text = v61, 
                tag = "text-body-large text-align-x-left text-wrap auto-xy padding-right-xxlarge" .. v64, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, -v63, 0, v63)
            })
        });
    end;
    return l_withLocalization_0({
        upsellTitleText = "Authentication.Passkey.Label.UpsellTitle", 
        passkeyPurposeText = "Authentication.Passkey.Description.Purpose", 
        benefitsText = "Authentication.Passkey.Description.Benefits", 
        dataPolicyText = "Authentication.Passkey.Description.DataPolicy", 
        createPasskeyText = "Authentication.Passkey.Action.CreatePasskey", 
        keepUsingPasswordText = "Authentication.Passkey.Action.KeepUsingPassword", 
        skipText = "Authentication.SignUp.Label.Skip"
    })(function(v66) --[[ Line: 222 ]]
        -- upvalues: v4 (ref), l_FullscreenPageWithSafeArea_0 (ref), v39 (copy), l_View_0 (ref), v44 (copy), v17 (ref), v57 (copy), v53 (copy), v18 (ref), l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 (ref), v54 (copy), v35 (ref), l_EventStreamConstants_0 (ref), v42 (copy), l_ScrollView_0 (ref), v50 (copy), l_ScrollBarVisibility_0 (ref), v65 (copy), v19 (ref), v59 (copy), l_authButtonClick_0 (ref), v16 (ref), v43 (copy)
        return v4.createElement(l_FullscreenPageWithSafeArea_0, {
            includeStatusBar = false, 
            BackgroundColor3 = v39.Theme.BackgroundDefault.Color
        }, {
            v4.createElement(l_View_0, {
                tag = "size-full-full padding-right-xxlarge padding-left-xxlarge padding-bottom-xxlarge padding-top-xxlarge"
            }, v44 and v4.createElement(v17, {
                onCancelButtonPressed = v57, 
                shouldRenderGraphic = v53.shouldRenderGraphic
            }) or {
                v4.createElement(l_View_0, {
                    tag = "col gap-small size-full-0 auto-xy", 
                    LayoutOrder = 1
                }, {
                    PasskeyUpsellHeaderContainer = v4.createElement(v18, {
                        localizedTitleText = if l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v54 == v35.AddAuthMethodPage then v66.createPasskeyText else v66.upsellTitleText, 
                        onCancelButtonPressed = function() --[[ Line: 243 ]] --[[ Name: onCancelButtonPressed ]]
                            -- upvalues: v57 (ref), l_EventStreamConstants_0 (ref)
                            v57(l_EventStreamConstants_0.Context.PasskeyUpsellScreen, l_EventStreamConstants_0.Button.DismissCornerX);
                        end, 
                        LayoutOrder = 0, 
                        isDisabled = v42, 
                        shouldRenderGraphic = v53.shouldRenderGraphic
                    }); 
                    v4.createElement(l_ScrollView_0, {
                        LayoutOrder = 1, 
                        Size = v50(v53.shouldRenderGraphic), 
                        scroll = {
                            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                            CanvasSize = UDim2.fromScale(1, 0), 
                            ScrollingDirection = Enum.ScrollingDirection.Y, 
                            scrollBarVisibility = l_ScrollBarVisibility_0.Auto
                        }, 
                        layout = {
                            FillDirection = Enum.FillDirection.Vertical, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            VerticalAlignment = Enum.VerticalAlignment.Top, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            Padding = UDim.new(0, 24)
                        }
                    }, {
                        PasskeyPurposeRow = v65("icons/menu/passkey", v66.passkeyPurposeText, 1), 
                        PasskeyBenefitsRow = v65("icons/common/safety", v66.benefitsText, 2), 
                        DataPolicyRow = v65("icons/common/eye_slash", v66.dataPolicyText, 3)
                    })
                }); 
                PasskeyUpsellButtonContainer = v4.createElement(v19, {
                    localizedContinueText = v66.createPasskeyText, 
                    localizedCancelText = if l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v54 == v35.AddAuthMethodPage then v66.skipText else v66.keepUsingPasswordText, 
                    onContinueButtonPressed = function() --[[ Line: 282 ]] --[[ Name: onContinueButtonPressed ]]
                        -- upvalues: v59 (ref), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v54 (ref)
                        v59();
                        l_authButtonClick_0(l_EventStreamConstants_0.Context.PasskeyUpsellScreen, l_EventStreamConstants_0.Button.RegisterPasskey, nil, nil, nil, v54);
                    end, 
                    onCancelButtonPressed = function() --[[ Line: 293 ]] --[[ Name: onCancelButtonPressed ]]
                        -- upvalues: v57 (ref), l_EventStreamConstants_0 (ref)
                        v57(l_EventStreamConstants_0.Context.PasskeyUpsellScreen, l_EventStreamConstants_0.Button.Close);
                    end, 
                    layoutOrder = 2, 
                    isDisabled = v42
                })
            }); 
            ErrorToastContainer = v42 and v4.createElement(v16, {
                onCancel = function() --[[ Line: 304 ]] --[[ Name: onCancel ]]
                    -- upvalues: v43 (ref), v57 (ref), l_EventStreamConstants_0 (ref)
                    v43(false);
                    v57(l_EventStreamConstants_0.Context.PasskeyUpsellErrorModalShown, l_EventStreamConstants_0.Button.GoHome);
                end, 
                onTryAgain = function() --[[ Line: 311 ]] --[[ Name: onTryAgain ]]
                    -- upvalues: v43 (ref), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v54 (ref), v59 (ref)
                    v43(false);
                    l_authButtonClick_0(l_EventStreamConstants_0.Context.PasskeyUpsellErrorModalShown, l_EventStreamConstants_0.Button.TryAgain, nil, nil, nil, v54);
                    v59();
                end
            })
        });
    end);
end;