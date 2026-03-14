local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Components.FullscreenPageWithSafeArea);
local v3 = require(l_Modules_0.LuaApp.Components.Authentication.LandingPageVideo);
local v4 = require(l_CorePackages_0.Packages.React);
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
return function(v9) --[[ Line: 29 ]] --[[ Name: VideoWithContentsLayout ]]
    -- upvalues: v4 (copy), l_getSafeAreaSize_0 (copy), l_useLocalization_0 (copy), l_useDesignTokens_0 (copy), l_FormFactor_0 (copy), v3 (copy), v2 (copy)
    local v10, v11 = v4.useState(0);
    local v12, v13 = v4.useState(0);
    local function v15(v14) --[[ Line: 33 ]]
        -- upvalues: v10 (copy), v11 (copy)
        if v10 ~= v14.AbsoluteSize.Y then
            v11(v14.AbsoluteSize.Y);
        end;
    end;
    local function v17(v16) --[[ Line: 39 ]]
        -- upvalues: v12 (copy), v13 (copy)
        if v12 ~= v16.AbsoluteSize.Y then
            v13(v16.AbsoluteSize.Y);
        end;
    end;
    local v18 = {
        Position = UDim2.new(0.5, 0, 1, 0), 
        AnchorPoint = Vector2.new(0.5, 1), 
        LogoPositionYScale = 0.08, 
        BodyPositionYScale = 0.3
    };
    local v19 = l_getSafeAreaSize_0(v9.screenSize, v9.globalGuiInset).Y.Offset - v9.statusBarHeight;
    local v20 = v19 * 0.3;
    local v21 = v19 * v18.LogoPositionYScale;
    local v22 = l_useLocalization_0({
        sloganText = "Feature.Landing.Heading.LandingSlogan"
    });
    local v23 = l_useDesignTokens_0();
    local v24 = {
        Logo = v4.createElement("ImageLabel", {
            Position = UDim2.new(0.5, 0, 0, v21), 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.new(0.7, 0, 0.7, 0), 
            Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/logo_white_1x.png", 
            ZIndex = 1
        }, {
            UISizeConstraint = v4.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(150, 25.951557093425606)
            }), 
            UIAspectRatioConstraint = v4.createElement("UIAspectRatioConstraint", {
                AspectRatio = 5.78, 
                AspectType = Enum.AspectType.FitWithinMaxSize
            })
        }), 
        ContentContainer = v4.createElement("Frame", {
            Position = UDim2.new(0.5, 0, 0, v20), 
            Size = UDim2.new(1, 0, 1, -v20), 
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundTransparency = 1, 
            ZIndex = 2
        }, {
            UIListLayout = v4.createElement("UIListLayout", {
                Padding = UDim.new(0, 16), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom
            }), 
            Text = v4.createElement("TextLabel", {
                Size = UDim2.new(1, -40, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Text = v22.sloganText, 
                TextColor3 = v23.Semantic.Color.Text.Emphasis.Color3, 
                TextSize = v23.Semantic.Typography.Title.FontSize, 
                Font = v23.Semantic.Typography.Title.Font, 
                TextXAlignment = if v9.formFactor == l_FormFactor_0.COMPACT then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Bottom, 
                TextWrapped = true, 
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                [v4.Change.AbsoluteSize] = v15
            }, {
                UISizeConstraint = if v9.formFactor == l_FormFactor_0.COMPACT then v4.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(360, 1e999)
                }) else nil
            }), 
            Content = v4.createElement("Frame", {
                Position = v18.Position, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                AnchorPoint = v18.AnchorPoint, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                [v4.Change.AbsoluteSize] = v17
            }, {
                v9.children
            })
        })
    };
    local function v26(_) --[[ Line: 127 ]]
        -- upvalues: v4 (ref), v3 (ref), v9 (copy), v10 (copy), v12 (copy)
        return v4.createElement(v3, {
            screenSize = v9.screenSize, 
            landingVideoAsset = v9.landingVideoAsset, 
            videoBottomOffsetGradientHeight = 3 * v10, 
            videoBottomOffsetHeight = v12 + v9.globalGuiInset.bottom + 16
        });
    end;
    return v4.createElement(v2, {
        includeStatusBar = true, 
        renderFullscreenBackground = v26, 
        buttonRef = v9.containerRef
    }, {
        Contents = v4.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            ZIndex = 2
        }, {
            v24
        })
    });
end;