local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_0.FadeController);
local v4 = require(l_Parent_0.AdLabel);
local v5 = require(l_Parent_0.CircularButton);
local v6 = require(l_Parent_0.LivePreviewWatermark);
local v7 = require(script.Parent.Flags);
local v8 = require(l_Parent_1.SharedFlags);
local v9 = require(l_Parent_1.UIBlox);
local l_ImageSetLabel_0 = v9.Core.ImageSet.ImageSetLabel;
local l_AppStyleProvider_0 = v9.App.Style.AppStyleProvider;
local l_Images_0 = v9.App.ImageSet.Images;
local v13 = l_Images_0["icons/controls/speakerMute"];
local v14 = l_Images_0["icons/controls/speaker"];
local v15 = l_Images_0["icons/actions/previewExpand"];
local v16 = l_Images_0["icons/actions/previewShrink"];
local v17 = l_Images_0["icons/controls/media-play-large"];
local v18 = l_Images_0["icons/controls/media-pause-large"];
local v19 = l_Images_0["icons/navigation/close"];
local v20 = l_Images_0["component_assets/circle_42_stroke_3"];
local v21 = v7.GetFFlagEnableReportAdDropdown();
local v22 = v7.GetEnableHideReportAdModalDuringScreenshot();
local l_FFlagInExperienceUseAppStyleProvider_0 = v8.FFlagInExperienceUseAppStyleProvider;
local v24 = if v21 then require(l_Parent_0.ReportAdPopup) else nil;
local v25 = if v21 then require(l_Parent_0.AdDropdownMenu) else nil;
local v26 = require(l_Parent_0.AdsInteractivityTelemetry);
local v27 = v2.PureComponent:extend("AdsInteractivityControls");
local function _(v28) --[[ Line: 39 ]] --[[ Name: opacityToTransparency ]]
    return 1 - v28;
end;
local v30 = v7.GetAdGuiInteractivityPixelsPerStud();
local function _(v31) --[[ Line: 46 ]] --[[ Name: getAdornee ]]
    if v31 == nil then
        return nil;
    elseif v31.Adornee ~= nil then
        return v31.Adornee;
    elseif v31.Parent ~= nil and v31.Parent:IsA("BasePart") then
        return v31.Parent;
    else
        return nil;
    end;
