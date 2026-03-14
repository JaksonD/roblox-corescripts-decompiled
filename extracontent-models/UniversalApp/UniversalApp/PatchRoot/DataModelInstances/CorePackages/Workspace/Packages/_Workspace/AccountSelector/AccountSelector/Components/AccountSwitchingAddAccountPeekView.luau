local l_TextService_0 = game:GetService("TextService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.dependencies);
local l_RoactRodux_0 = v2.RoactRodux;
local l_RoactUtils_0 = v2.RoactUtils;
local l_useDispatch_0 = l_RoactUtils_0.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = l_RoactUtils_0.Hooks.RoactRodux.useSelector;
local l_UIBlox_0 = v2.UIBlox;
local l_useLocalization_0 = v2.Localization.Hooks.useLocalization;
local l_React_0 = v2.React;
local l_useEffect_0 = l_React_0.useEffect;
local v11 = require(l_Parent_0.Analytics.AnalyticsEvents);
local v12 = require(l_Parent_0.Analytics.EventConstants);
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_useNavigation_0 = v2.Hooks.useNavigation;
local l_AppPage_0 = v2.RobloxAppEnums.AppPage;
local l_NavigateDown_0 = v2.NavigationRodux.Thunks.NavigateDown;
local l_PeekView_0 = v2.PeekView.PeekView;
local l_PeekViewState_0 = v2.PeekView.PeekViewState;
local l_useState_0 = l_React_0.useState;
local l_AppBtidLayers_0 = v2.ExperimentLayers.AppBtidLayers;
local l_RoactAppExperiment_0 = v2.RoactAppExperiment;
local v24 = game:DefineFastFlag("EnableAddAccountPeekviewRemoveSuperBriefState", false);
local l_FFlagEnableLuaLoginRevamp_0 = v2.SharedFlags.FFlagEnableLuaLoginRevamp;
local l_FStringLuaLoginRevampIxpLayer_0 = v2.SharedFlags.FStringLuaLoginRevampIxpLayer;
local l_GetFFlagEnableMultiPageSignup_0 = v2.SharedFlags.GetFFlagEnableMultiPageSignup;
local l_GetFFlagLuaAppEnableTopBanner_0 = v2.SharedFlags.GetFFlagLuaAppEnableTopBanner;
local v29 = 240;
local function v55(v30) --[[ Line: 56 ]] --[[ Name: AccountSwitchingAddAccountPeekView ]]
    -- upvalues: l_useStyle_0 (copy), l_useNavigation_0 (copy), l_useDispatch_0 (copy), l_useState_0 (copy), l_PeekViewState_0 (copy), l_useSelector_0 (copy), l_GetFFlagLuaAppEnableTopBanner_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_useLocalization_0 (copy), l_FFlagEnableLuaLoginRevamp_0 (copy), l_RoactAppExperiment_0 (copy), l_FStringLuaLoginRevampIxpLayer_0 (copy), l_TextService_0 (copy), v29 (ref), l_useEffect_0 (copy), v11 (copy), v12 (copy), l_GetFFlagEnableMultiPageSignup_0 (copy), l_React_0 (copy), l_PeekView_0 (copy), v24 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    local v31 = l_useStyle_0();
    local v32 = l_useNavigation_0();
    local v33 = l_useDispatch_0();
    local l_Color_0 = v31.Theme.BackgroundContrast.Color;
    local v35, v36 = l_useState_0(l_PeekViewState_0.Full);
    local l_BaseSize_0 = v31.Font.BaseSize;
    local v38 = v31.Font.Header1.RelativeSize * l_BaseSize_0;
    local v40 = l_useSelector_0(function(v39) --[[ Line: 65 ]]
        return v39.ScreenSize;
    end);
    local v42 = if l_GetFFlagLuaAppEnableTopBanner_0() then l_useSelector_0(function(v41) --[[ Line: 70 ]]
        return v41.GlobalGuiInset.top;
    end) else 0;
    local v43 = v40.X - 48;
    local function v44() --[[ Line: 77 ]]
        -- upvalues: v33 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        v33(l_NavigateDown_0({
            name = l_AppPage_0.MultiPageSignup, 
            extraProps = {
                enforceResetState = true
            }
        }));
    end;
    local v45 = l_useLocalization_0({
        titleText = "Authentication.AccountSwitch.Action.AddAccount", 
        loginText = "Authentication.Login.Heading.LoginRobloxAccountSwitching", 
        createText = "Authentication.AccountSwitch.Action.CreateNewAccount"
    });
    local v46 = {
        showLoginRevamp = false
    };
    if l_FFlagEnableLuaLoginRevamp_0 then
        v46 = l_RoactAppExperiment_0.useBrowserTrackerExperiment({
            l_FStringLuaLoginRevampIxpLayer_0
        }, function(v47) --[[ Line: 92 ]]
            -- upvalues: l_FStringLuaLoginRevampIxpLayer_0 (ref)
            return {
                showLoginRevamp = (v47[l_FStringLuaLoginRevampIxpLayer_0] or {}).showLoginRevamp
            };
        end);
    end;
    if l_GetFFlagLuaAppEnableTopBanner_0() then
        v29 = 193 + l_TextService_0:GetTextSize(v45.titleText, v38, v31.Font.Header1.Font, Vector2.new(0, 0)).Y;
    end;
    local function v49(v48) --[[ Line: 114 ]] --[[ Name: peekHeaderPositionYChange ]]
        -- upvalues: v36 (copy), l_PeekViewState_0 (ref)
        if v48 < 10 then
            v36(l_PeekViewState_0.Closed);
        end;
    end;
    local function v52(v50, _) --[[ Line: 121 ]] --[[ Name: viewStateChanged ]]
        -- upvalues: v36 (copy), l_PeekViewState_0 (ref), v32 (copy)
        v36(v50);
        if v50 == l_PeekViewState_0.Closed or v50 == l_PeekViewState_0.Hidden then
            v32.goBack();
        end;
    end;
    l_useEffect_0(function() --[[ Line: 128 ]]
        -- upvalues: v11 (ref), v12 (ref), v30 (copy)
        v11.sendModalShownEvent(v12.ctx.accountSwitcherAddAccount, v30.origin);
    end, {});
    local function v53() --[[ Line: 132 ]] --[[ Name: navigateToLogin ]]
        -- upvalues: v11 (ref), v12 (ref), v30 (copy), l_FFlagEnableLuaLoginRevamp_0 (ref), v46 (ref)
        v11.sendButtonClickEvent(v12.ctx.accountSwitcherAddAccount, v30.origin, v12.btn.login);
        if l_FFlagEnableLuaLoginRevamp_0 and v46.showLoginRevamp then
            v30.navigateToLoginV2();
            return;
        else
            v30.navigateToLogin();
            return;
        end;
    end;
    local function v54() --[[ Line: 146 ]] --[[ Name: navigateToSignUp ]]
        -- upvalues: v11 (ref), v12 (ref), v30 (copy), l_GetFFlagEnableMultiPageSignup_0 (ref), v44 (copy)
        v11.sendButtonClickEvent(v12.ctx.accountSwitcherAddAccount, v30.origin, v12.btn.signup);
        if l_GetFFlagEnableMultiPageSignup_0() and v30.shouldEnableMultiPageSignup then
            v44();
            return;
        else
            v30.navigateToSignUp();
            return;
        end;
    end;
    return l_React_0.createElement("Frame", {
        Size = if l_GetFFlagLuaAppEnableTopBanner_0() then UDim2.new(1, 0, 0, v40.Y - v42) else UDim2.new(1, 0, 0, v40.Y), 
        BackgroundColor3 = v31.Theme.Overlay.Color, 
        BackgroundTransparency = 1
    }, {
        l_React_0.createElement(l_PeekView_0, {
            hasScrim = true, 
            screenSize = v40, 
            briefViewContentHeight = UDim.new(0, v29), 
            superBriefViewContentHeight = if v24 then nil else UDim.new(0, 40), 
            peekHeaderClose = false, 
            style = v31, 
            canDragFullViewToBrief = true, 
            stateOnMount = l_PeekViewState_0.Brief, 
            returnToFullView = true, 
            peekHeaderPositionYChange = v49, 
            thumbstickScrollEnabled = true, 
            showDraggerInClosedState = true, 
            viewStateChanged = v52, 
            peekViewState = v35
        }, {
            Content = l_React_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 0, 
                BorderColor3 = l_Color_0, 
                BackgroundColor3 = l_Color_0, 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                ContentPadding = l_React_0.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 48)
                }), 
                UIListLayout = l_React_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 12), 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                TitleFrame = l_React_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 0), 
                    LayoutOrder = 0, 
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    ContentPadding = l_React_0.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 24), 
                        PaddingRight = UDim.new(0, 24)
                    }), 
                    TitleText = l_React_0.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Text = v45.titleText, 
                        TextSize = v38, 
                        TextColor3 = v31.Theme.TextEmphasis.Color, 
                        TextTransparency = v31.Theme.TextDefault.Transparency, 
                        Font = v31.Font.Header2.Font, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextWrapped = true, 
                        Size = UDim2.new(0, v43, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y
                    })
                }), 
                Divider = l_React_0.createElement("Frame", {
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, 1), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v31.Theme.Divider.Color, 
                    BackgroundTransparency = v31.Theme.Divider.Transparency
                }), 
                ButtonContentFrame = l_React_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 3
                }, {
                    UIListLayout = l_React_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center
                    }), 
                    UIPadding = l_React_0.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 24)
                    }), 
                    LoginButton = l_React_0.createElement("Frame", {
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, -40, 0, 48), 
                        BackgroundTransparency = 1
                    }, {
                        UIPadding = l_React_0.createElement("UIPadding", {
                            PaddingBottom = UDim.new(0, 60)
                        }), 
                        Button = l_React_0.createElement(l_Button_0, {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            size = UDim2.new(1, 0, 0, 48), 
                            text = v45.loginText, 
                            onActivated = v53
                        })
                    }), 
                    SignupButton = l_React_0.createElement("Frame", {
                        LayoutOrder = 2, 
                        Size = UDim2.new(1, -40, 0, 48), 
                        BackgroundTransparency = 1
                    }, {
                        Button = l_React_0.createElement(l_Button_0, {
                            buttonType = l_ButtonType_0.Secondary, 
                            size = UDim2.new(1, 0, 0, 48), 
                            text = v45.createText, 
                            onActivated = v54
                        })
                    })
                })
            })
        })
    });
