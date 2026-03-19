local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Otter);
local v2 = require(l_CorePackages_0.Packages.React);
local _ = require(l_CorePackages_0.Packages.ReactOtter);
local _ = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryAutoAdvance;
local v7 = game:DefineFastInt("LuaAppEdpMediaGalleryPageIndicatorsMaxVisibleCount", 5);
local function _(v8, v9) --[[ Line: 35 ]] --[[ Name: getFirstVisibleIndexOnScrollingRight ]]
    -- upvalues: v7 (copy)
    if v7 < v8 then
        return (math.max(1, math.min(v9, v8 - 2) - v7 + 2 + 1));
    else
        return 1;
    end;
end;
local function _(v11, v12) --[[ Line: 52 ]] --[[ Name: getFirstVisibleIndexOnScrollingLeft ]]
    -- upvalues: v7 (copy)
    if v7 < v11 then
        return (math.min(v11 - v7 + 1, math.max(v12, 3) - 2));
    else
        return 1;
    end;
end;
local function v17(v14, v15, v16) --[[ Line: 66 ]] --[[ Name: getDotAnchorPointAtIndex ]]
    if v16 < v15 then
        if v14 == v15 then
            return Vector2.new(1, 0.5);
        elseif v14 == v16 then
            return Vector2.new(0, 0.5);
        end;
    elseif v15 < v16 then
        if v14 == v15 then
            return Vector2.new(0, 0.5);
        elseif v14 == v16 then
            return Vector2.new(1, 0.5);
        end;
    end;
    return Vector2.new(0.5, 0.5);
end;
local function v21(v18, v19, v20) --[[ Line: 86 ]] --[[ Name: getDotPositionAtIndex ]]
    if v20 < v19 then
        if v18 == v19 then
            return UDim2.fromScale(1, 0.5);
        elseif v18 == v20 then
            return UDim2.fromScale(0, 0.5);
        end;
    elseif v19 < v20 then
        if v18 == v19 then
            return UDim2.fromScale(0, 0.5);
        elseif v18 == v20 then
            return UDim2.fromScale(1, 0.5);
        end;
    end;
    return UDim2.fromScale(0.5, 0.5);
