local l_script_FirstAncestor_0 = script:FindFirstAncestor("LandingPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v4 = require(l_Parent_0.Foundation);
local l_ButtonVariant_0 = v4.Enums.ButtonVariant;
local l_InputSize_0 = v4.Enums.InputSize;
local l_PeekViewState_0 = require(l_Parent_0.PeekView).PeekViewState;
local l_FullscreenPageWithSafeArea_0 = require(l_Parent_0.AppBlox).FullscreenPageWithSafeArea;
local v9 = require(l_script_FirstAncestor_0.Components.AccountCarousel);
local v10 = require(l_script_FirstAncestor_0.Components.AccountCarouselMorePeekView);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v12 = require(l_script_FirstAncestor_0.Constants.LandingPageConstants);
local v13 = require(l_script_FirstAncestor_0.Components.EditAccountPicker);
local l_GetAccountsListWithSignedOutAccounts_0 = require(l_Parent_0.AccountSwitching).GetAccountsListWithSignedOutAccounts;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local _ = require(l_script_FirstAncestor_0.Components.AccountCarouselAvatar);
local l_DisclaimerLinks_0 = require(l_Parent_0.AuthCommon).Components.DisclaimerLinks;
local v19 = require(l_Parent_0.AuthAnalytics);
local l_GetFFlagEnableAccountCarouselEvents_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableAccountCarouselEvents;
local l_EventStreamConstants_0 = v19.EventStreamConstants;
local l_authPageload_0 = v19.Events.authPageload;
local l_authButtonClick_0 = v19.Events.authButtonClick;
return function(v24) --[[ Line: 42 ]]
    -- upvalues: v2 (copy), l_PeekViewState_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_GetAccountsListWithSignedOutAccounts_0 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), l_GetFFlagEnableAccountCarouselEvents_0 (copy), l_authPageload_0 (copy), l_EventStreamConstants_0 (copy), v13 (copy), l_FullscreenPageWithSafeArea_0 (copy), v4 (copy), v12 (copy), v9 (copy), l_authButtonClick_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy), l_DisclaimerLinks_0 (copy), v10 (copy)
    local v25, v26 = v2.useState(1);
    local v27, v28 = v2.useState(false);
    local v29, v30 = v2.useState(l_PeekViewState_0.Closed);
    local v31 = l_useRoactService_0(l_RoactNetworking_0);
    local v33 = v2.useCallback(function() --[[ Line: 48 ]]
        -- upvalues: l_GetAccountsListWithSignedOutAccounts_0 (ref), v31 (copy), v24 (copy)
        l_GetAccountsListWithSignedOutAccounts_0(v31, {
            isAuthenticated = false, 
            filterUnauthenticatedSessionsForAccountPicker = true
        }):andThen(function(v32) --[[ Line: 52 ]]
            -- upvalues: v24 (ref)
            v24.setAccountPickerAccounts(v32);
        end);
    end, {});
    local v34 = l_useStyle_0();
    local v35 = l_useLocalization_0({
        signInAsAccount = {
            "Authentication.AccountPicker.Button.SignInAsAccount"; 
            displayName = v24.accounts and v24.accounts[v25] and v24.accounts[v25].username or ""
        }, 
        continueAs = {
            "Authentication.AccountPicker.Button.ContinueAsSignedIn"; 
            displayName = v24.accounts and v24.accounts[v25] and v24.accounts[v25].username or ""
        }, 
        moreOptions = "Authentication.AccountPicker.Button.MoreOptions", 
        chooseAnAccount = "Authentication.AccountSwitch.Header.ChooseAnAccount"
    });
    v2.useEffect(function() --[[ Line: 77 ]]
        -- upvalues: l_GetFFlagEnableAccountCarouselEvents_0 (ref), l_authPageload_0 (ref), l_EventStreamConstants_0 (ref)
        if l_GetFFlagEnableAccountCarouselEvents_0() then
            l_authPageload_0(l_EventStreamConstants_0.Context.AccountPickerLandingScreen);
        end;
    end, {});
    return v2.createElement(v2.Fragment, nil, {
        EditAccountPicker = if v27 then v2.createElement(v13, {
            accounts = v24.accounts, 
            onClose = function() --[[ Line: 87 ]] --[[ Name: onClose ]]
                -- upvalues: v28 (copy), v33 (copy)
                v28(false);
                v33();
            end
        }) else nil, 
        AccountCarouselContainer = v2.createElement(l_FullscreenPageWithSafeArea_0, {
            includeStatusBar = true, 
            BackgroundColor3 = v34.Theme.BackgroundDefault.Color
        }, {
            v2.createElement(v4.View, {
                tag = "col auto-xy size-full-0", 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                LogoContainer = v2.createElement(v4.View, {
                    tag = "col auto-y size-full-full items-center align-x-center justify-center padding-top-xlarge", 
                    LayoutOrder = 0
                }, {
                    Logo = v2.createElement(v4.Image, {
                        Image = v12.Common.RobloxLogo.IMAGE, 
                        ScaleType = Enum.ScaleType.Fit, 
                        Size = UDim2.new(0.7, 0, 0.7, 0), 
                        tag = "self-center", 
                        aspectRatio = v12.Common.RobloxLogo.ASPECT_RATIO, 
                        sizeConstraint = {
                            MaxSize = Vector2.new(v12.Common.RobloxLogo.MAX_WIDTH_LARGE, v12.Common.RobloxLogo.MAX_WIDTH_LARGE / v12.Common.RobloxLogo.ASPECT_RATIO)
                        }, 
                        ZIndex = 1
                    })
                }), 
                ChooseAnAccountTextContainer = v2.createElement(v4.View, {
                    tag = "col auto-y size-full-0 items-center align-x-center padding-top-xlarge", 
                    LayoutOrder = 1
                }, {
                    ChooseAnAccountText = v2.createElement(v4.Text, {
                        Text = v35.chooseAnAccount, 
                        tag = "auto-xy text-heading-small content-emphasis text-align-x-center"
                    })
                }), 
                AccountCarousel = v2.createElement(v9, {
                    accounts = v24.accounts, 
                    avatarSize = v24.avatarSize, 
                    setSelectedAvatarIndex = v26, 
                    LayoutOrder = 2
                }), 
                ButtonContainer = v2.createElement(v4.View, {
                    tag = "auto-y size-full-0 gap-small col align-x-center padding-x-xlarge padding-y-medium", 
                    LayoutOrder = 3
                }, {
                    PrimaryButton = v2.createElement(v4.Button, {
                        onActivated = function() --[[ Line: 141 ]] --[[ Name: onActivated ]]
                            -- upvalues: l_GetFFlagEnableAccountCarouselEvents_0 (ref), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v24 (copy), v25 (copy)
                            if l_GetFFlagEnableAccountCarouselEvents_0() then
                                l_authButtonClick_0(l_EventStreamConstants_0.Context.AccountPickerLandingScreen, if v24.accounts[v25].has_valid_session then l_EventStreamConstants_0.Button.AccountPickerContinueAsAccount else l_EventStreamConstants_0.Button.AccountPickerSignInAccount, v24.accounts[v25].user_id, nil);
                            end;
                            v24.onAvatarActivated(v24.accounts[v25].user_id, v24.accounts[v25].username, v24.accounts[v25].has_valid_session);
                        end, 
                        text = if not (v24.accounts and v24.accounts[v25]) or v24.accounts[v25].has_valid_session then v35.continueAs else v35.signInAsAccount, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        width = UDim.new(1, 0), 
                        size = l_InputSize_0.Large, 
                        LayoutOrder = 2
                    }), 
                    SecondaryButton = v2.createElement(v4.Button, {
                        onActivated = function() --[[ Line: 169 ]] --[[ Name: onActivated ]]
                            -- upvalues: v30 (copy), l_PeekViewState_0 (ref), l_GetFFlagEnableAccountCarouselEvents_0 (ref), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref)
                            v30(l_PeekViewState_0.Brief);
                            if l_GetFFlagEnableAccountCarouselEvents_0() then
                                l_authButtonClick_0(l_EventStreamConstants_0.Context.AccountPickerLandingScreen, l_EventStreamConstants_0.Button.AccountPickerMoreOptions, nil, nil);
                            end;
                        end, 
                        text = v35.moreOptions, 
                        variant = l_ButtonVariant_0.Standard, 
                        size = l_InputSize_0.Large, 
                        width = UDim.new(1, 0), 
                        LayoutOrder = 3
                    })
                }), 
                DisclaimerLinksView = v2.createElement(v4.View, {
                    tag = "row auto-y size-full-0 align-x-center", 
                    LayoutOrder = 4
                }, {
                    DisclaimerLinks = v2.createElement(l_DisclaimerLinks_0, {
                        fillDirection = Enum.FillDirection.Horizontal
                    })
                })
            }); 
            PeekViewContainer = if v29 ~= l_PeekViewState_0.Closed then v2.createElement(v10, {
                navigateToLogin = v24.navigateToLogin, 
                navigateToSignup = v24.navigateToSignup, 
                peekViewState = v29, 
                setPeekViewState = v30, 
                navigateToManageAccounts = function() --[[ Line: 202 ]] --[[ Name: navigateToManageAccounts ]]
                    -- upvalues: v28 (copy)
                    v28(true);
                end
            }) else nil
        })
    });
end;