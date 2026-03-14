local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSearch");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.Otter);
local v6 = require(l_Parent_0.tutils);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v8 = require(l_Parent_0.Foundation);
local v9 = require(l_Parent_0.Responsive);
local l_getIconSize_0 = v4.App.ImageSet.getIconSize;
local l_IconSize_0 = v4.App.ImageSet.Enum.IconSize;
local l_Interactable_0 = v4.Core.Control.Interactable;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v4.App.ImageSet.Images;
local v15 = l_Images_0["icons/actions/cycleLeft"];
local v16 = l_Images_0["icons/actions/cycleRight"];
local v17 = {
    frequency = 2, 
    dampingRatio = 0.9, 
    restingPositionLimit = 0.5, 
    restingVelocityLimit = 0.1
};
getMaxNumOfItemsVisible = function(v18) --[[ Line: 49 ]] --[[ Name: getMaxNumOfItemsVisible ]]
    local v19 = v18.itemWidth + v18.itemPadding;
    return (math.floor((v18.absoluteWidth + v18.itemPadding) / v19));
end;
CarouselScrollButton = function(v20) --[[ Line: 60 ]] --[[ Name: CarouselScrollButton ]]
    -- upvalues: l_useTokens_0 (copy), v3 (copy), l_Interactable_0 (copy), l_ImageSetLabel_0 (copy), l_getIconSize_0 (copy), l_IconSize_0 (copy)
    local v21 = l_useTokens_0();
    return v3.createElement(l_Interactable_0, {
        AutoButtonColor = false, 
        Size = UDim2.fromScale(1, 1), 
        BackgroundColor3 = v21.Color.OverMedia.OverMedia_0.Color3, 
        BackgroundTransparency = v21.Color.OverMedia.OverMedia_0.Transparency, 
        BorderSizePixel = 0, 
        [v3.Event.Activated] = v20.onActivate
    }, {
        CarouselScrollButtonIcon = v3.createElement(l_ImageSetLabel_0, {
            Size = UDim2.fromOffset(l_getIconSize_0(l_IconSize_0.Medium), l_getIconSize_0(l_IconSize_0.Medium)), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Image = v20.icon, 
            ImageColor3 = v21.Color.ActionStandard.Foreground.Color3, 
            ImageTransparency = v21.Color.ActionStandard.Foreground.Transparency
        })
    });
