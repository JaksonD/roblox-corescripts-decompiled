local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local v4 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local l_isRunningInStudio_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isRunningInStudio;
local l_game_EngineFeature_0 = game:GetEngineFeature("WebViewRedesignEnabled");
local function v12(v7, v8) --[[ Line: 20 ]] --[[ Name: renderPage ]]
    -- upvalues: l_isRunningInStudio_0 (copy), v2 (copy), v4 (copy), l_game_EngineFeature_0 (copy)
    local v9 = v7.isVisible or false;
    if l_isRunningInStudio_0() then
        local l_BackgroundDefault_0 = v8.Theme.BackgroundDefault;
        return v2.createElement("Frame", {
            Visible = v9, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = l_BackgroundDefault_0.Color, 
            BackgroundTransparency = l_BackgroundDefault_0.Transparency
        }, {
            TopBar = v2.createElement(v4.Container, {
                titleText = "WebViewStub", 
                leftItem = v4.BackButton
            })
        });
    else
        local l_Overlay_0 = v8.Theme.Overlay;
        return v2.createElement("TextButton", {
            Visible = v9, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = if l_game_EngineFeature_0 then v8.Theme.BackgroundDefault.Color else l_Overlay_0.Color, 
            BackgroundTransparency = l_game_EngineFeature_0 and 0 or l_Overlay_0.Transparency, 
            Text = "", 
            Active = false, 
            AutoButtonColor = false, 
            Selectable = false
        });
    end;
end;
return function(v13) --[[ Line: 54 ]]
    -- upvalues: l_withStyle_0 (copy), v12 (copy)
    return l_withStyle_0(function(v14) --[[ Line: 55 ]]
        -- upvalues: v12 (ref), v13 (copy)
        return v12(v13, v14);
    end);
end;