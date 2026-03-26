local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local v3 = require(l_script_FirstAncestor_0.dependencies);
local l_React_0 = v3.React;
local l_Dash_0 = v3.Dash;
local l_UIBlox_0 = v3.UIBlox;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_StandardButtonSize_0 = l_UIBlox_0.App.Button.Enum.StandardButtonSize;
local l_Colors_0 = l_UIBlox_0.App.Style.Colors;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_useLocalization_0 = v3.Hooks.useLocalization;
local v16 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_AppFonts_0 = require(l_Parent_0.Style).AppFonts;
local l_Image_0 = require(l_Parent_0.Foundation).Image;
local v19 = require(l_Parent_0.FoundationCloudAssets);
local l_Assets_0 = v19.Assets;
local l_preloadAsset_0 = v19.preloadAsset;
local v22 = game:DefineFastFlag("MigrateNoFriendsViewToFoundation", false);
local v23 = {
    layoutOrder = 0, 
    pageLoadingTimeReport = nil, 
    pageRenderReport = nil, 
    openAddFriendsPage = l_Dash_0.noop, 
    addFriendsBtnLabelKey = if l_FFlagConnectionsToFriendsRename_0 then v16.ADD_FRIENDS_BTN else v16.ADD_CONNECTIONS_BTN, 
    noFriendsTextLabelKey = if l_FFlagConnectionsToFriendsRename_0 then v16.NO_FRIENDS_TEXT else v16.NO_CONNECTIONS_TEXT, 
    addFriendsBtnEnabled = true
};
local function _(v24) --[[ Line: 64 ]] --[[ Name: loadFoundationCloudAsset ]]
    -- upvalues: l_preloadAsset_0 (copy), l_Assets_0 (copy)
    l_preloadAsset_0(v24);
    local v25 = l_Assets_0[v24];
    return v25.assetId, v25.size;
end;
return function(v27) --[[ Line: 70 ]] --[[ Name: NoFriendsView ]]
    -- upvalues: l_Dash_0 (copy), v23 (copy), v22 (copy), l_preloadAsset_0 (copy), l_Assets_0 (copy), l_React_0 (copy), l_useLocalization_0 (copy), l_useStyle_0 (copy), l_Image_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_Colors_0 (copy), l_StyledTextLabel_0 (copy), l_AppFonts_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_StandardButtonSize_0 (copy)
    local v28 = l_Dash_0.join(v23, v27 or {});
    local v29 = v22 and "pictograms/collaborators" or nil;
    local v30 = nil;
    local v31 = nil;
    if v22 then
        l_preloadAsset_0(v29);
        local v32 = l_Assets_0[v29];
        local l_assetId_0 = v32.assetId;
        local l_size_0 = v32.size;
        v30 = l_assetId_0;
        v31 = l_size_0;
    end;
    local v35 = if v22 then v31 / 3 else nil;
    l_React_0.useEffect(function() --[[ Line: 83 ]]
        -- upvalues: v28 (copy)
        if v28.pageLoadingTimeReport then
            v28.pageLoadingTimeReport();
        end;
        if v28.pageRenderReport then
            v28.pageRenderReport();
        end;
    end, {});
    local v36 = l_useLocalization_0({
        addFriendsBtn = v28.addFriendsBtnLabelKey, 
        noFriendsText = v28.noFriendsTextLabelKey, 
        noFriendsHeader = v28.noFriendsHeaderKey
    });
    local v37 = l_useStyle_0();
    return l_React_0.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        LayoutOrder = v28.layoutOrder, 
        BackgroundTransparency = 1
    }, {
        IndicatorInner = l_React_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            SidePadding = l_React_0.createElement("UIPadding", {
                PaddingRight = UDim.new(0, 30), 
                PaddingLeft = UDim.new(0, 30)
            }), 
            UIList = l_React_0.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, 15)
            }), 
            Imagelabel = if v22 then l_React_0.createElement(l_Image_0, {
                Image = v30, 
                Size = UDim2.fromOffset(v35.X, v35.Y), 
                LayoutOrder = 1
            }) else l_React_0.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = l_Images_0["icons/graphic/findfriends_xlarge"], 
                ImageColor3 = l_Colors_0.White, 
                LayoutOrder = 1, 
                Size = UDim2.fromOffset(96, 96)
            }), 
            Headerlabel = if v28.noFriendsHeaderKey and v36.noFriendsHeader then l_React_0.createElement(l_StyledTextLabel_0, {
                text = v36.noFriendsHeader, 
                fontStyle = v37.Font.Header1, 
                colorStyle = v37.Theme.TextEmphasis, 
                automaticSize = Enum.AutomaticSize.Y, 
                size = UDim2.new(1, 0, 0, 0), 
                textXAlignment = Enum.TextXAlignment.Center, 
                textYAlignment = Enum.TextYAlignment.Center, 
                layoutOrder = 2
            }) else nil, 
            Textlabel = l_React_0.createElement("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextWrapped = true, 
                BackgroundTransparency = 1, 
                Font = l_AppFonts_0.default:getDefault(), 
                LayoutOrder = 3, 
                Size = UDim2.new(1, 0, 0, 0), 
                Text = v36.noFriendsText, 
                TextColor3 = v37.Theme.TextMuted.Color, 
                TextSize = v37.Font.Header2.RelativeSize * v37.Font.BaseSize, 
                TextTransparency = v37.Theme.TextMuted.Transparency
            }), 
            Padding = l_React_0.createElement("Frame", {
                LayoutOrder = 4, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 0, 0, 10)
            }), 
            AddFriendsButton = v28.addFriendsBtnEnabled and l_React_0.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.PrimarySystem, 
                layoutOrder = 5, 
                text = v36.addFriendsBtn, 
                standardSize = l_StandardButtonSize_0.Regular, 
                onActivated = v28.openAddFriendsPage
            })
        })
    });
end;