local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Otter);
local v4 = require(l_CorePackages_0.Packages.React);
local _ = require(l_CorePackages_0.Packages.ReactOtter);
local l_CarouselScrollButtons_0 = require(l_CorePackages_0.Workspace.Packages.CollectionViews).CarouselScrollButtons;
local _ = require(l_CorePackages_0.Workspace.Packages.AppBlox);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v9 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v10 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v11 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = v9.FocusNavigationEventNameEnum;
local v13 = require(l_CorePackages_0.Packages.Foundation);
local l_useCursor_0 = v13.Hooks.useCursor;
local l_CursorType_0 = v13.Enums.CursorType;
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_SystemInfoProtocol_0 = require(l_CorePackages_0.Workspace.Packages.SystemInfoProtocol).SystemInfoProtocol;
local v18 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_useBreakpointXOrSmaller_0 = v18.useBreakpointXOrSmaller;
local l_useLastInput_0 = v18.useLastInput;
local v21 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v21.App.ImageSet.Images;
local l_ImageSetLabel_0 = v21.Core.ImageSet.ImageSetLabel;
local l_LoadableImage_0 = v21.App.Loading.LoadableImage;
local l_LoadingStrategy_0 = v21.App.Loading.Enum.LoadingStrategy;
local l_RoundIconButton_0 = require(l_CorePackages_0.Workspace.Packages.VideoUtils).RoundIconButton;
local v27 = require(script.Parent.MediaGalleryPageIndicators);
local v28 = require(script.Parent.MediaGalleryVideoItem);
local v29 = require(script.Parent.Hooks.useMediaGalleryRenderStepWhenVisible);
local v30 = require(script.Parent.Hooks.useVisibleMediaGalleryItems);
local l_enableAudioPlaybackInApp_0 = require(l_CorePackages_0.Workspace.Packages.MediaPlayback).enableAudioPlaybackInApp;
local l_FFlagFixMediaGalleryOversized_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagFixMediaGalleryOversized;
local l_FFlagLuaAppEdpMediaGalleryRedesign_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesign;
local l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesignIxp;
local l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview;
local l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreviewIxp;
local l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryAutoAdvance;
local l_FFlagLuaAppEdpMediaGalleryPreloadImage_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryPreloadImage;
local l_FFlagLuaAppEdpMediaGalleryFullScreen_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen;
local l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesignTelemetry;
local v41 = game:DefineFastFlag("LuaAppEdpMediaGalleryVideoAudioFix2", false);
local v42 = game:DefineFastString("LuaAppEdpAudioManufacturerDenyList", "huawei,hwi");
pcall(function() --[[ Line: 65 ]]
    -- upvalues: l_SystemInfoProtocol_0 (copy), v42 (copy), v41 (ref)
    local v43 = l_SystemInfoProtocol_0.default:getSystemInfo({
        l_SystemInfoProtocol_0.InfoNames.MANUFACTURER
    });
    if typeof(v43.manufacturer) == "string" then
        for v44 in v42:gmatch("(%w+)") do
            if typeof(v44) == "string" and string.lower(v44) == string.lower(v43.manufacturer) then
                v41 = false;
            end;
        end;
    end;
end);
local v45 = game:DefineFastFlag("LuaAppEdpMediaGalleryPageIndicators3", false);
local v46 = game:DefineFastFlag("LuaAppEdpMediaGalleryTouchDrag", false);
local v47 = game:DefineFastInt("LuaAppEdpMediaGalleryImageAutoAdvanceDuration", 5);
local v48 = {
    itemPadding = 16, 
    borderRadius = UDim.new(0, 8), 
    useSpring = true, 
    springConfig = {
        frequency = 3, 
        dampingRatio = 1, 
        restingVelocityLimit = 0.05
    }, 
    showCounter = true
};
local function _(v49) --[[ Line: 146 ]] --[[ Name: getImageUri ]]
    local v50 = string.find(v49, "http://www.roblox.com/asset/?id=", 1, true);
    if v50 and v50 == 1 then
        return (("rbxthumb://type=Asset&id=%*&w=768&h=432"):format((string.sub(v49, 33))));
    else
        return v49;
    end;
