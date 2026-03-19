local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_CaptureService_0 = game:GetService("CaptureService");
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.RoactUtils);
local v5 = require(l_Parent_1.Foundation);
local l_IXPServiceWrapper_0 = require(l_Parent_1.IXPServiceWrapper).IXPServiceWrapper;
local v7 = require(l_Parent_1.Localization);
local v8 = require(l_Parent_1.SocialStopwatch);
local l_Icon_0 = v5.Icon;
local l_Image_0 = v5.Image;
local l_PopoverAlign_0 = v5.Enums.PopoverAlign;
local l_PopoverSide_0 = v5.Enums.PopoverSide;
local l_Tooltip_0 = v5.Tooltip;
local l_View_0 = v5.View;
local v15 = require(l_Parent_0.Components.CoreUI.VideoCaptureControl);
local v16 = require(l_Parent_0.Components.CoreUI.VoiceChatIndicator);
local v17 = require(l_Parent_0.App.CapturesPolicy);
local v18 = require(l_Parent_0.Constants);
local v19 = require(l_Parent_0.Analytics.EventNames);
local v20 = require(l_Parent_0.Thunks.TakeCapture);
local v21 = require(l_Parent_0.Enums.SnapDirection);
local v22 = require(l_Parent_0.Analytics.useAnalytics);
local l_useCallback_0 = v3.useCallback;
local v24 = require(l_Parent_0.Hooks.useCaptureControlsController);
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v3.useEffect;
local l_useLocalization_0 = v7.Hooks.useLocalization;
local v28 = require(l_Parent_0.Hooks.usePlayShutterSound);
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local l_useTokens_0 = v5.Hooks.useTokens;
local v31 = require(l_Parent_0.Hooks.useTopbarInset);
local v32 = game:DefineFastFlag("CapturesLayerExposureLoggingEnabled", false);
local v33 = game:DefineFastFlag("DebugOverrideCaptureControlsVideoGuacPolicy", false);
local l_FStringSocialCaptureIXPLayer_0 = require(l_Parent_1.SharedFlags).FStringSocialCaptureIXPLayer;
local v35 = {
    [v21.Bottom] = l_PopoverSide_0.Top, 
    [v21.Left] = l_PopoverSide_0.Right, 
    [v21.Right] = l_PopoverSide_0.Left, 
    [v21.Top] = l_PopoverSide_0.Bottom
};
return (v17.connect(function(v36) --[[ Line: 226 ]]
    -- upvalues: l_CaptureService_0 (copy), v33 (copy)
    return {
        hasVideoCaptureCapability = v36.hasVideoCaptureCapability() and l_CaptureService_0:CanCaptureVideo() or v33
    };
end)(function(v37) --[[ Line: 65 ]]
    -- upvalues: v22 (copy), l_useDispatch_0 (copy), l_useLocalization_0 (copy), l_useTokens_0 (copy), v31 (copy), l_useSelector_0 (copy), v18 (copy), l_useEffect_0 (copy), v32 (copy), l_IXPServiceWrapper_0 (copy), l_FStringSocialCaptureIXPLayer_0 (copy), v28 (copy), v3 (copy), v24 (copy), v19 (copy), l_useCallback_0 (copy), v8 (copy), v20 (copy), l_View_0 (copy), v5 (copy), v15 (copy), v35 (copy), l_Tooltip_0 (copy), l_PopoverAlign_0 (copy), l_Icon_0 (copy), v16 (copy), l_Image_0 (copy)
    local v38 = v22();
    local v39 = l_useDispatch_0();
    local v40 = l_useLocalization_0({
        captureScreenshot = "Feature.Captures.Title.CaptureScreenshotTooltip"
    });
    local v41 = l_useTokens_0();
    local v42 = v31();
    local v44 = l_useSelector_0(function(v43) --[[ Line: 75 ]]
        -- upvalues: v18 (ref)
        return v43[v18.RoduxKey].IsActive;
    end);
    local v46 = l_useSelector_0(function(v45) --[[ Line: 79 ]]
        -- upvalues: v18 (ref)
        return v45[v18.RoduxKey].IsVideoCaptureActive.status;
    end);
    l_useEffect_0(function() --[[ Line: 83 ]]
        -- upvalues: v32 (ref), v44 (copy), l_IXPServiceWrapper_0 (ref), l_FStringSocialCaptureIXPLayer_0 (ref)
        if v32 and v44 then
            l_IXPServiceWrapper_0:LogFlagLinkedUserLayerExposure(l_FStringSocialCaptureIXPLayer_0);
        end;
    end, {
        v44
    });
    local v47 = v28();
    local v48 = v3.useMemo(function() --[[ Line: 91 ]]
        -- upvalues: v42 (copy), v41 (copy)
        return Vector2.new(v42.Min.X - v41.Padding.Small, v42.Height - v41.Padding.XSmall - v41.Padding.XXSmall);
    end, {
        v42, 
        v41
    });
    local v49 = v24(v44, v48);
    local l_dragContainerRef_0 = v49.dragContainerRef;
    local l_dragDetectorRef_0 = v49.dragDetectorRef;
    local l_dragItemAnchorPointBinding_0 = v49.dragItemAnchorPointBinding;
    local l_dragItemPositionBinding_0 = v49.dragItemPositionBinding;
    local l_dragItemRef_0 = v49.dragItemRef;
    local l_isItemHorizontal_0 = v49.isItemHorizontal;
    local l_screenshotButtonRef_0 = v49.screenshotButtonRef;
    local l_snapDirection_0 = v49.snapDirection;
    l_useEffect_0(function() --[[ Line: 109 ]]
        -- upvalues: v44 (copy), v38 (copy), v19 (ref)
        if v44 then
            v38.fireEvent(v19.CapturesEntrypointViewed);
        end;
    end, {
        v44
    });
    local v58 = l_useCallback_0(function() --[[ Line: 115 ]]
        -- upvalues: v8 (ref), v38 (copy), v19 (ref), v47 (copy), v39 (copy), v20 (ref)
        if not v8.Stopwatch.get(v8.Events.CaptureTaken) then
            v8.Stopwatch.start(v8.Events.CaptureTaken);
        end;
        v38.fireEvent(v19.CapturesEntrypointActivated);
        v47();
        v39(v20());
    end, {
        v47
    });
    return v3.createElement(l_View_0, {
        Position = UDim2.fromOffset(0, -v42.Height), 
        Size = UDim2.new(1, 0, 1, v42.Height), 
        tag = "padding-x-large padding-y-medium", 
        ZIndex = v18.ZIndex.Entrypoint
    }, {
        PaddedContainer = v3.createElement(l_View_0, {
            ref = l_dragContainerRef_0, 
            tag = "anchor-center-center position-center-center size-full"
        }, {
            CaptureControls = if v44 then v3.createElement(l_View_0, {
                AnchorPoint = l_dragItemAnchorPointBinding_0:map(function(v59) --[[ Line: 138 ]]
                    return Vector2.new(v59.x, v59.y);
                end), 
                onActivated = function() --[[ Line: 141 ]] --[[ Name: onActivated ]]

                end, 
                Position = l_dragItemPositionBinding_0:map(function(v60) --[[ Line: 142 ]]
                    return UDim2.fromOffset(v60.xOffset, v60.yOffset);
                end), 
                ref = l_dragItemRef_0, 
                stateLayer = {
                    affordance = v5.Enums.StateLayerAffordance.None
                }, 
                tag = {
                    ["row auto-x padding-x-small padding-y-xsmall size-0-1100"] = l_isItemHorizontal_0, 
                    ["col auto-y padding-y-small padding-x-xsmall size-1100-0"] = not l_isItemHorizontal_0, 
                    ["align-x-center align-y-center bg-over-media-0 flex-evenly radius-circle"] = true
                }
            }, {
                DragDetector = v3.createElement("UIDragDetector", {
                    DragStyle = Enum.UIDragDetectorDragStyle.Scriptable, 
                    BoundingUI = l_dragContainerRef_0, 
                    ref = l_dragDetectorRef_0, 
                    ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomOffset
                }), 
                VideoCaptureControl = if v37.hasVideoCaptureCapability then v3.createElement(v15, {
                    layoutOrder = 1, 
                    popoverSide = v35[l_snapDirection_0]
                }) else nil, 
                ScreenshotCTA = if not v46 then v3.createElement(l_View_0, {
                    LayoutOrder = 2, 
                    tag = {
                        ["size-1200-1200"] = true, 
                        ["anchor-center-center auto-xy clip position-center-center radius-circle"] = true
                    }, 
                    onActivated = v58, 
                    ref = l_screenshotButtonRef_0
                }, {
                    ScreenshotIconWithTooltip = v3.createElement(l_Tooltip_0, {
                        align = l_PopoverAlign_0.Center, 
                        side = v35[l_snapDirection_0], 
                        title = v40.captureScreenshot
                    }, v3.createElement(l_View_0, {
                        tag = "size-1200-1200"
                    }, {
                        v3.createElement(l_Icon_0, {
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            Position = UDim2.fromScale(0.5, 0.5), 
                            name = "icons/controls/screenCapture", 
                            style = v41.Color.Content.Emphasis
                        })
                    }))
                }) else nil, 
                VoiceChatIndicator = if v46 then v3.createElement(v16, {
                    layoutOrder = 3, 
                    popoverSide = v35[l_snapDirection_0]
                }) else nil, 
                DragAffordance = v3.createElement(l_View_0, {
                    LayoutOrder = 4, 
                    tag = "anchor-center-center auto-xy padding-xxsmall position-center-center"
                }, {
                    DragAffordanceIcon = v3.createElement(l_Image_0, {
                        Image = "component_assets/dragger_small", 
                        Rotation = l_isItemHorizontal_0 and 90 or 0, 
                        tag = "anchor-center-center content-muted position-center-center size-600-400"
                    })
                })
            }) else nil
        })
    });
end));