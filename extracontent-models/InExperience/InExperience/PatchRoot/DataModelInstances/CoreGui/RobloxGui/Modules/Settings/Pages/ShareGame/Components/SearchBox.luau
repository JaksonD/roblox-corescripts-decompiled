local l_CorePackages_0 = game:GetService("CorePackages");
local l_FFlagConnectionsToFriendsRename_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagConnectionsToFriendsRename;
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_RobloxGui_0.Modules.Settings.Pages.ShareGame.Constants);
local v5 = v3.Component:extend("SearchBox");
local v6 = require(l_RobloxGui_0.Modules.Settings.Pages.ShareGame.Spritesheets.ShareGameIcons);
local l_v6_ImagePath_0 = v6:GetImagePath();
local l_v6_Frame_0 = v6:GetFrame("search_border");
local v9 = Rect.new(3, 3, 4, 4);
local l_v6_Frame_1 = v6:GetFrame("search_small");
local l_v6_Frame_2 = v6:GetFrame("clear");
local l_ShareGame_0 = l_RobloxGui_0.Modules.Settings.Pages.ShareGame;
local v13 = require(l_RobloxGui_0.Modules.Settings.Theme);
local v14 = require(l_ShareGame_0.getTranslator)();
v5.init = function(v15) --[[ Line: 40 ]] --[[ Name: init ]]
    v15.state = {
        isTextWritten = false
    };
    v15.searchField = nil;
end;
v5.render = function(v16) --[[ Line: 47 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), l_v6_ImagePath_0 (copy), l_v6_Frame_0 (copy), v9 (copy), l_v6_ImagePath_0 (copy), l_v6_Frame_1 (copy), v4 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), v14 (copy), v13 (copy), l_v6_ImagePath_0 (copy), l_v6_Frame_2 (copy)
    local l_anchorPoint_0 = v16.props.anchorPoint;
    local l_onTextBoxFocusLost_0 = v16.props.onTextBoxFocusLost;
    local l_onTextBoxFocused_0 = v16.props.onTextBoxFocused;
    local l_position_0 = v16.props.position;
    local l_searchFieldRef_0 = v16.props.searchFieldRef;
    local l_size_0 = v16.props.size;
    local l_visible_0 = v16.props.visible;
    local l_zIndex_0 = v16.props.zIndex;
    local l_isTextWritten_0 = v16.state.isTextWritten;
    return v3.createElement("ImageLabel", {
        BackgroundTransparency = 1, 
        AnchorPoint = l_anchorPoint_0, 
        Position = l_position_0, 
        Size = l_size_0, 
        Visible = l_visible_0, 
        Image = l_v6_ImagePath_0, 
        ImageRectOffset = l_v6_Frame_0.offset, 
        ImageRectSize = l_v6_Frame_0.size, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = v9, 
        ZIndex = l_zIndex_0
    }, {
        UIPadding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 8), 
            PaddingRight = UDim.new(0, 8), 
            PaddingTop = UDim.new(0, 6), 
            PaddingBottom = UDim.new(0, 6)
        }), 
        SearchIcon = v3.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Image = l_v6_ImagePath_0, 
            ImageRectOffset = l_v6_Frame_1.offset, 
            ImageRectSize = l_v6_Frame_1.size, 
            Size = UDim2.new(0, 16, 0, 16), 
            ZIndex = l_zIndex_0
        }), 
        SearchField = v3.createElement("TextBox", {
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 28, 0.5, 0), 
            Size = UDim2.new(1, -56, 1, 0), 
            ClearTextOnFocus = false, 
            PlaceholderColor3 = v4.Color.GRAY3, 
            PlaceholderText = if l_FFlagConnectionsToFriendsRename_0 then v14:FormatByKey("Feature.SettingsHub.Label.SearchForFriendsPlaceholder.FriendsRename") else v14:FormatByKey("Feature.SettingsHub.Label.SearchForFriendsPlaceholder"), 
            Text = "", 
            TextColor3 = v4.Color.WHITE, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextSize = v13.textSize(16), 
            Font = v13.font(Enum.Font.SourceSans), 
            ZIndex = l_zIndex_0, 
            [v3.Ref] = function(v26) --[[ Line: 102 ]]
                -- upvalues: v16 (copy), l_searchFieldRef_0 (copy)
                v16.searchField = v26;
                if l_searchFieldRef_0 then
                    l_searchFieldRef_0(v26);
                end;
            end, 
            [v3.Event.Focused] = function() --[[ Line: 111 ]]
                -- upvalues: l_onTextBoxFocused_0 (copy)
                if l_onTextBoxFocused_0 then
                    l_onTextBoxFocused_0();
                end;
            end, 
            [v3.Event.FocusLost] = function(v27) --[[ Line: 116 ]]
                -- upvalues: l_onTextBoxFocusLost_0 (copy)
                if l_onTextBoxFocusLost_0 then
                    l_onTextBoxFocusLost_0(v27.Text);
                end;
            end
        }), 
        ClearButton = v3.createElement("ImageButton", {
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(1, 0), 
            Position = UDim2.new(1, 0, 0, 0), 
            Size = UDim2.new(0, 16, 0, 16), 
            Image = l_v6_ImagePath_0, 
            ImageRectOffset = l_v6_Frame_2.offset, 
            ImageRectSize = l_v6_Frame_2.size, 
            ZIndex = l_zIndex_0, 
            Visible = l_isTextWritten_0, 
            [v3.Event.Activated] = function() --[[ Line: 132 ]]
                -- upvalues: v16 (copy)
                if v16.searchField then
                    v16.searchField.Text = "";
                    v16.searchField:CaptureFocus();
                end;
            end
        })
    });
end;
v5.didMount = function(v28) --[[ Line: 145 ]] --[[ Name: didMount ]]
    local l_searchField_0 = v28.searchField;
    local l_onTextChanged_0 = v28.props.onTextChanged;
    if l_searchField_0 then
        v28.textBoxChangedConnection = l_searchField_0:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 150 ]]
            -- upvalues: l_searchField_0 (copy), v28 (copy), l_onTextChanged_0 (copy)
            local l_Text_0 = l_searchField_0.Text;
            v28:setState({
                isTextWritten = l_Text_0:len() > 0
            });
            l_onTextChanged_0(l_Text_0);
        end);
    end;
end;
v5.willUnmount = function(v32) --[[ Line: 160 ]] --[[ Name: willUnmount ]]
    if v32.textBoxChangedConnection then
        v32.textBoxChangedConnection:Disconnect();
    end;
end;
return v5;