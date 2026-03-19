local l_script_FirstAncestor_0 = script:FindFirstAncestor("LandingPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v3.Core.Style.useStyle;
local v5 = require(l_Parent_0.Foundation);
local l_ButtonVariant_0 = v5.Enums.ButtonVariant;
local l_InputSize_0 = v5.Enums.InputSize;
local l_PeekViewState_0 = require(l_Parent_0.PeekView).PeekViewState;
local l_FullscreenPageWithSafeArea_0 = require(l_Parent_0.AppBlox).FullscreenPageWithSafeArea;
local v10 = require(l_script_FirstAncestor_0.Components.AccountCarousel);
local v11 = require(l_script_FirstAncestor_0.Components.AccountCarouselMorePeekView);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v13 = require(l_script_FirstAncestor_0.Constants.LandingPageConstants);
local v14 = require(l_script_FirstAncestor_0.Components.EditAccountPicker);
local l_GetAccountsListWithSignedOutAccounts_0 = require(l_Parent_0.AccountSwitching).GetAccountsListWithSignedOutAccounts;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local _ = require(l_script_FirstAncestor_0.Components.AccountCarouselAvatar);
local l_DisclaimerLinks_0 = require(l_Parent_0.AuthCommon).Components.DisclaimerLinks;
local l_FFlagAccountPickerEnableUIBloxButtons_0 = require(l_Parent_0.SharedFlags).FFlagAccountPickerEnableUIBloxButtons;
local l_Button_0 = v3.App.Button.Button;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_StandardButtonSize_0 = v3.App.Button.Enum.StandardButtonSize;
local v24 = require(l_Parent_0.AuthAnalytics);
local l_GetFFlagEnableAccountCarouselEvents_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableAccountCarouselEvents;
local l_EventStreamConstants_0 = v24.EventStreamConstants;
local l_authPageload_0 = v24.Events.authPageload;
local l_authButtonClick_0 = v24.Events.authButtonClick;
return function(v29) --[[ Line: 47 ]]
    -- upvalues: v2 (copy), l_PeekViewState_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_GetAccountsListWithSignedOutAccounts_0 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), l_GetFFlagEnableAccountCarouselEvents_0 (copy), l_authPageload_0 (copy), l_EventStreamConstants_0 (copy), v14 (copy), l_FullscreenPageWithSafeArea_0 (copy), v5 (copy), v13 (copy), v10 (copy), l_FFlagAccountPickerEnableUIBloxButtons_0 (copy), l_authButtonClick_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_StandardButtonSize_0 (copy), l_DisclaimerLinks_0 (copy), v11 (copy)
    local v30, v31 = v2.useState(1);
    local v32, v33 = v2.useState(false);
    local v34, v35 = v2.useState(l_PeekViewState_0.Closed);
    local v36 = l_useRoactService_0(l_RoactNetworking_0);
    local v38 = v2.useCallback(function() --[[ Line: 53 ]]
        -- upvalues: l_GetAccountsListWithSignedOutAccounts_0 (ref), v36 (copy), v29 (copy)
        l_GetAccountsListWithSignedOutAccounts_0(v36, {
            isAuthenticated = false, 
            filterUnauthenticatedSessionsForAccountPicker = true
        }):andThen(function(v37) --[[ Line: 57 ]]
            -- upvalues: v29 (ref)
            v29.setAccountPickerAccounts(v37);
        end);
    end, {});
    local v39 = l_useStyle_0();
    local v40 = l_useLocalization_0({
        signInAsAccount = {
            "Authentication.AccountPicker.Button.SignInAsAccount"; 
            displayName = v29.accounts and v29.accounts[v30] and v29.accounts[v30].username or ""
        }, 
        continueAs = {
            "Authentication.AccountPicker.Button.ContinueAsSignedIn"; 
            displayName = v29.accounts and v29.accounts[v30] and v29.accounts[v30].username or ""
        }, 
        moreOptions = "Authentication.AccountPicker.Button.MoreOptions", 
        chooseAnAccount = "Authentication.AccountSwitch.Header.ChooseAnAccount"
    });
    v2.useEffect(function() --[[ Line: 82 ]]
        -- upvalues: l_GetFFlagEnableAccountCarouselEvents_0 (ref), l_authPageload_0 (ref), l_EventStreamConstants_0 (ref)
        if l_GetFFlagEnableAccountCarouselEvents_0() then
            l_authPageload_0(l_EventStreamConstants_0.Context.AccountPickerLandingScreen);
        end;
    end, {});
    return v2.createElement(v2.Fragment, nil, {
        EditAccountPicker = if v32 then v2.createElement(v14, {
            accounts = v29.accounts, 
            onClose = function() --[[ Line: 92 ]] --[[ Name: onClose ]]
                -- upvalues: v33 (copy), v38 (copy)
                v33(false);
                v38();
            end
        }) else nil, 
        AccountCarouselContainer = v2.createElement(l_FullscreenPageWithSafeArea_0, {
            includeStatusBar = true, 
            BackgroundColor3 = v39.Theme.BackgroundDefault.Color
        }, {
            v2.createElement(v5.View, {
                tag = "col auto-xy size-full-0", 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                LogoContainer = v2.createElement(v5.View, {
                    tag = "col auto-y size-full-full items-center align-x-center justify-center padding-top-xlarge", 
                    LayoutOrder = 0
                }, {
                    Logo = v2.createElement(v5.Image, {
                        Image = v13.Common.RobloxLogo.IMAGE, 
                        ScaleType = Enum.ScaleType.Fit, 
                        Size = UDim2.new(0.7, 0, 0.7, 0), 
                        tag = "self-center", 
                        aspectRatio = v13.Common.RobloxLogo.ASPECT_RATIO, 
                        sizeConstraint = {
                            MaxSize = Vector2.new(v13.Common.RobloxLogo.MAX_WIDTH_LARGE, v13.Common.RobloxLogo.MAX_WIDTH_LARGE / v13.Common.RobloxLogo.ASPECT_RATIO)
                        }, 
                        ZIndex = 1
                    })
                }), 
                ChooseAnAccountTextContainer = v2.createElement(v5.View, {
                    tag = "col auto-y size-full-0 items-center align-x-center padding-top-xlarge", 
                    LayoutOrder = 1
                }, {
                    ChooseAnAccountText = v2.createElement(v5.Text, {
                        Text = v40.chooseAnAccount, 
                        tag = "auto-xy text-heading-small content-emphasis text-align-x-center"
                    })
                }), 
                AccountCarousel = v2.createElement(v10, {
                    accounts = v29.accounts, 
                    avatarSize = v29.avatarSize, 
                    setSelectedAvatarIndex = v31, 
                    LayoutOrder = 2
                }), 
                ButtonContainer = v2.createElement(v5.View, {
                    tag = "auto-y size-full-0 gap-small col align-x-center padding-x-xlarge padding-y-medium", 
                    LayoutOrder = 3
                }, {
                    PrimaryButton = if not l_FFlagAccountPickerEnableUIBloxButtons_0 then v2.createElement(v5.Button, {
                        onActivated = function() --[[ Line: 147 ]] --[[ Name: onActivated ]]
                            -- upvalues: l_GetFFlagEnableAccountCarouselEvents_0 (ref), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v29 (copy), v30 (copy)
                            if l_GetFFlagEnableAccountCarouselEvents_0() then
                                l_authButtonClick_0(l_EventStreamConstants_0.Context.AccountPickerLandingScreen, if v29.accounts[v30].has_valid_session then l_EventStreamConstants_0.Button.AccountPickerContinueAsAccount else l_EventStreamConstants_0.Button.AccountPickerSignInAccount, v29.accounts[v30].user_id, nil);
                            end;
                            v29.onAvatarActivated(v29.accounts[v30].user_id, v29.accounts[v30].username, v29.accounts[v30].has_valid_session);
                        end, 
                        text = if not (v29.accounts and v29.accounts[v30]) or v29.accounts[v30].has_valid_session then v40.continueAs else v40.signInAsAccount, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        width = UDim.new(1, 0), 
                        size = l_InputSize_0.Large, 
                        LayoutOrder = 2
                    }) else v2.createElement(l_Button_0, {
                        onActivated = function() --[[ Line: 175 ]] --[[ Name: onActivated ]]
                            -- upvalues: l_GetFFlagEnableAccountCarouselEvents_0 (ref), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v29 (copy), v30 (copy)
                            if l_GetFFlagEnableAccountCarouselEvents_0() then
                                l_authButtonClick_0(l_EventStreamConstants_0.Context.AccountPickerLandingScreen, if v29.accounts[v30].has_valid_session then l_EventStreamConstants_0.Button.AccountPickerContinueAsAccount else l_EventStreamConstants_0.Button.AccountPickerSignInAccount, v29.accounts[v30].user_id, nil);
                            end;
                            v29.onAvatarActivated(v29.accounts[v30].user_id, v29.accounts[v30].username, v29.accounts[v30].has_valid_session);
                        end, 
                        text = if not (v29.accounts and v29.accounts[v30]) or v29.accounts[v30].has_valid_session then v40.continueAs else v40.signInAsAccount, 
                        buttonType = l_ButtonType_0.PrimaryContextual, 
                        standardSize = l_StandardButtonSize_0.Regular
                    }), 
                    SecondaryButton = if not l_FFlagAccountPickerEnableUIBloxButtons_0 then v2.createElement(v5.Button, {
                        onActivated = function() --[[ Line: 202 ]] --[[ Name: onActivated ]]
                            -- upvalues: v35 (copy), l_PeekViewState_0 (ref), l_GetFFlagEnableAccountCarouselEvents_0 (ref), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref)
                            v35(l_PeekViewState_0.Brief);
                            if l_GetFFlagEnableAccountCarouselEvents_0() then
                                l_authButtonClick_0(l_EventStreamConstants_0.Context.AccountPickerLandingScreen, l_EventStreamConstants_0.Button.AccountPickerMoreOptions, nil, nil);
                            end;
                        end, 
                        text = v40.moreOptions, 
                        variant = l_ButtonVariant_0.Standard, 
                        size = l_InputSize_0.Large, 
                        width = UDim.new(1, 0), 
                        LayoutOrder = 3
                    }) else v2.createElement(l_Button_0, {
                        onActivated = function() --[[ Line: 220 ]] --[[ Name: onActivated ]]
                            -- upvalues: l_GetFFlagEnableAccountCarouselEvents_0 (ref), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v35 (copy), l_PeekViewState_0 (ref)
                            if l_GetFFlagEnableAccountCarouselEvents_0() then
                                l_authButtonClick_0(l_EventStreamConstants_0.Context.AccountPickerLandingScreen, l_EventStreamConstants_0.Button.AccountPickerMoreOptions, nil, nil);
                            end;
                            v35(l_PeekViewState_0.Brief);
                        end, 
                        text = v40.moreOptions, 
                        buttonType = l_ButtonType_0.Secondary, 
                        standardSize = l_StandardButtonSize_0.Regular
                    })
                }), 
                DisclaimerLinksView = v2.createElement(v5.View, {
                    tag = "row auto-y size-full-0 align-x-center", 
                    LayoutOrder = 4
                }, {
                    DisclaimerLinks = v2.createElement(l_DisclaimerLinks_0, {
                        fillDirection = Enum.FillDirection.Horizontal
                    })
                })
            }); 
            PeekViewContainer = if v34 ~= l_PeekViewState_0.Closed then v2.createElement(v11, {
                navigateToLogin = v29.navigateToLogin, 
                navigateToSignup = v29.navigateToSignup, 
                peekViewState = v34, 
                setPeekViewState = v35, 
                navigateToManageAccounts = function() --[[ Line: 251 ]] --[[ Name: navigateToManageAccounts ]]
                    -- upvalues: v33 (copy)
                    v33(true);
                end
            }) else nil
        })
    });
end;