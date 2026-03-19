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
return v3.forwardRef(function(v12, v13) --[[ Line: 44 ]]
    -- upvalues: v10 (copy), v3 (copy), v5 (copy), v9 (copy), v11 (copy), l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 (copy), l_useAXAnimateScrollFrame_0 (copy), v2 (copy), v4 (copy)
    local v14 = nil;
    local v15 = nil;
    if v10 then
        v14 = v3.useRef(not v12.preventInitialLoadMore);
        v15 = v3.useCallback(v5(function() --[[ Line: 54 ]]
            -- upvalues: v14 (ref)
            v14.current = true;
        end, 0.5), {});
    end;
    local function v19(v16) --[[ Line: 61 ]] --[[ Name: onScrollingFrameChanged ]]
        -- upvalues: v12 (copy), v10 (ref), v14 (ref), v9 (ref), v11 (ref)
        local l_onThresholdReached_0 = v12.onThresholdReached;
        local v18 = nil;
        if v10 then
            v18 = not v12.preventInitialLoadMore or v14.current;
        end;
        if l_onThresholdReached_0 then
            if v10 and not v18 then
                return;
            elseif v16.CanvasPosition.Y > v16.CanvasSize.Y.Offset - v16.AbsoluteWindowSize.Y - if v9 and v12.preloadDistance then v12.preloadDistance else v11 then
                l_onThresholdReached_0();
            end;
        end;
    end;
    local function v21(v20) --[[ Line: 91 ]] --[[ Name: onCanvasPositionChanged ]]
        -- upvalues: v19 (copy), v12 (copy)
        v19(v20);
        if v12.onCanvasPositionChanged then
            v12.onCanvasPositionChanged(v20);
        end;
    end;
    local function v23(v22) --[[ Line: 98 ]] --[[ Name: onCanvasSizeChanged ]]
        -- upvalues: v10 (ref), v14 (ref), v15 (ref), v19 (copy), v12 (copy)
        if v10 and (not v14 or not v14.current) then
            v15();
        end;
        v19(v22);
        if v12.onCanvasSizeChanged then
            v12.onCanvasSizeChanged(v22);
        end;
    end;
    local function v25(v24) --[[ Line: 108 ]] --[[ Name: onAbsoluteWindowSizeChanged ]]
        -- upvalues: v19 (copy), v12 (copy)
        v19(v24);
        if v12.onAbsoluteWindowSizeChanged then
            v12.onAbsoluteWindowSizeChanged(v24);
        end;
    end;
    local l_v13_0 = v13;
    if l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 then
        local v27 = v3.useRef(nil);
        if not l_v13_0 then
            l_v13_0 = v27;
        end;
        l_useAXAnimateScrollFrame_0(l_v13_0);
    end;
    local v28 = v2.Dictionary.join(v12, {
        onCanvasPositionChangedCallback = v21, 
        onCanvasSizeChangedCallback = v23, 
        onAbsoluteWindowSizeChangedCallback = v25, 
        onThresholdReached = v2.None, 
        showLoadingBar = v2.None, 
        onCanvasPositionChanged = v2.None, 
        onCanvasSizeChanged = v2.None, 
        onAbsoluteWindowSizeChanged = v2.None, 
        ref = if l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 then l_v13_0 else v13
    });
    return v3.createElement(v4, v28);
end);