local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.Foundation);
local l_ScrollView_0 = v4.ScrollView;
local l_ScrollBarVisibility_0 = v4.Enums.ScrollBarVisibility;
local v7 = require(l_Modules_0.LuaApp.Components.Authentication.DualLayoutBackButton);
local v8 = require(l_Modules_0.LuaApp.FitChildren);
local v9 = require(l_Modules_0.LuaApp.Enum.Alignment);
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
local v11 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local function v30(v15) --[[ Line: 23 ]]
    -- upvalues: l_useStyle_0 (copy), l_useDesignTokens_0 (copy), v9 (copy), l_useUiModeInfo_0 (copy), v2 (copy), l_UiMode_0 (copy), v7 (copy), v8 (copy), l_ScrollView_0 (copy), l_ScrollBarVisibility_0 (copy)
    local v16 = l_useStyle_0();
    local v17 = l_useDesignTokens_0();
    local l_Font_0 = v16.Font;
    local l_Theme_0 = v16.Theme;
    local l_children_0 = v15.children;
    local v21 = v15.ContentAlign or v9.Top;
    local l_Space_800_0 = v17.Global.Space_800;
    local l_Space_1000_0 = v17.Global.Space_1000;
    local l_Space_400_0 = v17.Global.Space_400;
    local v25 = v17.Global.FontSize_500 + l_Space_400_0;
    local v26 = l_useUiModeInfo_0();
    local l_buttonRef_0 = v15.buttonRef;
    local v28 = {
        [v9.Top] = {
            Position = UDim2.new(0.5, 0, 0, 0), 
            AnchorPoint = Vector2.new(0.5, 0)
        }, 
        [v9.Bottom] = {
            Position = UDim2.new(0.5, 0, 1, 0), 
            AnchorPoint = Vector2.new(0.5, 1)
        }
    };
    local v29 = {
        Title = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            BackgroundTransparency = 1
        }, {
            BackButton = if v26.uiMode == l_UiMode_0.VR then v2.createElement(v7, {
                navigateBack = v15.navigateBack
            }) else nil, 
            TitleLabel = v2.createElement("TextLabel", {
                Text = v15.localized.title, 
                TextSize = v17.Global.FontSize_500, 
                Font = l_Font_0.Title.Font, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            })
        }), 
        AlignmentContainer = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0.5, 0, 0, v25), 
            Size = UDim2.new(1, 0, 1, -v25), 
            AnchorPoint = Vector2.new(0.5, 0), 
            ZIndex = 2
        }, {
            Content = v2.createElement(v8.FitFrame, {
                Position = v28[v21].Position, 
                Size = UDim2.new(1, 0, 1, 0), 
                fitAxis = v8.FitAxis.Height, 
                AnchorPoint = v28[v21].AnchorPoint, 
                BackgroundTransparency = 1
            }, {
                l_children_0
            })
        })
    };
    return v2.createElement(l_ScrollView_0, {
        BorderSizePixel = 0, 
        scroll = {
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            CanvasSize = UDim2.fromScale(1, 0), 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            scrollBarVisibility = l_ScrollBarVisibility_0.None
        }, 
        Size = UDim2.new(1, 0, 1, 0), 
        tag = "bg-action-subtle"
    }, {
        ContentFrame = v2.createElement("Frame", {
            Position = UDim2.new(0, l_Space_800_0, 0, l_Space_1000_0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, -(2 * l_Space_800_0), 1, -(2 * l_Space_1000_0)), 
            AnchorPoint = Vector2.new(0, 0), 
            BackgroundTransparency = 1, 
            ref = l_buttonRef_0
        }, {
            v29
        })
    });
end;
return function(v31) --[[ Line: 114 ]]
    -- upvalues: v11 (copy), v2 (copy), v30 (copy), v3 (copy)
    local v32 = v11({
        title = "Authentication.Login.Heading.LoginRoblox"
    });
    return v2.createElement(v30, v3.Dictionary.join({
        localized = v32
    }, v31));
end;