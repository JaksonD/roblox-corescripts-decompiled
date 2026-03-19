local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Localization);
local v3 = require(l_Parent_0.RobloxAppHooks);
local v4 = require(l_Parent_0.UIBlox);
local l_StyledTextLabel_0 = v4.App.Text.StyledTextLabel;
local l_useLocalization_0 = v2.Hooks.useLocalization;
local l_useScreenSize_0 = v3.useScreenSize;
local l_useStyle_0 = v4.Core.Style.useStyle;
return function(v9) --[[ Line: 20 ]]
    -- upvalues: l_useScreenSize_0 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), v1 (copy), l_StyledTextLabel_0 (copy)
    local v10 = l_useScreenSize_0();
    local v11 = l_useStyle_0();
    local v12 = l_useLocalization_0({
        postsNotFound = "Feature.ContentFeed.Body.PostsNotFound"
    });
    return v1.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        LayoutOrder = v9.layoutOrder, 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = UDim2.new(1, 0, 0, v10.Y)
    }, {
        NotFoundMessage = v1.createElement(l_StyledTextLabel_0, {
            fluidSizing = false, 
            fontStyle = v11.Font.Header1, 
            colorStyle = v11.Theme.TextEmphasis, 
            layoutOrder = 1, 
            size = UDim2.fromScale(1, 1), 
            text = v12.postsNotFound, 
            textTruncate = Enum.TextTruncate.AtEnd, 
            textXAlignment = Enum.TextXAlignment.Center, 
            textYAlignment = Enum.TextYAlignment.Center
        })
    });
end;