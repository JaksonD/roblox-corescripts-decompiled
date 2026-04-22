local l_UserInputService_0 = game:GetService("UserInputService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Foundation);
local v5 = require(l_Parent_0.UIBlox);
local l_Interactable_0 = v5.Core.Control.Interactable;
local l_FullscreenPageWithSafeArea_0 = require(l_Parent_0.AppBlox).FullscreenPageWithSafeArea;
local v8 = require(l_Parent_0.Navigation);
local v9 = require(l_script_FirstAncestor_0.Components.Videos.VideoPlayer);
local v10 = require(l_script_FirstAncestor_0.Components.Videos.ProgressBar);
local l_useNavigation_0 = v8.useNavigation;
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_IconButton_0 = v4.IconButton;
local l_View_0 = v4.View;
local l_ButtonSize_0 = v4.Enums.ButtonSize;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local v17 = game:DefineFastFlag("BrandVideosFixCloseFullscreen", false);
return function() --[[ Line: 42 ]]
    -- upvalues: l_useNavigation_0 (copy), l_useScreenSize_0 (copy), l_useStyle_0 (copy), v3 (copy), v17 (copy), l_UserInputService_0 (copy), l_FullscreenPageWithSafeArea_0 (copy), l_View_0 (copy), l_IconButton_0 (copy), l_ButtonSize_0 (copy), v9 (copy), v10 (copy), l_Interactable_0 (copy)
    local v18 = l_useNavigation_0();
    local v19 = v18.getParam("extraProps");
    local v20 = l_useScreenSize_0();
    local l_Theme_0 = l_useStyle_0().Theme;
    local v22, v23 = v3.useState(0);
    local v24, v25 = v3.useState(0);
    local v26, v27 = v3.useState(true);
    local v28, v29 = v3.useState(not v19 or not (v19.isMuted ~= nil) or v19.isMuted);
    local v30 = v3.useRef(nil);
    v3.useEffect(function() --[[ Line: 56 ]]
        -- upvalues: v19 (copy), v28 (copy)
        if v19 and v19.onMuteUpdate then
            v19.onMuteUpdate(v28);
        end;
    end, {
        v28, 
        v19
    });
    local v33 = v3.useMemo(function() --[[ Line: 62 ]]
        -- upvalues: v20 (copy)
        local l_X_0 = v20.X;
        local v32 = l_X_0 / 1.7777777777777777;
        if v20.Y < v32 then
            v32 = v20.Y;
            l_X_0 = v32 * 1.7777777777777777;
        end;
        return UDim2.new(0, l_X_0, 0, v32);
    end, {
        v20.X, 
        v20.Y
    });
    local v34 = v3.useCallback(function() --[[ Line: 74 ]]
        -- upvalues: v17 (ref), v30 (copy), v26 (copy), v18 (copy)
        if v17 and v30.current and v26 then
            v30.current.togglePlayPause();
        end;
        v18.goBack();
    end, {
        v18.goBack
    });
    local v39 = v3.useCallback(function(v35, v36, v37, v38) --[[ Line: 83 ]]
        -- upvalues: v23 (copy), v25 (copy), v27 (copy), v29 (copy)
        v23(v35);
        v25(v36);
        v27(v37);
        v29(v38);
    end, {});
    local v41 = v3.useCallback(function(v40) --[[ Line: 90 ]]
        -- upvalues: v30 (copy), v24 (copy)
        if v30.current and v30.current.setTimePosition then
            v30.current.setTimePosition(v24 * v40);
        end;
    end, {
        v24
    });
    local v42 = v3.useCallback(function() --[[ Line: 96 ]]
        -- upvalues: v30 (copy)
        if v30.current and v30.current.togglePlayPause then
            v30.current.togglePlayPause();
        end;
    end, {});
    local v43 = v3.useCallback(function() --[[ Line: 102 ]]
        -- upvalues: v30 (copy)
        if v30.current and v30.current.toggleMute then
            v30.current.toggleMute();
        end;
    end, {});
    v3.useEffect(function() --[[ Line: 108 ]]
        -- upvalues: l_UserInputService_0 (ref), v42 (copy), v34 (copy)
        local v46 = l_UserInputService_0.InputBegan:Connect(function(v44, v45) --[[ Line: 109 ]]
            -- upvalues: v42 (ref), v34 (ref)
            if v45 then
                return;
            else
                if v44.KeyCode == Enum.KeyCode.Space then
                    v42();
                end;
                if v44.KeyCode == Enum.KeyCode.Escape then
                    v34();
                end;
                return;
            end;
        end);
        return function() --[[ Line: 123 ]]
            -- upvalues: v46 (copy)
            v46:Disconnect();
        end;
    end, {
        v42, 
        v34
    });
    return v3.createElement(l_FullscreenPageWithSafeArea_0, {
        includeStatusBar = true, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency
    }, {
        CloseButtonContainer = v3.createElement(l_View_0, {
            tag = "align-x-right align-y-top position-top-right anchor-top-right auto-xy padding-xlarge padding-medium", 
            ZIndex = 100000
        }, {
            CloseButton = v3.createElement(l_IconButton_0, {
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, 0, 0.5, 0), 
                icon = "icons/navigation/close", 
                size = l_ButtonSize_0.Medium, 
                onActivated = v34
            })
        }), 
        VideoContainer = v3.createElement(l_View_0, {
            Size = v33, 
            tag = "position-center-center anchor-center-center"
        }, {
            VideoPlayer = if v19 and v19.videoId then v3.createElement(v9, {
                initialTimePosition = v19.initialTimePosition, 
                isFullscreen = true, 
                isMuted = v28, 
                looped = false, 
                videoId = v19.videoId, 
                onProgressUpdate = v39, 
                ref = v30
            }) else nil
        }), 
        FixedProgressBar = if v24 > 0 then v3.createElement(l_View_0, {
            Size = UDim2.new(1, 0, 0, 80), 
            tag = "position-bottom-center anchor-bottom-center", 
            ZIndex = 1000
        }, {
            ProgressBar = v3.createElement(v10, {
                isFullScreen = true, 
                isMuted = v28, 
                isPlaying = v26, 
                onMuteButtonActivated = v43, 
                onPlayButtonActivated = v42, 
                onProgressBarActivated = v41, 
                timePosition = v22, 
                timeLength = v24
            })
        }) else nil, 
        InteractableWrapper = if v24 > 0 then v3.createElement(l_View_0, {
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 999
        }, {
            Interactable = v3.createElement(l_Interactable_0, {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                Selectable = false, 
                [v3.Event.Activated] = v42
            })
        }) else nil
    });
end;