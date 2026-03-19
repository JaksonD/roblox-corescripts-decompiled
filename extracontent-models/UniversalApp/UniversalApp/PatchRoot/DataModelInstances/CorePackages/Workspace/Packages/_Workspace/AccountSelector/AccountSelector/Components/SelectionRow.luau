local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_React_0 = v1.React;
local l_UIBlox_0 = v1.UIBlox;
local l_Cell_0 = l_UIBlox_0.App.Table.Cell;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_useDesignTokens_0 = v1.Style.useDesignTokens;
return function(v10) --[[ Line: 24 ]] --[[ Name: SelectionRow ]]
    -- upvalues: l_useStyle_0 (copy), l_useDesignTokens_0 (copy), l_React_0 (copy), l_StyledTextLabel_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_Cell_0 (copy)
    local v11 = l_useStyle_0();
    local v12 = l_useDesignTokens_0();
    local function v13() --[[ Line: 28 ]] --[[ Name: handleAccountSelection ]]
        -- upvalues: v10 (copy)
        if v10.userInteractionEnabled then
            v10.onAccountSelection();
        end;
    end;
    local function v14() --[[ Line: 34 ]] --[[ Name: renderText ]]
        -- upvalues: l_React_0 (ref), v11 (copy), v12 (copy), v10 (copy), l_StyledTextLabel_0 (ref)
        return l_React_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = v11.Theme.BackgroundContrast.Color, 
            BackgroundTransparency = v12.Global.Opacity_0
        }, {
            VerticalLayout = l_React_0.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            TitleText = if v10.titleContent and v10.titleContent ~= "" then l_React_0.createElement(l_StyledTextLabel_0, {
                text = v10.titleContent, 
                fontStyle = v11.Font.Header2, 
                colorStyle = v11.Theme.TextEmphasis, 
                layoutOrder = 0
            }) else nil, 
            SubtitleText = if v10.subtitleContent and v10.subtitleContent ~= "" then l_React_0.createElement(l_StyledTextLabel_0, {
                text = v10.subtitleContent, 
                fontStyle = v11.Font.Body, 
                colorStyle = v11.Theme.TextEmphasis, 
                layoutOrder = 1
            }) else nil
        });
    end;
    local function v15() --[[ Line: 65 ]] --[[ Name: renderIconComponent ]]
        -- upvalues: v10 (copy), l_React_0 (ref), l_ImageSetLabel_0 (ref), l_Images_0 (ref), v11 (copy)
        if v10.iconKey and v10.iconKey ~= nil then
            return (l_React_0.createElement(l_ImageSetLabel_0, {
                Size = UDim2.fromOffset(28, 28), 
                Image = l_Images_0[v10.iconKey], 
                ImageColor3 = v10.iconColor or v11.Theme.Success.Color, 
                BackgroundTransparency = 1
            }));
        else
            return l_React_0.createElement("Frame", {
                BorderSizePixel = 0
            });
        end;
    end;
    local function v16() --[[ Line: 79 ]] --[[ Name: renderCellHead ]]
        -- upvalues: l_React_0 (ref), v12 (copy), v11 (copy), v10 (copy), v14 (copy)
        return l_React_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = v12.Global.Opacity_0, 
            BorderColor3 = v11.Theme.BackgroundContrast.Color
        }, {
            UIPadding = l_React_0.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 24)
            }), 
            Layout = l_React_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, v12.Global.Space_150)
            }), 
            AvatarThumbnail = v10.renderImage(), 
            Names = v14()
        });
    end;
    return l_React_0.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v12.Global.Size_800), 
        BackgroundTransparency = 1, 
        BackgroundColor3 = v11.Theme.BackgroundContrast.Color, 
        BorderColor3 = v11.Theme.BackgroundContrast.Color
    }, {
        Cell = l_React_0.createElement(l_Cell_0, {
            BorderColor3 = v11.Theme.BackgroundContrast.Color, 
            onActivated = v13, 
            head = v16(), 
            tail = v15(), 
            userInteractionEnabled = v10.userInteractionEnabled, 
            size = UDim2.new(1, 0, 0, v12.Global.Size_800), 
            background = l_React_0.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundColor3 = v11.Theme.BackgroundContrast.Color, 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0
            })
        })
    });
end;