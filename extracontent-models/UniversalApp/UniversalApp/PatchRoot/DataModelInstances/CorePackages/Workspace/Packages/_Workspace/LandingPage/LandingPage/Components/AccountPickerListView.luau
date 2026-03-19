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
return function(v23) --[[ Line: 51 ]]
    -- upvalues: v2 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), l_authPageload_0 (copy), l_EventStreamConstants_0 (copy), v22 (copy), l_GetAccountsListWithSignedOutAccounts_0 (copy), l_authButtonClick_0 (copy), v3 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_Constants_0 (copy), v14 (copy), l_FullscreenPageWithSafeArea_0 (copy), v12 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy), l_DisclaimerLinks_0 (copy)
    local v24, v25 = v2.useState(false);
    local v26, v27 = v2.useState(v23.accounts);
    local v28 = l_useRoactService_0(l_RoactNetworking_0);
    local v29 = l_useStyle_0();
    local v30 = l_useLocalization_0({
        allAccounts = "Authentication.AccountPicker.Label.AllAccounts", 
        manage = "Authentication.AccountPicker.Label.Manage", 
        signInAsAccount = "Authentication.AccountPicker.Button.SignIntoAnotherAccount", 
        createAccount = "Authentication.AccountPicker.Button.CreateAccount", 
        signedOut = "Authentication.AccountPicker.Label.SignedOut"
    });
    v2.useEffect(function() --[[ Line: 65 ]]
        -- upvalues: l_authPageload_0 (ref), l_EventStreamConstants_0 (ref)
        l_authPageload_0(l_EventStreamConstants_0.Context.AccountPickerLandingScreenListView);
    end, {});
    v2.useEffect(function() --[[ Line: 69 ]]
        -- upvalues: v27 (copy), v23 (copy), v22 (ref), l_authPageload_0 (ref), l_EventStreamConstants_0 (ref)
        v27(v23.accounts);
        if v22 then
            l_authPageload_0(l_EventStreamConstants_0.Context.AccountPickerListViewAccountsDisplayed, tostring(#v23.accounts), nil);
        end;
    end, {
        v23.accounts
    });
    local v32 = v2.useCallback(function() --[[ Line: 80 ]]
        -- upvalues: l_GetAccountsListWithSignedOutAccounts_0 (ref), v28 (copy), v23 (copy)
        l_GetAccountsListWithSignedOutAccounts_0(v28, {
            isAuthenticated = false, 
            filterUnauthenticatedSessionsForAccountPicker = true
        }):andThen(function(v31) --[[ Line: 84 ]]
            -- upvalues: v23 (ref)
            v23.setAccountPickerAccounts(v31);
        end);
    end, {});
    local function _(v33) --[[ Line: 89 ]]
        -- upvalues: l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v23 (copy)
        l_authButtonClick_0(l_EventStreamConstants_0.Context.AccountPickerLandingScreenListView, l_EventStreamConstants_0.Button.AccountPickerAccountSelected, v33.user_id, nil);
        v23.onAvatarActivated(v33.user_id, v33.username, v33.has_valid_session);
    end;
    local function v35() --[[ Line: 99 ]]
        -- upvalues: l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v25 (copy)
        l_authButtonClick_0(l_EventStreamConstants_0.Context.AccountPickerLandingScreenListView, l_EventStreamConstants_0.Button.AccountPickerManageAccountsOpened, nil, nil);
        v25(true);
    end;
    local function v36() --[[ Line: 109 ]]
        -- upvalues: l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v23 (copy)
        l_authButtonClick_0(l_EventStreamConstants_0.Context.AccountPickerLandingScreenListView, l_EventStreamConstants_0.Button.AccountPickerSignInAnotherAccount, nil, nil);
        v23.navigateToLogin();
    end;
    local function v37() --[[ Line: 119 ]]
        -- upvalues: l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v23 (copy)
        l_authButtonClick_0(l_EventStreamConstants_0.Context.AccountPickerLandingScreenListView, l_EventStreamConstants_0.Button.AccountPickerCreateAccount, nil, nil);
        v23.navigateToSignup();
    end;
    local v38 = {};
    for v39, v40 in ipairs(v26) do
        local v41 = v40.username or "";
        local v42 = "@" .. v41;
        v38["AccountCard_" .. tostring(v39)] = v2.createElement(v3.View, {
            tag = "row padding-x-small size-full-0 items-center auto-y", 
            LayoutOrder = v39
        }, {
            AccountCard = v2.createElement(v3.View, {
                tag = "row size-full-0 auto-y gap-none padding-medium radius-medium align-y-center padding-right-small", 
                BackgroundTransparency = 1, 
                onActivated = function() --[[ Line: 141 ]] --[[ Name: onActivated ]]
                    -- upvalues: v40 (copy), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v23 (copy)
                    local l_v40_0 = v40;
                    l_authButtonClick_0(l_EventStreamConstants_0.Context.AccountPickerLandingScreenListView, l_EventStreamConstants_0.Button.AccountPickerAccountSelected, l_v40_0.user_id, nil);
                    v23.onAvatarActivated(l_v40_0.user_id, l_v40_0.username, l_v40_0.has_valid_session);
                end, 
                stateLayer = {
                    affordance = v3.Enums.StateLayerAffordance.None
                }
            }, {
                Avatar = v2.createElement(v3.View, {
                    tag = "col radius-full self-center", 
                    Size = UDim2.new(0, 56, 0, 56), 
                    LayoutOrder = 0
                }, {
                    AvatarContainer = v2.createElement(v3.View, {
                        Size = UDim2.new(0, 56, 0, 56), 
                        tag = "radius-circle bg-surface-200"
                    }, {
                        AvatarImage = v2.createElement(v3.Image, {
                            Size = UDim2.new(1, 0, 1, 0), 
                            Image = l_getRbxthumbWithTypeSizeAndOptions_0(tostring(v40.user_id), l_Constants_0.RbxthumbTypes.AvatarHeadShot, 150), 
                            tag = "radius-circle"
                        })
                    })
                }), 
                AccountInfo = v2.createElement(v3.View, {
                    tag = "col fill auto-xy items-start padding-left-small", 
                    LayoutOrder = 1
                }, {
                    DisplayName = v2.createElement(v3.Text, {
                        Text = v40.display_name or v41, 
                        tag = "auto-xy text-title-large text-truncate-end text-align-x-left content-emphasis", 
                        LayoutOrder = 0
                    }), 
                    Username = v2.createElement(v3.Text, {
                        Text = v42, 
                        tag = "auto-xy text-body-small text-truncate-end text-align-x-left content-muted", 
                        LayoutOrder = 1
                    })
                }), 
                SignedOutPill = if not v40.has_valid_session then v2.createElement(v3.View, {
                    tag = "col auto-xy padding-x-small padding-y-xsmall radius-small bg-surface-300", 
                    LayoutOrder = 2
                }, {
                    PillText = v2.createElement(v3.Text, {
                        Text = v30.signedOut, 
                        tag = "auto-xy text-caption-large text-align-x-center text-title-medium"
                    })
                }) else nil
            })
        });
    end;
    return v2.createElement(v2.Fragment, nil, {
        EditAccountPicker = if v24 then v2.createElement(v14, {
            accounts = v23.accounts, 
            onClose = function() --[[ Line: 202 ]] --[[ Name: onClose ]]
                -- upvalues: v25 (copy), v32 (copy)
                v25(false);
                v32();
            end
        }) else nil, 
        MainContainer = v2.createElement(l_FullscreenPageWithSafeArea_0, {
            includeStatusBar = true, 
            BackgroundColor3 = v29.Theme.BackgroundDefault.Color
        }, {
            OuterContainer = v2.createElement(v3.View, {
                tag = "col auto-xy size-full-0", 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                LogoContainer = v2.createElement(v3.View, {
                    tag = "col auto-y size-full-full items-center align-x-center justify-center padding-top-xlarge padding-bottom-xxlarge", 
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
                    tag = "row size-full-0 auto-y items-center padding-x-small padding-bottom-large padding-top-xxlarge", 
                    LayoutOrder = 1
                }, {
                    Title = v2.createElement(v3.Text, {
                        LayoutOrder = 1, 
                        Text = v30.allAccounts, 
                        tag = "fill auto-xy align-x-left padding-left-medium text-align-x-left text-heading-small content-emphasis"
                    }), 
                    EditButton = v2.createElement(v3.View, {
                        LayoutOrder = 2, 
                        tag = "col size-0 auto-xy padding-x-small", 
                        onActivated = v35
                    }, {
                        EditIcon = v2.createElement(v3.Text, {
                            Text = v30.manage, 
                            tag = "auto-xy text-title-medium text-align-x-right content-action-link"
                        })
                    })
                }), 
                ScrollViewContainer = v2.createElement(v3.View, {
                    tag = "col fill size-full-0 padding-x-large", 
                    LayoutOrder = 2
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
                            tag = "col auto-xy gap-xxsmall bg-surface-100 radius-large"
                        }, v38)
                    })
                }), 
                ButtonContainer = v2.createElement(v3.View, {
                    tag = "auto-y size-full-0 gap-small col align-x-center padding-x-xlarge padding-y-medium", 
                    LayoutOrder = 3
                }, {
                    SignInButton = v2.createElement(v3.Button, {
                        onActivated = v36, 
                        text = v30.signInAsAccount, 
                        variant = l_ButtonVariant_0.Standard, 
                        size = l_InputSize_0.Large, 
                        width = UDim.new(1, 0), 
                        LayoutOrder = 1
                    }), 
                    CreateAccountButton = v2.createElement(v3.Button, {
                        onActivated = v37, 
                        text = v30.createAccount, 
                        variant = l_ButtonVariant_0.Standard, 
                        size = l_InputSize_0.Large, 
                        width = UDim.new(1, 0), 
                        LayoutOrder = 2
                    })
                }), 
                DisclaimerLinksView = v2.createElement(v3.View, {
                    tag = "row auto-y size-full-0 align-x-center", 
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