end;
Carousel = function(v22) --[[ Line: 83 ]] --[[ Name: Carousel ]]
    -- upvalues: l_useTokens_0 (copy), v9 (copy), v3 (copy), v5 (copy), l_UserGameSettings_0 (copy), v17 (copy), v6 (copy), v8 (copy), v15 (copy), v16 (copy)
    local v23 = l_useTokens_0();
    local v24 = v9.useLastInput();
    local v25, v26 = v3.useState(false);
    local v27, v28 = v3.useState(false);
    local v29, v30 = v3.useState(0);
    local v31, v32 = v3.useState(0);
    local v33, v34 = v3.useState(0);
    local v35 = v3.useRef(nil);
    local v36 = v3.useRef(nil);
    local v37 = v3.useRef(v5.createSingleMotor(0));
    local v39 = v3.useCallback(function(v38) --[[ Line: 98 ]]
        -- upvalues: v34 (copy)
        v34(v38.AbsoluteSize.X);
    end, {});
    local v45 = v3.useMemo(function() --[[ Line: 106 ]]
        -- upvalues: v22 (copy), v3 (ref), v39 (copy)
        local v40 = v22.children or {};
        local v41 = {};
        local v42 = false;
        for v43, v44 in v40 do
            if not v42 then
                v41[v43] = v3.createElement("Frame", {
                    Size = UDim2.fromOffset(0, 0), 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    [v3.Change.AbsoluteSize] = v39, 
                    LayoutOrder = if v44.props and v44.props.LayoutOrder then v44.props.LayoutOrder else 1
                }, v44);
                v42 = true;
            else
                v41[v43] = v44;
            end;
        end;
        return v41;
    end, {
        v22.children, 
        v39
    });
    local v48 = v3.useCallback(function() --[[ Line: 128 ]]
        -- upvalues: v36 (copy), v33 (copy), v22 (copy)
        local l_current_0 = v36.current;
        local v47 = 1;
        if l_current_0 and l_current_0.CanvasPosition.X > 0 then
            v47 = math.floor(l_current_0.CanvasPosition.X / (v33 + v22.itemPadding)) + 1;
        end;
        return v47;
    end, {
        v33, 
        v22.itemPadding
    });
    local v50 = v3.useCallback(function(v49) --[[ Line: 137 ]]
        -- upvalues: v33 (copy), v22 (copy)
        return (v49 - 1) * v33 + (v49 - 1) * v22.itemPadding;
    end, {
        v33, 
        v22.itemPadding
    });
    local v56 = v3.useCallback(function(v51) --[[ Line: 144 ]]
        -- upvalues: v22 (copy), v27 (copy), v36 (copy), v50 (copy), l_UserGameSettings_0 (ref), v28 (copy), v37 (copy), v5 (ref), v17 (ref)
        if v22.isScrollingDisabled or v27 or not v36.current then
            return;
        else
            local l_current_1 = v36.current;
            local l_X_0 = l_current_1.CanvasPosition.X;
            local v54 = v50(v51);
            if l_UserGameSettings_0.ReducedMotion then
                l_current_1.CanvasPosition = Vector2.new(v54, 0);
                v28(false);
                return;
            else
                if v37.current then
                    v37.current:destroy();
                end;
                v37.current = v5.createSingleMotor(l_X_0);
                v37.current:onStep(function(v55) --[[ Line: 163 ]]
                    -- upvalues: v28 (ref), l_current_1 (copy)
                    v28(true);
                    l_current_1.CanvasPosition = Vector2.new(v55, 0);
                end);
                v37.current:onComplete(function() --[[ Line: 167 ]]
                    -- upvalues: v28 (ref)
                    v28(false);
                end);
                v37.current:setGoal(v5.spring(v54, v17));
                return;
            end;
        end;
    end, {
        v22.isScrollingDisabled, 
        v27, 
        v50
    });
    local v59 = v3.useCallback(function(v57) --[[ Line: 174 ]]
        -- upvalues: v27 (copy), v6 (ref), v45 (copy), v56 (copy)
        if v27 then
            return;
        else
            local v58 = math.max(1, (math.min(v57, (v6.fieldCount(v45)))));
            v56(v58);
            return;
        end;
    end, {
        v27, 
        v56, 
        v45
    });
    local v61 = v3.useCallback(function(v60) --[[ Line: 183 ]]
        -- upvalues: v30 (copy), v32 (copy), v33 (copy), v22 (copy)
        v30(v60.AbsoluteSize.X);
        v32(getMaxNumOfItemsVisible({
            itemWidth = v33, 
            itemPadding = v22.itemPadding, 
            absoluteWidth = v60.AbsoluteSize.X
        }));
    end, {
        v33, 
        v22.itemPadding
    });
    local v63 = v3.useCallback(function() --[[ Line: 192 ]]
        -- upvalues: v48 (copy), v59 (copy), v31 (copy)
        local v62 = v48();
        v59(v62 - v31);
    end, {
        v59, 
        v48, 
        v31
    });
    local v65 = v3.useCallback(function() --[[ Line: 197 ]]
        -- upvalues: v48 (copy), v59 (copy), v31 (copy)
        local v64 = v48();
        v59(v64 + v31);
    end, {
        v59, 
        v48, 
        v31
    });
    local v67 = v3.useCallback(function(v66) --[[ Line: 202 ]]
        -- upvalues: v24 (copy), v9 (ref), v8 (ref), v26 (copy)
        if v24 == v9.Input.Pointer then
            if v66 == v8.Enums.ControlState.Default then
                v26(false);
                return;
            elseif v66 == v8.Enums.ControlState.Hover then
                v26(true);
            end;
        end;
    end, {
        v24
    });
    v3.useEffect(function() --[[ Line: 212 ]]
        -- upvalues: v37 (copy)
        return function() --[[ Line: 213 ]]
            -- upvalues: v37 (ref)
            if v37.current then
                v37.current:destroy();
            end;
        end;
    end, {});
    v3.useEffect(function() --[[ Line: 220 ]]
        -- upvalues: v32 (copy), v33 (copy), v22 (copy), v29 (copy)
        v32(getMaxNumOfItemsVisible({
            itemWidth = v33, 
            itemPadding = v22.itemPadding, 
            absoluteWidth = v29
        }));
    end, {
        v29, 
        v33, 
        v22.itemPadding
    });
    local v69 = v3.useMemo(function() --[[ Line: 228 ]]
        -- upvalues: v36 (copy), v25 (copy)
        local l_current_2 = v36.current;
        if l_current_2 then
            return v25 and l_current_2.CanvasPosition.X > 0;
        else
            return false;
        end;
    end, {
        v25, 
        v27
    });
    local v72 = v3.useMemo(function() --[[ Line: 236 ]]
        -- upvalues: v36 (copy), v29 (copy), v25 (copy)
        local l_current_3 = v36.current;
        if l_current_3 then
            local v71 = l_current_3.CanvasPosition.X + v29 >= l_current_3.AbsoluteCanvasSize.X;
            return v25 and not v71;
        else
            return false;
        end;
    end, {
        v25, 
        v29, 
        v27
    });
    return v3.createElement(v8.View, {
        stateLayer = {
            affordance = v8.Enums.StateLayerAffordance.None
        }, 
        tag = "size-full-0 auto-y clip position-top-left", 
        backgroundStyle = v23.Color.None, 
        ref = v35, 
        onStateChanged = v67, 
        onAbsoluteSizeChanged = v61
    }, {
        CarouselLeftMargin = v3.createElement("Frame", {
            Position = UDim2.fromScale(0, 0), 
            AnchorPoint = Vector2.new(0, 0), 
            Size = UDim2.new(0, v23.Size.Size_1000, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ZIndex = 2
        }, {
            ScrollLeftButton = if v69 then v3.createElement(CarouselScrollButton, {
                icon = v15, 
                onActivate = v63
            }) else nil
        }), 
        CarouselScrollingFrame = v3.createElement("ScrollingFrame", {
            Size = UDim2.new(1, 0, 1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            ScrollBarThickness = 0, 
            BackgroundTransparency = 1, 
            ClipsDescendants = false, 
            AutomaticCanvasSize = Enum.AutomaticSize.XY, 
            ScrollingEnabled = not v22.isScrollingDisabled and not v27, 
            ScrollingDirection = Enum.ScrollingDirection.X, 
            ElasticBehavior = Enum.ElasticBehavior.Always, 
            Selectable = false, 
            [v3.Change.CanvasPosition] = v22.onChangeCanvasPosition, 
            ref = function(v73) --[[ Line: 282 ]] --[[ Name: ref ]]
                -- upvalues: v36 (copy), v22 (copy)
                if v73 then
                    v36.current = v73;
                    v22.scrollingFrameRef = v73;
                end;
            end
        }, {
            v3.createElement(v3.Fragment, nil, {
                CarouselListLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Padding = UDim.new(0, v22.itemPadding), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                CarouselPadding = v3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v22.carouselMargin), 
                    PaddingRight = UDim.new(0, v22.carouselMargin)
                }), 
                CarouselContent = v3.createElement(v3.Fragment, nil, v45)
            })
        }), 
        CarouselRightMargin = v3.createElement("Frame", {
            Position = UDim2.fromScale(1, 0), 
            AnchorPoint = Vector2.new(1, 0), 
            Size = UDim2.new(0, v23.Size.Size_1000, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ZIndex = 2
        }, {
            ScrollRightButton = if v72 then v3.createElement(CarouselScrollButton, {
                icon = v16, 
                onActivate = v65
            }) else nil
        })
    });
end;
return Carousel;