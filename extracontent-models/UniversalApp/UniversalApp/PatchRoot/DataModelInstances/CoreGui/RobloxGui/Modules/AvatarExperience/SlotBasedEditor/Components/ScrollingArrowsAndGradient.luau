local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Otter);
local v2 = require(l_CorePackages_0.Packages.ReactOtter);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local v5 = require(l_CorePackages_0.Packages.React);
local l_useEffect_0 = v5.useEffect;
local l_useCallback_0 = v5.useCallback;
local l_useRef_0 = v5.useRef;
local l_useMotor_0 = v2.useMotor;
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.ScrollingListWithArrowsAndGradient);
local _ = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local l_FFlagAXSlotsFixLeftScroll_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsFixLeftScroll;
local v13 = {
    frequency = 2, 
    dampingRatio = 0.9, 
    restingPositionLimit = 0.5, 
    restingVelocityLimit = 0.1
};
local function v25(v14, v15, v16) --[[ Line: 48 ]] --[[ Name: getScrollToLocation ]]
    -- upvalues: l_FFlagAXSlotsFixLeftScroll_0 (copy)
    if typeof(v15) == "table" and v15.current ~= nil and v16 ~= nil then
        local l_X_0 = v15.current.AbsolutePosition.X;
        local l_X_1 = v15.current.AbsoluteWindowSize.X;
        local l_X_2 = v15.current.CanvasPosition.X;
        local l_X_3 = v16.AbsolutePosition.X;
        local v21 = v16.AbsoluteSize.X + (v14 or 0);
        local v22 = math.floor(l_X_1 / 2) - math.floor(v21 / 2);
        local v23 = if l_FFlagAXSlotsFixLeftScroll_0 then l_X_3 < l_X_0 else l_X_3 < l_X_0 and v21 < l_X_0 - math.abs(l_X_3);
        local v24 = l_X_1 - (l_X_3 - l_X_0) < v21;
        if v23 then
            return (math.max(l_X_2 - (l_X_0 - l_X_3) - v22, 0));
        elseif v24 then
            return l_X_2 + (v21 - (l_X_1 - (l_X_3 - l_X_0))) + v22;
        end;
    end;
    return nil;
end;
return v5.memo(function(v26) --[[ Line: 99 ]]
    -- upvalues: v4 (copy), l_useRef_0 (copy), v5 (copy), l_useMotor_0 (copy), l_useCallback_0 (copy), v25 (copy), v1 (copy), v13 (copy), l_useEffect_0 (copy), v10 (copy)
    local v27 = v4.useRefCache();
    local v28 = l_useRef_0(nil);
    local v29, v30 = v5.useState(nil);
    local v32 = v5.useCallback(function(v31) --[[ Line: 107 ]]
        -- upvalues: v28 (copy)
        if v28.current then
            v28.current.CanvasPosition = Vector2.new(v31, 0);
        end;
    end, {});
    local v33 = l_useMotor_0(if v28.current then v28.current.CanvasPosition.X else 0, v32);
    local v37 = l_useCallback_0(function(v34) --[[ Line: 123 ]]
        -- upvalues: v26 (copy), v27 (copy), v30 (copy), v25 (ref), v28 (copy), v33 (copy), v1 (ref), v13 (ref)
        if v26.selectedItemKey then
            local v35 = v27[v26.selectedItemKey];
            if v35 then
                v30(v35.current);
                if v26.enableSnapToSelectedItem or v34 then
                    local v36 = v25(v26.buttonPadding, v28, v35.current);
                    if v36 then
                        v33(v1.spring(v36, v13));
                    end;
                end;
            end;
        end;
    end, {
        v26.selectedItemKey, 
        v26.enableSnapToSelectedItem, 
        v26.buttonPadding
    });
    l_useEffect_0(function() --[[ Line: 139 ]]
        -- upvalues: v37 (copy)
        v37();
    end, {
        v37, 
        v26.selectedItemKey, 
        v26.enableSnapToSelectedItem, 
        v26.buttonPadding
    });
    local l_resetPositionSignal_0 = v26.resetPositionSignal;
    local v39 = l_useCallback_0(function() --[[ Line: 146 ]]
        -- upvalues: v37 (copy)
        v37(true);
    end, {
        v37, 
        v26.buttonPadding, 
        v26.selectedItemKey
    });
    l_useEffect_0(function() --[[ Line: 150 ]]
        -- upvalues: l_resetPositionSignal_0 (copy), v39 (copy)
        local v40 = nil;
        if l_resetPositionSignal_0 then
            v40 = l_resetPositionSignal_0:connect(v39);
        end;
        return function() --[[ Line: 155 ]]
            -- upvalues: v40 (ref)
            if v40 then
                v40:disconnect();
            end;
        end;
    end, {
        nil, 
        l_resetPositionSignal_0, 
        v26.selectedItemKey
    });
    local v42 = l_useCallback_0(function(v41) --[[ Line: 162 ]]
        -- upvalues: v27 (copy)
        return v27[v41];
    end, {});
    local v44 = l_useCallback_0(function(v43) --[[ Line: 166 ]]
        -- upvalues: v28 (copy)
        if v28.current then
            v28.current.CanvasSize = UDim2.new(0, v43.AbsoluteSize.X, 1, 0);
        end;
    end, {});
    local v45 = l_useCallback_0(function() --[[ Line: 172 ]]
        -- upvalues: v28 (copy)
        return v28;
    end, {});
    return v5.createElement("Frame", {
        ClipsDescendants = true, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v26.LayoutOrder, 
        AutomaticSize = if v26.AutomaticSize then v26.AutomaticSize else nil, 
        Size = if v26.navHeight then UDim2.new(1, 0, 0, v26.navHeight) else UDim2.new(1, 0, 1, 0), 
        ZIndex = v26.ZIndex
    }, {
        ScrollingList = v5.createElement(v10, {
            getScollingListContent = l_useCallback_0(function() --[[ Line: 187 ]]
                -- upvalues: v26 (copy), v42 (copy), v45 (copy), v44 (copy), v29 (copy)
                return v26.renderScrollingListContent({
                    getScrollingFrameItemRef = v42, 
                    getScrollingFrameRef = v45, 
                    onNavFrameSizeChanged = v44, 
                    selectedItemInstance = v29
                });
            end, {
                v26.renderScrollingListContent, 
                v42, 
                v45, 
                v44, 
                v29
            }), 
            scrollingFrameRef = v28, 
            buttonRefs = v27, 
            buttonPadding = v26.buttonPadding or 0, 
            childWidgetIndex = if v26.enableIntroScroll then tostring(v26.index) else nil, 
            useIntroScroll = v26.enableIntroScroll or false
        })
    });
end);