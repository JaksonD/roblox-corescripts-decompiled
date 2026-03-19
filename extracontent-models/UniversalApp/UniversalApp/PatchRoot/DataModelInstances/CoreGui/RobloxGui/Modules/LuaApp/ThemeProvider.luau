local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.Roact);
local l_LocalStorageKey_0 = require(l_CorePackages_0.Workspace.Packages.LocalStorage).Enums.LocalStorageKey;
local l_Tokens_0 = require(l_CorePackages_0.Packages.UIBlox).App.Style.Tokens;
local v6 = require(l_Modules_0.LuaApp.Themes.getThemeModuleForString);
local v7 = require(l_Modules_0.LuaApp.ThemeContext_DEPRECATED);
local v8 = v3.Component:extend("ThemeProvider");
local function v12(v9, v10) --[[ Line: 15 ]]
    local v11 = table.clone(v9);
    v11.ContextPrimaryButton.Color = v10.Color.ActionEmphasis.Background.Color3;
    v11.ContextPrimaryButton.Transparency = v10.Color.ActionEmphasis.Background.Transparency;
    v11.ContextPrimaryButton.Text.Color = v10.Color.ActionEmphasis.Foreground.Color3;
    v11.ContextPrimaryButton.Text.Transparency = v10.Color.ActionEmphasis.Foreground.Transparency;
    v11.SecondaryButton.Color = v10.Color.ActionSubtle.Background.Color3;
    v11.SecondaryButton.Transparency = v10.Color.ActionSubtle.Background.Transparency;
    v11.SecondaryButton.DisabledColor = v10.Color.ActionSubtle.Background.Color3;
    v11.SecondaryButton.DisabledTransparency = 0.5;
    v11.SecondaryButton.OnPressColor = v10.Color.ActionSubtle.Background.Color3;
    v11.SecondaryButton.OnPressTransparency = 0.5;
    v11.SecondaryButton.Text.Color = v10.Color.ActionSubtle.Foreground.Color3;
    v11.SecondaryButton.Text.Transparency = v10.Color.ActionSubtle.Foreground.Transparency;
    v11.SecondaryButton.Border.Color = v10.Color.ActionSubtle.Border.Color3;
    v11.SecondaryButton.Border.Transparency = v10.Color.ActionSubtle.Border.Transparency;
    v11.ShimmerPanel.Color = v10.Color.Common.Shimmer.Color3;
    v11.ShimmerPanel.Transparency = v10.Color.Common.Shimmer.Transparency;
    v11.AlertWindow.Background.Color = v10.Semantic.Color.BackgroundUi.Default.Color3;
    v11.AlertWindow.Title.Color = v10.Color.Content.Emphasis.Color3;
    v11.AlertWindow.Message.Color = v10.Color.Content.Default.Color3;
    v11.AlertWindow.Divider.Color = v10.Color.Stroke.Default.Color3;
    v11.GameDetails.GameInfoList.Cells.Background.Color = v10.Color.State.Press.Color3;
    v11.GameDetails.GameInfoList.Cells.Background.Transparency.Pressed = v10.Color.State.Press.Transparency;
    v11.GameMediaAccordion.Item.BackgroundColor = v10.Color.Surface.Surface_300.Color3;
    v11.GameMediaAccordion.Item.BackgroundTransparency = 0.5;
    v11.GameMediaAccordion.FakeItem.Loading.Color = v10.Color.Surface.Surface_300.Color3;
    v11.GameMediaAccordion.FakeItem.Loading.BaseTransparency = 0.5;
    v11.GameMediaAccordion.FakeItem.Loaded.Color = v10.Color.OverMedia.OverMedia_200.Color3;
    v11.GameMediaAccordion.FakeItem.Loaded.BaseTransparency = v10.Color.OverMedia.OverMedia_200.Transparency;
    v11.GameMediaAccordion.VideoIconColor = v10.Color.Content.Emphasis.Color3;
    return v11;
end;
v8.init = function(v13, v14) --[[ Line: 58 ]] --[[ Name: init ]]
    -- upvalues: v6 (copy), l_Tokens_0 (copy), v12 (copy)
    local l_themeName_0 = v14.themeName;
    local v16 = v6(l_themeName_0);
    local v17 = l_Tokens_0.getFoundationTokensDefaultScale(l_themeName_0);
    v13.state = {
        theme = v12(v16, v17)
    };
end;
v8.didMount = function(v18) --[[ Line: 69 ]] --[[ Name: didMount ]]
    -- upvalues: l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy), v6 (copy), l_Tokens_0 (copy), v12 (copy)
    v18.connection = l_AppStorageService_0.ItemWasSet:Connect(function(v19, v20) --[[ Line: 70 ]]
        -- upvalues: l_LocalStorageKey_0 (ref), v6 (ref), l_Tokens_0 (ref), v12 (ref), v18 (copy)
        if v19 == l_LocalStorageKey_0.AuthenticatedTheme then
            local v21 = v6(v20);
            local v22 = l_Tokens_0.getFoundationTokensDefaultScale(v20);
            v21 = v12(v21, v22);
            v18:setState({
                theme = v21
            });
        end;
    end);
end;
v8.willUnmount = function(v23) --[[ Line: 83 ]] --[[ Name: willUnmount ]]
    if v23.connection then
        v23.connection:Disconnect();
    end;
end;
v8.render = function(v24) --[[ Line: 89 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v7 (copy)
    return v3.createElement(v7.Provider, {
        value = v24.state.theme
    }, v24.props[v3.Children]);
end;
return v8;