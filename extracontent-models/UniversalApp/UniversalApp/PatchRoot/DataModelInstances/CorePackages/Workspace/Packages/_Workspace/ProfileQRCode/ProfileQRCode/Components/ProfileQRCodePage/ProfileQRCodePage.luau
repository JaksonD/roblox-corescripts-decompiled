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
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local l_FStringCanAccessTrustedContactsAmpFeature_0 = require(l_Parent_0.SharedFlags).FStringCanAccessTrustedContactsAmpFeature;
local l_FFlagTCPolicyCheckRedirect_0 = require(l_Parent_0.SharedFlags).FFlagTCPolicyCheckRedirect;
local l_FStringIsUserInTcEligibleCountryAmpFeature_0 = require(l_Parent_0.SharedFlags).FStringIsUserInTcEligibleCountryAmpFeature;
local l_FStringCanAccessTrustedContactsAmpNameSpace_0 = require(l_Parent_0.SharedFlags).FStringCanAccessTrustedContactsAmpNameSpace;
local l_AmpApiProvider_0 = require(l_Parent_0.AmpUpsell).AmpApiProvider;
local l_AmpEnums_0 = require(l_Parent_0.AmpUpsell).AmpEnums;
return function(v43) --[[ Line: 81 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useAppPolicy_0 (copy), l_useLocalization_0 (copy), v26 (copy), l_FFlagQRCodeCopyUpdates_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), v2 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v34 (copy), l_useIsWideMode_0 (copy), l_useStyle_0 (copy), l_useLastInputMode_0 (copy), l_useFocusGuiObject_0 (copy), l_useProfileShareLink_0 (copy), l_Contexts_0 (copy), l_ProfileSharePolicyEnum_0 (copy), l_Images_0 (copy), l_FFlagTCPolicyCheckRedirect_0 (copy), l_FStringIsUserInTcEligibleCountryAmpFeature_0 (copy), l_FStringCanAccessTrustedContactsAmpFeature_0 (copy), l_AmpApiProvider_0 (copy), l_FStringCanAccessTrustedContactsAmpNameSpace_0 (copy), l_AmpEnums_0 (copy), v24 (copy), l_VerticalScrollView_0 (copy), v33 (copy), v25 (copy), l_StyledTextLabel_0 (copy), l_InputLabel_0 (copy), l_InputLabelSize_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_StandardButtonSize_0 (copy)
    local v44 = l_useDispatch_0();
    local v46 = l_useAppPolicy_0(function(v45) --[[ Line: 84 ]]
        return v45.getWebViewSupport();
    end);
    local v47 = l_useLocalization_0({
        description = v26.ScanQRText, 
        descriptionTCEducation = if l_FFlagQRCodeCopyUpdates_0 then v26.TrustedConnectionDescription else nil, 
        descriptionTrustedFriends = if l_FFlagConnectionsToFriendsRename_0 then v26.TrustedFriendsDescription else nil, 
        shareProfileLink = v26.ShareProfileLink, 
        copyProfileLink = v26.CopyProfileLink, 
        learnMore = "Feature.Chat.Action.LearnMore"
    });
    local v48 = v2.useCallback(function() --[[ Line: 97 ]]
        -- upvalues: v44 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        v44(l_NavigateDown_0({
            name = l_AppPage_0.GenericWebPage, 
            detail = "https://en.help.roblox.com/hc/en-us/articles/37725513985812", 
            extraProps = {
                title = ""
            }
        }, nil));
    end, {
        v44
    });
    local v49, v50 = v2.useState(false);
    local v51 = if v34 then v2.useRef(nil) else nil;
    local v52 = l_useIsWideMode_0();
    local v53 = l_useStyle_0();
    local v54 = if v34 then l_useLastInputMode_0() else nil;
    local v55 = if v34 then l_useFocusGuiObject_0() else nil;
    local v56 = l_useProfileShareLink_0({
        context = l_Contexts_0.ProfileQRCode
    });
    local v57 = false;
    if v56.policy ~= l_ProfileSharePolicyEnum_0.Disabled then
        v57 = v56.hasLoaded;
    end;
    local v58 = nil;
    local v59 = nil;
    if v56.policy == l_ProfileSharePolicyEnum_0.Share then
        v58 = v47.shareProfileLink;
        v59 = l_Images_0["icons/actions/share"];
    elseif v56.policy == l_ProfileSharePolicyEnum_0.Copy then
        v58 = v47.copyProfileLink;
        v59 = l_Images_0["icons/menu/link"];
    end;
    if v34 then
        v2.useEffect(function() --[[ Line: 128 ]]
            -- upvalues: v55 (copy), v51 (copy), v54 (copy)
            if v55 and v51 and v51.current and v54 == "Focus" then
                v55(v51.current);
            end;
        end, {});
    end;
    local v60, v61 = v2.useState(false);
    local v62, v63 = v2.useState(false);
    if l_FFlagQRCodeCopyUpdates_0 then
        v2.useEffect(function() --[[ Line: 139 ]]
            -- upvalues: l_FFlagTCPolicyCheckRedirect_0 (ref), l_FStringIsUserInTcEligibleCountryAmpFeature_0 (ref), l_FStringCanAccessTrustedContactsAmpFeature_0 (ref), l_AmpApiProvider_0 (ref), l_FStringCanAccessTrustedContactsAmpNameSpace_0 (ref), l_AmpEnums_0 (ref), v61 (copy), v63 (copy)
            local v64 = if l_FFlagTCPolicyCheckRedirect_0 then l_FStringIsUserInTcEligibleCountryAmpFeature_0 else l_FStringCanAccessTrustedContactsAmpFeature_0;
            if l_AmpApiProvider_0.upsellFeatureAccess(v64, {}, l_FStringCanAccessTrustedContactsAmpNameSpace_0).access == l_AmpEnums_0.AccessResponseEnum.Granted then
                v61(true);
            end;
            v63(true);
        end, {});
    end;
    return v2.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        TopElements = v2.createElement(v24, {
            appStorageService = v43.appStorageService, 
            onClose = v43.onClose, 
            openQrCodeScanner = v43.openQrCodeScanner, 
            robloxEventReceiver = v43.robloxEventReceiver
        }), 
        VerticalScrollView = v2.createElement(l_VerticalScrollView_0, {
            useAutomaticCanvasSize = true, 
            size = if v52 then nil else UDim2.new(1, 0, 1, -24), 
            canvasSizeY = UDim.new(), 
            position = UDim2.new(0, 0, 0, 56)
        }, {
            GradientBackground = v2.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundColor3 = v33, 
                BackgroundTransparency = v52 and 0.7 or 1, 
                Position = UDim2.fromScale(0, 0), 
                Size = if v52 then UDim2.fromScale(0.6, 1) else UDim2.fromScale(1, 1), 
                BorderSizePixel = 0, 
                [v2.Change.AbsoluteSize] = v2.useCallback(function(v65) --[[ Line: 174 ]]
                    -- upvalues: v50 (copy)
                    if v65.AbsoluteSize.Y >= 450 then
                        v50(true);
                        return;
                    else
                        v50(false);
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
                    Size = if v52 then UDim2.new(1, 0, 1, -56) else UDim2.new(1, 0, 0.5, 0), 
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
                        isSmallScreen = v49
                    }), 
                    Spacer1 = v2.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.fromOffset(0, v49 and 12 or 24), 
                        LayoutOrder = 2
                    }), 
                    Description = if l_FFlagQRCodeCopyUpdates_0 and v62 == false then v2.createElement("Frame", {
                        Size = UDim2.new(0, 304, 0, 45), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 3
                    }) else v2.createElement(l_StyledTextLabel_0, {
                        layoutOrder = 3, 
                        text = if l_FFlagQRCodeCopyUpdates_0 and v60 then if l_FFlagConnectionsToFriendsRename_0 then v47.descriptionTrustedFriends else v47.descriptionTCEducation else v47.description, 
                        fontStyle = v53.Font.CaptionBody, 
                        lineHeight = 1, 
                        colorStyle = v53.Theme.TextDefault, 
                        size = if l_FFlagQRCodeCopyUpdates_0 and v60 then UDim2.new(0, 304, 0, 0) else UDim2.new(1, 0, 0, 0), 
                        automaticSize = Enum.AutomaticSize.Y, 
                        textXAlignment = if l_FFlagQRCodeCopyUpdates_0 and v60 then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center, 
                        textYAlignment = if l_FFlagQRCodeCopyUpdates_0 and v60 then Enum.TextYAlignment.Top else Enum.TextYAlignment.Center, 
                        fluidSizing = false, 
                        richText = false
                    }), 
                    LearnMoreWebLink = if v46 then if l_FFlagQRCodeCopyUpdates_0 and v62 == false then v2.createElement("Frame", {
                        Size = UDim2.new(0, 304, 0, 15), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 4
                    }) else if l_FFlagQRCodeCopyUpdates_0 and v60 then v2.createElement("Frame", {
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
                            Text = ("<u>%*</u>"):format(v47.learnMore), 
                            size = l_InputLabelSize_0.Small, 
                            onActivated = v48
                        })
                    }) else v2.createElement(l_InputLabel_0, {
                        LayoutOrder = 4, 
                        tag = "auto-y size-full-0", 
                        RichText = true, 
                        Text = ("<u>%*</u>"):format(v47.learnMore), 
                        size = l_InputLabelSize_0.Small, 
                        onActivated = v48
                    }) else nil, 
                    ProfileShareButtonContainer = if v57 then v2.createElement("Frame", {
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
                            text = v58, 
                            icon = v59, 
                            maxWidth = 304, 
                            onActivated = v56.onActivated, 
                            ref = if v34 then v51 else nil
                        })
                    }) else nil, 
                    UISizeConstraint = v2.createElement("UISizeConstraint", {
                        MinSize = Vector2.new(0, 420)
                    })
                }), 
                Gradient = v2.createElement("UIGradient", {
                    Rotation = 90, 
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, v53.Theme.BackgroundContrast.Color), 
                        ColorSequenceKeypoint.new(1, v53.Theme.BackgroundContrast.Color)
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