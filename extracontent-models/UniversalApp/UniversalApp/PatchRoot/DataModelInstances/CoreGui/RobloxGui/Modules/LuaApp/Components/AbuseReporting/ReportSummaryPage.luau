local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local v3 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_StyledTextLabel_0 = v2.App.Text.StyledTextLabel;
local l_ScrollingListTable_0 = v2.App.Table.ScrollingListTable;
local l_CellHeadDetail_0 = v2.App.Table.CellHeadDetail;
local l_Cell_0 = v2.App.Table.Cell;
local v8 = require(l_CorePackages_0.Packages.Dash);
local v9 = require(l_CorePackages_0.Workspace.Packages.Style);
local l_useDesignTokens_0 = v9.useDesignTokens;
local l_mapTypographyVariantToFontEnum_0 = v9.mapTypographyVariantToFontEnum;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_isSelectedDataDSAIllegalContent_0 = require(l_CorePackages_0.Workspace.Packages.DsaIllegalContentReporting).isSelectedDataDSAIllegalContent;
local l_isShowEUDSAIllegalContentReportingLink_0 = require(l_CorePackages_0.Workspace.Packages.DsaIllegalContentReporting).isShowEUDSAIllegalContentReportingLink;
local l_GetFFlagDSAIllegalContentReporting_0 = v3.GetFFlagDSAIllegalContentReporting;
local l_GetFFlagDSAVRSkipFrontendGeoCheck_0 = v3.GetFFlagDSAVRSkipFrontendGeoCheck;
return function(v17) --[[ Line: 32 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useStyle_0 (copy), v1 (copy), l_isSelectedDataDSAIllegalContent_0 (copy), l_GetFFlagDSAVRSkipFrontendGeoCheck_0 (copy), l_GetFFlagDSAIllegalContentReporting_0 (copy), l_isShowEUDSAIllegalContentReportingLink_0 (copy), l_mapTypographyVariantToFontEnum_0 (copy), l_ScrollingListTable_0 (copy), v8 (copy), l_Cell_0 (copy), l_CellHeadDetail_0 (copy), l_StyledTextLabel_0 (copy)
    local v18 = l_useDesignTokens_0();
    local l_selectionData_0 = v17.selectionData;
    local v20 = l_useStyle_0();
    v1.useEffect(function() --[[ Line: 37 ]]
        -- upvalues: v17 (copy)
        v17.onSummaryPageMounted();
    end, {});
    local v21 = false;
    local v22 = false;
    if v17.dsaText ~= nil then
        v22 = l_isSelectedDataDSAIllegalContent_0(v17.selectionData);
    end;
    v21 = if l_GetFFlagDSAVRSkipFrontendGeoCheck_0() then v22 and l_GetFFlagDSAIllegalContentReporting_0() else v22 and l_isShowEUDSAIllegalContentReportingLink_0();
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 460), 
        BackgroundTransparency = v18.Global.Opacity_0
    }, {
        Layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Heading = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v18.Global.Space_600), 
            BackgroundTransparency = v18.Global.Opacity_0
        }, {
            Padding = v1.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v18.Global.Space_200), 
                PaddingBottom = UDim.new(0, v18.Global.Space_200)
            }), 
            Prompt = v1.createElement("TextLabel", {
                Text = v17.heading, 
                Font = l_mapTypographyVariantToFontEnum_0(v18.Semantic.Typography.Subheader), 
                LayoutOrder = 1, 
                TextColor3 = v18.Semantic.Color.Text.Emphasis.Color3, 
                TextTransparency = v18.Semantic.Color.Text.Emphasis.Transparency, 
                TextSize = v18.Semantic.Typography.Subheader.FontSize, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Size = UDim2.new(1, 0, 0, v18.Semantic.Typography.Subheader.FontSize), 
                BackgroundTransparency = v18.Global.Opacity_0
            })
        }), 
        SelectionList = v1.createElement("Frame", {
            LayoutOrder = 2, 
            Size = if v21 then UDim2.new(1, 0, 0, 120) else UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = v18.Global.Opacity_0
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            ListTable = v1.createElement(l_ScrollingListTable_0, {
                cells = v8.map(l_selectionData_0, function(v23) --[[ Line: 94 ]]
                    -- upvalues: v1 (ref), l_Cell_0 (ref), v18 (copy), l_CellHeadDetail_0 (ref), v20 (copy)
                    return v1.createElement(l_Cell_0, {
                        size = UDim2.new(1, 0, 0, v18.Global.Size_800), 
                        head = v1.createElement(l_CellHeadDetail_0, {
                            labelText = v23.heading, 
                            labelTextColor = v20.Theme.TextMuted, 
                            labelTextFont = v20.Font.SubHeader1, 
                            subLabelText = v23.humanReadableText, 
                            subLabelTextColor = v20.Theme.TextEmphasis, 
                            subLabelTextFont = v20.Font.Body
                        }), 
                        userInteractionEnabled = false
                    });
                end)
            })
        }), 
        DSANotice = if v21 then v1.createElement("Frame", {
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, 120), 
            BackgroundTransparency = v18.Global.Opacity_0
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            Content = v1.createElement(l_StyledTextLabel_0, {
                layoutOrder = 2, 
                size = UDim2.new(1, 0, 0, 60), 
                lineHeight = 1, 
                text = v17.dsaText, 
                textXAlignment = Enum.TextXAlignment.Center, 
                textYAlignment = Enum.TextYAlignment.Top, 
                fontStyle = v20.Font.Body, 
                colorStyle = v20.Theme.TextEmphasis, 
                fluidSizing = true, 
                richText = false
            })
        }) else nil
    });
end;