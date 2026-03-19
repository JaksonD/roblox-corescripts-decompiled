local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.React);
local l_ContactList_0 = l_CoreGui_0:WaitForChild("RobloxGui").Modules.ContactList;
local v5 = require(l_ContactList_0.dependencies);
local l_UIBlox_0 = v5.UIBlox;
local l_Colors_0 = l_UIBlox_0.App.Style.Colors;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_useLocalization_0 = v5.Hooks.useLocalization;
local v12 = {
    searchBarHeight = 36, 
    searchText = ""
};
return function(v13) --[[ Line: 35 ]]
    -- upvalues: v2 (copy), v12 (copy), l_useStyle_0 (copy), v3 (copy), l_useLocalization_0 (copy), l_Colors_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy)
    local v14 = v2.Dictionary.join(v12, v13);
    local v15 = l_useStyle_0();
    local l_Font_0 = v15.Font;
    local l_Theme_0 = v15.Theme;
    local v18, v19 = v3.useState(false);
    local v22 = v3.useCallback(function(v20, v21) --[[ Line: 43 ]]
        -- upvalues: v14 (copy)
        if v21 == "Text" then
            v14.onSearchChanged(v20.Text);
        end;
    end, {
        v14.onSearchChanged
    });
    local l_searchFriendsLabel_0 = l_useLocalization_0({
        searchFriendsLabel = "Feature.Call.Prompt.SearchFriends"
    }).searchFriendsLabel;
    return v3.createElement("Frame", {
        Size = UDim2.new(1, -48, 0, v14.searchBarHeight), 
        BackgroundColor3 = l_Theme_0.UIMuted.Color, 
        BackgroundTransparency = l_Theme_0.UIMuted.Transparency, 
        LayoutOrder = v14.layoutOrder
    }, {
        UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, 4)
        }), 
        UICorner = v3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        UIPadding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 12), 
            PaddingRight = UDim.new(0, 12)
        }), 
        UIStroke = v3.createElement("UIStroke", {
            Color = l_Colors_0.Pumice, 
            Thickness = 1
        }), 
        SearchImage = v3.createElement(l_ImageSetLabel_0, {
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            Image = l_Images_0["icons/common/search_small"], 
            ImageColor3 = if v18 then l_Colors_0.White else Color3.fromHex("#696A6B"), 
            Size = UDim2.fromOffset(16, 16)
        }), 
        TextBox = v3.createElement("TextBox", {
            Size = UDim2.new(1, -20, 1, 0), 
            BackgroundTransparency = 1, 
            ClearTextOnFocus = false, 
            ClipsDescendants = true, 
            Font = l_Font_0.Body.Font, 
            LayoutOrder = 2, 
            PlaceholderColor3 = Color3.fromHex("#696A6B"), 
            PlaceholderText = l_searchFriendsLabel_0, 
            Text = v14.searchText, 
            TextColor3 = l_Colors_0.White, 
            TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            [v3.Event.Changed] = v22, 
            [v3.Event.Focused] = function() --[[ Line: 98 ]]
                -- upvalues: v19 (copy), v14 (copy)
                v19(true);
                v14.onFocused();
            end, 
            [v3.Event.FocusLost] = function() --[[ Line: 102 ]]
                -- upvalues: v19 (copy)
                v19(false);
            end
        })
    });
end;