end;
local function v201(v52) --[[ Line: 157 ]] --[[ Name: MediaGallerySnapping ]]
    -- upvalues: v2 (copy), v48 (copy), l_FFlagLuaAppEdpMediaGalleryRedesign_0 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 (copy), l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 (copy), l_useDesignTokens_0 (copy), v4 (copy), v46 (copy), l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 (copy), v41 (ref), l_enableAudioPlaybackInApp_0 (copy), l_Signal_0 (copy), l_useLastInput_0 (copy), v18 (copy), v3 (copy), l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 (copy), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (copy), v47 (copy), v29 (copy), l_useBreakpointXOrSmaller_0 (copy), l_useCursor_0 (copy), l_CursorType_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v11 (copy), v10 (copy), l_UserInputService_0 (copy), v30 (copy), l_LoadableImage_0 (copy), l_FFlagLuaAppEdpMediaGalleryPreloadImage_0 (copy), l_LoadingStrategy_0 (copy), v28 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_RoundIconButton_0 (copy), v45 (copy), v27 (copy), l_CarouselScrollButtons_0 (copy), l_FFlagFixMediaGalleryOversized_0 (copy)
    local v53 = v2.Dictionary.join(v48, v52);
    local v54 = nil;
    if l_FFlagLuaAppEdpMediaGalleryRedesign_0 then
        v54 = not l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 or v53.mediaGalleryRedesignEnabledIxp;
    end;
    local v55 = if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then not l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 or v53.mediaGalleryVideoPreviewEnabledIxp else nil;
    local v56 = l_useDesignTokens_0();
    local l_Space_150_0 = v56.Global.Space_150;
    local v58 = if v53.itemAspectRatio and v53.itemAspectRatio ~= 0 then v53.itemAspectRatio else 1.7777777777777777;
    local v59, v60 = v4.useState(Vector2.new(0, 0));
    local v61 = if not v46 then v4.useRef(false) else nil;
    local v62 = v4.useRef((Vector3.new()));
    local v63 = v4.useRef(nil);
    local v64 = nil;
    local v65 = nil;
    local v66 = nil;
    local v67 = nil;
    local v68 = nil;
    local v69 = nil;
    local v70 = nil;
    local v71 = nil;
    local v72 = nil;
    local v73 = nil;
    local v74 = nil;
    local v75 = nil;
    local v76 = nil;
    local v77 = nil;
    local v78 = nil;
    local v79 = nil;
    local v80 = nil;
    local v81 = nil;
    local v82 = nil;
    local v83 = nil;
    local v84 = nil;
    local v85 = nil;
    local v86 = nil;
    local v87 = nil;
    local v88 = nil;
    local v89 = nil;
    local v90 = nil;
    local l_Size_250_0 = v56.Global.Size_250;
    local l_Size_175_0 = v56.Global.Size_175;
    local v93 = nil;
    local v94 = nil;
    local v95 = nil;
    local v96 = nil;
    local v97 = nil;
    if l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 or v46 then
        v86 = v4.useRef(nil);
    end;
    if l_FFlagLuaAppEdpMediaGalleryRedesign_0 then
        if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 and v41 then
            local v98 = nil;
            for _, v100 in v53.items do
                if v100.videoId then
                    v98 = true;
                    break;
                end;
            end;
            do
                local l_v98_0 = v98;
                v4.useEffect(function() --[[ Line: 222 ]]
                    -- upvalues: l_v98_0 (ref), l_enableAudioPlaybackInApp_0 (ref)
                    if l_v98_0 then
                        task.delay(0, function() --[[ Line: 224 ]]
                            -- upvalues: l_enableAudioPlaybackInApp_0 (ref)
                            l_enableAudioPlaybackInApp_0();
                        end);
                    end;
                end, {
                    l_v98_0
                });
            end;
        end;
        local v102, v103 = v4.useState(v53.startIndex or 1);
        v64 = v102;
        v65 = v103;
        v4.useEffect(function() --[[ Line: 233 ]]
            -- upvalues: v53 (copy)
            local v104 = {};
            for _, v106 in v53.items do
                if v106.imageId then
                    local l_imageId_0 = v106.imageId;
                    local v108 = string.find(l_imageId_0, "http://www.roblox.com/asset/?id=", 1, true);
                    table.insert(v104, if v108 and v108 == 1 then ("rbxthumb://type=Asset&id=%*&w=768&h=432"):format((string.sub(l_imageId_0, 33))) else l_imageId_0);
                end;
            end;
            if #v104 > 0 then
                task.spawn(function() --[[ Line: 241 ]]
                    -- upvalues: v104 (copy)
                    game:GetService("ContentProvider"):PreloadAsync(v104);
                end);
            end;
        end, {
            v53.items
        });
        v68 = v4.useCallback(function(v109) --[[ Line: 248 ]]
            -- upvalues: v59 (copy), v53 (copy)
            if v109 == 1 then
                return Vector2.new(0, 0);
            else
                local v110 = v59.X + v53.itemPadding;
                return Vector2.new(v110, 0);
            end;
        end, {
            v53.itemPadding, 
            v59
        });
        v102, v103 = v4.useBinding(v68(v64));
        v69 = v102;
        v70 = v103;
        v4.useEffect(function() --[[ Line: 259 ]]
            -- upvalues: v70 (ref), v68 (ref), v64 (ref)
            v70(v68(v64));
        end, {
            v68, 
            v64
        });
        v71 = v4.useRef(l_Signal_0.new());
        v102 = l_useLastInput_0();
        v90 = v102 == v18.Input.Directional;
        v72 = if v54 then v102 == v18.Input.Pointer else nil;
        if l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 then
            local v111;
            v103, v111 = v4.useBinding(0);
            v82 = v103;
            v83 = v111;
            v103, v111 = v4.useBinding(0);
            v84 = v103;
            v85 = v111;
        end;
        v103 = v4.useRef(false);
        local l_v103_0 = v103 --[[ copy: 47 -> 66 ]];
        v73 = v4.useCallback(function(v113, v114) --[[ Line: 278 ]]
            -- upvalues: l_v103_0 (copy), v69 (ref), v59 (copy), v53 (copy), v64 (ref), l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 (ref), v54 (ref), v83 (ref), v85 (ref), v71 (ref), v3 (ref), v70 (ref), l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 (ref), v65 (ref)
            if l_v103_0.current then
                return;
            else
                local v115 = v69:getValue();
                local v116 = v59.X + v53.itemPadding;
                local v117 = nil;
                local v118 = nil;
                if v113 == "Right" then
                    v117 = v64 + 1;
                    v118 = v115 + Vector2.new(v116, 0);
                else
                    v117 = v64 - 1;
                    v118 = v115 - Vector2.new(v116, 0);
                end;
                if v117 < 1 or #v53.items < v117 then
                    return;
                else
                    if l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 and v54 then
                        v83(0);
                        v85(0);
                    end;
                    if v54 then
                        v71.current:fire(v117);
                    end;
                    l_v103_0.current = true;
                    local v119 = v3.createSingleMotor(0);
                    v119:onStep(function(v120) --[[ Line: 313 ]]
                        -- upvalues: v70 (ref), v115 (copy), v118 (ref)
                        v70(v115:Lerp(v118, v120));
                    end);
                    if v53.useSpring then
                        v119:setGoal(v3.spring(1, v53.springConfig));
                    else
                        v119:setGoal(v3.instant(1));
                    end;
                    v119:onComplete(function() --[[ Line: 323 ]]
                        -- upvalues: l_v103_0 (ref), v53 (ref), l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 (ref), v117 (ref), v114 (copy), v65 (ref)
                        l_v103_0.current = false;
                        if v53.onSwipe then
                            v53.onSwipe();
                        end;
                        if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 and v53.onMediaGalleryMediaChanged and v53.items and v53.items[v117] then
                            local v121 = v53.items[v117];
                            v53.onMediaGalleryMediaChanged(v121.imageId, v121.videoId, v121.isYouTubeVideo, v114);
                        end;
                        v65(v117);
                    end);
                    return function() --[[ Line: 343 ]]
                        -- upvalues: v119 (copy)
                        v119:destroy();
                    end;
                end;
            end;
        end, {
            v53.items, 
            v53.itemPadding, 
            v53.useSpring, 
            v53.springConfig, 
            v53.onSwipe, 
            v59, 
            v64, 
            v69, 
            v54
        });
        v74 = v4.useCallback(function() --[[ Line: 360 ]]
            -- upvalues: v73 (ref)
            v73("Left");
        end, {
            v73
        });
        v75 = v4.useCallback(function() --[[ Line: 364 ]]
            -- upvalues: v73 (ref)
            v73("Right");
        end, {
            v73
        });
        v76 = v4.useCallback(function(_, v123) --[[ Line: 369 ]]
            -- upvalues: v73 (ref)
            if v123 == Enum.SwipeDirection.Right then
                v73("Left");
                return;
            else
                if v123 == Enum.SwipeDirection.Left then
                    v73("Right");
                end;
                return;
            end;
        end, {
            v73
        });
        v77 = v4.useCallback(function(v124) --[[ Line: 378 ]]
            -- upvalues: v60 (copy)
            v60(v124.AbsoluteSize);
        end, {});
        local v125, v126 = v4.useState(true);
        v95 = v125;
        v96 = v126;
        v93 = v4.useMemo(function() --[[ Line: 384 ]]
            -- upvalues: l_Signal_0 (ref)
            return l_Signal_0.new();
        end, {});
        v94 = v4.useMemo(function() --[[ Line: 387 ]]
            -- upvalues: l_Signal_0 (ref)
            return l_Signal_0.new();
        end, {});
        v78 = v4.useCallback(function() --[[ Line: 390 ]]
            -- upvalues: v53 (copy), v64 (ref), v93 (ref)
            local v127 = v53.items[v64];
            if v127 and v127.videoId then
                v93:fire();
            end;
        end, {
            v64, 
            v53.items, 
            v93
        });
        if not v46 then
            v79 = v4.useCallback(function(_, v129) --[[ Line: 399 ]]
                -- upvalues: v61 (copy), v62 (copy)
                if v129.UserInputType == Enum.UserInputType.Touch then
                    v61.current = false;
                    v62.current = v129.Position;
                end;
            end, {});
            v80 = v4.useCallback(function(_, v131) --[[ Line: 406 ]]
                -- upvalues: v62 (copy), v61 (copy)
                if v131.UserInputType == Enum.UserInputType.Touch and v62.current and v62.current.X and math.abs(v131.Position.X - v62.current.X) > 50 then
                    v61.current = true;
                end;
            end, {});
            v81 = v4.useCallback(function(_, v133) --[[ Line: 419 ]]
                -- upvalues: v62 (copy)
                if v133.UserInputType == Enum.UserInputType.Touch then
                    v62.current = Vector3.new();
                end;
            end, {});
        end;
        if l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 then
            if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then
                v87 = v4.useCallback(function() --[[ Line: 428 ]]
                    -- upvalues: l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (ref), v53 (copy), v73 (ref)
                    if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 and v53.isFullscreen then
                        return;
                    else
                        v73("Right", true);
                        return;
                    end;
                end, {
                    v73
                });
            end;
            local l_v103_1 = v103 --[[ copy: 47 -> 70 ]];
            v125 = v4.useCallback(function(v135) --[[ Line: 437 ]]
                -- upvalues: l_v103_1 (copy), v82 (ref), v47 (ref), v73 (ref), v83 (ref), v85 (ref)
                if not l_v103_1.current then
                    local v136 = v82:getValue() + v135;
                    if v47 <= v136 then
                        v73("Right", true);
                        return;
                    else
                        v83(v136);
                        v85(v136 / v47);
                    end;
                end;
            end, {
                v82, 
                v73
            });
            v126 = v4.useCallback(function() --[[ Line: 452 ]]
                -- upvalues: v83 (ref), v85 (ref)
                v83(0);
                v85(0);
            end, {});
            local v137 = nil;
            if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 and v55 and v53.items and v53.items[v64] and v53.items[v64].videoId then
                v137 = true;
            end;
            v29(if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v53.isOccluded else nil, if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v53.isFullscreen else nil, if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 and v55 then v137 else nil, v86, v125, v126, if l_FFlagLuaAppEdpMediaGalleryRedesignIxp_0 then v53.mediaGalleryRedesignEnabledIxp else nil, if l_FFlagLuaAppEdpMediaGalleryVideoPreviewIxp_0 then v53.mediaGalleryVideoPreviewEnabledIxp else nil);
        end;
        if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then
            v4.useEffect(function() --[[ Line: 481 ]]
                -- upvalues: v54 (ref), v65 (ref), v53 (copy)
                if v54 then
                    v65(v53.startIndex or 1);
                end;
            end, {
                v53.startIndex, 
                v54
            });
        end;
        v88 = l_useBreakpointXOrSmaller_0(v18.Keys.Small);
        v97 = l_useCursor_0(l_CursorType_0.Invisible);
        v125 = v4.useCallback(function() --[[ Line: 492 ]]
            -- upvalues: v53 (copy), v64 (ref)
            if v53.onFullscreenToggleButtonActivated and v53.items and v53.items[v64] then
                local v138 = v53.items[v64].videoId ~= nil;
                v53.onFullscreenToggleButtonActivated(v64, v138);
            end;
        end, {
            v53.onFullscreenToggleButtonActivated, 
            v64, 
            v53.items
        });
        v126 = v53.items and v64 and v53.items[v64] and v53.items[v64].videoId ~= nil;
        local l_v126_0 = v126 --[[ copy: 49 -> 67 ]];
        local v140 = v4.useCallback(function() --[[ Line: 503 ]]
            -- upvalues: l_v126_0 (copy), v94 (ref)
            if l_v126_0 then
                v94:fire();
            end;
        end, {
            v94, 
            v126
        });
        local v141 = v4.useMemo(function() --[[ Line: 509 ]]
            -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v53 (copy), l_v126_0 (copy), v95 (ref)
            return {
                [Enum.KeyCode.ButtonL1] = l_FocusNavigationEventNameEnum_0.TabBackward, 
                [Enum.KeyCode.ButtonR1] = l_FocusNavigationEventNameEnum_0.TabForward, 
                [Enum.KeyCode.ButtonR3] = if v53.isFullscreen then l_FocusNavigationEventNameEnum_0.ExitFullscreen else l_FocusNavigationEventNameEnum_0.Fullscreen, 
                [Enum.KeyCode.ButtonL3] = if not l_v126_0 then nil else if v95 then l_FocusNavigationEventNameEnum_0.Unmute else l_FocusNavigationEventNameEnum_0.Mute
            };
        end, {
            v53.isFullscreen, 
            v95, 
            v126
        });
        local l_v125_0 = v125 --[[ copy: 48 -> 68 ]];
        local l_v140_0 = v140 --[[ copy: 50 -> 69 ]];
        local v144 = v4.useMemo(function() --[[ Line: 522 ]]
            -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v11 (ref), v74 (ref), v75 (ref), l_v125_0 (copy), l_v140_0 (copy)
            return {
                [l_FocusNavigationEventNameEnum_0.TabBackward] = {
                    handler = v11.onRelease(v74)
                }, 
                [l_FocusNavigationEventNameEnum_0.TabForward] = {
                    handler = v11.onRelease(v75)
                }, 
                [l_FocusNavigationEventNameEnum_0.Fullscreen] = {
                    handler = v11.onRelease(l_v125_0)
                }, 
                [l_FocusNavigationEventNameEnum_0.ExitFullscreen] = {
                    handler = v11.onRelease(l_v125_0)
                }, 
                [l_FocusNavigationEventNameEnum_0.Mute] = {
                    handler = v11.onRelease(l_v140_0)
                }, 
                [l_FocusNavigationEventNameEnum_0.Unmute] = {
                    handler = v11.onRelease(l_v140_0)
                }
            };
        end, {
            v74, 
            v75, 
            v125, 
            v140
        });
        local v145 = v10.useEventMap(v141);
        v89 = v10.useEventHandlerMap(v144, v145);
    else
        local v146, v147 = v4.useBinding(v53.startIndex or 1);
        v66 = v146;
        v67 = v147;
        v68 = function(v148) --[[ Line: 550 ]]
            -- upvalues: v59 (copy), v53 (copy)
            local v149 = v59.X + v53.itemPadding;
            return Vector2.new(v149 * (v148 - 1), 0);
        end;
        v146, v147 = v4.useBinding(v68(v66:getValue()));
        v69 = v146;
        v70 = v147;
        v4.useEffect(function() --[[ Line: 558 ]]
            -- upvalues: v70 (ref), v68 (ref), v66 (ref)
            v70(v68(v66:getValue()));
        end, {
            v59
        });
        v73 = function(v150) --[[ Line: 562 ]]
            -- upvalues: v66 (ref), v53 (copy), v67 (ref), v68 (ref), v69 (ref), v3 (ref), v70 (ref), v46 (ref), v61 (copy)
            local v151 = nil;
            v151 = if v150 == "Right" then v66:getValue() + 1 else v66:getValue() - 1;
            if v151 >= 1 and v151 <= #v53.items then
                v67(v151);
                local v152 = v68(v66:getValue());
                local v153 = v69:getValue();
                local v154 = v3.createSingleMotor(0);
                v154:onStep(function(v155) --[[ Line: 580 ]]
                    -- upvalues: v70 (ref), v153 (copy), v152 (copy)
                    v70(v153:Lerp(v152, v155));
                end);
                if v53.useSpring then
                    v154:setGoal(v3.spring(1, v53.springConfig));
                else
                    v154:setGoal(v3.instant(1));
                end;
                v154:onComplete(function() --[[ Line: 590 ]]
                    -- upvalues: v46 (ref), v61 (ref), v53 (ref)
                    if not v46 then
                        v61.current = false;
                    end;
                    if v53.onSwipe then
                        v53.onSwipe();
                    end;
                end);
                return;
            else
                return;
            end;
        end;
        v76 = function(_, v157) --[[ Line: 601 ]]
            -- upvalues: v73 (ref)
            if v157 == Enum.SwipeDirection.Right then
                v73("Left");
                return;
            else
                if v157 == Enum.SwipeDirection.Left then
                    v73("Right");
                end;
                return;
            end;
        end;
        v77 = function(v158) --[[ Line: 610 ]]
            -- upvalues: v60 (copy)
            v60(v158.AbsoluteSize);
        end;
        v78 = function(v159) --[[ Line: 614 ]]
            -- upvalues: v46 (ref), v61 (copy), v53 (copy)
            if not v46 and v61.current then
                return;
            elseif v53.onPreviewActivated then
                return v53.onPreviewActivated(v159);
            else
                return;
            end;
        end;
        if not v46 then
            v79 = function(_, v161) --[[ Line: 626 ]]
                -- upvalues: v61 (copy), v62 (copy)
                if v161.UserInputType == Enum.UserInputType.Touch then
                    v61.current = false;
                    v62.current = v161.Position;
                end;
            end;
            v80 = function(_, v163) --[[ Line: 633 ]]
                -- upvalues: v62 (copy), v61 (copy)
                if v163.UserInputType == Enum.UserInputType.Touch and v62.current and math.abs(v163.Position.X - v62.current.X) > 50 then
                    v61.current = true;
                end;
            end;
            v81 = function(_, v165) --[[ Line: 642 ]]
                -- upvalues: v62 (copy)
                if v165.UserInputType == Enum.UserInputType.Touch then
                    v62.current = Vector3.new();
                end;
            end;
        end;
    end;
    if v46 then
        v4.useEffect(function() --[[ Line: 651 ]]
            -- upvalues: l_UserInputService_0 (ref), v86 (ref), v76 (ref)
            local v166 = false;
            local v171 = l_UserInputService_0.TouchStarted:Connect(function(v167) --[[ Line: 654 ]]
                -- upvalues: v86 (ref), v166 (ref)
                local l_current_0 = v86.current;
                if l_current_0 then
                    local l_AbsolutePosition_0 = l_current_0.AbsolutePosition;
                    local l_AbsoluteSize_0 = l_current_0.AbsoluteSize;
                    if v167.Position.X >= l_AbsolutePosition_0.X and v167.Position.X <= l_AbsolutePosition_0.X + l_AbsoluteSize_0.X and v167.Position.Y >= l_AbsolutePosition_0.Y and v167.Position.Y <= l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y then
                        v166 = true;
                    end;
                end;
            end);
            local v173 = l_UserInputService_0.TouchEnded:Connect(function(_) --[[ Line: 672 ]]
                -- upvalues: v166 (ref)
                v166 = false;
            end);
            local v175 = l_UserInputService_0.TouchDrag:Connect(function(v174) --[[ Line: 676 ]]
                -- upvalues: v166 (ref), v76 (ref)
                if v166 then
                    v76(nil, v174);
                end;
            end);
            return function() --[[ Line: 682 ]]
                -- upvalues: v171 (copy), v173 (copy), v175 (copy)
                v171:Disconnect();
                v173:Disconnect();
                v175:Disconnect();
            end;
        end, {
            v76
        });
    end;
    local v176 = if l_FFlagLuaAppEdpMediaGalleryRedesign_0 then v30(v53.items, v64) else nil;
    local v177 = nil;
    if l_FFlagLuaAppEdpMediaGalleryRedesign_0 and v54 then
        local l_Size_100_0 = v56.Global.Size_100;
        local v179 = if v88 then v56.Global.Size_200 else v56.Global.Size_350;
        local l_Size_500_0 = v56.Global.Size_500;
        v177 = l_Size_100_0 + v179 + l_Size_500_0;
    end;
    local v181 = {};
    local v182 = if l_FFlagLuaAppEdpMediaGalleryRedesign_0 then v176 else v53.items;
    for v183, v184 in v182 do
        local v185 = nil;
        v185 = if l_FFlagLuaAppEdpMediaGalleryRedesign_0 then if v64 == 1 then v183 else v64 - 2 + v183 else v183;
        local v186 = "Item" .. v185;
        local l_createElement_0 = v4.createElement;
        local v188 = "TextButton";
        do
            local l_v185_0 = v185;
            local v190 = {
                LayoutOrder = l_v185_0, 
                Size = UDim2.new(1, 0, 0, v59.X / v58), 
                TextTransparency = 1, 
                Text = "", 
                BackgroundTransparency = 1, 
                AutoButtonColor = false, 
                [v4.Event.InputBegan] = if v46 then nil else v79, 
                [v4.Event.InputChanged] = if v46 then nil else v80, 
                [v4.Event.InputEnded] = if v46 then nil else v81, 
                [v4.Event.Activated] = if l_FFlagLuaAppEdpMediaGalleryRedesign_0 then nil else if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 and v55 and v184.videoId then nil else function() --[[ Line: 729 ]]
                    -- upvalues: v78 (ref), l_v185_0 (ref)
                    v78(l_v185_0);
                end, 
                [v4.Event.TouchSwipe] = if v46 then nil else v76, 
                Selectable = not v54 and nil
            };
            local v191 = {};
            local v192;
            if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 and v55 and v184.videoId then
                v192 = nil;
            else
                v192 = v4.createElement;
                local l_l_LoadableImage_0_0 = l_LoadableImage_0;
                local v194 = {
                    cornerRadius = v53.borderRadius, 
                    Size = UDim2.fromScale(1, 1)
                };
                local v195;
                if v54 then
                    local l_imageId_1 = v184.imageId;
                    local v197 = string.find(l_imageId_1, "http://www.roblox.com/asset/?id=", 1, true);
                    v195 = if v197 and v197 == 1 then ("rbxthumb://type=Asset&id=%*&w=768&h=432"):format((string.sub(l_imageId_1, 33))) else l_imageId_1;
                else
                    v195 = v184.imageId;
                end;
                v194.Image = v195;
                v194.ScaleType = Enum.ScaleType.Crop;
                v194.BackgroundTransparency = 1;
                v194.ZIndex = 1;
                v194.useShimmerAnimationWhileLoading = true;
                v194.loadingStrategy = if l_FFlagLuaAppEdpMediaGalleryPreloadImage_0 then l_LoadingStrategy_0.Eager else nil;
                v192 = v192(l_l_LoadableImage_0_0, v194);
            end;
            v191.Image = v192;
            v191.Video = if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 and v55 and v184.videoId then v4.createElement(v28, {
                video = v184.videoId, 
                thumbnail = v184.imageId, 
                Size = UDim2.fromScale(1, 1), 
                cornerRadius = v53.borderRadius.Offset, 
                ZIndex = 1, 
                itemIndex = l_v185_0, 
                isFullscreen = if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v53.isFullscreen else nil, 
                isMediaGalleryOccluded = if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v53.isOccluded else nil, 
                videoPlaybackCoordinator = v53.videoPlaybackCoordinator, 
                onVideoProgressChanged = if l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 then v85 else nil, 
                onVideoEnded = if l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 then v87 else nil, 
                videoAnalytics = v53.videoAnalytics, 
                universeId = v53.universeId, 
                toggleVideoPlaybackSignal = if l_v185_0 == v64 then v93 else nil, 
                toggleMuteSignal = if l_v185_0 == v64 then v94 else nil, 
                onMutedChanged = if l_v185_0 == v64 then v96 else nil
            }) else nil;
            v191.GradientOverlay = if l_FFlagLuaAppEdpMediaGalleryRedesign_0 and v54 then if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 and v55 and v184.videoId then nil else v4.createElement("Frame", {
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.fromScale(0, 1), 
                Size = UDim2.new(1, 0, 0, v177), 
                BackgroundColor3 = v56.Global.Color.Black.Color3, 
                BorderSizePixel = 0, 
                ZIndex = 2
            }, {
                Gradient = v4.createElement("UIGradient", {
                    Rotation = 90, 
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1), 
                        NumberSequenceKeypoint.new(1, 0.2)
                    })
                }), 
                UICorner = v4.createElement("UICorner", {
                    CornerRadius = v53.borderRadius
                })
            }) else nil;
            v191.PlayButton = if v184.isYouTubeVideo then v4.createElement("TextButton", {
                Size = UDim2.new(0, 60, 0, 45), 
                AnchorPoint = Vector2.new(1, 1), 
                Position = UDim2.new(1, -l_Space_150_0, 1, -l_Space_150_0), 
                TextTransparency = 1, 
                Text = "", 
                BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
                BackgroundTransparency = 0.5, 
                ZIndex = l_FFlagLuaAppEdpMediaGalleryRedesign_0 and v54 and 3 or 2, 
                [v4.Event.Activated] = function() --[[ Line: 808 ]]
                    -- upvalues: v53 (copy), l_v185_0 (ref)
                    if v53.onVideoPlayActivated then
                        v53.onVideoPlayActivated(l_v185_0);
                    end;
                end
            }, {
                PlayButtonCorner = v4.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                }), 
                PlayIcon = v4.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.fromOffset(26, 26), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Image = l_Images_0["icons/common/play"], 
                    BackgroundTransparency = 1, 
                    ZIndex = 2
                })
            }) else nil;
            v191.FullscreenButton = if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 and v54 and v53.onFullscreenToggleButtonActivated then v4.createElement(l_RoundIconButton_0, {
                icon = v53.isFullscreen and "two-arrows-to-center" or "two-arrows-from-center", 
                onActivated = function() --[[ Line: 832 ]] --[[ Name: onActivated ]]
                    -- upvalues: v53 (copy), l_v185_0 (ref), v184 (copy)
                    v53.onFullscreenToggleButtonActivated(l_v185_0, v184.videoId ~= nil);
                end, 
                AnchorPoint = Vector2.new(1, 0), 
                Position = UDim2.new(1, -v56.Global.Space_250, 0, v56.Global.Space_250), 
                ZIndex = 3, 
                Selectable = false
            }) else nil;
            v181[v186] = l_createElement_0(v188, v190, v191);
        end;
    end;
    v182 = nil;
    local v198 = nil;
    if v59.X < 500 then
        v182 = v56.Global.Space_300;
        v198 = v56.Global.Space_100;
    else
        v182 = v56.Global.Space_400;
        v198 = v56.Global.Space_200;
    end;
    local v200 = if not v53.showCounter or l_FFlagLuaAppEdpMediaGalleryRedesign_0 and v54 then nil else v4.createElement("TextLabel", {
        Size = UDim2.fromScale(0, 1), 
        AutomaticSize = Enum.AutomaticSize.X, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5), 
        BackgroundTransparency = 1, 
        Text = if l_FFlagLuaAppEdpMediaGalleryRedesign_0 then ("<b>%* / %*</b>"):format(v64, #v53.items) else v66:map(function(v199) --[[ Line: 863 ]]
            -- upvalues: v53 (copy)
            return (("<b>%* / %*</b>"):format(v199, #v53.items));
        end), 
        Font = v56.Semantic.Typography.CaptionHeader.Font, 
        TextSize = v56.Semantic.Typography.CaptionHeader.FontSize, 
        TextColor3 = v56.Semantic.Color.Text.Emphasis.Color3, 
        TextTransparency = v56.Semantic.Color.Text.Emphasis.Transparency, 
        RichText = true, 
        LineHeight = 1, 
        ref = v63
    });
    return v4.createElement(l_FFlagLuaAppEdpMediaGalleryRedesign_0 and v54 and "TextButton" or "Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        ref = v89, 
        AutoButtonColor = (not l_FFlagLuaAppEdpMediaGalleryRedesign_0 or not v54) and nil, 
        Text = l_FFlagLuaAppEdpMediaGalleryRedesign_0 and v54 and "" or nil, 
        [v4.Event.Activated] = if l_FFlagLuaAppEdpMediaGalleryRedesign_0 and v54 then v78 else nil, 
        SelectionBehaviorRight = if l_FFlagLuaAppEdpMediaGalleryRedesign_0 and v54 then Enum.SelectionBehavior.Stop else nil, 
        SelectionImageObject = if l_FFlagLuaAppEdpMediaGalleryRedesign_0 and v54 and v53.isFullscreen then v97 else nil, 
        SelectionGroup = l_FFlagLuaAppEdpMediaGalleryRedesign_0 and v54 and true or nil
    }, {
        ScrollingFrame = v4.createElement("ScrollingFrame", {
            Selectable = false, 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.fromScale(0, 0.5), 
            Size = UDim2.new(1, 0, 0, v59.X / v58), 
            AutomaticCanvasSize = Enum.AutomaticSize.XY, 
            CanvasPosition = v69, 
            ScrollingEnabled = false, 
            ScrollBarImageTransparency = 1, 
            ScrollBarThickness = l_FFlagLuaAppEdpMediaGalleryRedesign_0 and v54 and v53.clipsNonCurrentItems and 0 or nil, 
            ScrollingDirection = Enum.ScrollingDirection.X, 
            ClipsDescendants = if l_FFlagLuaAppEdpMediaGalleryRedesign_0 and v54 then v53.clipsNonCurrentItems else false, 
            ZIndex = 1, 
            [v4.Change.AbsoluteSize] = v77, 
            ref = if not not l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 or v46 then v86 else nil
        }, {
            Layout = v4.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, v53.itemPadding)
            }), 
            Items = v4.createElement(v4.Fragment, {}, v181)
        }), 
        Counter = if not v53.showCounter or l_FFlagLuaAppEdpMediaGalleryRedesign_0 and v54 then nil else v4.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 1), 
            Position = UDim2.new(0.5, 0, 1, -l_Space_150_0), 
            Size = UDim2.fromOffset((v63.current and v63.current.AbsoluteSize.X or 0) + v198 * 2, v182), 
            BackgroundTransparency = 0.3, 
            BackgroundColor3 = v56.Semantic.Color.Background.Default.Color3, 
            BorderSizePixel = 0, 
            ZIndex = 2
        }, {
            TextLabel = v200, 
            Corner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            })
        }), 
        PageIndicators = if not (l_FFlagLuaAppEdpMediaGalleryRedesign_0 and v54 and v45 and #v53.items > 1) or l_FFlagLuaAppEdpMediaGalleryFullScreen_0 and v53.isFullscreen then nil else v4.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 1), 
            AutomaticSize = Enum.AutomaticSize.X, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(0, v56.Global.Size_100), 
            Position = UDim2.new(0.5, 0, 1, if v88 then -v56.Global.Size_200 else -v56.Global.Size_350), 
            ZIndex = 2
        }, {
            UIListLayout = v4.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, l_Size_175_0), 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            PageLeftGamepadIcon = if v90 then v4.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                LayoutOrder = -1, 
                Image = l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonL1), 
                ImageTransparency = v64 <= 1 and 0.5 or nil, 
                Size = UDim2.fromOffset(l_Size_250_0, l_Size_250_0)
            }) else nil, 
            Indicators = v4.createElement(v27, {
                numberOfItems = #v53.items, 
                mediaGalleryStartIndex = v53.startIndex or 1, 
                currentItemProgressBinding = if l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 then v84 else nil, 
                mediaGalleryScrolledSignal = v71.current, 
                useSpring = v53.useSpring, 
                springConfig = v53.springConfig
            }), 
            PageRightGamepadIcon = if v90 then v4.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Image = l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonR1), 
                ImageTransparency = #v53.items <= v64 and 0.5 or nil, 
                Size = UDim2.fromOffset(l_Size_250_0, l_Size_250_0)
            }) else nil
        }), 
        ScrollButtons = if l_FFlagLuaAppEdpMediaGalleryRedesign_0 and v54 and v72 then v4.createElement(l_CarouselScrollButtons_0, {
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.fromScale(0.5, 0), 
            Size = UDim2.new(1, l_FFlagLuaAppEdpMediaGalleryFullScreen_0 and v53.isFullscreen and 0 or v56.Global.Size_500, 1, 0), 
            buttonOffsetFromEdge = if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 and v53.isFullscreen then v56.Global.Space_250 else nil, 
            ZIndex = 10, 
            leftScrollingEnabled = v64 > 1, 
            rightScrollingEnabled = #v53.items > v64, 
            handleScrollLeft = v74, 
            handleScrollRight = v75
        }) else nil, 
        SizeConstraint = v4.createElement("UISizeConstraint", {
            MinSize = Vector2.new(l_FFlagFixMediaGalleryOversized_0 and 0 or v59.X, v59.X / v58)
        })
    });
end;
if l_FFlagLuaAppEdpMediaGalleryVideoPreview_0 then
    return (v4.memo(v201));
else
    return v201;
end;