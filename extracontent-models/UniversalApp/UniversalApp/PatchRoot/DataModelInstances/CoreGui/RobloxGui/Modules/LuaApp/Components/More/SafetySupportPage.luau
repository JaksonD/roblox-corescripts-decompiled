local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
local v5 = require(l_Modules_0.LuaApp.AppPage);
local v6 = require(l_Modules_0.LuaApp.Constants);
local v7 = require(l_Modules_0.LuaApp.Components.More.Config.MorePageSettings);
local v8 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v11 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v12 = require(l_Modules_0.LuaApp.Components.More.MoreList);
local v13 = require(l_Modules_0.LuaApp.Components.More.MoreItemContainer);
local v14 = require(l_Modules_0.LuaApp.Components.More.MorePageScrollingFrame);
local function v17(v15, v16) --[[ Line: 42 ]] --[[ Name: renderItem ]]
    -- upvalues: v3 (copy), v13 (copy)
    return v3.createElement(v13, {
        item = v15, 
        layoutInfo = v16
    });
end;
return function() --[[ Line: 49 ]] --[[ Name: SafetySupportPage ]]
    -- upvalues: v8 (copy), l_useSelector_0 (copy), l_FormFactor_0 (copy), v6 (copy), l_useStyle_0 (copy), v3 (copy), v7 (copy), v5 (copy), v2 (copy), v11 (copy), v14 (copy), v12 (copy), v17 (copy)
    local v19 = not v8(function(v18) --[[ Line: 50 ]]
        return v18.getWebViewSupport();
    end);
    local v21 = l_useSelector_0(function(v20) --[[ Line: 54 ]]
        return v20.FormFactor;
    end) == l_FormFactor_0.WIDE;
    local v22 = 0;
    local v23 = 0;
    local l_MORE_PAGE_SECTION_PADDING_0 = v6.MORE_PAGE_SECTION_PADDING;
    local l_MORE_PAGE_SECTION_PADDING_1 = v6.MORE_PAGE_SECTION_PADDING;
    if v21 then
        v22 = v6.MORE_PAGE_WIDE_PADDING_HORIZONTAL;
        v23 = v6.MORE_PAGE_WIDE_PADDING_HORIZONTAL;
        l_MORE_PAGE_SECTION_PADDING_0 = v6.MORE_PAGE_WIDE_PADDING_VERTICAL;
        l_MORE_PAGE_SECTION_PADDING_1 = v6.MORE_PAGE_WIDE_PADDING_VERTICAL;
    end;
    local v26 = v6.MORE_PAGE_CONTENT_MAX_WIDTH + v22 + v23;
    local l_BackgroundDefault_0 = l_useStyle_0().Theme.BackgroundDefault;
    local v30 = v3.useMemo(function() --[[ Line: 74 ]]
        -- upvalues: v7 (ref), v5 (ref), v19 (copy), v2 (ref)
        local v28 = v7.GetItemsInPage(v5.SafetySupport, nil, nil, nil, nil, v19);
        return v2.List.map(v28, function(v29) --[[ Line: 84 ]]
            return v29.contents;
        end);
    end, {
        v19
    });
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_BackgroundDefault_0.Color, 
        BackgroundTransparency = l_BackgroundDefault_0.Transparency
    }, {
        TopBar = v3.createElement(v11.Container, {
            leftItem = v11.BackButton, 
            rightItems = {
                v11.BuyRobuxButton, 
                v11.NotificationsButton
            }
        }), 
        PageContent = v3.createElement(v11.PageContent, {}, {
            Scroller = v3.createElement(v14, {
                Position = UDim2.fromScale(0, 0), 
                Size = UDim2.fromScale(1, 1), 
                maxWidth = v26
            }, {
                Layout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, v6.MORE_PAGE_SECTION_PADDING)
                }), 
                UIPadding = v3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v22), 
                    PaddingRight = UDim.new(0, v23), 
                    PaddingTop = UDim.new(0, l_MORE_PAGE_SECTION_PADDING_0), 
                    PaddingBottom = UDim.new(0, l_MORE_PAGE_SECTION_PADDING_1)
                }), 
                SafetySupportPageList = v3.createElement(v12, {
                    LayoutOrder = 1, 
                    itemList = v30, 
                    renderItem = v17, 
                    rowHeight = v6.MORE_PAGE_ROW_HEIGHT
                })
            })
        })
    });
end;