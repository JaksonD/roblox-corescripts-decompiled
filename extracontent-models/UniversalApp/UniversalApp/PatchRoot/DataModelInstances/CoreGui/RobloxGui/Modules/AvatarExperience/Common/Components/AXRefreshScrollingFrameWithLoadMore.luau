local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_Modules_0.LuaApp.Components.RefreshScrollingFrame);
local v5 = require(l_Modules_0.LuaApp.Util.debounce);
local l_useAXAnimateScrollFrame_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Components.AnimatedScrollingFrame.useAXAnimateScrollFrame;
local l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXScrollingFramesShouldAnimateOnFocus;
local v8 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local v9 = v8() and game:DefineFastFlag("AXScrollingFramePreloadDistanceProp2", false);
local v10 = v8() and game:DefineFastFlag("AXScrollingFramePreventInitialLoadMore3", false);
local v11 = game:DefineFastInt("AXScrollingPreloadDistance", 2000);
local l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXFixGamepadNavigationOnOutfitManagement;
return v3.forwardRef(function(v13, v14) --[[ Line: 48 ]]
    -- upvalues: v10 (copy), v3 (copy), v5 (copy), v9 (copy), v11 (copy), l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 (copy), l_useAXAnimateScrollFrame_0 (copy), v2 (copy), l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 (copy), v4 (copy)
    local v15 = nil;
    local v16 = nil;
    if v10 then
        v15 = v3.useRef(not v13.preventInitialLoadMore);
        v16 = v3.useCallback(v5(function() --[[ Line: 58 ]]
            -- upvalues: v15 (ref)
            v15.current = true;
        end, 0.5), {});
    end;
    local function v20(v17) --[[ Line: 65 ]] --[[ Name: onScrollingFrameChanged ]]
        -- upvalues: v13 (copy), v10 (ref), v15 (ref), v9 (ref), v11 (ref)
        local l_onThresholdReached_0 = v13.onThresholdReached;
        local v19 = nil;
        if v10 then
            v19 = not v13.preventInitialLoadMore or v15.current;
        end;
        if l_onThresholdReached_0 then
            if v10 and not v19 then
                return;
            elseif v17.CanvasPosition.Y > v17.CanvasSize.Y.Offset - v17.AbsoluteWindowSize.Y - if v9 and v13.preloadDistance then v13.preloadDistance else v11 then
                l_onThresholdReached_0();
            end;
        end;
    end;
    local function v22(v21) --[[ Line: 95 ]] --[[ Name: onCanvasPositionChanged ]]
        -- upvalues: v20 (copy), v13 (copy)
        v20(v21);
        if v13.onCanvasPositionChanged then
            v13.onCanvasPositionChanged(v21);
        end;
    end;
    local function v24(v23) --[[ Line: 102 ]] --[[ Name: onCanvasSizeChanged ]]
        -- upvalues: v10 (ref), v15 (ref), v16 (ref), v20 (copy), v13 (copy)
        if v10 and (not v15 or not v15.current) then
            v16();
        end;
        v20(v23);
        if v13.onCanvasSizeChanged then
            v13.onCanvasSizeChanged(v23);
        end;
    end;
    local function v26(v25) --[[ Line: 112 ]] --[[ Name: onAbsoluteWindowSizeChanged ]]
        -- upvalues: v20 (copy), v13 (copy)
        v20(v25);
        if v13.onAbsoluteWindowSizeChanged then
            v13.onAbsoluteWindowSizeChanged(v25);
        end;
    end;
    local l_v14_0 = v14;
    if l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 then
        local v28 = v3.useRef(nil);
        if not l_v14_0 then
            l_v14_0 = v28;
        end;
        l_useAXAnimateScrollFrame_0(l_v14_0);
    end;
    local v29 = v2.Dictionary.join(v13, {
        onCanvasPositionChangedCallback = v22, 
        onCanvasSizeChangedCallback = v24, 
        onAbsoluteWindowSizeChangedCallback = v26, 
        onThresholdReached = v2.None, 
        showLoadingBar = v2.None, 
        onCanvasPositionChanged = v2.None, 
        onCanvasSizeChanged = v2.None, 
        onAbsoluteWindowSizeChanged = v2.None, 
        Selectable = if l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 then v13.Selectable else nil, 
        ref = if l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 then l_v14_0 else v14
    });
    return v3.createElement(v4, v29);
end);