end;
v27.init = function(v33) --[[ Line: 61 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v2 (copy)
    if game:GetEngineFeature("DeprecateCpv15") then
        v33.state = {
            adUIType = Enum.AdUIType.None, 
            adGuiRectStuds = Vector2.new(0, 0), 
            isViewable = false, 
            videoPlaying = false, 
            isFullscreen = false, 
            eudsaPromptActive = false, 
            isDropDownOpen = false, 
            isReportAdPopupOpen = false, 
            hideLivePreviewWatermark = false
        };
    else
        v33.state = {
            adUIType = Enum.AdUIType.None, 
            adGuiRectStuds = Vector2.new(0, 0), 
            isViewable = false, 
            videoPlaying = false, 
            isFullscreen = false, 
            isClickToPlay = false, 
            eudsaPromptActive = false, 
            isDropDownOpen = false, 
            isReportAdPopupOpen = false, 
            hideLivePreviewWatermark = false
        };
    end;
    local function v37() --[[ Line: 89 ]] --[[ Name: onAdorneeChanged ]]
        -- upvalues: v33 (copy)
        local l_v33_0 = v33;
        local v35 = {};
        local l_adGui_0 = v33.props.adGui;
        v35.adornee = if l_adGui_0 == nil then nil else if l_adGui_0.Adornee ~= nil then l_adGui_0.Adornee else if l_adGui_0.Parent ~= nil and l_adGui_0.Parent:IsA("BasePart") then l_adGui_0.Parent else nil;
        l_v33_0:setState(v35);
    end;
    v33.signalConnections = {
        v33.props.adGui:GetPropertyChangedSignal("Adornee"):Connect(v37), 
        v33.props.adGui:GetPropertyChangedSignal("Parent"):Connect(v37)
    };
    v33.props.adGui.adGuiStateChanged:Connect(function(v38) --[[ Line: 100 ]]
        -- upvalues: v33 (copy)
        v33:setState(v38);
    end);
    v33.fadeController = v3.new();
    local v39, v40 = v2.createBinding(1);
    v33.controlsOpacity = v39;
    v33.updateControlsOpacity = v40;
    v33.fadeController:subscribe(function(v41) --[[ Line: 107 ]]
        -- upvalues: v33 (copy)
        v33.updateControlsOpacity(v41);
    end);
    v33.props.adGui:forwardStateToLuaUI();
end;
v27.willUnmount = function(v42) --[[ Line: 114 ]] --[[ Name: willUnmount ]]
    for _, v44 in ipairs(v42.signalConnections) do
        v44:Disconnect();
    end;
end;
v27.render = function(v45) --[[ Line: 120 ]] --[[ Name: render ]]
    -- upvalues: v18 (copy), v17 (copy), v14 (copy), v13 (copy), v16 (copy), v15 (copy), v2 (copy), v21 (copy), v30 (copy), v26 (copy), v24 (copy), v22 (copy), v25 (copy), v4 (copy), v5 (copy), v19 (copy), l_ImageSetLabel_0 (copy), v20 (copy), v6 (copy)
    if not v45.props.adGui then
        return nil;
    else
        local v46 = v45.state.adUIType == Enum.AdUIType.Video;
        local v47 = v45.state.adUIType == Enum.AdUIType.None;
        local v48 = nil;
        if game:GetEngineFeature("DeprecateCpv15") then
            if v46 and v45.state.isFullscreen then
                v48 = if v45.state.videoPlaying then v18 else v17;
            end;
        elseif v46 then
            if v45.state.isFullscreen and not v45.state.videoPlaying or v45.state.isClickToPlay and not v45.state.isFullscreen then
                v48 = v17;
            elseif v45.state.isFullscreen and v45.state.videoPlaying then
                v48 = v18;
            end;
        end;
        local v49 = v46 and v45.state.isFullscreen;
        local v50 = nil;
        v50 = if game:GetEngineFeature("DeprecateCpv15") then v46 and not v45.state.isFullscreen and v45.state.videoPlaying else v46 and not v45.state.isFullscreen and not v45.state.isClickToPlay and v45.state.videoPlaying;
        local v51 = v45.state.volumeEnabled and v14 or v13;
        local v52 = v45.state.isFullscreen and v16 or v15;
        local v53 = Vector2.new(0.10038949275, 0.17847020934);
        if not v45.state.isFullscreen then
            v53 = v53 * 1.5;
        end;
        local v56 = v45.controlsOpacity:map(function(v54) --[[ Line: 166 ]]
            -- upvalues: v48 (ref), v17 (ref)
            if v48 == v17 then
                return true;
            else
                local v55 = false;
                if v48 ~= nil then
                    v55 = v54 and v54 > 0;
                end;
                return v55;
            end;
        end);
        if not v45.state.isViewable then
            v56 = false;
        end;
        local v58 = v45.controlsOpacity:map(function(v57) --[[ Line: 177 ]]
            -- upvalues: v48 (ref), v17 (ref)
            if v48 == v17 then
                return 0.19999999999999996;
            else
                return 1 - v57 * 0.8;
            end;
        end);
        local l_createElement_0 = v2.createElement;
        local v60 = "SurfaceGui";
        local v61 = {
            ZOffset = 1, 
            ZIndexBehavior = if v21 then Enum.ZIndexBehavior.Sibling else Enum.ZIndexBehavior.Global, 
            LightInfluence = 0, 
            SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud, 
            PixelsPerStud = v30
        };
        local l_adGui_1 = v45.props.adGui;
        v61.Adornee = if l_adGui_1 == nil then nil else if l_adGui_1.Adornee ~= nil then l_adGui_1.Adornee else if l_adGui_1.Parent ~= nil and l_adGui_1.Parent:IsA("BasePart") then l_adGui_1.Parent else nil;
        v61.Face = v45.props.adGui.Face;
        v61.AlwaysOnTop = v45.state.isFullscreen;
        v61.Brightness = 2;
        return l_createElement_0(v60, v61, {
            InteractiveArea = v2.createElement("TextButton", {
                Size = UDim2.fromOffset(v45.state.adGuiRectStuds.X * v30, v45.state.adGuiRectStuds.Y * v30), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundColor3 = Color3.new(0, 0, 0), 
                BackgroundTransparency = v45.controlsOpacity:map(function(v63) --[[ Line: 204 ]]
                    -- upvalues: v48 (ref), v17 (ref)
                    if v48 == v17 then
                        return 0.7;
                    else
                        return 1 - v63 * 0.3;
                    end;
                end), 
                Text = "", 
                [v2.Event.MouseMoved] = function(_, _) --[[ Line: 213 ]]
                    -- upvalues: v46 (copy), v45 (copy)
                    if v46 and v45.state.isFullscreen then
                        v45.fadeController:updateLastInputTime();
                    end;
                end, 
                [v2.Event.Activated] = function(_, v67) --[[ Line: 218 ]]
                    -- upvalues: v21 (ref), v45 (copy), v26 (ref), v46 (copy)
                    if v21 and v45.state.isDropDownOpen then
                        v45:setState({
                            isDropDownOpen = false
                        });
                        v45.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayEventTriggered);
                        v45.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayButtonClicked);
                        v26.logAdMenuEvent("close");
                        return;
                    else
                        if v46 then
                            if not v45.state.isFullscreen then
                                if v45.state.isViewable then
                                    v45.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.FullscreenButtonClicked);
                                    return;
                                end;
                            elseif v45.state.videoPlaying then
                                if v67.UserInputType == Enum.UserInputType.Touch then
                                    if v45.fadeController:inProgress() and not v45.fadeController:isFading() then
                                        v45.fadeController:skipToFade();
                                        return;
                                    else
                                        v45.fadeController:updateLastInputTime();
                                        return;
                                    end;
                                else
                                    v45.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PauseButtonClicked);
                                    return;
                                end;
                            else
                                v45.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayButtonClicked);
                            end;
                        end;
                        return;
                    end;
                end
            }, {
                AbuseReportingModal = v21 and v24 and v45.state.isReportAdPopupOpen and v2.createElement(v24, {
                    showReportAdPopup = v45.state.isReportAdPopupOpen, 
                    onClose = function() --[[ Line: 256 ]] --[[ Name: onClose ]]
                        -- upvalues: v45 (copy)
                        v45:setState({
                            isReportAdPopupOpen = false
                        });
                    end, 
                    onOpen = v22 and function() --[[ Line: 262 ]]
                        -- upvalues: v45 (copy), v26 (ref)
                        v45:setState({
                            isReportAdPopupOpen = true
                        });
                        v26.logReportAdEvent("open");
                    end or nil, 
                    adInfo = v45.props.adGui:GetSingleReportAdInfo()
                }) or nil, 
                AdDropdownMenu = if v21 and v25 then v2.createElement(v25, {
                    showDropDownMenu = v45.state.isDropDownOpen, 
                    onWhyThisAdActivated = function() --[[ Line: 276 ]] --[[ Name: onWhyThisAdActivated ]]
                        -- upvalues: v45 (copy), v26 (ref)
                        v45.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.WhyThisAdClicked);
                        v26.logWhyThisAdEvent();
                    end, 
                    onReportAdActivated = function() --[[ Line: 281 ]] --[[ Name: onReportAdActivated ]]
                        -- upvalues: v45 (copy)
                        v45:setState({
                            isReportAdPopupOpen = true
                        });
                    end, 
                    transparency = 0.19999999999999996
                }) else nil, 
                AdLabel = v2.createElement(v4, {
                    onActivated = v21 and function() --[[ Line: 291 ]]
                        -- upvalues: v45 (copy), v26 (ref)
                        v45:setState({
                            isDropDownOpen = not v45.state.isDropDownOpen
                        });
                        if v45.state.isDropDownOpen then
                            v45.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayEventTriggered);
                            v45.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayButtonClicked);
                        else
                            v45.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PauseEventTriggered);
                            v45.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PauseButtonClicked);
                        end;
                        v26.logAdMenuEvent(v45.state.isDropDownOpen and "open" or "close");
                    end or function() --[[ Line: 305 ]]
                        -- upvalues: v45 (copy)
                        v45.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.AdLabelClicked);
                    end, 
                    isMenuOpen = v45.state.isDropDownOpen, 
                    Visible = not v47
                }), 
                CloseButton = v2.createElement(v5, {
                    HorizontalScale = 0.06884057971, 
                    Position = UDim2.fromScale(0.995, 0.005), 
                    AnchorPoint = Vector2.new(1, 0), 
                    ImageSize = UDim2.fromScale(0.8, 0.8), 
                    Image = v19, 
                    Visible = v49, 
                    Transparency = v58, 
                    AutoButtonColor = not v21 or not v45.state.isDropDownOpen or false, 
                    onActivated = function() --[[ Line: 320 ]] --[[ Name: onActivated ]]
                        -- upvalues: v21 (ref), v45 (copy), v26 (ref)
                        if v21 and v45.state.isDropDownOpen then
                            v45:setState({
                                isDropDownOpen = false
                            });
                            v45.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayEventTriggered);
                            v45.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayButtonClicked);
                            v26.logAdMenuEvent("close");
                            return;
                        else
                            v45.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.CloseButtonClicked);
                            return;
                        end;
                    end
                }), 
                PlayPauseButton = v2.createElement("ImageButton", {
                    BackgroundTransparency = 1, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Size = UDim2.fromScale(v53.X, v53.Y), 
                    Visible = v56, 
                    AutoButtonColor = not v21 or not v45.state.isDropDownOpen or false, 
                    [v2.Event.Activated] = function() --[[ Line: 341 ]]
                        -- upvalues: v21 (ref), v45 (copy), v26 (ref), v48 (ref), v17 (ref), v18 (ref)
                        if v21 and v45.state.isDropDownOpen then
                            v45:setState({
                                isDropDownOpen = false
                            });
                            v45.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayEventTriggered);
                            v45.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayButtonClicked);
                            v26.logAdMenuEvent("close");
                            return;
                        elseif v48 == v17 then
                            v45.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayButtonClicked);
                            return;
                        else
                            if v48 == v18 then
                                v45.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PauseButtonClicked);
                            end;
                            return;
                        end;
                    end
                }, {
                    circle = v2.createElement(l_ImageSetLabel_0, {
                        Image = v20, 
                        Size = UDim2.fromScale(1, 1), 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        BackgroundTransparency = 1, 
                        ImageTransparency = v58
                    }), 
                    icon = v2.createElement(l_ImageSetLabel_0, {
                        Image = v48, 
                        Size = UDim2.fromScale(0.6, 0.6), 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        BackgroundTransparency = 1, 
                        ImageTransparency = v58
                    })
                }), 
                VolumeButton = v2.createElement(v5, {
                    Visible = v50, 
                    Position = UDim2.fromScale(0.075, 0.75), 
                    HorizontalScale = 0.12, 
                    Image = v51, 
                    ImageSize = UDim2.fromScale(0.8, 0.8), 
                    AutoButtonColor = not v21 or not v45.state.isDropDownOpen or false, 
                    onActivated = function() --[[ Line: 383 ]] --[[ Name: onActivated ]]
                        -- upvalues: v21 (ref), v45 (copy), v26 (ref)
                        if v21 and v45.state.isDropDownOpen then
                            v45:setState({
                                isDropDownOpen = false
                            });
                            v45.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayEventTriggered);
                            v26.logAdMenuEvent("close");
                            return;
                        else
                            v45.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.VolumeButtonClicked);
                            return;
                        end;
                    end, 
                    Transparency = 0.19999999999999996
                }), 
                FullscreenButton = v2.createElement(v5, {
                    Visible = v50, 
                    Position = UDim2.fromScale(0.87625, 0.75), 
                    AnchorPoint = Vector2.new(1, 0), 
                    HorizontalScale = 0.12, 
                    Image = v52, 
                    ImageSize = UDim2.fromScale(0.7, 0.7), 
                    AutoButtonColor = not v21 or not v45.state.isDropDownOpen or false, 
                    onActivated = function() --[[ Line: 405 ]] --[[ Name: onActivated ]]
                        -- upvalues: v21 (ref), v45 (copy), v26 (ref)
                        if v21 and v45.state.isDropDownOpen then
                            v45:setState({
                                isDropDownOpen = false
                            });
                            v45.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.PlayEventTriggered);
                            v26.logAdMenuEvent("close");
                            return;
                        else
                            v45.props.adGui:HandleLuaUIEvent(Enum.AdUIEventType.FullscreenButtonClicked);
                            return;
                        end;
                    end, 
                    Transparency = 0.19999999999999996
                }), 
                LivePreviewWatermark = v2.createElement(v6, {
                    IsVisible = not v45.state.hideLivePreviewWatermark
                } or nil) or nil
            })
        });
    end;
end;
local function v70(v68) --[[ Line: 427 ]] --[[ Name: AdsInteractivityFunctionalWrapper ]]
    -- upvalues: v9 (copy), v2 (copy), l_AppStyleProvider_0 (copy), v27 (copy)
    local l_Dark_0 = v9.App.Style.Constants.ThemeName.Dark;
    return v2.createElement(l_AppStyleProvider_0, {
        style = {
            themeName = l_Dark_0
        }
    }, {
        AdsInteractivityControls = v2.createElement(v27, v68)
    });
end;
if l_FFlagInExperienceUseAppStyleProvider_0 then
    return v70;
else
    return v27;
end;