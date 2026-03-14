local l_Parent_0 = script:FindFirstAncestor("ProfilePlatform").Parent;
local v1 = require(l_Parent_0.Foundation);
local v2 = require(l_Parent_0.React);
local l_ButtonSize_0 = v1.Enums.ButtonSize;
local l_IconButton_0 = v1.IconButton;
local l_View_0 = v1.View;
return function(v6) --[[ Line: 27 ]] --[[ Name: ProgressBar ]]
    -- upvalues: v2 (copy), l_View_0 (copy), l_IconButton_0 (copy), l_ButtonSize_0 (copy)
    local v7 = if v6.timeLength > 0 then v6.timePosition / v6.timeLength else 0;
    local v8 = v2.useRef(nil);
    local v9, v10 = v2.useState(0);
    v2.useEffect(function() --[[ Line: 32 ]]
        -- upvalues: v8 (copy), v10 (copy)
        if not v8 or not v8.current then
            return;
        else
            local v12 = v8.current.InputBegan:Connect(function(v11) --[[ Line: 39 ]]
                -- upvalues: v10 (ref)
                v10(v11.Position.X);
            end);
            return function() --[[ Line: 43 ]]
                -- upvalues: v12 (copy)
                v12:Disconnect();
            end;
        end;
    end, {});
    local v15 = v2.useCallback(function() --[[ Line: 48 ]]
        -- upvalues: v8 (copy), v6 (copy), v9 (copy)
        if not v8 or not v8.current then
            return;
        else
            local l_X_0 = v8.current.AbsolutePosition.X;
            local l_X_1 = v8.current.AbsoluteSize.X;
            v6.onProgressBarActivated((v9 - l_X_0) / l_X_1);
            return;
        end;
    end, {
        v9, 
        v6.onProgressBarActivated
    });
    return v2.createElement(l_View_0, {
        tag = {
            ["align-x-center align-y-center col size-full-1400"] = true, 
            ["padding-medium"] = v6.isFullScreen, 
            ["padding-x-medium"] = not v6.isFullScreen
        }
    }, {
        ProgressBarContainer = v2.createElement(l_View_0, {
            backgroundStyle = {
                Color3 = Color3.fromHex("#D5D7DD"), 
                Transparency = 0.7
            }, 
            LayoutOrder = 1, 
            onActivated = v15, 
            ref = v8, 
            tag = "radius-small size-full-200"
        }, {
            Progress = v2.createElement(l_View_0, {
                Size = UDim2.fromScale(v7, 1), 
                tag = "radius-small bg-action-sub-emphasis"
            })
        }), 
        CTAContainer = v2.createElement(l_View_0, {
            isDisabled = true, 
            LayoutOrder = 2, 
            tag = "row flex-between align-x-center align-y-center size-full-1000"
        }, {
            PlayButton = v2.createElement(l_IconButton_0, {
                icon = v6.isPlaying and "icons/controls/media-pause-medium" or "icons/controls/media-play-medium", 
                isDisabled = false, 
                LayoutOrder = 1, 
                onActivated = v6.onPlayButtonActivated, 
                size = l_ButtonSize_0.Medium
            }), 
            MuteButton = v2.createElement(l_IconButton_0, {
                icon = v6.isMuted and "icons/controls/speakerMute" or "icons/controls/speaker", 
                isDisabled = false, 
                LayoutOrder = 3, 
                onActivated = v6.onMuteButtonActivated, 
                size = l_ButtonSize_0.Medium
            })
        })
    });
end;