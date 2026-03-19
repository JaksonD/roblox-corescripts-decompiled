local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.Localization);
local v5 = require(l_Parent_0.ReactFocusNavigation);
local v6 = require(l_Parent_0.FocusNavigationUtils);
local l_Contexts_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Contexts;
local v8 = require(l_Parent_0.ProfileShareLinks);
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_useProfileShareLink_0 = v8.Hooks.useProfileShareLink;
local l_ProfileSharePolicyEnum_0 = v8.Enums.ProfileSharePolicyEnum;
local v12 = require(l_Parent_0.RoactUtils);
local l_Button_0 = v3.App.Button.Button;
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_StandardButtonSize_0 = v3.App.Button.Enum.StandardButtonSize;
local l_VerticalScrollView_0 = v3.App.Container.VerticalScrollView;
local l_Images_0 = v3.App.ImageSet.Images;
local v19 = require(l_Parent_0.Foundation);
local l_InputLabel_0 = v19.InputLabel;
local l_InputLabelSize_0 = v19.Enums.InputLabelSize;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v24 = require(l_script_FirstAncestor_0.Components.ProfileQRCodeTopElements);
local v25 = require(l_script_FirstAncestor_0.Components.QRCodeView);
local v26 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_useIsWideMode_0 = require(l_Parent_0.SocialCommon).Hooks.useIsWideMode;
local l_useLocalization_0 = v4.Hooks.useLocalization;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_useDispatch_0 = v12.Hooks.RoactRodux.useDispatch;
local l_useFocusGuiObject_0 = v5.useFocusGuiObject;
local l_useLastInputMode_0 = v6.useLastInputMode;
local v33 = Color3.new(1, 1, 1);
local v34 = require(l_script_FirstAncestor_0.Flags.FFlagProfileQRCodeFixFocusNavigation);
local l_FFlagQRCodeCopyUpdates_0 = require(l_Parent_0.SharedFlags).FFlagQRCodeCopyUpdates;
return function(v36) --[[ Line: 74 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useAppPolicy_0 (copy), l_useLocalization_0 (copy), l_FFlagQRCodeCopyUpdates_0 (copy), v26 (copy), v2 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v34 (copy), l_useIsWideMode_0 (copy), l_useStyle_0 (copy), l_useLastInputMode_0 (copy), l_useFocusGuiObject_0 (copy), l_useProfileShareLink_0 (copy), l_Contexts_0 (copy), l_ProfileSharePolicyEnum_0 (copy), l_Images_0 (copy), v24 (copy), l_VerticalScrollView_0 (copy), v33 (copy), v25 (copy), l_StyledTextLabel_0 (copy), l_InputLabel_0 (copy), l_InputLabelSize_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_StandardButtonSize_0 (copy)
    local v37 = l_useDispatch_0();
    local v39 = l_useAppPolicy_0(function(v38) --[[ Line: 77 ]]
        return v38.getWebViewSupport();
    end);
    local v40 = l_useLocalization_0({
        description = if l_FFlagQRCodeCopyUpdates_0 then v26.QrCodeDescription else v26.ScanQRText, 
        shareProfileLink = v26.ShareProfileLink, 
        copyProfileLink = v26.CopyProfileLink, 
        learnMore = "Feature.Chat.Action.LearnMore"
    });
    local v41 = v2.useCallback(function() --[[ Line: 88 ]]
        -- upvalues: v37 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        v37(l_NavigateDown_0({
            name = l_AppPage_0.GenericWebPage, 
            detail = "https://en.help.roblox.com/hc/en-us/articles/37725513985812", 
            extraProps = {
                title = ""
            }
        }, nil));
    end, {
        v37
    });
    local v42, v43 = v2.useState(false);
    local v44 = if v34 then v2.useRef(nil) else nil;
    local v45 = l_useIsWideMode_0();
    local v46 = l_useStyle_0();
    local v47 = if v34 then l_useLastInputMode_0() else nil;
    local v48 = if v34 then l_useFocusGuiObject_0() else nil;
    local v49 = l_useProfileShareLink_0({
        context = l_Contexts_0.ProfileQRCode
    });
    local v50 = false;
    if v49.policy ~= l_ProfileSharePolicyEnum_0.Disabled then
        v50 = v49.hasLoaded;
    end;
    local v51 = nil;
    local v52 = nil;
    if v49.policy == l_ProfileSharePolicyEnum_0.Share then
        v51 = v40.shareProfileLink;
        v52 = l_Images_0["icons/actions/share"];
    elseif v49.policy == l_ProfileSharePolicyEnum_0.Copy then
        v51 = v40.copyProfileLink;
        v52 = l_Images_0["icons/menu/link"];
    end;
    if v34 then
        v2.useEffect(function() --[[ Line: 119 ]]
            -- upvalues: v48 (copy), v44 (copy), v47 (copy)
            if v48 and v44 and v44.current and v47 == "Focus" then
                v48(v44.current);
            end;
        end, {});
    end;
    return v2.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        TopElements = v2.createElement(v24, {
            appStorageService = v36.appStorageService, 
            onClose = v36.onClose, 
            openQrCodeScanner = v36.openQrCodeScanner, 
            robloxEventReceiver = v36.robloxEventReceiver
        }), 
        VerticalScrollView = v2.createElement(l_VerticalScrollView_0, {
            useAutomaticCanvasSize = true, 
            size = if v45 then nil else UDim2.new(1, 0, 1, -24), 
            canvasSizeY = UDim.new(), 
            position = UDim2.new(0, 0, 0, 56)
        }, {
            GradientBackground = v2.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundColor3 = v33, 
                BackgroundTransparency = v45 and 0.7 or 1, 
                Position = UDim2.fromScale(0, 0), 
                Size = if v45 then UDim2.fromScale(0.6, 1) else UDim2.fromScale(1, 1), 
                BorderSizePixel = 0, 
                [v2.Change.AbsoluteSize] = v2.useCallback(function(v53) --[[ Line: 151 ]]
                    -- upvalues: v43 (copy)
                    if v53.AbsoluteSize.Y >= 450 then
                        v43(true);
                        return;
                    else
                        v43(false);
                        return;
                    end;
                end)
            }, {
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Bottom
                }), 
                Content = v2.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    Size = if v45 then UDim2.new(1, 0, 1, -56) else UDim2.new(1, 0, 0.5, 0), 
                    BorderSizePixel = 0
                }, {
                    Layout = v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    Padding = v2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 24), 
                        PaddingRight = UDim.new(0, 24), 
                        PaddingBottom = UDim.new(0, 24), 
                        PaddingLeft = UDim.new(0, 24)
                    }), 
                    QRCodeView = v2.createElement(v25, {
                        layoutOrder = 1, 
                        isSmallScreen = v42
                    }), 
                    Spacer1 = v2.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.fromOffset(0, v42 and 12 or 24), 
                        LayoutOrder = 2
                    }), 
                    Description = v2.createElement(l_StyledTextLabel_0, {
                        layoutOrder = 3, 
                        text = v40.description, 
                        fontStyle = v46.Font.CaptionBody, 
                        lineHeight = 1, 
                        colorStyle = v46.Theme.TextDefault, 
                        size = if l_FFlagQRCodeCopyUpdates_0 then UDim2.new(0, 304, 0, 0) else UDim2.new(1, 0, 0, 0), 
                        automaticSize = Enum.AutomaticSize.Y, 
                        textXAlignment = if l_FFlagQRCodeCopyUpdates_0 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center, 
                        textYAlignment = if l_FFlagQRCodeCopyUpdates_0 then Enum.TextYAlignment.Top else Enum.TextYAlignment.Center, 
                        fluidSizing = false, 
                        richText = false
                    }), 
                    LearnMoreWebLink = if v39 then if l_FFlagQRCodeCopyUpdates_0 then v2.createElement("Frame", {
                        Size = UDim2.new(0, 304, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        LayoutOrder = 4
                    }, {
                        Layout = v2.createElement("UIListLayout", {
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            VerticalAlignment = Enum.VerticalAlignment.Top
                        }), 
                        LearnMoreWebLink = v2.createElement(l_InputLabel_0, {
                            tag = "auto-y size-full-0 text-align-x-left", 
                            RichText = true, 
                            Text = ("<u>%*</u>"):format(v40.learnMore), 
                            size = l_InputLabelSize_0.Small, 
                            onActivated = v41
                        })
                    }) else v2.createElement(l_InputLabel_0, {
                        LayoutOrder = 4, 
                        tag = "auto-y size-full-0", 
                        RichText = true, 
                        Text = ("<u>%*</u>"):format(v40.learnMore), 
                        size = l_InputLabelSize_0.Small, 
                        onActivated = v41
                    }) else nil, 
                    ProfileShareButtonContainer = if v50 then v2.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Size = UDim2.fromScale(1, 0), 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 5
                    }, {
                        Layout = v2.createElement("UIListLayout", {
                            HorizontalAlignment = Enum.HorizontalAlignment.Center
                        }), 
                        UIPadding = v2.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, 24), 
                            PaddingBottom = UDim.new(0, 24)
                        }), 
                        ProfileShareButton = v2.createElement(l_Button_0, {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            standardSize = l_StandardButtonSize_0.Regular, 
                            text = v51, 
                            icon = v52, 
                            maxWidth = 304, 
                            onActivated = v49.onActivated, 
                            ref = if v34 then v44 else nil
                        })
                    }) else nil, 
                    UISizeConstraint = v2.createElement("UISizeConstraint", {
                        MinSize = Vector2.new(0, 420)
                    })
                }), 
                Gradient = v2.createElement("UIGradient", {
                    Rotation = 90, 
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, v46.Theme.BackgroundContrast.Color), 
                        ColorSequenceKeypoint.new(1, v46.Theme.BackgroundContrast.Color)
                    }), 
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0.4), 
                        NumberSequenceKeypoint.new(1, 0)
                    })
                })
            })
        })
    });
end;