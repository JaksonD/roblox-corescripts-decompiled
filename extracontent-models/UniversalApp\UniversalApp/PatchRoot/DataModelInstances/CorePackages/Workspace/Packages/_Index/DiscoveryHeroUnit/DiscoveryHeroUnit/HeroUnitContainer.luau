local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryHeroUnit");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.ArgCheck);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v5.Hooks.useTokens;
local l_Image_0 = v5.Image;
local v8 = require(l_Parent_0.React);
local v9 = require(l_Parent_0.Responsive);
local v10 = require(l_script_FirstAncestor_0.HeroImages);
local l_HeroNarrowLayout_0 = require(l_script_FirstAncestor_0.HeroUnitTypes).HeroNarrowLayout;
local v12 = require(l_Parent_0.CollectionViews);
local l_CollectionHeader_0 = v12.CollectionHeader;
local l_maybeForceDarkTheme_0 = v12.maybeForceDarkTheme;
local l_FFlagLuaAppEnableHeroUnitV2_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableHeroUnitV2;
local v16 = {
    Compact = 0.5625, 
    Square = 1, 
    Tall = 1.25
};
local v17 = {
    Color3 = Color3.new(1, 1, 1), 
    Transparency = 0
};
local function _(v18, v19) --[[ Line: 133 ]] --[[ Name: scaleSizeForPlatform ]]
    return v18 * v19.Stroke.Standard;
end;
local function v36(v21, v22) --[[ Line: 138 ]] --[[ Name: useHeroConfiguration ]]
    -- upvalues: v9 (copy), l_HeroNarrowLayout_0 (copy), v16 (copy), l_FFlagLuaAppEnableHeroUnitV2_0 (copy), v4 (copy), l_UserGameSettings_0 (copy)
    local v23 = nil;
    local v24 = v9.useResponsive({
        {
            Key = "Small", 
            maxWidth = 413
        }, 
        {
            Key = "Medium", 
            maxWidth = 600
        }
    });
    local v25 = true;
    if v24 ~= "Small" then
        v25 = v24 == "Medium";
    end;
    v23 = v25;
    v25 = nil;
    local v26 = nil;
    local v27 = nil;
    local v28 = nil;
    local v29 = nil;
    local v30 = nil;
    local v31 = nil;
    local v32 = nil;
    if v23 then
        local v33 = v21.narrowLayout or l_HeroNarrowLayout_0.Compact;
        v25 = v16[v33] or v16[l_HeroNarrowLayout_0.Compact];
        v27 = if v24 == "Small" then v22.Typography.HeadingMedium else v22.Typography.HeadingLarge;
        v28 = v22.Typography.BodyMedium;
        v29 = v21.titleImage == nil and v33 == l_HeroNarrowLayout_0.Compact or v21.subtitle == nil;
        v30 = v22.Padding.Large;
        v31 = v22.Gap.Large;
        if l_FFlagLuaAppEnableHeroUnitV2_0 then
            v32 = 0.16;
            if v21.titleImageAspectRatio == 1 then
                v32 = 0.26;
            end;
        else
            v32 = 0.25;
        end;
    else
        v26 = 336 * v22.Stroke.Standard;
        v27 = v22.Typography.DisplaySmall;
        v28 = v22.Typography.BodyLarge;
        v29 = v21.subtitle == nil;
        v30 = v22.Padding.XLarge;
        v31 = v22.Gap.XXLarge;
        if l_FFlagLuaAppEnableHeroUnitV2_0 then
            v32 = 0.2;
            if v21.titleImageAspectRatio == 1 then
                v32 = 0.3;
            end;
        else
            v32 = 0.3;
        end;
    end;
    local v34 = nil;
    local v35 = nil;
    if v21.gradient ~= nil then
        if v21.gradient.degree == 270 then
            v35 = 0.5;
            v34 = 1;
        elseif v21.gradient.degree == 0 then
            v35 = 1;
            v34 = 0.5;
        else
            v35 = 0.5;
            v34 = 1;
        end;
    else
        v35 = 0.5;
        v34 = 1;
    end;
    return v4.Dictionary.join({
        cornerRadius = v22.Radius.Medium, 
        titleTypography = v27, 
        subtitleTypography = v28, 
        aspectRatio = v25, 
        backgroundImageFrameHeight = v26, 
        hideSubtitle = v29, 
        foregroundOverflow = v31, 
        backgroundOverflow = 50 * v22.Stroke.Standard, 
        foregroundAspectRatio = 1, 
        gradientWidthPercent = v34, 
        gradientHeightPercent = v35, 
        contentPadding = v30, 
        enableBackgroundAnimation = not l_UserGameSettings_0.ReducedMotion, 
        enableForegroundAnimation = not l_UserGameSettings_0.ReducedMotion, 
        sideMargin = 0, 
        minForegroundHeightPercent = 0.8, 
        maxForegroundHeightPercent = 1, 
        titleImageAspectRatio = 3, 
        titleImageHeightPercentage = v32, 
        minCardHeight = 262 * v22.Stroke.Standard
    }, v21);
