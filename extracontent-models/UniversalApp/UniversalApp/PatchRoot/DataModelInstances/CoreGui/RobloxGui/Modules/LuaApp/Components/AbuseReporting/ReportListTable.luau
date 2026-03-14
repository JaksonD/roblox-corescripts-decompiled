local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_ScrollingListTable_0 = v4.App.Table.ScrollingListTable;
local l_CellTailDescription_0 = v4.App.Table.CellTailDescription;
local l_CellHeadDetail_0 = v4.App.Table.CellHeadDetail;
local _ = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportTypes);
local l_Cell_0 = v4.App.Table.Cell;
local v10 = require(l_CorePackages_0.Packages.Dash);
local v11 = require(l_CorePackages_0.Workspace.Packages.Style);
local l_useDesignTokens_0 = v11.useDesignTokens;
local l_mapTypographyVariantToFontEnum_0 = v11.mapTypographyVariantToFontEnum;
local l_GetFFlagLuafiedReportThumbnail_0 = v1.GetFFlagLuafiedReportThumbnail;
return function(v15) --[[ Line: 29 ]]
    -- upvalues: l_useDesignTokens_0 (copy), v3 (copy), l_mapTypographyVariantToFontEnum_0 (copy), l_ScrollingListTable_0 (copy), v10 (copy), l_Cell_0 (copy), l_GetFFlagLuafiedReportThumbnail_0 (copy), l_CellHeadDetail_0 (copy), l_CellTailDescription_0 (copy)
    local v16 = l_useDesignTokens_0();
    local l_currentList_0 = v15.currentList;
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = v16.Global.Opacity_0
    }, {
        Layout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Heading = v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v16.Global.Size_700), 
            BackgroundTransparency = v16.Global.Opacity_0
        }, {
            Padding = v3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v16.Global.Space_300), 
                PaddingBottom = UDim.new(0, v16.Global.Space_300)
            }), 
            HeadingText = v3.createElement("TextLabel", {
                Text = l_currentList_0.heading, 
                Font = l_mapTypographyVariantToFontEnum_0(v16.Semantic.Typography.Subheader), 
                LayoutOrder = 1, 
                TextColor3 = v16.Semantic.Color.Text.Emphasis.Color3, 
                TextTransparency = v16.Semantic.Color.Text.Emphasis.Transparency, 
                TextSize = v16.Semantic.Typography.Subheader.FontSize, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Size = UDim2.new(1, 0, 0, v16.Semantic.Typography.Subheader.FontSize), 
                BackgroundTransparency = v16.Global.Opacity_0
            })
        }), 
        SelectionList = v3.createElement("Frame", {
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            ListTable = v3.createElement(l_ScrollingListTable_0, {
                cells = v10.map(l_currentList_0.listItems, function(v18) --[[ Line: 70 ]]
                    -- upvalues: v3 (ref), l_Cell_0 (ref), l_GetFFlagLuafiedReportThumbnail_0 (ref), v16 (copy), l_CellHeadDetail_0 (ref), l_CellTailDescription_0 (ref), v15 (copy), l_currentList_0 (copy)
                    return v3.createElement(l_Cell_0, {
                        size = UDim2.new(1, 0, 0, if l_GetFFlagLuafiedReportThumbnail_0() then v16.Global.Size_500 else v16.Global.Size_700), 
                        head = v3.createElement(l_CellHeadDetail_0, {
                            labelText = v18.humanReadableText
                        }), 
                        tail = v3.createElement(l_CellTailDescription_0, {
                            text = "", 
                            showArrow = true
                        }), 
                        onActivated = function() --[[ Line: 85 ]] --[[ Name: onActivated ]]
                            -- upvalues: v15 (ref), v18 (copy), l_currentList_0 (ref)
                            v15.onSelect(v18.tagValues, l_currentList_0.heading, v18.humanReadableText, v18.nextList);
                        end
                    });
                end)
            })
        })
    });
end;