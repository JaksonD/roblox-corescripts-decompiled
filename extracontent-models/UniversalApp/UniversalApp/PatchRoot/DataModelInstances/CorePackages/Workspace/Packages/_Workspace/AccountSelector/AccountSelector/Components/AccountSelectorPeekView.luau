local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_React_0 = v1.React;
local l_UIBlox_0 = v1.UIBlox;
local l_PeekView_0 = v1.PeekView.PeekView;
local l_Cryo_0 = v1.Cryo;
local l_RoactNavigation_0 = v1.RoactNavigation;
local l_PeekViewState_0 = v1.PeekView.PeekViewState;
local l_useNavigation_0 = v1.Hooks.useNavigation;
local l_useState_0 = l_React_0.useState;
local l_useEffect_0 = l_React_0.useEffect;
local l_useLocalization_0 = v1.Localization.Hooks.useLocalization;
local l_useDesignTokens_0 = v1.Style.useDesignTokens;
local l_useSelector_0 = v1.RoactUtils.Hooks.RoactRodux.useSelector;
local v14 = require(script.Parent.AccountSelectionList);
local _ = require(script.Parent.AccountSelection);
local v16 = require(l_Parent_0.Analytics.AnalyticsEvents);
local v17 = game:DefineFastFlag("MoveAccountSelectorClosingAfterOperation", false);
local v18 = game:DefineFastInt("AccountSelectorInitialRowsShown", 6);
local v19 = game:DefineFastFlag("EnableAccountSelectorPeekviewRemoveSuperBriefState", false);
local l_GetFFlagLuaAppEnableTopBanner_0 = v1.SharedFlags.GetFFlagLuaAppEnableTopBanner;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local v55 = l_RoactNavigation_0.withNavigationFocus(function(v22) --[[ Line: 54 ]] --[[ Name: AccountSelectorPeekView ]]
    -- upvalues: l_useStyle_0 (copy), l_useNavigation_0 (copy), l_useState_0 (copy), l_PeekViewState_0 (copy), l_useDesignTokens_0 (copy), v18 (copy), l_useLocalization_0 (copy), l_useSelector_0 (copy), l_GetFFlagLuaAppEnableTopBanner_0 (copy), l_React_0 (copy), l_useEffect_0 (copy), v16 (copy), v17 (copy), l_PeekView_0 (copy), v19 (copy), v14 (copy)
    local v23 = l_useStyle_0();
    local v24 = l_useNavigation_0();
    local v25, v26 = l_useState_0(false);
    local v27, v28 = l_useState_0(l_PeekViewState_0.Full);
    local l_BaseSize_0 = v23.Font.BaseSize;
    local v30 = v23.Font.Header1.RelativeSize * l_BaseSize_0;
    local v31 = l_useDesignTokens_0();
    local v32 = #v22.users;
    local l_Size_800_0 = v31.Global.Size_800;
    local v34 = l_Size_800_0 * 100.5;
    local v35 = l_Size_800_0 * (math.min(v18, v32) + 1.25 + 1);
    local v36 = v32 < 100 and l_Size_800_0 * v32 or v34;
    local v37 = l_useLocalization_0({
        titleText = v22.titleTextKey, 
        helpText = v22.helpTextKey
    });
    local v39 = l_useSelector_0(function(v38) --[[ Line: 88 ]]
        return v38.ScreenSize;
    end);
    local v41 = if l_GetFFlagLuaAppEnableTopBanner_0() then l_useSelector_0(function(v40) --[[ Line: 93 ]]
        return v40.GlobalGuiInset.top;
    end) else 0;
    local v42 = v39.X - 48;
    local v43 = l_React_0.useRef(false);
    local l_Color_0 = v23.Theme.BackgroundContrast.Color;
    l_useEffect_0(function() --[[ Line: 102 ]]
        -- upvalues: v22 (copy), v16 (ref), v43 (copy)
        local v45 = "";
        for _, v47 in v22.users do
            v45 = v45 .. tostring(v47.id) .. ",";
        end;
        v45 = v45:sub(1, -2);
        v16.sendPageLoadEvent(v22.context, v22.origin, v45);
        return function() --[[ Line: 111 ]]
            -- upvalues: v43 (ref), v22 (ref)
            if not v43.current then
                v22.onAccountSelectionAbandoned();
            end;
        end;
    end, {});
    local function v49(v48) --[[ Line: 120 ]] --[[ Name: handleAccountSelection ]]
        -- upvalues: v17 (ref), v28 (copy), l_PeekViewState_0 (ref), v26 (copy), v22 (copy), v16 (ref), v43 (copy)
        if not v17 then
            v28(l_PeekViewState_0.Closed);
        end;
        v26(true);
        v22.onAccountSelection(v48);
        v16.sendSelectEvent(v22.context, v22.origin, (tostring(v48)));
        v43.current = true;
        if v17 then
            v28(l_PeekViewState_0.Closed);
        end;
    end;
    local function v52(v50, _) --[[ Line: 133 ]] --[[ Name: viewStateChanged ]]
        -- upvalues: v28 (copy), l_PeekViewState_0 (ref), v24 (copy)
        v28(v50);
        if v50 == l_PeekViewState_0.Closed or v50 == l_PeekViewState_0.Hidden then
            v24.goBack();
        end;
    end;
    local function v54(v53) --[[ Line: 140 ]] --[[ Name: peekHeaderPositionYChange ]]
        -- upvalues: v28 (copy), l_PeekViewState_0 (ref)
        if v53 < 10 then
            v28(l_PeekViewState_0.Closed);
        end;
    end;
    return l_React_0.createElement("Frame", {
        Size = if l_GetFFlagLuaAppEnableTopBanner_0() then UDim2.new(1, 0, 0, v39.Y - v41) else UDim2.new(1, 0, 0, v39.Y), 
        BackgroundColor3 = v23.Theme.Overlay.Color, 
        BackgroundTransparency = 1
    }, {
        PeekView = l_React_0.createElement(l_PeekView_0, {
            hasScrim = true, 
            briefViewContentHeight = UDim.new(0, v35), 
            superBriefViewContentHeight = if v19 then nil else UDim.new(0, 40), 
            peekHeaderClose = false, 
            style = v23, 
            canDragFullViewToBrief = true, 
            stateOnMount = l_PeekViewState_0.Brief, 
            mountAnimation = true, 
            returnToFullView = true, 
            peekHeaderPositionYChange = v54, 
            thumbstickScrollEnabled = true, 
            showDraggerInClosedState = true, 
            viewStateChanged = v52, 
            peekViewState = v27
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
                        Text = v37.titleText, 
                        TextSize = v30, 
                        TextColor3 = v23.Theme.TextEmphasis.Color, 
                        TextTransparency = v23.Theme.TextDefault.Transparency, 
                        Font = v23.Font.Header2.Font, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextWrapped = true, 
                        Size = UDim2.new(0, v42, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y
                    })
                }), 
                Divider = l_React_0.createElement("Frame", {
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, 1), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v23.Theme.Divider.Color, 
                    BackgroundTransparency = v23.Theme.Divider.Transparency
                }), 
                HelpText = if v37.helpText then l_React_0.createElement("TextLabel", {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    Text = v37.helpText, 
                    TextSize = l_BaseSize_0, 
                    TextColor3 = v23.Theme.TextDefault.Color, 
                    TextTransparency = v23.Theme.TextDefault.Transparency, 
                    Font = v23.Font.Body.Font, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    Size = UDim2.new(0, v42, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y
                }) else nil, 
                AccountSelectionContent = l_React_0.createElement("Frame", {
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
                    AccountSelectionList = l_React_0.createElement(v14, {
                        users = v22.users, 
                        onAccountSelection = v49, 
                        height = v36, 
                        isDisabled = v25, 
                        LayoutOrder = 0, 
                        isScrollable = false
                    }), 
                    FooterContent = l_React_0.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, 0), 
                        BackgroundColor3 = v23.Theme.BackgroundUIDefault.Color, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1, 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }, {
                        Contents = if v22.renderFooterComponent then v22.renderFooterComponent() else nil
                    })
                })
            })
        })
    });
end);
return l_React_0.forwardRef(function(v56, v57) --[[ Line: 278 ]]
    -- upvalues: l_React_0 (copy), v55 (ref), l_Cryo_0 (copy)
    return l_React_0.createElement(v55, l_Cryo_0.Dictionary.join(v56, {
        defaultChildRef = v57
    }));
end);