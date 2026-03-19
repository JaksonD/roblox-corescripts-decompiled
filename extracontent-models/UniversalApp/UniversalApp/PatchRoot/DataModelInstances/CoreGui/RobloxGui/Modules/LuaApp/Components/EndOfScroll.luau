local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v2.Style.withStyle;
local l_useSelectionCursor_0 = v2.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v2.App.SelectionImage.CursorKind;
local v6 = require(l_Modules_0.Common.Roact);
local v7 = require(l_Modules_0.LuaApp.Components.LocalizedTextButton);
return function(v8) --[[ Line: 18 ]] --[[ Name: EndOfScroll ]]
    -- upvalues: l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), l_withStyle_0 (copy), v6 (copy), v7 (copy)
    local l_backToTopCallback_0 = v8.backToTopCallback;
    local l_LayoutOrder_0 = v8.LayoutOrder;
    local v11 = l_useSelectionCursor_0(l_CursorKind_0.RoundedRect);
    local v12 = v8.bottomPadding or 0;
    return l_withStyle_0(function(v13) --[[ Line: 25 ]]
        -- upvalues: v6 (ref), v12 (copy), l_LayoutOrder_0 (copy), v7 (ref), l_backToTopCallback_0 (copy), v11 (copy)
        return v6.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 70 + v12), 
            LayoutOrder = l_LayoutOrder_0
        }, {
            BackToTopButton = v6.createElement(v7, {
                Size = UDim2.new(0.5, 0, 0, 30), 
                Position = UDim2.new(0.25, 0, 0, 20), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = "Feature.GamePage.Action.BackToTop", 
                Font = v13.Font.Body.Font, 
                TextSize = v13.Font.BaseSize * v13.Font.Body.RelativeSize, 
                TextColor3 = v13.Theme.TextEmphasis.Color, 
                TextTransparency = v13.Theme.TextEmphasis.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                [v6.Event.Activated] = l_backToTopCallback_0, 
                SelectionImageObject = v11
            })
        });
    end);
end;