end;
if l_GetFFlagEnableMultiPageSignup_0() then
    v55 = l_RoactAppExperiment_0.connectBrowserTrackerLayer({
        l_AppBtidLayers_0.SignupLayer
    }, function(v56, _) --[[ Line: 294 ]]
        -- upvalues: l_AppBtidLayers_0 (copy)
        return {
            shouldEnableMultiPageSignup = (v56[l_AppBtidLayers_0.SignupLayer] or {}).shouldEnableMultiPageSignup
        };
    end)(v55);
end;
return (l_RoactRodux_0.connect(nil, function(v58) --[[ Line: 304 ]]
    -- upvalues: l_NavigateDown_0 (copy), l_AppPage_0 (copy)
    return {
        navigateToLogin = function() --[[ Line: 306 ]] --[[ Name: navigateToLogin ]]
            -- upvalues: v58 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
            v58(l_NavigateDown_0({
                name = l_AppPage_0.Login
            }));
        end, 
        navigateToLoginV2 = function() --[[ Line: 310 ]] --[[ Name: navigateToLoginV2 ]]
            -- upvalues: v58 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
            v58(l_NavigateDown_0({
                name = l_AppPage_0.LoginV2
            }));
        end, 
        navigateToSignUp = function() --[[ Line: 314 ]] --[[ Name: navigateToSignUp ]]
            -- upvalues: v58 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
            v58(l_NavigateDown_0({
                name = l_AppPage_0.SinglePageSignUp
            }));
        end
    };
end)(v55));