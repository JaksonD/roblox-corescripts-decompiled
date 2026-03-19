local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_useCursor_0 = v2.App.SelectionCursor.useCursor;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_FFlagChatLineReportingFocusFixesEnabled_0 = require(l_Parent_0.SharedFlags).FFlagChatLineReportingFocusFixesEnabled;
local v6 = game:DefineFastFlag("AddBackgroundTransparencyToAbuseReportCommentTextField", false);
return function(v7) --[[ Line: 27 ]] --[[ Name: CommentTextField ]]
    -- upvalues: v1 (copy), l_FFlagChatLineReportingFocusFixesEnabled_0 (copy), l_useCursor_0 (copy), l_useStyle_0 (copy), v6 (copy)
    local v8, v9 = v1.useState("");
    local v10 = if l_FFlagChatLineReportingFocusFixesEnabled_0 then l_useCursor_0() else nil;
    local v11 = l_useStyle_0();
    local l_Font_0 = v11.Font.Body.Font;
    local l_BaseSize_0 = v11.Font.BaseSize;
    local l_Theme_0 = v11.Theme;
    local v17 = v1.useCallback(function(v15) --[[ Line: 35 ]]
        -- upvalues: v9 (copy), v7 (copy), v8 (copy)
        local l_Text_0 = v15.Text;
        if v15.TextFits then
            v9(l_Text_0);
            v7.onUpdate(l_Text_0);
            return;
        else
            v15.Text = v8;
            return;
        end;
    end);
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 60), 
        BackgroundTransparency = if v6 then if v7.backgroundTransparency ~= nil then v7.backgroundTransparency else v11.Theme.BackgroundDefault.Transparency else v11.Theme.BackgroundDefault.Transparency, 
        BackgroundColor3 = v7.backgroundColor3 or v11.Theme.BackgroundDefault.Color, 
        LayoutOrder = v7.layoutOrder, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        UIPadding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 10), 
            PaddingRight = UDim.new(0, 10), 
            PaddingTop = UDim.new(0, 10), 
            PaddingBottom = UDim.new(0, 10)
        }), 
        UICorner = v1.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        CommentField = v1.createElement("TextBox", {
            Size = UDim2.new(1, 0, 0, 40), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Position = UDim2.new(0, 0, 0, 0), 
            AnchorPoint = Vector2.new(0, 0), 
            BackgroundColor3 = v7.backgroundColor3 or l_Theme_0.BackgroundDefault.Color, 
            PlaceholderText = v7.placeholderText, 
            Font = l_Font_0, 
            SelectionImageObject = v10, 
            Text = v7.text, 
            TextSize = l_BaseSize_0, 
            TextColor3 = l_Theme_0.TextDefault.Color, 
            TextTransparency = l_Theme_0.TextDefault.Transparency, 
            TextXAlignment = v7.textXAlignment or Enum.TextXAlignment.Left, 
            TextYAlignment = v7.textYAlignment or Enum.TextYAlignment.Top, 
            BackgroundTransparency = v6 and 1 or l_Theme_0.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            LayoutOrder = 1, 
            RichText = false, 
            MultiLine = true, 
            TextWrapped = true, 
            TextTruncate = Enum.TextTruncate.SplitWord, 
            ClearTextOnFocus = false, 
            OverlayNativeInput = true, 
            ClipsDescendants = true, 
            Interactable = v7.interactable, 
            [v1.Change.Text] = v17
        })
    });
end;