local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Foundation);
local v2 = require(l_Parent_0.React);
local l_ButtonSize_0 = v1.Enums.ButtonSize;
local l_IconButton_0 = v1.IconButton;
local l_Text_0 = v1.Text;
local l_View_0 = v1.View;
local function _(v7) --[[ Line: 29 ]] --[[ Name: formatTime ]]
    local v8 = math.floor(v7 / 60);
    local v9 = math.floor(v7 % 60);
    return string.format("%02d:%02d", v8, v9);
end;
return function(v11) --[[ Line: 35 ]] --[[ Name: ProgressBar ]]
    -- upvalues: v2 (copy), l_View_0 (copy), l_IconButton_0 (copy), l_ButtonSize_0 (copy), l_Text_0 (copy)
    local v12 = v11.timePosition / v11.timeLength;
    local l_timePosition_0 = v11.timePosition;
    local v14 = math.floor(l_timePosition_0 / 60);
    local v15 = math.floor(l_timePosition_0 % 60);
    local v16 = string.format("%02d:%02d", v14, v15);
    v14 = v11.timeLength;
    v15 = math.floor(v14 / 60);
    local v17 = math.floor(v14 % 60);
    l_timePosition_0 = string.format("%02d:%02d", v15, v17);
    v14 = v2.useRef(nil);
    v15, v17 = v2.useState(0);
    v2.useEffect(function() --[[ Line: 42 ]]
        -- upvalues: v14 (copy), v17 (copy)
        if not v14 or not v14.current then
            return;
        else
            local v19 = v14.current.InputBegan:Connect(function(v18) --[[ Line: 49 ]]
                -- upvalues: v17 (ref)
                v17(v18.Position.X);
            end);
            return function() --[[ Line: 53 ]]
                -- upvalues: v19 (copy)
                v19:Disconnect();
            end;
        end;
    end, {});
    local v22 = v2.useCallback(function() --[[ Line: 58 ]]
        -- upvalues: v14 (copy), v11 (copy), v15 (copy)
        if not v14 or not v14.current then
            return;
        else
            local l_X_0 = v14.current.AbsolutePosition.X;
            local l_X_1 = v14.current.AbsoluteSize.X;
            v11.onProgressBarActivated((v15 - l_X_0) / l_X_1);
            return;
        end;
    end, {
        v15, 
        v11.onProgressBarActivated
    });
    return v2.createElement(l_View_0, {
        tag = {
            ["align-x-center align-y-center col size-full-1400"] = true, 
            ["padding-medium"] = v11.isFullScreen, 
            ["padding-x-medium"] = not v11.isFullScreen
        }
    }, {
        ProgressBarContainer = v2.createElement(l_View_0, {
            LayoutOrder = 1, 
            onActivated = v22, 
            ref = v14, 
            tag = "radius-small bg-over-media-0 size-full-200"
        }, {
            Progress = v2.createElement(l_View_0, {
                Size = UDim2.fromScale(v12, 1), 
                tag = "radius-small bg-system-neutral"
            })
        }), 
        CTAContainer = v2.createElement(l_View_0, {
            LayoutOrder = 2, 
            isDisabled = true, 
            tag = "row flex-between align-x-center align-y-center size-full-1000"
        }, {
            PlayButton = v2.createElement(l_IconButton_0, {
                icon = v11.isPlaying and "icons/controls/media-pause-medium" or "icons/controls/media-play-medium", 
                isDisabled = false, 
                LayoutOrder = 1, 
                onActivated = v11.onPlayButtonActivated, 
                size = l_ButtonSize_0.Medium
            }), 
            TimeText = if v11.isTimeHidden then nil else v2.createElement(l_Text_0, {
                LayoutOrder = 2, 
                Text = string.format("%s / %s", v16, l_timePosition_0), 
                tag = "auto-xy text-body-large"
            }), 
            MuteButton = v2.createElement(l_IconButton_0, {
                icon = v11.isMuted and "icons/controls/speakerMute" or "icons/controls/speaker", 
                isDisabled = false, 
                LayoutOrder = 3, 
                onActivated = v11.onMuteButtonActivated, 
                size = l_ButtonSize_0.Medium
            })
        })
    });
end;