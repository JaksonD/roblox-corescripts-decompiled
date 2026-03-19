local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v3 = require(l_CorePackages_0.Packages.Roact);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local v5 = require(l_Modules_0.LuaApp.Constants);
local v6 = require(l_Modules_0.LuaApp.Flags.FFlagEnableFlyoutSidePanel);
local v7 = v3.PureComponent:extend("MoreList");
v7.defaultProps = {
    LayoutOrder = 1
};
v7.render = function(v8) --[[ Line: 19 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v3 (copy), v5 (copy), v6 (copy), l_withStyle_0 (copy)
    local l_LayoutOrder_0 = v8.props.LayoutOrder;
    local l_itemList_0 = v8.props.itemList;
    local l_renderItem_0 = v8.props.renderItem;
    local l_rowHeight_0 = v8.props.rowHeight;
    v2.isType(l_renderItem_0, "function", "MoreList.props.renderItem");
    if not l_itemList_0 or #l_itemList_0 == 0 then
        return;
    else
        local function v24(v13, v14) --[[ Line: 31 ]]
            -- upvalues: l_itemList_0 (copy), v3 (ref), l_rowHeight_0 (copy), l_renderItem_0 (copy), v5 (ref), v6 (ref), l_LayoutOrder_0 (copy)
            local v15 = {};
            local v16 = 0;
            v15.Layout = (not (#l_itemList_0[1] <= 1) or #l_itemList_0 > 1) and v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right
            });
            for v17, v18 in ipairs(l_itemList_0) do
                for v19, v20 in ipairs(v18) do
                    v16 = v16 + 1;
                    local v21 = true;
                    if v19 >= #v18 then
                        v21 = v17 < #l_itemList_0;
                    end;
                    local v22 = {
                        Size = UDim2.new(1, 0, 0, v21 and l_rowHeight_0 - 1 or l_rowHeight_0), 
                        LayoutOrder = v16 * 2 - 1
                    };
                    v15["Row" .. v16] = l_renderItem_0(v20, v22);
                    if v21 then
                        local v23 = v20.icon and v5.MORE_PAGE_TEXT_PADDING_WITH_ICON or v5.MORE_PAGE_ROW_PADDING_LEFT;
                        if v6 then
                            v23 = v5.MORE_PAGE_ROW_PADDING_LEFT;
                        end;
                        v15["Divider" .. v16] = v3.createElement("Frame", {
                            Size = UDim2.new(1, -v23, 0, 1), 
                            BackgroundColor3 = v14.Color, 
                            BackgroundTransparency = v14.Transparency, 
                            BorderSizePixel = 0, 
                            LayoutOrder = v16 * 2
                        });
                    end;
                end;
            end;
            return v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_rowHeight_0 * v16), 
                BackgroundColor3 = v13.Color, 
                BackgroundTransparency = v13.Transparency, 
                BorderSizePixel = 0, 
                BorderColor3 = v14.Color, 
                LayoutOrder = l_LayoutOrder_0
            }, v15);
        end;
        return l_withStyle_0(function(v25) --[[ Line: 78 ]]
            -- upvalues: v24 (copy)
            return v24(v25.Theme.BackgroundDefault, v25.Theme.Divider);
        end);
    end;
end;
return v7;