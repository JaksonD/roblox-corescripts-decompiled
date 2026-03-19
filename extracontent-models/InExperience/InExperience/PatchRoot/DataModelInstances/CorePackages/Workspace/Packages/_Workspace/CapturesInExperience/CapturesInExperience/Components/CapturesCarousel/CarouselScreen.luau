local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v4 = require(l_Parent_1.AppCommonLib);
local l_IXPServiceWrapper_0 = require(l_Parent_1.IXPServiceWrapper).IXPServiceWrapper;
local v6 = require(l_Parent_1.React);
local v7 = require(l_Parent_1.RoactUtils);
local v8 = require(l_Parent_1.RobloxAppHooks);
local v9 = require(l_Parent_1.UIBlox);
local l_Images_0 = v9.App.ImageSet.Images;
local l_ImageSetButton_0 = v9.Core.ImageSet.ImageSetButton;
local l_Signal_0 = v4.Signal;
local l_useStyle_0 = v9.Core.Style.useStyle;
local l_useCallback_0 = v6.useCallback;
local l_useDispatch_0 = v7.Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v6.useEffect;
local l_useEffectOnce_0 = v7.Hooks.useEffectOnce;
local l_useRef_0 = v6.useRef;
local l_useScreenSize_0 = v8.useScreenSize;
local l_useSelector_0 = v7.Hooks.RoactRodux.useSelector;
local l_useState_0 = v6.useState;
local v22 = require(l_Parent_0.Components.CapturesCarousel.CapturesCarousel);
local v23 = require(l_Parent_0.Enums.CapturesToastType);
local v24 = require(l_Parent_0.Actions.CarouselClosed);
local v25 = require(l_Parent_0.Components.CapturesCarousel.CarouselCTAContainer);
local v26 = require(l_Parent_0.Constants);
local v27 = require(l_Parent_0.Thunks.DeleteCapture);
local v28 = require(l_Parent_0.Components.Common.DeleteWarningModal);
local v29 = require(l_Parent_0.Analytics.EventNames);
local v30 = require(l_Parent_0.Utils.getTimestampFromCapture);
local v31 = require(l_Parent_0.Components.Common.PermissionModal);
local v32 = require(l_Parent_0.Components.Common.ToastContainer);
local v33 = require(l_Parent_0.Actions.ToastTriggered);
local _ = require(l_Parent_0.Types);
local v35 = require(l_Parent_0.Analytics.useAnalytics);
local l_FFlagUseMediaPlayerInCarousel_0 = require(l_Parent_1.SharedFlags).FFlagUseMediaPlayerInCarousel;
local l_FStringSocialCaptureTakenIXPLayer_0 = require(l_Parent_1.SharedFlags).FStringSocialCaptureTakenIXPLayer;
local v38 = UDim2.fromOffset(32, 32);
local function v43(v39) --[[ Line: 55 ]] --[[ Name: getTitle ]]
    -- upvalues: v30 (copy), l_LocalizationService_0 (copy)
    local v40 = v30(v39);
    if not v40 then
        return "";
    else
        assert(typeof(v40) == "number", "Expected timestamp to be a number");
        local v41 = DateTime.fromUnixTimestampMillis(v40);
        local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
        return (("%* %*"):format(v41:FormatLocalTime("L", l_RobloxLocaleId_0), (v41:FormatLocalTime("LT", l_RobloxLocaleId_0))));
    end;
