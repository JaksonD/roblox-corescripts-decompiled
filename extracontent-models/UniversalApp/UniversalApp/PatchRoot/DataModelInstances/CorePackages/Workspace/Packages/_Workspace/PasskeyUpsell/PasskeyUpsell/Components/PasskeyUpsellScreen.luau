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
local l_authMsgShown_0 = v30.Events.authMsgShown;
local l_EventStreamConstants_0 = v30.EventStreamConstants;
local v36 = require(l_script_FirstAncestor_0.Enums.PasskeyUpsellSource);
local v37 = require(l_Parent_0.SharedFlags);
local l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 = v37.FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment;
local l_FFlagEmitPasskeyRegistrationSourceOnFinish_0 = v37.FFlagEmitPasskeyRegistrationSourceOnFinish;
return function(v40) --[[ Line: 68 ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), l_useTokens_0 (copy), v4 (copy), l_useSelector_0 (copy), v2 (copy), l_AppBtidLayers_0 (copy), v36 (copy), l_authPageload_0 (copy), l_EventStreamConstants_0 (copy), l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 (copy), l_AppPage_0 (copy), v29 (copy), l_authButtonClick_0 (copy), v15 (copy), l_authModalShown_0 (copy), l_FFlagEmitPasskeyRegistrationSourceOnFinish_0 (copy), l_authMsgShown_0 (copy), l_SetCurrentToastMessage_0 (copy), l_Images_0 (copy), l_View_0 (copy), l_Image_0 (copy), l_Text_0 (copy), l_withLocalization_0 (copy), l_FullscreenPageWithSafeArea_0 (copy), v17 (copy), v18 (copy), l_ScrollView_0 (copy), l_ScrollBarVisibility_0 (copy), v19 (copy), v16 (copy)
    local v41 = l_useRoactService_0(l_RoactNetworking_0);
    local v42 = l_useStyle_0();
    local v43 = l_useDispatch_0();
    local v44 = l_useTokens_0();
    local v45, v46 = v4.useState(false);
    local v47, v48 = v4.useState(false);
    local v50 = l_useSelector_0(function(v49) --[[ Line: 76 ]]
        return v49.ScreenSize;
    end);
    local function v53(v51) --[[ Line: 86 ]] --[[ Name: determineScrollViewSize ]]
        -- upvalues: v50 (copy)
        if not v51 then
            return UDim2.fromScale(1, 0.5);
        else
            local v52 = math.clamp(math.pow(v50.Y / 640, 3) * 100, 75, v50.Y);
            return UDim2.new(1, 0, 0, v52);
        end;
    end;
    local v56 = v2.useBrowserTrackerExperiment({
        l_AppBtidLayers_0.LoginLayer
    }, function(v54) --[[ Line: 99 ]]
        -- upvalues: l_AppBtidLayers_0 (ref)
        local v55 = v54[l_AppBtidLayers_0.LoginLayer] or {};
        return {
            shouldShowToastNotification = v55.shouldShowPasskeyUpsellToastNotification, 
            shouldShowSuccessScreen = v55.shouldShowPasskeyUpsellSuccessScreen, 
            shouldRenderGraphic = v55.shouldRenderPasskeyUpsellGraphic
        };
    end);
    local v57 = v40.source or v36.Login;
    l_authPageload_0(l_EventStreamConstants_0.Context.PasskeyUpsellScreen, nil, nil, v57);
    local function v60(v58, v59) --[[ Line: 114 ]]
        -- upvalues: l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 (ref), v57 (copy), v36 (ref), v40 (copy), v43 (copy), l_AppPage_0 (ref), v29 (ref), v41 (copy), l_authButtonClick_0 (ref)
        if l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v57 == v36.AddAuthMethodPage and v40.onDismiss then
            v40.onDismiss();
        else
            v43(v40.resetNavigationHistory({
                {
                    name = l_AppPage_0.Home
                }
            }));
            v29(v41, v43);
        end;
        l_authButtonClick_0(v58, v59, nil, nil, nil, v57);
    end;
    local function v62() --[[ Line: 126 ]]
        -- upvalues: v15 (ref), v41 (copy), l_authModalShown_0 (ref), l_EventStreamConstants_0 (ref), v57 (copy), l_authPageload_0 (ref), l_FFlagEmitPasskeyRegistrationSourceOnFinish_0 (ref), l_authMsgShown_0 (ref), l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 (ref), v36 (ref), v40 (copy), v56 (copy), v43 (copy), l_AppPage_0 (ref), l_SetCurrentToastMessage_0 (ref), v44 (copy), l_Images_0 (ref), v48 (copy), v46 (copy)
        v15(v41):andThen(function(v61) --[[ Line: 127 ]]
            -- upvalues: l_authModalShown_0 (ref), l_EventStreamConstants_0 (ref), v57 (ref), l_authPageload_0 (ref), l_FFlagEmitPasskeyRegistrationSourceOnFinish_0 (ref), l_authMsgShown_0 (ref), l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 (ref), v36 (ref), v40 (ref), v56 (ref), v43 (ref), l_AppPage_0 (ref), l_SetCurrentToastMessage_0 (ref), v44 (ref), l_Images_0 (ref), v48 (ref)
            if not v61 then
                l_authModalShown_0(l_EventStreamConstants_0.Context.PasskeyUpsellErrorModalShown, l_EventStreamConstants_0.State.RegisterCredentialsError, nil, v57);
                return;
            else
                l_authPageload_0(l_EventStreamConstants_0.Context.PasskeyUpsellScreen, l_EventStreamConstants_0.State.PasskeyRegistrationComplete, nil, v57);
                if l_FFlagEmitPasskeyRegistrationSourceOnFinish_0 then
                    l_authMsgShown_0(l_EventStreamConstants_0.Context.PasskeyCreationSource, l_EventStreamConstants_0.State.FinishRegistration, v57);
                end;
                if l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v57 == v36.AddAuthMethodPage then
                    v40.resetNavigationHistory(nil);
                    return;
                elseif v56.shouldShowToastNotification then
                    v43(v40.resetNavigationHistory({
                        {
                            name = l_AppPage_0.Home
                        }
                    }));
                    v43(l_SetCurrentToastMessage_0({
                        toastMessage = "Authentication.Passkey.Label.UpsellToastTitle", 
                        toastIconColorStyle = {
                            Color = v44.Color.Extended.Green.Green_500.Color3, 
                            Transparency = 0
                        }, 
                        toastIcon = l_Images_0["icons/common/check_contained_fill"], 
                        slideIn = true
                    }));
                    l_authModalShown_0(l_EventStreamConstants_0.Context.PasskeyUpsellToastShown, l_EventStreamConstants_0.State.Success, nil, v57);
                    return;
                else
                    if v56.shouldShowSuccessScreen then
                        task.wait(0.2);
                        v48(true);
                    end;
                    return;
                end;
            end;
        end):catch(function() --[[ Line: 180 ]]
            -- upvalues: l_authModalShown_0 (ref), l_EventStreamConstants_0 (ref), v57 (ref), v46 (ref)
            l_authModalShown_0(l_EventStreamConstants_0.Context.PasskeyUpsellErrorModalShown, l_EventStreamConstants_0.State.Unknown, nil, v57);
            v46(true);
        end);
    end;
    local function v68(v63, v64, v65) --[[ Line: 191 ]] --[[ Name: IconAndText ]]
        -- upvalues: v4 (ref), l_View_0 (ref), l_Image_0 (ref), v44 (copy), l_Text_0 (ref)
        local v66 = 32;
        local v67 = "";
        if v63 == "icons/common/eye_slash" then
            v66 = 24;
            v67 = " padding-left-xsmall";
        end;
        return v4.createElement(l_View_0, {
            tag = "row gap-medium size-full-0 auto-y text-wrap padding-right-xxlarge" .. v67, 
            LayoutOrder = v65
        }, {
            Icon = v4.createElement(l_Image_0, {
                Size = UDim2.new(0, v66, 0, v66), 
                BackgroundTransparency = 1, 
                imageStyle = {
                    Color3 = v44.Color.Content.Default.Color3
                }, 
                Image = v63, 
                LayoutOrder = 1
            }), 
            RowText = v4.createElement(l_Text_0, {
                Text = v64, 
                tag = "text-body-large text-align-x-left text-wrap auto-xy padding-right-xxlarge" .. v67, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, -v66, 0, v66)
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
    })(function(v69) --[[ Line: 231 ]]
        -- upvalues: v4 (ref), l_FullscreenPageWithSafeArea_0 (ref), v42 (copy), l_View_0 (ref), v47 (copy), v17 (ref), v60 (copy), v56 (copy), v18 (ref), l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 (ref), v57 (copy), v36 (ref), l_EventStreamConstants_0 (ref), v45 (copy), l_ScrollView_0 (ref), v53 (copy), l_ScrollBarVisibility_0 (ref), v68 (copy), v19 (ref), v62 (copy), l_authButtonClick_0 (ref), v16 (ref), v46 (copy)
        return v4.createElement(l_FullscreenPageWithSafeArea_0, {
            includeStatusBar = false, 
            BackgroundColor3 = v42.Theme.BackgroundDefault.Color
        }, {
            v4.createElement(l_View_0, {
                tag = "size-full-full padding-right-xxlarge padding-left-xxlarge padding-bottom-xxlarge padding-top-xxlarge"
            }, v47 and v4.createElement(v17, {
                onCancelButtonPressed = v60, 
                shouldRenderGraphic = v56.shouldRenderGraphic
            }) or {
                v4.createElement(l_View_0, {
                    tag = "col gap-small size-full-0 auto-xy", 
                    LayoutOrder = 1
                }, {
                    PasskeyUpsellHeaderContainer = v4.createElement(v18, {
                        localizedTitleText = if l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v57 == v36.AddAuthMethodPage then v69.createPasskeyText else v69.upsellTitleText, 
                        onCancelButtonPressed = function() --[[ Line: 252 ]] --[[ Name: onCancelButtonPressed ]]
                            -- upvalues: v60 (ref), l_EventStreamConstants_0 (ref)
                            v60(l_EventStreamConstants_0.Context.PasskeyUpsellScreen, l_EventStreamConstants_0.Button.DismissCornerX);
                        end, 
                        LayoutOrder = 0, 
                        isDisabled = v45, 
                        shouldRenderGraphic = v56.shouldRenderGraphic
                    }); 
                    v4.createElement(l_ScrollView_0, {
                        LayoutOrder = 1, 
                        Size = v53(v56.shouldRenderGraphic), 
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
                        PasskeyPurposeRow = v68("icons/menu/passkey", v69.passkeyPurposeText, 1), 
                        PasskeyBenefitsRow = v68("icons/common/safety", v69.benefitsText, 2), 
                        DataPolicyRow = v68("icons/common/eye_slash", v69.dataPolicyText, 3)
                    })
                }); 
                PasskeyUpsellButtonContainer = v4.createElement(v19, {
                    localizedContinueText = v69.createPasskeyText, 
                    localizedCancelText = if l_FFlagEnableAddAuthMethodPagePasskeyNudgeDirectionalExperiment_0 and v57 == v36.AddAuthMethodPage then v69.skipText else v69.keepUsingPasswordText, 
                    onContinueButtonPressed = function() --[[ Line: 291 ]] --[[ Name: onContinueButtonPressed ]]
                        -- upvalues: v62 (ref), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v57 (ref)
                        v62();
                        l_authButtonClick_0(l_EventStreamConstants_0.Context.PasskeyUpsellScreen, l_EventStreamConstants_0.Button.RegisterPasskey, nil, nil, nil, v57);
                    end, 
                    onCancelButtonPressed = function() --[[ Line: 302 ]] --[[ Name: onCancelButtonPressed ]]
                        -- upvalues: v60 (ref), l_EventStreamConstants_0 (ref)
                        v60(l_EventStreamConstants_0.Context.PasskeyUpsellScreen, l_EventStreamConstants_0.Button.Close);
                    end, 
                    layoutOrder = 2, 
                    isDisabled = v45
                })
            }); 
            ErrorToastContainer = v45 and v4.createElement(v16, {
                onCancel = function() --[[ Line: 313 ]] --[[ Name: onCancel ]]
                    -- upvalues: v46 (ref), v60 (ref), l_EventStreamConstants_0 (ref)
                    v46(false);
                    v60(l_EventStreamConstants_0.Context.PasskeyUpsellErrorModalShown, l_EventStreamConstants_0.Button.GoHome);
                end, 
                onTryAgain = function() --[[ Line: 320 ]] --[[ Name: onTryAgain ]]
                    -- upvalues: v46 (ref), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v57 (ref), v62 (ref)
                    v46(false);
                    l_authButtonClick_0(l_EventStreamConstants_0.Context.PasskeyUpsellErrorModalShown, l_EventStreamConstants_0.Button.TryAgain, nil, nil, nil, v57);
                    v62();
                end
            })
        });
    end);
end;