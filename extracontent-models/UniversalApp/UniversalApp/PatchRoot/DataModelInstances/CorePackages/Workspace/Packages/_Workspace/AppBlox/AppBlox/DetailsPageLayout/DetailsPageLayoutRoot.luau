local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.Responsive);
local l_View_0 = v2.View;
local l_withDefaults_0 = v2.Utility.withDefaults;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_StateLayerAffordance_0 = v2.Enums.StateLayerAffordance;
local l_useDeviceInsets_0 = v3.useDeviceInsets;
local v9 = require(script.Parent.DetailsPageLayoutContext);
local v10 = require(script.Parent.DetailsPageLayoutUtils);
local v11 = {
    testId = "app-blox-details-page", 
    fullBleedAspectRatio = 1.7777777777777777, 
    fullBleedOverlap = 180
};
return v1.memo(v1.forwardRef(function(v12, v13) --[[ Line: 49 ]] --[[ Name: DetailsPageLayoutRoot ]]
    -- upvalues: l_useDeviceInsets_0 (copy), l_useTokens_0 (copy), l_withDefaults_0 (copy), v11 (copy), v1 (copy), v10 (copy), v9 (copy), l_View_0 (copy), l_StateLayerAffordance_0 (copy)
    local v14 = l_useDeviceInsets_0();
    local v15 = l_useTokens_0();
    local v16 = l_withDefaults_0(v12, v11);
    local v17 = false;
    if v16.fullBleedContent ~= nil then
        v17 = not v16.isFullscreen;
    end;
    local v18, v19 = v1.useBinding(false);
    local v20, v21 = v1.useBinding(false);
    local v22, v23 = v1.useBinding(0);
    local l_fullBleedOverlap_0 = v16.fullBleedOverlap;
    local v25 = v15.Size.Size_1000 + v15.Padding.Large + v15.Padding.Medium + v14.top;
    local v26, v27 = v1.useState(false);
    local v28 = not v17 or v26;
    local v29, v30 = v1.useBinding(Vector2.new(0, 0));
    local v31, v32 = v1.useBinding(0);
    local v33, v34 = v1.useBinding(0);
    local v35, v36 = v1.useState(0);
    local v37, v38 = v1.useState(false);
    local v39 = v1.useRef(false);
    local v41 = v29:map(function(v40) --[[ Line: 81 ]]
        return v40.Y;
    end);
    local v43 = v29:map(function(v42) --[[ Line: 85 ]]
        -- upvalues: v16 (copy)
        return UDim2.new(0, v42.X, 0, v42.X / v16.fullBleedAspectRatio);
    end);
    local v45 = v29:map(function(v44) --[[ Line: 91 ]]
        -- upvalues: v17 (copy), v10 (ref), v16 (copy), v25 (copy)
        if not v17 then
            return 0;
        else
            return v10.computeContentTopOffset(v44.X, v16.fullBleedAspectRatio, v25);
        end;
    end);
    local v50 = v1.joinBindings({
        v45, 
        v31
    }):map(function(v46) --[[ Line: 100 ]]
        -- upvalues: v25 (copy)
        local v47 = v46[1];
        local v48 = v46[2];
        local v49 = math.max(0, v47 + v25 - v48) / 2;
        return UDim2.new(0.5, 0, 0, v49);
    end);
    local v57 = v1.joinBindings({
        v31, 
        v45, 
        v33
    }):map(function(v51) --[[ Line: 110 ]]
        -- upvalues: v10 (ref), v25 (copy), l_fullBleedOverlap_0 (copy)
        local v52 = v51[1];
        local v53 = v51[2];
        local v54 = v51[3];
        if v53 == 0 then
            return (math.clamp(v52 / v10.getNoBannerFadeParams(v25), 0, 1));
        else
            local v55, v56 = v10.getHeaderFadeParams(v53, v54, l_fullBleedOverlap_0);
            return (math.clamp((v52 - v55) / v56, 0, 1));
        end;
    end);
    local v61 = v1.useCallback(function(v58) --[[ Line: 125 ]]
        -- upvalues: v30 (copy), v38 (copy), v17 (copy), v39 (copy), v10 (ref), v16 (copy), v25 (copy), l_fullBleedOverlap_0 (copy), v36 (copy), v32 (copy)
        local l_AbsoluteSize_0 = v58.AbsoluteSize;
        v30(l_AbsoluteSize_0);
        if l_AbsoluteSize_0.X > 0 and l_AbsoluteSize_0.Y > 0 then
            v38(true);
            if v17 and not v39.current then
                v39.current = true;
                local v60 = v10.computeInitialScrollY(l_AbsoluteSize_0.X, v16.fullBleedAspectRatio, v25, l_fullBleedOverlap_0);
                v36(v60);
                v32(v60);
            end;
        end;
    end, {
        v17, 
        v16.fullBleedAspectRatio, 
        v25, 
        l_fullBleedOverlap_0
    });
    local v62 = v1.useRef(0);
    local v64 = v1.useCallback(function(v63) --[[ Line: 147 ]]
        -- upvalues: v62 (copy), v34 (copy)
        if math.abs(v63 - v62.current) > 0.5 then
            v62.current = v63;
            v34(v63);
        end;
    end, {});
    local v71 = v1.useCallback(function(v65) --[[ Line: 154 ]]
        -- upvalues: v32 (copy), v17 (copy), v45 (copy), v33 (copy), v10 (ref), l_fullBleedOverlap_0 (copy), v27 (copy)
        local l_Y_0 = v65.CanvasPosition.Y;
        v32(l_Y_0);
        if v17 then
            local v67 = v45:getValue();
            local v68 = v33:getValue();
            local v69, v70 = v10.getHeaderFadeParams(v67, v68, l_fullBleedOverlap_0);
            v27(v10.shouldShowStickyBar(l_Y_0, v67, v69, v70));
        end;
    end, {
        v17, 
        l_fullBleedOverlap_0
    });
    local v72 = v1.useMemo(function() --[[ Line: 176 ]]
        -- upvalues: v17 (copy), v18 (copy), v19 (copy), v20 (copy), v21 (copy), v16 (copy), v25 (copy), v22 (copy), v23 (copy), v71 (copy), v45 (copy), l_fullBleedOverlap_0 (copy), v35 (copy), v37 (copy), v41 (copy), v57 (copy), v28 (copy), v64 (copy)
        return {
            hasFullBleed = v17, 
            hasHeader = v18, 
            setHasHeader = v19, 
            hasActions = v20, 
            setHasActions = v21, 
            isFullscreen = v16.isFullscreen, 
            headerBarHeight = v25, 
            actionBarHeight = v22, 
            setActionBarHeight = v23, 
            onCanvasPositionChanged = v71, 
            contentTopOffset = v45, 
            maxContentWidth = 850, 
            fullBleedOverlap = l_fullBleedOverlap_0, 
            initialScrollY = v35, 
            hasValidContainerSize = v37, 
            containerHeight = v41, 
            headerOpacity = v57, 
            stickyHeaderActive = v28, 
            onClose = v16.onClose, 
            testId = v16.testId, 
            onCanvasSizeChanged = v64
        };
    end, {
        v17, 
        v16.isFullscreen, 
        v25, 
        l_fullBleedOverlap_0, 
        v35, 
        v37, 
        v28, 
        v16.onClose, 
        v16.testId, 
        v41, 
        v57, 
        v71, 
        v64
    });
    return v1.createElement(v9.Provider, {
        value = v72
    }, v1.createElement(l_View_0, {
        tag = "size-full clip bg-surface-0", 
        stateLayer = {
            affordance = l_StateLayerAffordance_0.None
        }, 
        onAbsoluteSizeChanged = v61, 
        ref = v13, 
        testId = ("%*--root"):format(v16.testId)
    }, {
        FullBleed = if v17 then v1.createElement(l_View_0, {
            tag = "size-full position-top-center anchor-top-center clip", 
            ZIndex = 0, 
            testId = ("%*--fullbleed"):format(v16.testId)
        }, {
            ParallaxFrame = v1.createElement(l_View_0, {
                Position = v50, 
                Size = v43, 
                tag = "clip anchor-center-center"
            }, v16.fullBleedContent)
        }) else nil, 
        Children = v1.createElement(v1.Fragment, nil, v16.children)
    }));
end));