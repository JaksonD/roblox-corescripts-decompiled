local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v8 = require(l_Modules_0.LuaApp.AppPage);
local v9 = require(l_Modules_0.LuaApp.Constants);
local v10 = require(l_Modules_0.LuaApp.Components.More.Config.MorePageSettings);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v12 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v13 = require(l_Modules_0.LuaApp.Components.More.MoreList);
local v14 = require(l_Modules_0.LuaApp.Components.More.MoreItemContainer);
local v15 = require(l_Modules_0.LuaApp.Components.More.MorePageScrollingFrame);
local v16 = require(l_CorePackages_0.Packages.React);
local v17 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local v18 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.TenFootUiShell).Constants;
local v21 = require(l_Modules_0.LuaApp.Components.More.MoreSectionList);
local l_FFlagEnableLeftNavOnConsole_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole;
local l_l_RunService_0_RobloxVersion_0 = l_RunService_0:GetRobloxVersion();
local l_ClientGitHash_0 = l_RunService_0.ClientGitHash;
l_l_RunService_0_RobloxVersion_0 = string.format("%s (%.6s)", l_l_RunService_0_RobloxVersion_0, l_ClientGitHash_0);
local v25 = v4.PureComponent:extend("AboutPage");
v25.init = function(v26) --[[ Line: 57 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v14 (copy)
    v26.renderItem = function(v27, v28) --[[ Line: 58 ]]
        -- upvalues: v4 (ref), v14 (ref)
        return v4.createElement(v14, {
            item = v27, 
            layoutInfo = v28
        });
    end;
end;
v25.render = function(v29) --[[ Line: 66 ]] --[[ Name: render ]]
    -- upvalues: l_FormFactor_0 (copy), v9 (copy), v10 (copy), v3 (copy), v4 (copy), v12 (copy), v15 (copy), v13 (copy), l_withStyle_0 (copy)
    local v30 = v29.props.formFactor == l_FormFactor_0.WIDE;
    local v31 = 0;
    local v32 = 0;
    local l_MORE_PAGE_SECTION_PADDING_0 = v9.MORE_PAGE_SECTION_PADDING;
    local l_MORE_PAGE_SECTION_PADDING_1 = v9.MORE_PAGE_SECTION_PADDING;
    if v30 then
        v31 = v9.MORE_PAGE_WIDE_PADDING_HORIZONTAL;
        v32 = v9.MORE_PAGE_WIDE_PADDING_HORIZONTAL;
        l_MORE_PAGE_SECTION_PADDING_0 = v9.MORE_PAGE_WIDE_PADDING_VERTICAL;
        l_MORE_PAGE_SECTION_PADDING_1 = v9.MORE_PAGE_WIDE_PADDING_VERTICAL;
    end;
    local v35 = v9.MORE_PAGE_CONTENT_MAX_WIDTH + v31 + v32;
    local v36 = v10.GetItemsInPage(v29.props.aboutPageType, nil, nil, nil, nil, v29.props.disableWebViewSupport);
    v36 = v3.List.map(v36, function(v37) --[[ Line: 92 ]]
        return v37.contents;
    end);
    local function v40(v38, _) --[[ Line: 96 ]]
        -- upvalues: v4 (ref), v12 (ref), v15 (ref), v35 (copy), v9 (ref), v31 (ref), v32 (ref), l_MORE_PAGE_SECTION_PADDING_0 (ref), l_MORE_PAGE_SECTION_PADDING_1 (ref), v13 (ref), v36 (ref), v29 (copy)
        return v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v38.Color, 
            BackgroundTransparency = v38.Transparency
        }, {
            TopBar = v4.createElement(v12.Container, {
                leftItem = v12.BackButton, 
                rightItems = {
                    v12.BuyRobuxButton, 
                    v12.NotificationsButton
                }
            }), 
            PageContent = v4.createElement(v12.PageContent, {}, {
                Scroller = v4.createElement(v15, {
                    Position = UDim2.fromScale(0, 0), 
                    Size = UDim2.fromScale(1, 1), 
                    maxWidth = v35
                }, {
                    Layout = v4.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = UDim.new(0, v9.MORE_PAGE_SECTION_PADDING)
                    }), 
                    UIPadding = v4.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v31), 
                        PaddingRight = UDim.new(0, v32), 
                        PaddingTop = UDim.new(0, l_MORE_PAGE_SECTION_PADDING_0), 
                        PaddingBottom = UDim.new(0, l_MORE_PAGE_SECTION_PADDING_1)
                    }), 
                    AboutPageList = v4.createElement(v13, {
                        LayoutOrder = 1, 
                        itemList = v36, 
                        renderItem = v29.renderItem, 
                        rowHeight = v9.MORE_PAGE_ROW_HEIGHT
                    })
                })
            })
        });
    end;
    return l_withStyle_0(function(v41) --[[ Line: 137 ]]
        -- upvalues: v3 (ref), v40 (copy)
        local v42 = v3.Dictionary.join(v41.Theme.TextDefault, {
            Font = v41.Font.Footer.Font, 
            Size = v41.Font.BaseSize * v41.Font.Footer.RelativeSize
        });
        return v40(v41.Theme.BackgroundDefault, v42);
    end);
end;
v25 = l_RoactAppPolicy_0.connect(function(v43, _) --[[ Line: 146 ]]
    local v45 = not v43.getWebViewSupport();
    return {
        aboutPageType = v43.getAboutPageType(), 
        disableWebViewSupport = v45
    };
end)(v25);
v25 = v5.connect(function(v46, _) --[[ Line: 154 ]]
    return {
        formFactor = v46.FormFactor
    };
end)(v25);
return function(v48) --[[ Line: 160 ]]
    -- upvalues: v18 (copy), l_UiMode_0 (copy), v17 (copy), v10 (copy), v3 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), v8 (copy), l_Constants_0 (copy), v16 (copy), v21 (copy), v25 (ref)
    local v49 = v18.useUiModeInfo().uiMode == l_UiMode_0.TenFoot;
    local v51 = v17(function(v50) --[[ Line: 164 ]]
        return v50.getAboutPageType();
    end);
    if v49 then
        local v52 = v10.GetItemsInPage(v51);
        v52 = v3.List.map(v52, function(v53) --[[ Line: 171 ]]
            return v53.contents;
        end);
        local v54 = l_FFlagEnableLeftNavOnConsole_0 and 0 or if v51 == v8.TenFootAbout then l_Constants_0.TOP_BAR_CANVAS_SIZE.Y else 0;
        return v16.createElement(v21, {
            itemList = v52, 
            topbarHeight = v54
        });
    else
        return v16.createElement(v25, v48);
    end;
end;