end;
return v8.memo(function(v37) --[[ Line: 241 ]] --[[ Name: HeroUnitContainer ]]
    -- upvalues: v8 (copy), l_useTokens_0 (copy), v36 (copy), l_FFlagLuaAppEnableHeroUnitV2_0 (copy), v3 (copy), l_Image_0 (copy), l_CollectionHeader_0 (copy), v17 (copy), v10 (copy), l_UserGameSettings_0 (copy), l_maybeForceDarkTheme_0 (copy)
    local v38, v39 = v8.useBinding(0);
    local v41 = v8.useCallback(function(v40) --[[ Line: 243 ]]
        -- upvalues: v39 (copy)
        if v40 then
            v39(v40.AbsoluteSize.X);
        end;
    end, {});
    local v42 = l_useTokens_0();
    local v43 = v36(v37, v42);
    local v44 = nil;
    v44 = if v43.backgroundImageFrameHeight and v43.foregroundOverflow then v43.backgroundImageFrameHeight + v43.foregroundOverflow else v43.backgroundImageFrameHeight;
    if l_FFlagLuaAppEnableHeroUnitV2_0 then
        assert(v43.minCardHeight ~= nil, "minCardHeight is required");
        assert(v43.titleImageAspectRatio ~= nil, "titleImageAspectRatio is required");
    end;
    local v47 = v8.useCallback(function() --[[ Line: 265 ]]
        -- upvalues: v37 (copy), v3 (ref), v8 (ref), l_Image_0 (ref), v38 (copy), v44 (ref), v43 (copy)
        if not v37.titleImage then
            v3.assert(false, "The path should never be called");
            return v8.createElement(v8.Fragment);
        else
            return v8.createElement(l_Image_0, {
                Image = v37.titleImage, 
                Size = v38:map(function(v45) --[[ Line: 273 ]]
                    -- upvalues: v44 (ref), v43 (ref)
                    local l_v44_0 = v44;
                    if v43.aspectRatio then
                        l_v44_0 = math.max(v43.minCardHeight, v45 * v43.aspectRatio + v43.foregroundOverflow);
                    end;
                    return UDim2.new(0, v45, 0, l_v44_0 * v43.titleImageHeightPercentage);
                end), 
                aspectRatio = v43.titleImageAspectRatio, 
                Position = UDim2.new(0, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0, 0.5), 
                ZIndex = 0
            });
        end;
    end, {
        v38, 
        v44, 
        v37.titleImage, 
        v43.titleImageAspectRatio, 
        v43.minCardHeight, 
        v43.aspectRatio, 
        v43.foregroundOverflow, 
        v43.titleImageHeightPercentage
    });
    local v48 = v37.headerComponent or v8.createElement(l_CollectionHeader_0, {
        LayoutOrder = 0, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        title = if l_FFlagLuaAppEnableHeroUnitV2_0 then v37.title else if v37.titleImage then v47 else v37.title, 
        AnchorPoint = Vector2.new(0, 0.5), 
        subtitle = if v43.hideSubtitle then nil else v37.subtitle, 
        hideButton = true, 
        titleColor = v17, 
        subtitleColor = v17, 
        titleTypography = v43.titleTypography, 
        subtitleTypography = v43.subtitleTypography, 
        forceUpdatedHeader = true, 
        Position = UDim2.new(0, 0, 0.5, 0)
    });
    return v8.createElement("TextButton", {
        ref = v41, 
        [v8.Change.AbsoluteSize] = v41, 
        Position = UDim2.new(0, v43.sideMargin, 0, 0), 
        Size = if v43.aspectRatio then v38:map(function(v49) --[[ Line: 321 ]]
            -- upvalues: v43 (copy)
            return UDim2.new(1, -2 * v43.sideMargin, 0, (math.max(v43.minCardHeight, v49 * v43.aspectRatio + v43.foregroundOverflow)));
        end) else UDim2.new(1, -2 * v43.sideMargin, 0, v44), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Text = "", 
        [v8.Event.Activated] = v37.onActivated, 
        SelectionOrder = v37.SelectionOrder, 
        [v8.Tag] = if v37.testId then ("data-testid=%*"):format(v37.testId) else nil
    }, {
        HeroBackground = v37.backgroundComponent or v8.createElement(v10, {
            ZIndex = 0, 
            Size = UDim2.new(1, 0, 1, 0), 
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.new(0, 0, 1, 0), 
            verticalScrollingFrameRef = v37.verticalScrollingFrameRef, 
            foregroundImage = v37.foregroundImage, 
            backgroundImage = v37.backgroundImage, 
            foregroundAspectRatio = v43.foregroundAspectRatio, 
            foregroundHeightPercent = v38:map(function(v50) --[[ Line: 350 ]]
                -- upvalues: v43 (copy)
                local l_minForegroundHeightPercent_0 = v43.minForegroundHeightPercent;
                local l_maxForegroundHeightPercent_0 = v43.maxForegroundHeightPercent;
                if v50 < 600 then
                    return l_minForegroundHeightPercent_0;
                elseif v50 > 1140 then
                    return l_maxForegroundHeightPercent_0;
                else
                    local v53 = (v50 - 600) / 540;
                    return v53 * l_maxForegroundHeightPercent_0 + (1 - v53) * l_minForegroundHeightPercent_0;
                end;
            end), 
            foregroundOverflow = v43.foregroundOverflow, 
            backgroundOverflow = v43.backgroundOverflow, 
            cornerRadius = v43.cornerRadius, 
            enableBackgroundAnimation = v43.enableBackgroundAnimation and not l_UserGameSettings_0.ReducedMotion, 
            enableForegroundAnimation = v43.enableForegroundAnimation and not l_UserGameSettings_0.ReducedMotion, 
            gradient = v43.gradient, 
            gradientHeightPercent = v43.gradientHeightPercent, 
            gradientWidthPercent = v43.gradientWidthPercent, 
            tokens = v42
        }), 
        HeroForeground = l_maybeForceDarkTheme_0(v8.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -v43.foregroundOverflow), 
            Position = UDim2.new(0, 0, 0, v43.foregroundOverflow), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ZIndex = 2
        }, {
            UIPadding = v8.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v43.contentPadding), 
                PaddingRight = UDim.new(0, v43.contentPadding), 
                PaddingTop = UDim.new(0, v43.contentPadding), 
                PaddingBottom = UDim.new(0, v43.contentPadding)
            }), 
            HeroLogo = if l_FFlagLuaAppEnableHeroUnitV2_0 and v37.titleImage then v8.createElement(l_Image_0, {
                Image = v37.titleImage, 
                Size = v38:map(function(v54) --[[ Line: 393 ]]
                    -- upvalues: v44 (ref), v43 (copy)
                    local v55 = v44 or 0;
                    if v43.aspectRatio then
                        v55 = math.max(v43.minCardHeight, v54 * v43.aspectRatio + v43.foregroundOverflow);
                    end;
                    return UDim2.new(0, v54, 0, v55 * v43.titleImageHeightPercentage);
                end), 
                aspectRatio = v43.titleImageAspectRatio, 
                Position = UDim2.new(1, 0, 0, 0), 
                AnchorPoint = Vector2.new(1, 0)
            }) else nil, 
            HeroHeaderFrame = v8.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Position = UDim2.new(0, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, {
                HeroHeader = v48
            }), 
            HeroBottomRowFrame = v8.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Position = UDim2.new(0, 0, 1, 0), 
                AnchorPoint = Vector2.new(0, 1), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, {
                HeroBottomRow = v37.bottomRowComponent
            }), 
            HeroOverlay = v37.overlayComponent
        }), true)
    });
end);