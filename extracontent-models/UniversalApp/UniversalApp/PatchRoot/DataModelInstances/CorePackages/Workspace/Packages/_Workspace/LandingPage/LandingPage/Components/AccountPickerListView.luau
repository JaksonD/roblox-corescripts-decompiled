local l_script_FirstAncestor_0 = script:FindFirstAncestor("LandingPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_InputSize_0 = v3.Enums.InputSize;
local l_FullscreenPageWithSafeArea_0 = require(l_Parent_0.AppBlox).FullscreenPageWithSafeArea;
local v8 = require(l_Parent_0.UserLib);
local l_getRbxthumbWithTypeSizeAndOptions_0 = v8.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_Constants_0 = v8.Utils.Constants;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v12 = require(l_script_FirstAncestor_0.Constants.LandingPageConstants);
local l_DisclaimerLinks_0 = require(l_Parent_0.AuthCommon).Components.DisclaimerLinks;
local v14 = require(l_script_FirstAncestor_0.Components.EditAccountPicker);
local v15 = require(l_Parent_0.AuthAnalytics);
local l_EventStreamConstants_0 = v15.EventStreamConstants;
local l_authButtonClick_0 = v15.Events.authButtonClick;
local l_authPageload_0 = v15.Events.authPageload;
local l_GetAccountsListWithSignedOutAccounts_0 = require(l_Parent_0.AccountSwitching).GetAccountsListWithSignedOutAccounts;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v22 = game:DefineFastFlag("EnableAccountPickerListViewEvents", false);
local v23 = game:DefineFastFlag("FixAccountPickerListViewScrollAndAlignment", false);
return function(v24) --[[ Line: 53 ]]
    -- upvalues: v2 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), l_authPageload_0 (copy), l_EventStreamConstants_0 (copy), v22 (copy), l_GetAccountsListWithSignedOutAccounts_0 (copy), l_authButtonClick_0 (copy), v3 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_Constants_0 (copy), v14 (copy), l_FullscreenPageWithSafeArea_0 (copy), v12 (copy), v23 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy), l_DisclaimerLinks_0 (copy)
    local v25, v26 = v2.useState(false);
    local v27, v28 = v2.useState(v24.accounts);
    local v29 = l_useRoactService_0(l_RoactNetworking_0);
    local v30 = l_useStyle_0();
    local v31 = l_useLocalization_0({
        allAccounts = "Authentication.AccountPicker.Label.AllAccounts", 
        manage = "Authentication.AccountPicker.Label.Manage", 
        signInAsAccount = "Authentication.AccountPicker.Button.SignIntoAnotherAccount", 
        createAccount = "Authentication.AccountPicker.Button.CreateAccount", 
        signedOut = "Authentication.AccountPicker.Label.SignedOut"
    });
    v2.useEffect(function() --[[ Line: 67 ]]
        -- upvalues: l_authPageload_0 (ref), l_EventStreamConstants_0 (ref)
        l_authPageload_0(l_EventStreamConstants_0.Context.AccountPickerLandingScreenListView);
    end, {});
    v2.useEffect(function() --[[ Line: 71 ]]
        -- upvalues: v28 (copy), v24 (copy), v22 (ref), l_authPageload_0 (ref), l_EventStreamConstants_0 (ref)
        v28(v24.accounts);
        if v22 then
            l_authPageload_0(l_EventStreamConstants_0.Context.AccountPickerListViewAccountsDisplayed, tostring(#v24.accounts), nil);
        end;
    end, {
        v24.accounts
    });
    local v33 = v2.useCallback(function() --[[ Line: 82 ]]
        -- upvalues: l_GetAccountsListWithSignedOutAccounts_0 (ref), v29 (copy), v24 (copy)
        l_GetAccountsListWithSignedOutAccounts_0(v29, {
            isAuthenticated = false, 
            filterUnauthenticatedSessionsForAccountPicker = true
        }):andThen(function(v32) --[[ Line: 86 ]]
            -- upvalues: v24 (ref)
            v24.setAccountPickerAccounts(v32);
        end);
    end, {
        v29, 
        v24.setAccountPickerAccounts
    });
    local function _(v34) --[[ Line: 91 ]]
        -- upvalues: l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v24 (copy)
        l_authButtonClick_0(l_EventStreamConstants_0.Context.AccountPickerLandingScreenListView, l_EventStreamConstants_0.Button.AccountPickerAccountSelected, v34.user_id, nil);
        v24.onAvatarActivated(v34.user_id, v34.username, v34.has_valid_session);
    end;
    local function v36() --[[ Line: 101 ]]
        -- upvalues: l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v26 (copy)
        l_authButtonClick_0(l_EventStreamConstants_0.Context.AccountPickerLandingScreenListView, l_EventStreamConstants_0.Button.AccountPickerManageAccountsOpened, nil, nil);
        v26(true);
    end;
    local function v37() --[[ Line: 111 ]]
        -- upvalues: l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v24 (copy)
        l_authButtonClick_0(l_EventStreamConstants_0.Context.AccountPickerLandingScreenListView, l_EventStreamConstants_0.Button.AccountPickerSignInAnotherAccount, nil, nil);
        v24.navigateToLogin();
    end;
    local function v38() --[[ Line: 121 ]]
        -- upvalues: l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v24 (copy)
        l_authButtonClick_0(l_EventStreamConstants_0.Context.AccountPickerLandingScreenListView, l_EventStreamConstants_0.Button.AccountPickerCreateAccount, nil, nil);
        v24.navigateToSignup();
    end;
    local v39 = {};
    for v40, v41 in ipairs(v27) do
        local v42 = v41.username or "";
        local v43 = "@" .. v42;
        v39["AccountCard_" .. tostring(v40)] = v2.createElement(v3.View, {
            tag = "row items-center size-full-0 auto-y padding-x-small", 
            LayoutOrder = v40
        }, {
            AccountCard = v2.createElement(v3.View, {
                tag = "row align-y-center gap-none size-full-0 auto-y padding-medium padding-right-small radius-medium", 
                BackgroundTransparency = 1, 
                onActivated = function() --[[ Line: 143 ]] --[[ Name: onActivated ]]
                    -- upvalues: v41 (copy), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v24 (copy)
                    local l_v41_0 = v41;
                    l_authButtonClick_0(l_EventStreamConstants_0.Context.AccountPickerLandingScreenListView, l_EventStreamConstants_0.Button.AccountPickerAccountSelected, l_v41_0.user_id, nil);
                    v24.onAvatarActivated(l_v41_0.user_id, l_v41_0.username, l_v41_0.has_valid_session);
                end, 
                stateLayer = {
                    affordance = v3.Enums.StateLayerAffordance.None
                }
            }, {
                Avatar = v2.createElement(v3.View, {
                    tag = "radius-full col self-center", 
                    Size = UDim2.new(0, 56, 0, 56), 
                    LayoutOrder = 0
                }, {
                    AvatarContainer = v2.createElement(v3.View, {
                        Size = UDim2.new(0, 56, 0, 56), 
                        tag = "radius-circle bg-surface-200"
                    }, {
                        AvatarImage = v2.createElement(v3.Image, {
                            Size = UDim2.new(1, 0, 1, 0), 
                            Image = l_getRbxthumbWithTypeSizeAndOptions_0(tostring(v41.user_id), l_Constants_0.RbxthumbTypes.AvatarHeadShot, 150), 
                            tag = "radius-circle"
                        })
                    })
                }), 
                AccountInfo = v2.createElement(v3.View, {
                    tag = "col items-start fill auto-xy padding-left-small", 
                    LayoutOrder = 1
                }, {
                    DisplayName = v2.createElement(v3.Text, {
                        Text = v41.display_name or v42, 
                        tag = "auto-xy text-title-large text-align-x-left text-truncate-end content-emphasis", 
                        LayoutOrder = 0
                    }), 
                    Username = v2.createElement(v3.Text, {
                        Text = v43, 
                        tag = "auto-xy text-body-small text-align-x-left text-truncate-end content-muted", 
                        LayoutOrder = 1
                    })
                }), 
                SignedOutPill = if not v41.has_valid_session then v2.createElement(v3.View, {
                    tag = "col auto-xy padding-x-small padding-y-xsmall radius-small bg-surface-300", 
                    LayoutOrder = 2
                }, {
                    PillText = v2.createElement(v3.Text, {
                        Text = v31.signedOut, 
                        tag = "auto-xy text-title-medium text-caption-large text-align-x-center"
                    })
                }) else nil
            })
        });
    end;
    return v2.createElement(v2.Fragment, nil, {
        EditAccountPicker = if v25 then v2.createElement(v14, {
            accounts = v24.accounts, 
            onClose = function() --[[ Line: 204 ]] --[[ Name: onClose ]]
                -- upvalues: v26 (copy), v33 (copy)
                v26(false);
                v33();
            end
        }) else nil, 
        MainContainer = v2.createElement(l_FullscreenPageWithSafeArea_0, {
            includeStatusBar = true, 
            BackgroundColor3 = v30.Theme.BackgroundDefault.Color
        }, {
            OuterContainer = v2.createElement(v3.View, {
                tag = "col size-full-0 auto-xy", 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                LogoContainer = v2.createElement(v3.View, {
                    tag = "justify-center col align-x-center items-center size-full-full auto-y padding-bottom-xxlarge padding-top-xlarge", 
                    LayoutOrder = 0
                }, {
                    Logo = v2.createElement(v3.Image, {
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
                HeaderContainer = v2.createElement(v3.View, {
                    tag = "row items-center size-full-0 auto-y padding-x-small padding-bottom-large padding-top-xxlarge", 
                    LayoutOrder = 1
                }, {
                    Title = v2.createElement(v3.Text, {
                        LayoutOrder = 1, 
                        Text = v31.allAccounts, 
                        tag = "align-x-left fill auto-xy padding-left-medium text-heading-small text-align-x-left content-emphasis"
                    }), 
                    EditButton = v2.createElement(v3.View, {
                        LayoutOrder = 2, 
                        tag = "col size-0 auto-xy padding-x-small", 
                        onActivated = v36
                    }, {
                        EditIcon = v2.createElement(v3.Text, {
                            Text = v31.manage, 
                            tag = "auto-xy text-title-medium text-align-x-right content-action-link"
                        })
                    })
                }), 
                ScrollViewContainer = v2.createElement(v3.View, {
                    tag = v23 and "col fill size-full-0 padding-x-xlarge" or "col fill size-full-0 padding-x-large", 
                    LayoutOrder = 2
                }, {
                    AccountListWrapper = if v23 then v2.createElement(v3.View, {
                        tag = "col fill size-full-0 radius-large bg-surface-100", 
                        ClipsDescendants = true
                    }, {
                        ScrollView = v2.createElement(v3.ScrollView, {
                            scroll = {
                                AutomaticCanvasSize = Enum.AutomaticSize.XY, 
                                CanvasSize = UDim2.fromOffset(0, 0), 
                                ScrollingDirection = Enum.ScrollingDirection.Y, 
                                scrollBarVisibility = v3.Enums.ScrollBarVisibility.None
                            }, 
                            Size = UDim2.new(1, 0, 1, 0)
                        }, {
                            AccountElements = v2.createElement(v3.View, {
                                tag = "col gap-xxsmall auto-xy"
                            }, v39)
                        })
                    }) else v2.createElement(v3.ScrollView, {
                        scroll = {
                            AutomaticCanvasSize = Enum.AutomaticSize.XY, 
                            CanvasSize = UDim2.fromOffset(0, 0), 
                            ScrollingDirection = Enum.ScrollingDirection.Y, 
                            scrollBarVisibility = v3.Enums.ScrollBarVisibility.None
                        }, 
                        Size = UDim2.new(1, 0, 1, 0)
                    }, {
                        AccountElements = v2.createElement(v3.View, {
                            tag = "col gap-xxsmall auto-xy radius-large bg-surface-100"
                        }, v39)
                    })
                }), 
                ButtonContainer = v2.createElement(v3.View, {
                    tag = "col align-x-center gap-small size-full-0 auto-y padding-x-xlarge padding-y-medium", 
                    LayoutOrder = 3
                }, {
                    SignInButton = v2.createElement(v3.Button, {
                        onActivated = v37, 
                        text = v31.signInAsAccount, 
                        variant = l_ButtonVariant_0.Standard, 
                        size = l_InputSize_0.Large, 
                        width = UDim.new(1, 0), 
                        LayoutOrder = 1
                    }), 
                    CreateAccountButton = v2.createElement(v3.Button, {
                        onActivated = v38, 
                        text = v31.createAccount, 
                        variant = l_ButtonVariant_0.Standard, 
                        size = l_InputSize_0.Large, 
                        width = UDim.new(1, 0), 
                        LayoutOrder = 2
                    })
                }), 
                DisclaimerLinksView = v2.createElement(v3.View, {
                    tag = "row align-x-center size-full-0 auto-y", 
                    LayoutOrder = 4
                }, {
                    DisclaimerLinks = v2.createElement(l_DisclaimerLinks_0, {
                        fillDirection = Enum.FillDirection.Horizontal
                    })
                })
            })
        })
    });
end;