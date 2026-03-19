local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.ReactOtter);
local v4 = require(l_Parent_1.RoactUtils);
local v5 = require(l_Parent_1.Foundation);
local v6 = require(l_Parent_1.Localization);
local l_Icon_0 = v5.Icon;
local l_PopoverAlign_0 = v5.Enums.PopoverAlign;
local l_Tooltip_0 = v5.Tooltip;
local l_View_0 = v5.View;
local v11 = require(l_Parent_0.Components.CoreUI.RadialProgressBar);
local v12 = require(l_Parent_0.Constants);
local v13 = require(l_Parent_0.Analytics.EventNames);
local v14 = require(l_Parent_0.Thunks.StartVideoCapture);
local v15 = require(l_Parent_0.Thunks.StopVideoCapture);
local v16 = require(l_Parent_0.Analytics.useAnalytics);
local l_useCallback_0 = v2.useCallback;
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v2.useEffect;
local l_useLocalization_0 = v6.Hooks.useLocalization;
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local l_useTokens_0 = v5.Hooks.useTokens;
local v23 = require(l_Parent_0.Enums.CaptureTriggerType);
local v24 = game:DefineFastInt("MaxVideoCaptureDurationSeconds", 30);
return function(v25) --[[ Line: 44 ]]
    -- upvalues: v16 (copy), l_useDispatch_0 (copy), l_useLocalization_0 (copy), l_useTokens_0 (copy), l_useSelector_0 (copy), v12 (copy), l_useCallback_0 (copy), v13 (copy), v15 (copy), v3 (copy), l_useEffect_0 (copy), v24 (copy), v14 (copy), v2 (copy), l_View_0 (copy), l_Tooltip_0 (copy), l_PopoverAlign_0 (copy), l_Icon_0 (copy), v23 (copy), v5 (copy), v11 (copy)
    local v26 = v16();
    local v27 = l_useDispatch_0();
    local v28 = l_useLocalization_0({
        captureVideo = "Feature.Captures.Title.CaptureVideoTooltip", 
        videoCaptureInProgressTitle = "Feature.Captures.Title.VideoCaptureInProgressTooltip"
    });
    local v29 = l_useTokens_0();
    local v31 = l_useSelector_0(function(v30) --[[ Line: 53 ]]
        -- upvalues: v12 (ref)
        return v30[v12.RoduxKey].IsVideoCaptureActive.status;
    end);
    local v33 = l_useSelector_0(function(v32) --[[ Line: 57 ]]
        -- upvalues: v12 (ref)
        return v32[v12.RoduxKey].IsVideoCaptureActive.triggerType;
    end);
    local v34 = l_useCallback_0(function() --[[ Line: 61 ]]
        -- upvalues: v31 (copy), v26 (copy), v13 (ref), v27 (copy), v15 (ref)
        if not v31 then
            return;
        else
            v26.fireEvent(v13.CapturesEntrypointVideoDeactivatedAutomatically);
            v27(v15());
            return;
        end;
    end, {
        v31
    });
    local v35, v36 = v3.useAnimatedBinding(0, v34);
    l_useEffect_0(function() --[[ Line: 73 ]]
        -- upvalues: v31 (copy), v36 (copy), v3 (ref), v24 (ref)
        if v31 then
            v36(v3.ease(1, {
                duration = v24, 
                easingStyle = Enum.EasingStyle.Linear
            }));
            return;
        else
            v36(v3.instant(0));
            return;
        end;
    end, {
        v36, 
        v31
    });
    local v37 = l_useCallback_0(function() --[[ Line: 84 ]]
        -- upvalues: v31 (copy), v26 (copy), v13 (ref), v27 (copy), v14 (ref)
        if v31 then
            return;
        else
            v26.fireEvent(v13.CapturesEntrypointVideoActivated);
            v27(v14());
            return;
        end;
    end, {
        v31
    });
    local v38 = l_useCallback_0(function() --[[ Line: 94 ]]
        -- upvalues: v31 (copy), v26 (copy), v13 (ref), v27 (copy), v15 (ref)
        if not v31 then
            return;
        else
            v26.fireEvent(v13.CapturesEntrypointVideoDeactivated);
            v27(v15());
            return;
        end;
    end, {
        v31
    });
    return v2.createElement(v2.Fragment, nil, {
        VideoCaptureStartCTA = if not v31 then v2.createElement(l_View_0, {
            LayoutOrder = v25.layoutOrder, 
            onActivated = v37, 
            tag = {
                ["size-1200-1200"] = true, 
                ["anchor-center-center auto-xy clip position-center-center radius-circle"] = true
            }
        }, {
            StartIconWithTooltip = v2.createElement(l_Tooltip_0, {
                align = l_PopoverAlign_0.Center, 
                side = v25.popoverSide, 
                title = v28.captureVideo
            }, v2.createElement(l_View_0, {
                tag = "size-1200-1200"
            }, {
                Icon = v2.createElement(l_Icon_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    name = "icons/controls/screenRecord_alt", 
                    style = v29.Color.Content.Emphasis
                })
            }))
        }) else nil, 
        VideoCaptureDisabledStartCTA = if v31 and v33 == v23.LegacyCapture then v2.createElement(l_View_0, {
            LayoutOrder = v25.layoutOrder, 
            tag = "anchor-center-center auto-xy clip position-center-center radius-circle"
        }, {
            StartIconWithTooltip = v2.createElement(l_Tooltip_0, {
                align = l_PopoverAlign_0.Center, 
                side = v25.popoverSide, 
                title = v28.videoCaptureInProgressTitle
            }, v2.createElement(l_Icon_0, {
                name = "icons/controls/screenRecord_alt", 
                style = v29.Color.Content.Muted
            }))
        }) else nil, 
        VideoCaptureActiveView = if v31 and (not (v33 ~= v23.UserCapture) or v33 == v23.DeveloperCapture) then v2.createElement(l_View_0, {
            LayoutOrder = v25.layoutOrder, 
            tag = "anchor-center-center clip position-center-center radius-circle size-900-900 padding-xxsmall"
        }, {
            VideoCaptureStopCTA = if v33 == v23.UserCapture then v2.createElement(l_View_0, {
                tag = "anchor-center-center bg-over-media-300 col flex-evenly position-center-center size-700-700 radius-circle", 
                onActivated = v38
            }, {
                VideoCaptureStopIcon = v2.createElement(l_Icon_0, {
                    name = "icons/controls/mediaStop_small", 
                    size = v5.Enums.IconSize.Small, 
                    style = v29.Color.System.Alert
                })
            }) else nil, 
            VideoCaptureActiveIndicator = if v33 == v23.DeveloperCapture then v2.createElement(l_View_0, {
                tag = "anchor-center-center col flex-evenly position-center-center size-700-700 radius-circle"
            }, {
                VideoCaptureIndicatorIcon = v2.createElement(l_View_0, {
                    tag = "anchor-center-center bg-alert position-center-center size-300-300 radius-circle"
                })
            }) else nil, 
            ProgressBar = v2.createElement(v11, {
                progress = v35
            })
        }) else nil
    });
end;