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
local v18 = game:DefineFastFlag("AddMaxLimitToAccountSelector", false);
local v19 = game:DefineFastInt("AccountSelectorInitialRowsShown", 6);
local v20 = game:DefineFastFlag("EnableAccountSelectorPeekviewRemoveSuperBriefState", false);
local l_GetFFlagLuaAppEnableTopBanner_0 = v1.SharedFlags.GetFFlagLuaAppEnableTopBanner;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local v56 = l_RoactNavigation_0.withNavigationFocus(function(v23) --[[ Line: 55 ]] --[[ Name: AccountSelectorPeekView ]]
    -- upvalues: l_useStyle_0 (copy), l_useNavigation_0 (copy), l_useState_0 (copy), l_PeekViewState_0 (copy), l_useDesignTokens_0 (copy), v18 (copy), v19 (copy), l_useLocalization_0 (copy), l_useSelector_0 (copy), l_GetFFlagLuaAppEnableTopBanner_0 (copy), l_React_0 (copy), l_useEffect_0 (copy), v16 (copy), v17 (copy), l_PeekView_0 (copy), v20 (copy), v14 (copy)
    local v24 = l_useStyle_0();
    local v25 = l_useNavigation_0();
    local v26, v27 = l_useState_0(false);
    local v28, v29 = l_useState_0(l_PeekViewState_0.Full);
    local l_BaseSize_0 = v24.Font.BaseSize;
    local v31 = v24.Font.Header1.RelativeSize * l_BaseSize_0;
    local v32 = l_useDesignTokens_0();
    local v33 = #v23.users;
    local l_Size_800_0 = v32.Global.Size_800;
    local v35 = l_Size_800_0 * 100.5;
    local v36 = l_Size_800_0 * (v33 + 1.25 + 1);
    if v18 then
        v36 = l_Size_800_0 * (math.min(v19, v33) + 1.25 + 1);
    end;
    local v37 = v33 < 100 and l_Size_800_0 * v33 or v35;
    local v38 = l_useLocalization_0({
        titleText = v23.titleTextKey, 
        helpText = v23.helpTextKey
    });
    local v40 = l_useSelector_0(function(v39) --[[ Line: 96 ]]
        return v39.ScreenSize;
    end);
    local v42 = if l_GetFFlagLuaAppEnableTopBanner_0() then l_useSelector_0(function(v41) --[[ Line: 101 ]]
        return v41.GlobalGuiInset.top;
    end) else 0;
    local v43 = v40.X - 48;
    local v44 = l_React_0.useRef(false);
    local l_Color_0 = v24.Theme.BackgroundContrast.Color;
    l_useEffect_0(function() --[[ Line: 110 ]]
        -- upvalues: v23 (copy), v16 (ref), v44 (copy)
        local v46 = "";
        for _, v48 in v23.users do
            v46 = v46 .. tostring(v48.id) .. ",";
        end;
        v46 = v46:sub(1, -2);
        v16.sendPageLoadEvent(v23.context, v23.origin, v46);
        return function() --[[ Line: 119 ]]
            -- upvalues: v44 (ref), v23 (ref)
            if not v44.current then
                v23.onAccountSelectionAbandoned();
            end;
        end;
    end, {});
    local function v50(v49) --[[ Line: 128 ]] --[[ Name: handleAccountSelection ]]
        -- upvalues: v17 (ref), v29 (copy), l_PeekViewState_0 (ref), v27 (copy), v23 (copy), v16 (ref), v44 (copy)
        if not v17 then
            v29(l_PeekViewState_0.Closed);
        end;
        v27(true);
        v23.onAccountSelection(v49);
        v16.sendSelectEvent(v23.context, v23.origin, (tostring(v49)));
        v44.current = true;
        if v17 then
            v29(l_PeekViewState_0.Closed);
        end;
    end;
    local function v53(v51, _) --[[ Line: 141 ]] --[[ Name: viewStateChanged ]]
        -- upvalues: v29 (copy), l_PeekViewState_0 (ref), v25 (copy)
        v29(v51);
        if v51 == l_PeekViewState_0.Closed or v51 == l_PeekViewState_0.Hidden then
            v25.goBack();
        end;
    end;
    local function v55(v54) --[[ Line: 148 ]] --[[ Name: peekHeaderPositionYChange ]]
        -- upvalues: v29 (copy), l_PeekViewState_0 (ref)
        if v54 < 10 then
            v29(l_PeekViewState_0.Closed);
        end;
    end;
    return l_React_0.createElement("Frame", {
        Size = if l_GetFFlagLuaAppEnableTopBanner_0() then UDim2.new(1, 0, 0, v40.Y - v42) else UDim2.new(1, 0, 0, v40.Y), 
        BackgroundColor3 = v24.Theme.Overlay.Color, 
        BackgroundTransparency = 1
    }, {
        PeekView = l_React_0.createElement(l_PeekView_0, {
            hasScrim = true, 
            briefViewContentHeight = UDim.new(0, v36), 
            superBriefViewContentHeight = if v20 then nil else UDim.new(0, 40), 
            peekHeaderClose = false, 
            style = v24, 
            canDragFullViewToBrief = true, 
            stateOnMount = l_PeekViewState_0.Brief, 
            mountAnimation = true, 
            returnToFullView = true, 
            peekHeaderPositionYChange = v55, 
            thumbstickScrollEnabled = true, 
            showDraggerInClosedState = true, 
            viewStateChanged = v53, 
            peekViewState = v28
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
                        Text = v38.titleText, 
                        TextSize = v31, 
                        TextColor3 = v24.Theme.TextEmphasis.Color, 
                        TextTransparency = v24.Theme.TextDefault.Transparency, 
                        Font = v24.Font.Header2.Font, 
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
                    BackgroundColor3 = v24.Theme.Divider.Color, 
                    BackgroundTransparency = v24.Theme.Divider.Transparency
                }), 
                HelpText = if v38.helpText then l_React_0.createElement("TextLabel", {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    Text = v38.helpText, 
                    TextSize = l_BaseSize_0, 
                    TextColor3 = v24.Theme.TextDefault.Color, 
                    TextTransparency = v24.Theme.TextDefault.Transparency, 
                    Font = v24.Font.Body.Font, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    Size = UDim2.new(0, v43, 0, 0), 
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
                        users = v23.users, 
                        onAccountSelection = v50, 
                        height = v37, 
                        isDisabled = v26, 
                        LayoutOrder = 0, 
                        isScrollable = false
                    }), 
                    FooterContent = l_React_0.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, 0), 
                        BackgroundColor3 = v24.Theme.BackgroundUIDefault.Color, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1, 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }, {
                        Contents = if v23.renderFooterComponent then v23.renderFooterComponent() else nil
                    })
                })
            })
        })
    });
end);
return l_React_0.forwardRef(function(v57, v58) --[[ Line: 286 ]]
    -- upvalues: l_React_0 (copy), v56 (ref), l_Cryo_0 (copy)
    return l_React_0.createElement(v56, l_Cryo_0.Dictionary.join(v57, {
        defaultChildRef = v58
    }));
end);