local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.CenteredModalView);
local l_useAXAnimateScrollFrame_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Components.AnimatedScrollingFrame.useAXAnimateScrollFrame;
local v6 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXItemDetailsScrollingEnabledCallback);
local v7 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus and game:DefineFastFlag("AXMIgrateItemDetailsModalToAutofocus", false);
local function v8() --[[ Line: 37 ]]
    return nil;
end;
return function(v9) --[[ Line: 41 ]]
    -- upvalues: v8 (copy), v7 (copy), v3 (copy), l_useAXAnimateScrollFrame_0 (copy), v2 (copy), v4 (copy), v6 (copy)
    local l_renderContent_0 = v9.renderContent;
    local v11 = v9.renderTopBar or v8;
    local v12 = v9.renderBottomBar or v8;
    local v13 = v9.topBarHeight or 0;
    local v14 = v9.bottomBarHeight or 0;
    local v15 = nil;
    if v7 then
        v15 = v3.useRef(nil);
        l_useAXAnimateScrollFrame_0(v15);
    end;
    return v2.createElement(v4, {}, {
        TopBar = v11(), 
        ScrollingContent = v2.createElement("ScrollingFrame", {
            ref = if v7 then v15 else nil, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, -(v13 + v14)), 
            Position = UDim2.new(0, 0, 0, v13), 
            ScrollBarThickness = 0, 
            CanvasSize = UDim2.new(1, 0, 0, 0), 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            ScrollingEnabled = if v6() then v9.scrollingEnabled else nil, 
            Selectable = not v7 and nil
        }, {
            Content = l_renderContent_0()
        }), 
        BottomBar = v12()
    });
end;