end;
return function(v22) --[[ Line: 106 ]] --[[ Name: MediaGalleryPageIndicators ]]
    -- upvalues: l_useTokens_0 (copy), l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 (copy), v2 (copy), v7 (copy), v1 (copy), v17 (copy), v21 (copy)
    local v23 = l_useTokens_0();
    local l_Size_100_0 = v23.Size.Size_100;
    local l_Size_150_0 = v23.Size.Size_150;
    local l_Size_200_0 = v23.Size.Size_200;
    local l_Size_800_0 = v23.Size.Size_800;
    local l_Small_0 = v23.Padding.Small;
    local l_Muted_0 = v23.DarkMode.Content.Muted;
    local v30 = if l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 then v23.DarkMode.Content.Emphasis else nil;
    local v31, v32 = v2.useState(v22.mediaGalleryStartIndex);
    local v33, v34 = v2.useState(v22.mediaGalleryStartIndex);
    local v35, v36 = v2.useState(1);
    local v37, v38 = v2.useBinding(Vector2.new(0, 0));
    local v39, v40 = v2.useState(false);
    local v41, v42 = v2.useBinding(0);
    local v43 = v2.useRef({});
    local v44 = math.min(v22.numberOfItems, v7);
    local v45 = v2.useMemo(function() --[[ Line: 133 ]]
        -- upvalues: v44 (copy), l_Size_200_0 (copy), l_Small_0 (copy), l_Size_800_0 (copy)
        return (v44 - 1) * (l_Size_200_0 + l_Small_0) + l_Size_800_0;
    end, {
        v44, 
        l_Size_200_0, 
        l_Small_0, 
        l_Size_800_0
    });
    local v47 = v2.useCallback(function(v46) --[[ Line: 137 ]]
        -- upvalues: l_Size_200_0 (copy), l_Small_0 (copy)
        return Vector2.new((v46 - 1) * (l_Size_200_0 + l_Small_0), 0);
    end, {
        l_Size_200_0, 
        l_Small_0
    });
    local v52 = v2.useCallback(function(v48) --[[ Line: 142 ]]
        -- upvalues: v35 (copy), v44 (copy), v22 (copy), v31 (copy), l_Size_800_0 (copy), l_Size_200_0 (copy), l_Size_100_0 (copy), l_Size_150_0 (copy)
        local v49 = math.min(v35 + v44 - 1, v22.numberOfItems);
        local v50 = v35 > 1;
        local v51 = v49 < v22.numberOfItems;
        if v48 == v31 then
            return UDim2.fromOffset(l_Size_800_0, l_Size_200_0);
        else
            if v50 then
                if v48 < v35 then
                    return UDim2.fromOffset(0, 0);
                elseif v48 == v35 then
                    return UDim2.fromOffset(l_Size_100_0, l_Size_100_0);
                elseif v48 == v35 + 1 then
                    return UDim2.fromOffset(l_Size_150_0, l_Size_150_0);
                end;
            end;
            if v51 then
                if v49 < v48 then
                    return UDim2.fromOffset(0, 0);
                elseif v48 == v49 then
                    return UDim2.fromOffset(l_Size_100_0, l_Size_100_0);
                elseif v48 == v49 - 1 then
                    return UDim2.fromOffset(l_Size_150_0, l_Size_150_0);
                end;
            end;
            return UDim2.fromOffset(l_Size_200_0, l_Size_200_0);
        end;
    end, {
        v22.numberOfItems, 
        v44, 
        v35, 
        v31, 
        l_Size_100_0, 
        l_Size_150_0, 
        l_Size_200_0, 
        l_Size_800_0
    });
    v2.useEffect(function() --[[ Line: 186 ]]
        -- upvalues: v22 (copy), v7 (ref), v38 (copy), v47 (copy), v36 (copy), v42 (copy), v32 (copy)
        local l_numberOfItems_0 = v22.numberOfItems;
        local l_mediaGalleryStartIndex_0 = v22.mediaGalleryStartIndex;
        local v55 = if v7 < l_numberOfItems_0 then math.max(1, math.min(l_mediaGalleryStartIndex_0, l_numberOfItems_0 - 2) - v7 + 2 + 1) else 1;
        v38(v47(v55));
        v36(v55);
        v42(1);
        v32(v22.mediaGalleryStartIndex);
    end, {
        v22.numberOfItems, 
        v22.mediaGalleryStartIndex, 
        v47
    });
    v2.useEffect(function() --[[ Line: 196 ]]
        -- upvalues: v32 (copy), v22 (copy), v7 (ref), v34 (copy), v36 (copy), v40 (copy)
        local function _(v56) --[[ Line: 197 ]] --[[ Name: handleMediaGalleryScrolled ]]
            -- upvalues: v32 (ref), v22 (ref), v7 (ref), v34 (ref), v36 (ref), v40 (ref)
            v32(function(v57) --[[ Line: 198 ]]
                -- upvalues: v56 (copy), v22 (ref), v7 (ref), v34 (ref), v36 (ref), v40 (ref)
                local v58 = nil;
                if v57 < v56 then
                    local l_numberOfItems_1 = v22.numberOfItems;
                    local l_v56_0 = v56;
                    v58 = if v7 < l_numberOfItems_1 then math.max(1, math.min(l_v56_0, l_numberOfItems_1 - 2) - v7 + 2 + 1) else 1;
                else
                    local l_numberOfItems_2 = v22.numberOfItems;
                    local l_v56_1 = v56;
                    v58 = if v7 < l_numberOfItems_2 then math.min(l_numberOfItems_2 - v7 + 1, math.max(l_v56_1, 3) - 2) else 1;
                end;
                v34(v57);
                v36(v58);
                v40(true);
                return v56;
            end);
        end;
        local v71 = v22.mediaGalleryScrolledSignal:connect(function(v64) --[[ Line: 216 ]]
            -- upvalues: v32 (ref), v22 (ref), v7 (ref), v34 (ref), v36 (ref), v40 (ref)
            v32(function(v65) --[[ Line: 198 ]]
                -- upvalues: v64 (copy), v22 (ref), v7 (ref), v34 (ref), v36 (ref), v40 (ref)
                local v66 = nil;
                if v65 < v64 then
                    local l_numberOfItems_3 = v22.numberOfItems;
                    local l_v64_0 = v64;
                    v66 = if v7 < l_numberOfItems_3 then math.max(1, math.min(l_v64_0, l_numberOfItems_3 - 2) - v7 + 2 + 1) else 1;
                else
                    local l_numberOfItems_4 = v22.numberOfItems;
                    local l_v64_1 = v64;
                    v66 = if v7 < l_numberOfItems_4 then math.min(l_numberOfItems_4 - v7 + 1, math.max(l_v64_1, 3) - 2) else 1;
                end;
                v34(v65);
                v36(v66);
                v40(true);
                return v64;
            end);
        end);
        return function() --[[ Line: 220 ]]
            -- upvalues: v71 (ref)
            if v71 ~= nil then
                v71:disconnect();
                v71 = nil;
            end;
        end;
    end, {
        v22.numberOfItems, 
        v22.mediaGalleryScrolledSignal
    });
    v2.useEffect(function() --[[ Line: 229 ]]
        -- upvalues: v39 (copy), v1 (ref), v22 (copy), v37 (copy), v47 (copy), v35 (copy), v42 (copy), v38 (copy), v40 (copy)
        if not v39 then
            return;
        else
            local v72 = v1.createSingleMotor(0);
            v72:setGoal(if v22.useSpring then v1.spring(1, v22.springConfig) else v1.instant(1));
            local v73 = v37:getValue();
            local v74 = v47(v35);
            v72:onStep(function(v75) --[[ Line: 240 ]]
                -- upvalues: v42 (ref), v38 (ref), v73 (copy), v74 (copy)
                v42(v75);
                v38(v73:Lerp(v74, v75));
            end);
            v72:onComplete(function() --[[ Line: 245 ]]
                -- upvalues: v40 (ref)
                v40(false);
            end);
            return function() --[[ Line: 248 ]]
                -- upvalues: v72 (copy)
                v72:destroy();
            end;
        end;
    end, {
        v22.useSpring, 
        v22.springConfig, 
        v39, 
        v35, 
        v37, 
        v47
    });
    local v82 = v2.useMemo(function() --[[ Line: 263 ]]
        -- upvalues: v22 (copy), v43 (copy), v52 (copy), v2 (ref), v31 (copy), l_Size_800_0 (copy), l_Size_200_0 (copy), v17 (ref), v33 (copy), v21 (ref), v41 (copy), l_Muted_0 (copy), l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 (ref), v30 (copy)
        local v76 = {};
        for v77 = 1, v22.numberOfItems do
            local v78 = v43.current[v77];
            local v79 = v52(v77);
            v76["Indicator" .. v77] = v2.createElement("Frame", {
                Size = UDim2.fromOffset(if v77 == v31 then l_Size_800_0 else l_Size_200_0, l_Size_200_0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = v77
            }, {
                Dot = v2.createElement("Frame", {
                    AnchorPoint = v17(v77, v33, v31), 
                    Position = v21(v77, v33, v31), 
                    Size = v41:map(function(v80) --[[ Line: 286 ]]
                        -- upvalues: v78 (copy), v79 (copy)
                        if v78 == nil then
                            return v79;
                        else
                            return v78:Lerp(v79, v80);
                        end;
                    end), 
                    BackgroundColor3 = l_Muted_0.Color3, 
                    BackgroundTransparency = l_Muted_0.Transparency, 
                    BorderSizePixel = 0
                }, {
                    UICorner = v2.createElement("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    }), 
                    ProgressBar = if l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 and v77 == v31 and v22.currentItemProgressBinding then v2.createElement("Frame", {
                        Size = v22.currentItemProgressBinding:map(function(v81) --[[ Line: 305 ]]
                            -- upvalues: l_Size_200_0 (ref), l_Size_800_0 (ref)
                            return UDim2.fromOffset(l_Size_200_0 + v81 * (l_Size_800_0 - l_Size_200_0), l_Size_200_0);
                        end), 
                        BackgroundColor3 = v30.Color3, 
                        BackgroundTransparency = v30.Transparency, 
                        BorderSizePixel = 0
                    }, {
                        UICorner = v2.createElement("UICorner", {
                            CornerRadius = UDim.new(1, 0)
                        })
                    }) else nil
                })
            });
            v43.current[v77] = v79;
        end;
        return v76;
    end, {
        v22.numberOfItems, 
        if l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 then v22.currentItemProgressBinding else nil, 
        v33, 
        v31, 
        v52, 
        l_Size_200_0, 
        l_Size_800_0, 
        l_Muted_0, 
        if l_FFlagLuaAppEdpMediaGalleryAutoAdvance_0 then v30 else nil, 
        v41
    });
    return v2.createElement("ScrollingFrame", {
        AnchorPoint = v22.AnchorPoint, 
        Position = v22.Position, 
        Size = UDim2.fromOffset(v45, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ZIndex = v22.ZIndex, 
        ClipsDescendants = true, 
        ScrollingDirection = Enum.ScrollingDirection.X, 
        ScrollingEnabled = false, 
        ScrollBarThickness = 0, 
        CanvasSize = UDim2.fromOffset(0, l_Size_200_0), 
        AutomaticCanvasSize = Enum.AutomaticSize.X, 
        CanvasPosition = v37, 
        Selectable = false
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            Padding = UDim.new(0, l_Small_0), 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Items = v2.createElement(v2.Fragment, {}, v82)
    });
end;