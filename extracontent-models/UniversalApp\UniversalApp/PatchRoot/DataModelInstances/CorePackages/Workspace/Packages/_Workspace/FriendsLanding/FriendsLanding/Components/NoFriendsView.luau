local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_React_0 = v2.React;
local l_Dash_0 = v2.Dash;
local l_UIBlox_0 = v2.UIBlox;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_StandardButtonSize_0 = l_UIBlox_0.App.Button.Enum.StandardButtonSize;
local l_Colors_0 = l_UIBlox_0.App.Style.Colors;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_useLocalization_0 = v2.Hooks.useLocalization;
local v15 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_AppFonts_0 = require(l_Parent_0.Style).AppFonts;
local l_Image_0 = require(l_Parent_0.Foundation).Image;
local v18 = require(l_Parent_0.FoundationCloudAssets);
local l_Assets_0 = v18.Assets;
local l_preloadAsset_0 = v18.preloadAsset;
local v21 = game:DefineFastFlag("MigrateNoFriendsViewToFoundation", false);
local v22 = {
    layoutOrder = 0, 
    pageLoadingTimeReport = nil, 
    pageRenderReport = nil, 
    openAddFriendsPage = l_Dash_0.noop, 
    addFriendsBtnLabelKey = v15.ADD_CONNECTIONS_BTN, 
    noFriendsTextLabelKey = v15.NO_CONNECTIONS_TEXT, 
    addFriendsBtnEnabled = true
};
local function _(v23) --[[ Line: 59 ]] --[[ Name: loadFoundationCloudAsset ]]
    -- upvalues: l_preloadAsset_0 (copy), l_Assets_0 (copy)
    l_preloadAsset_0(v23);
    local v24 = l_Assets_0[v23];
    return v24.assetId, v24.size;
end;
return function(v26) --[[ Line: 65 ]] --[[ Name: NoFriendsView ]]
    -- upvalues: l_Dash_0 (copy), v22 (copy), v21 (copy), l_preloadAsset_0 (copy), l_Assets_0 (copy), l_React_0 (copy), l_useLocalization_0 (copy), l_useStyle_0 (copy), l_Image_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_Colors_0 (copy), l_StyledTextLabel_0 (copy), l_AppFonts_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_StandardButtonSize_0 (copy)
    local v27 = l_Dash_0.join(v22, v26 or {});
    local v28 = v21 and "pictograms/collaborators" or nil;
    local v29 = nil;
    local v30 = nil;
    if v21 then
        l_preloadAsset_0(v28);
        local v31 = l_Assets_0[v28];
        local l_assetId_0 = v31.assetId;
        local l_size_0 = v31.size;
        v29 = l_assetId_0;
        v30 = l_size_0;
    end;
    local v34 = if v21 then v30 / 3 else nil;
    l_React_0.useEffect(function() --[[ Line: 78 ]]
        -- upvalues: v27 (copy)
        if v27.pageLoadingTimeReport then
            v27.pageLoadingTimeReport();
        end;
        if v27.pageRenderReport then
            v27.pageRenderReport();
        end;
    end, {});
    local v35 = l_useLocalization_0({
        addFriendsBtn = v27.addFriendsBtnLabelKey, 
        noFriendsText = v27.noFriendsTextLabelKey, 
        noFriendsHeader = v27.noFriendsHeaderKey
    });
    local v36 = l_useStyle_0();
    return l_React_0.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        LayoutOrder = v27.layoutOrder, 
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
            Imagelabel = if v21 then l_React_0.createElement(l_Image_0, {
                Image = v29, 
                Size = UDim2.fromOffset(v34.X, v34.Y), 
                LayoutOrder = 1
            }) else l_React_0.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = l_Images_0["icons/graphic/findfriends_xlarge"], 
                ImageColor3 = l_Colors_0.White, 
                LayoutOrder = 1, 
                Size = UDim2.fromOffset(96, 96)
            }), 
            Headerlabel = if v27.noFriendsHeaderKey and v35.noFriendsHeader then l_React_0.createElement(l_StyledTextLabel_0, {
                text = v35.noFriendsHeader, 
                fontStyle = v36.Font.Header1, 
                colorStyle = v36.Theme.TextEmphasis, 
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
                Text = v35.noFriendsText, 
                TextColor3 = v36.Theme.TextMuted.Color, 
                TextSize = v36.Font.Header2.RelativeSize * v36.Font.BaseSize, 
                TextTransparency = v36.Theme.TextMuted.Transparency
            }), 
            Padding = l_React_0.createElement("Frame", {
                LayoutOrder = 4, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 0, 0, 10)
            }), 
            AddFriendsButton = v27.addFriendsBtnEnabled and l_React_0.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.PrimarySystem, 
                layoutOrder = 5, 
                text = v35.addFriendsBtn, 
                standardSize = l_StandardButtonSize_0.Regular, 
                onActivated = v27.openAddFriendsPage
            })
        })
    });
end;