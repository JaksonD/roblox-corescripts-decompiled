local l_Parent_0 = script:FindFirstAncestor("VideoUtils").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.BuilderIcons);
local l_Icon_0 = v2.Icon;
local l_IconVariant_0 = v2.IconVariant;
local l_maybeForceDarkTheme_0 = require(l_Parent_0.CollectionViews).maybeForceDarkTheme;
local v6 = require(l_Parent_0.Foundation);
local l_IconButton_0 = v6.IconButton;
local l_IconSize_0 = v6.Enums.IconSize;
local l_useTokens_0 = v6.Hooks.useTokens;
local v10 = require(l_Parent_0.Responsive);
local l_useBreakpointXOrSmaller_0 = v10.useBreakpointXOrSmaller;
local v12 = require(script.Parent.VideoProgressBar);
local l_FFlagLuaAppEdpMediaGalleryFullScreen_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen;
return function(v14) --[[ Line: 45 ]] --[[ Name: VideoPlayerBottomOverlay ]]
    -- upvalues: l_useTokens_0 (copy), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (copy), l_useBreakpointXOrSmaller_0 (copy), v10 (copy), v1 (copy), l_IconButton_0 (copy), l_Icon_0 (copy), l_IconVariant_0 (copy), l_IconSize_0 (copy), v12 (copy), l_maybeForceDarkTheme_0 (copy)
    local v15 = l_useTokens_0();
    local v16 = true;
    if v14.muteButtonConfig == nil then
        v16 = l_FFlagLuaAppEdpMediaGalleryFullScreen_0 and (v14.playButtonConfig ~= nil or v14.progressBarConfig ~= nil);
    end;
    local v17 = l_useBreakpointXOrSmaller_0(v10.Keys.Small);
    local l_XXLarge_0 = v15.Padding.XXLarge;
    local v19 = v17 and 0 or v15.Padding.Medium;
    local l_Medium_0 = v15.Padding.Medium;
    local l_Size_1000_0 = v15.Size.Size_1000;
    local l_Size_100_0 = v15.Size.Size_100;
    local l_XSmall_0 = v15.Padding.XSmall;
    local v24 = if v14.muteButtonConfig then v1.createElement(l_IconButton_0, {
        icon = {
            name = if v14.muteButtonConfig.muted then l_Icon_0.SpeakerSlash else l_Icon_0.Speaker, 
            variant = l_IconVariant_0.Filled
        }, 
        iconSize = l_IconSize_0.Medium, 
        onActivated = v14.muteButtonConfig.onMuteButtonActivated or nil, 
        AnchorPoint = Vector2.new(1, 1), 
        Position = UDim2.fromScale(1, 1), 
        Selectable = false
    }) else nil;
    local v25 = nil;
    if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then
        v25 = {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, l_XSmall_0), 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Padding = v1.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_XXLarge_0), 
                PaddingBottom = UDim.new(0, v19), 
                PaddingLeft = UDim.new(0, l_Medium_0), 
                PaddingRight = UDim.new(0, l_Medium_0)
            }), 
            ProgressBar = if v14.progressBarConfig then v1.createElement(v12, {
                progressBinding = v14.progressBarConfig.progressBinding, 
                Size = UDim2.new(1, 0, 0, l_Size_100_0), 
                LayoutOrder = 1
            }) else nil, 
            ButtonsContainer = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_Size_1000_0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 2
            }, {
                PlayButton = if v14.playButtonConfig then v1.createElement(l_IconButton_0, {
                    icon = {
                        name = if v14.playButtonConfig.isVideoPlaying then l_Icon_0.PauseLarge else l_Icon_0.PlayLarge, 
                        variant = l_IconVariant_0.Filled
                    }, 
                    iconSize = l_IconSize_0.Medium, 
                    onActivated = v14.playButtonConfig.onPlayButtonActivated, 
                    AnchorPoint = Vector2.new(0, 1), 
                    Position = UDim2.fromScale(0, 1), 
                    Selectable = false
                }) else nil, 
                MuteButton = if v14.muteButtonConfig then v24 else nil
            })
        };
    end;
    local v27 = v1.useMemo(function() --[[ Line: 124 ]]
        -- upvalues: l_XXLarge_0 (copy), v19 (copy), v14 (copy), l_FFlagLuaAppEdpMediaGalleryFullScreen_0 (ref), l_Size_1000_0 (copy), l_Size_100_0 (copy), l_XSmall_0 (copy)
        local v26 = l_XXLarge_0 + v19;
        if v14.muteButtonConfig or l_FFlagLuaAppEdpMediaGalleryFullScreen_0 and v14.playButtonConfig then
            v26 = v26 + l_Size_1000_0;
        end;
        if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 and v14.progressBarConfig then
            v26 = v26 + (l_Size_100_0 + l_XSmall_0);
        end;
        return v26;
    end, {
        v14.muteButtonConfig, 
        if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v14.playButtonConfig else nil, 
        if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v14.progressBarConfig else nil, 
        l_XXLarge_0, 
        v19, 
        l_Size_1000_0, 
        l_Size_100_0, 
        l_XSmall_0
    });
    return v1.createElement("Frame", {
        AnchorPoint = Vector2.new(0, 1), 
        Position = UDim2.fromScale(0, 1), 
        Size = UDim2.new(1, 0, 0, v27), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ZIndex = v14.ZIndex
    }, {
        GradientOverlay = v1.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = v15.Color.Extended.Black.Black_100.Color3, 
            BorderSizePixel = 0, 
            ZIndex = 1
        }, {
            Gradient = v1.createElement("UIGradient", {
                Rotation = 90, 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), 
                    NumberSequenceKeypoint.new(1, 0.2)
                })
            }), 
            UICorner = if v14.cornerRadius then v1.createElement("UICorner", {
                CornerRadius = UDim.new(0, v14.cornerRadius)
            }) else nil
        }), 
        UserControls = if v14.videoLoaded and v16 then l_maybeForceDarkTheme_0(v1.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ZIndex = 10
        }, if l_FFlagLuaAppEdpMediaGalleryFullScreen_0 then v25 else {
            Padding = v1.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_XXLarge_0), 
                PaddingBottom = UDim.new(0, v19), 
                PaddingLeft = UDim.new(0, l_Medium_0), 
                PaddingRight = UDim.new(0, l_Medium_0)
            }), 
            MuteButton = if v14.muteButtonConfig then v24 else nil
        }), true) else nil
    });
end;