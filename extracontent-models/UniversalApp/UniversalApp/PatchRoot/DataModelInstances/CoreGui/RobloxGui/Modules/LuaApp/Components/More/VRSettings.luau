local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
local l_useEffect_0 = v2.useEffect;
local v5 = require(l_Modules_0.LuaApp.Constants);
local v6 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v7 = require(l_Modules_0.LuaApp.Components.More.MorePageScrollingFrame);
local v8 = require(l_Modules_0.LuaApp.Components.More.VRSettingsContent);
return require(l_Modules_0.LuaApp.Components.More.withMorePagePaddings)(function(v9) --[[ Line: 21 ]] --[[ Name: VRSettings ]]
    -- upvalues: l_useStyle_0 (copy), l_useEffect_0 (copy), v2 (copy), v6 (copy), v7 (copy), v5 (copy), v8 (copy)
    local l_BackgroundDefault_0 = l_useStyle_0().Theme.BackgroundDefault;
    l_useEffect_0(function() --[[ Line: 25 ]]
        return function() --[[ Line: 26 ]]
            if game:GetEngineFeature("GlobalBasicSettingsSaveStateReflection") then
                task.spawn(function() --[[ Line: 28 ]]
                    UserSettings():SaveState();
                end);
            end;
        end;
    end);
    local v11 = nil;
    local v12 = nil;
    local v13 = nil;
    local l_paddings_0 = v9.paddings;
    assert(l_paddings_0, "paddings must not be nil");
    v11 = l_paddings_0.paddingHorizontal;
    v12 = l_paddings_0.paddingVertical;
    v13 = l_paddings_0.contentMaxWidth;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_BackgroundDefault_0.Color, 
        BackgroundTransparency = l_BackgroundDefault_0.Transparency
    }, {
        TopBar = v2.createElement(v6.Container, {
            leftItem = v6.BackButton
        }), 
        PageContent = v2.createElement(v6.PageContent, {}, {
            Scroller = v2.createElement(v7, {
                Position = UDim2.fromScale(0, 0), 
                Size = UDim2.fromScale(1, 1), 
                maxWidth = v13
            }, {
                Layout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, v5.MORE_PAGE_SECTION_PADDING)
                }), 
                UIPadding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v11), 
                    PaddingRight = UDim.new(0, v11), 
                    PaddingTop = UDim.new(0, v12), 
                    PaddingBottom = UDim.new(0, v12)
                }), 
                Content = v2.createElement(v8)
            })
        })
    });
end);