end;
return function(_) --[[ Line: 73 ]]
    -- upvalues: v35 (copy), l_useDispatch_0 (copy), l_useStyle_0 (copy), l_useSelector_0 (copy), v26 (copy), l_useRef_0 (copy), l_Signal_0 (copy), l_useState_0 (copy), l_useScreenSize_0 (copy), l_useEffectOnce_0 (copy), l_IXPServiceWrapper_0 (copy), l_FStringSocialCaptureTakenIXPLayer_0 (copy), l_useEffect_0 (copy), v33 (copy), v23 (copy), l_useCallback_0 (copy), v29 (copy), v24 (copy), v27 (copy), l_ContextActionService_0 (copy), v43 (copy), v6 (copy), l_FFlagUseMediaPlayerInCarousel_0 (copy), l_ImageSetButton_0 (copy), l_Images_0 (copy), v38 (copy), v22 (copy), v25 (copy), v28 (copy), v31 (copy), v32 (copy)
    local v45 = v35();
    local v46 = l_useDispatch_0();
    local v47 = l_useStyle_0();
    local v49 = l_useSelector_0(function(v48) --[[ Line: 78 ]]
        -- upvalues: v26 (ref)
        return v48[v26.RoduxKey].Captures;
    end);
    local v51 = l_useSelector_0(function(v50) --[[ Line: 82 ]]
        -- upvalues: v26 (ref)
        return v50[v26.RoduxKey].Carousel.IsOpen;
    end);
    local v53 = l_useSelector_0(function(v52) --[[ Line: 86 ]]
        -- upvalues: v26 (ref)
        return v52[v26.RoduxKey].Carousel.SelectedCaptureIndex;
    end);
    local v55 = l_useSelector_0(function(v54) --[[ Line: 90 ]]
        -- upvalues: v26 (ref)
        return v54[v26.RoduxKey].Carousel.IsDeleteWarningModalOpen;
    end);
    local v56 = l_useRef_0(l_Signal_0.new());
    local v57, v58 = l_useState_0(false);
    local v59, v60 = l_useState_0(false);
    local v61 = l_useScreenSize_0();
    l_useEffectOnce_0(function() --[[ Line: 99 ]]
        -- upvalues: l_IXPServiceWrapper_0 (ref), l_FStringSocialCaptureTakenIXPLayer_0 (ref)
        l_IXPServiceWrapper_0:LogUserLayerExposure(l_FStringSocialCaptureTakenIXPLayer_0);
    end, v51);
    l_useEffect_0(function() --[[ Line: 103 ]]
        -- upvalues: v46 (copy), v33 (ref), v23 (ref)
        v46(v33(v23.None));
    end, {
        v51
    });
    local v62 = l_useCallback_0(function() --[[ Line: 107 ]]
        -- upvalues: v58 (copy), v45 (copy), v29 (ref), v46 (copy), v24 (ref)
        v58(false);
        v45.fireEvent(v29.CapturesCarouselClosed);
        v46(v24());
    end, {});
    local v63 = l_useCallback_0(function() --[[ Line: 113 ]]
        -- upvalues: v58 (copy), v45 (copy), v29 (ref), v46 (copy), v24 (ref)
        v58(false);
        v45.fireEvent(v29.CapturesCarouselClosedByKeyboard);
        v46(v24());
    end, {});
    local v64 = l_useCallback_0(function() --[[ Line: 119 ]]
        -- upvalues: v60 (copy)
        v60(true);
    end, {});
    local v65 = l_useCallback_0(function() --[[ Line: 123 ]]
        -- upvalues: v60 (copy)
        v60(false);
    end, {});
    local v68 = l_useCallback_0(function() --[[ Line: 127 ]]
        -- upvalues: v58 (copy), v49 (copy), v53 (copy), v46 (copy), v27 (ref), v56 (copy)
        v58(true);
        local v66 = v49[v53];
        local function v67() --[[ Line: 131 ]]
            -- upvalues: v46 (ref), v27 (ref), v66 (copy), v58 (ref)
            v46(v27(v66));
            v58(false);
        end;
        v56.current:fire(v67);
    end, {
        v49, 
        v53
    });
    l_useEffect_0(function() --[[ Line: 139 ]]
        -- upvalues: v51 (copy), v55 (copy), l_ContextActionService_0 (ref), v63 (copy)
        if not v51 or v55 then
            return;
        else
            l_ContextActionService_0:BindCoreAction("CapturesCarouselCloseShortcutAction", function(_, v70) --[[ Line: 144 ]]
                -- upvalues: v63 (ref)
                if v70 == Enum.UserInputState.End then
                    v63();
                end;
            end, false, Enum.KeyCode.Escape);
            return function() --[[ Line: 150 ]]
                -- upvalues: l_ContextActionService_0 (ref)
                l_ContextActionService_0:UnbindCoreAction("CapturesCarouselCloseShortcutAction");
            end;
        end;
    end, {
        v51, 
        v55, 
        v63
    });
    if not v51 then
        return nil;
    else
        local v71 = v61.Y - 32 - 40 - 8 - 16 - 16;
        local v72 = v49[v53];
        local v73 = v43(v72);
        return v6.createElement("Frame", {
            Active = true, 
            BackgroundColor3 = v47.Theme.BackgroundContrast.Color, 
            BackgroundTransparency = v47.Theme.BackgroundContrast.Transparency, 
            BorderSizePixel = 0, 
            Position = UDim2.fromOffset(0, 0), 
            Size = UDim2.fromScale(1, 1)
        }, {
            CarouselContainer = v6.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1)
            }, {
                UIListLayout = v6.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, 8), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                Padding = v6.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 16), 
                    PaddingTop = UDim.new(0, 8)
                }), 
                TitleFrame = v6.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, 32), 
                    ZIndex = l_FFlagUseMediaPlayerInCarousel_0 and 1 or 2
                }, {
                    CloseButton = v6.createElement(l_ImageSetButton_0, {
                        AnchorPoint = Vector2.new(0, 0.5), 
                        BackgroundTransparency = 1, 
                        Image = l_Images_0["icons/navigation/close"], 
                        ImageColor3 = v47.Theme.IconEmphasis.Color, 
                        ImageTransparency = v47.Theme.IconEmphasis.Transparency, 
                        Position = UDim2.new(0, 42, 0.5, 0), 
                        Size = v38, 
                        [v6.Event.Activated] = v62
                    }), 
                    DropShadow = v6.createElement("TextLabel", {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        AutomaticSize = Enum.AutomaticSize.X, 
                        BackgroundTransparency = 1, 
                        Font = v47.Font.Header2.Font, 
                        LayoutOrder = 1, 
                        Position = UDim2.new(0.5, 0, 0.5, 2), 
                        Size = UDim2.fromScale(0, 1), 
                        Text = v73, 
                        TextColor3 = v47.Theme.DropShadow.Color, 
                        TextSize = v47.Font.BaseSize * v47.Font.Header2.RelativeSize, 
                        TextTransparency = v47.Theme.DropShadow.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        ZIndex = 1
                    }, {
                        UIStroke = v6.createElement("UIStroke", {
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, 
                            Color = v47.Theme.DropShadow.Color, 
                            LineJoinMode = Enum.LineJoinMode.Round, 
                            Thickness = 1, 
                            Transparency = v47.Theme.DropShadow.Transparency
                        })
                    }), 
                    Title = v6.createElement("TextLabel", {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        AutomaticSize = Enum.AutomaticSize.X, 
                        BackgroundTransparency = 1, 
                        Font = v47.Font.Header2.Font, 
                        LayoutOrder = 1, 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        Size = UDim2.fromScale(0, 1), 
                        Text = v73, 
                        TextColor3 = v47.Theme.TextEmphasis.Color, 
                        TextSize = v47.Font.BaseSize * v47.Font.Header2.RelativeSize, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        ZIndex = 2
                    })
                }), 
                CapturesCarousel = v6.createElement(v22, {
                    deleteItemSignal = v56.current, 
                    isDisabled = v57, 
                    LayoutOrder = 2, 
                    maxHeight = v71, 
                    ZIndex = l_FFlagUseMediaPlayerInCarousel_0 and 2 or 1
                }), 
                CTAContainer = v6.createElement(v25, {
                    deleteItem = v68, 
                    height = 40, 
                    isDisabled = v57 or v55, 
                    LayoutOrder = 3, 
                    openPermissionModal = v64, 
                    ZIndex = l_FFlagUseMediaPlayerInCarousel_0 and 1 or 2
                })
            }), 
            DeleteWarningModal = v6.createElement(v28, {
                deleteItem = v68, 
                zIndex = 3
            }), 
            PermissionModal = v6.createElement(v31, {
                closeModal = v65, 
                visible = v59, 
                zIndex = 3
            }), 
            ToastsFrame = v6.createElement("Frame", {
                Active = false, 
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1), 
                ZIndex = v26.ZIndex.Toasts
            }, {
                ToastContainer = v6.createElement(v32)
            })
        });
    end;
end;