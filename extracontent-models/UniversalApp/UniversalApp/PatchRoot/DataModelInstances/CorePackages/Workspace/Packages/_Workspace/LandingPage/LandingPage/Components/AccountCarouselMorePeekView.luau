local l_Parent_0 = script:FindFirstAncestor("LandingPage").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_PeekView_0 = require(l_Parent_0.PeekView).PeekView;
local l_PeekViewState_0 = require(l_Parent_0.PeekView).PeekViewState;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_debounce_0 = require(l_Parent_0.AuthCommon).Utils.debounce;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v8 = game:DefineFastInt("AccountPickerPeekViewCloseOffset", 10);
local v9 = game:DefineFastInt("AccountPickerPeekViewBriefViewSize", 80);
local v10 = require(l_Parent_0.AuthAnalytics);
local l_GetFFlagEnableAccountCarouselEvents_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableAccountCarouselEvents;
local l_EventStreamConstants_0 = v10.EventStreamConstants;
local l_authButtonClick_0 = v10.Events.authButtonClick;
local v14 = v9 * 3;
local function v16(v15) --[[ Line: 28 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.createElement(v2.View, {
        tag = "size-full-0 auto-y align-y-center text-align-x-left align-x-left padding-y-medium", 
        onActivated = v15.onActivated, 
        LayoutOrder = v15.LayoutOrder
    }, {
        ButtonText = v1.createElement(v2.Text, {
            Text = v15.text, 
            tag = "auto-xy text-title-large content-emphasis text-align-x-left padding-left-xlarge"
        })
    });
end;
return function(v17) --[[ Line: 49 ]]
    -- upvalues: l_useSelector_0 (copy), l_useLocalization_0 (copy), l_debounce_0 (copy), v8 (copy), l_PeekViewState_0 (copy), v1 (copy), v2 (copy), l_PeekView_0 (copy), v14 (copy), v16 (copy), l_GetFFlagEnableAccountCarouselEvents_0 (copy), l_authButtonClick_0 (copy), l_EventStreamConstants_0 (copy)
    local v19 = l_useSelector_0(function(v18) --[[ Line: 50 ]]
        return v18.ScreenSize;
    end);
    local v20 = l_useLocalization_0({
        signInToAnotherAccount = "Authentication.AccountPicker.Button.SignIntoAnotherAccount", 
        moreOptions = "Authentication.AccountPicker.Label.MoreOptions", 
        createAccount = "Authentication.AccountPicker.Button.CreateAccount", 
        manageAccounts = "Authentication.AccountPicker.Label.ManageAccounts"
    });
    local v22 = l_debounce_0(function(v21) --[[ Line: 61 ]]
        -- upvalues: v8 (ref), v17 (copy), l_PeekViewState_0 (ref)
        if v21 < v8 then
            v17.setPeekViewState(l_PeekViewState_0.Closed);
        end;
    end, 0.03);
    return v1.createElement(v2.View, {
        tag = "anchor-bottom-center position-bottom-center bg-over-media", 
        Size = UDim2.new(1, 0, 0, v19.Y)
    }, {
        v1.createElement(l_PeekView_0, {
            hasScrim = true, 
            screenSize = v19, 
            briefViewContentHeight = UDim.new(0, v14), 
            superBriefViewContentHeight = nil, 
            peekHeaderClose = false, 
            canDragFullViewToBrief = true, 
            stateOnMount = l_PeekViewState_0.Brief, 
            returnToFullView = true, 
            peekHeaderPositionYChange = function(v23) --[[ Line: 67 ]] --[[ Name: peekHeaderPositionYChange ]]
                -- upvalues: v22 (copy)
                v22(v23);
            end, 
            thumbstickScrollEnabled = true, 
            showDraggerInClosedState = true, 
            peekViewState = v17.peekViewState
        }, {
            PeekViewContent = v1.createElement(v2.View, {
                tag = "size-full-0 auto-y col gap-small align-x-left padding-bottom-xlarge"
            }, {
                Title = v1.createElement(v2.Text, {
                    Text = v20.moreOptions, 
                    tag = "auto-xy text-heading-medium content-emphasis text-align-x-left padding-left-xlarge padding-bottom-small", 
                    LayoutOrder = 1
                }), 
                ManageAccountsButton = v1.createElement(v16, {
                    onActivated = function() --[[ Line: 98 ]] --[[ Name: onActivated ]]
                        -- upvalues: v17 (copy)
                        v17.navigateToManageAccounts();
                    end, 
                    text = v20.manageAccounts, 
                    LayoutOrder = 2
                }), 
                LoginButton = v1.createElement(v16, {
                    onActivated = function() --[[ Line: 105 ]] --[[ Name: onActivated ]]
                        -- upvalues: l_GetFFlagEnableAccountCarouselEvents_0 (ref), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v17 (copy), l_PeekViewState_0 (ref)
                        if l_GetFFlagEnableAccountCarouselEvents_0() then
                            l_authButtonClick_0(l_EventStreamConstants_0.Context.AccountPickerLandingScreen, l_EventStreamConstants_0.Button.AccountPickerSignInAnotherAccount, nil, nil);
                        end;
                        v17.setPeekViewState(l_PeekViewState_0.Closed);
                        v17.navigateToLogin();
                    end, 
                    text = v20.signInToAnotherAccount, 
                    LayoutOrder = 3
                }), 
                SignupButton = v1.createElement(v16, {
                    onActivated = function() --[[ Line: 121 ]] --[[ Name: onActivated ]]
                        -- upvalues: l_GetFFlagEnableAccountCarouselEvents_0 (ref), l_authButtonClick_0 (ref), l_EventStreamConstants_0 (ref), v17 (copy), l_PeekViewState_0 (ref)
                        if l_GetFFlagEnableAccountCarouselEvents_0() then
                            l_authButtonClick_0(l_EventStreamConstants_0.Context.AccountPickerLandingScreen, l_EventStreamConstants_0.Button.AccountPickerCreateAccount, nil, nil);
                        end;
                        v17.setPeekViewState(l_PeekViewState_0.Closed);
                        v17.navigateToSignup();
                    end, 
                    text = v20.createAccount, 
                    LayoutOrder = 4
                })
            })
        })
    });
end;