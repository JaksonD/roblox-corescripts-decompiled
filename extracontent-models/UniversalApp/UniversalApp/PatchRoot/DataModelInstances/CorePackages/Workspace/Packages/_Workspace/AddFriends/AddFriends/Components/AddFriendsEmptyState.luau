local l_Parent_0 = script:FindFirstAncestor("AddFriends").Parent;
local v1 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.FoundationCloudAssets);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v6 = game:DefineFastFlag("AddFriendsFixText", false);
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local l_Assets_0 = v4.Assets;
v4.preloadAsset("pictograms/collaborators");
local v9 = l_Assets_0["pictograms/collaborators"] or {};
return function(v10) --[[ Line: 26 ]] --[[ Name: AddFriendsEmptyState ]]
    -- upvalues: l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), v6 (copy), l_useTokens_0 (copy), v1 (copy), v3 (copy), v9 (copy)
    local v11 = l_useLocalization_0({
        titleText = l_FFlagConnectionsToFriendsRename_0 and "Feature.AddFriends.Title.AddFriendsToolTip" or "Feature.AddFriends.Title.AddConnectionsToolTip", 
        emptyStatePromptText = if v6 then nil else l_FFlagConnectionsToFriendsRename_0 and "Feature.AddFriends.Label.EmptyState.FriendsRename" or "Feature.AddFriends.Label.EmptyState", 
        emptyStateBodyText = if v6 then {
            l_FFlagConnectionsToFriendsRename_0 and "Feature.AddFriends.Text.EmptyState.FriendsRename" or "Feature.AddFriends.Text.EmptyState"; 
            lineBreak = "\n"
        } else nil
    });
    local v12 = l_useTokens_0();
    local v13 = 180 * v12.Config.UI.Scale;
    local v14 = 320 * v12.Config.UI.Scale;
    return v1.createElement(v3.View, {
        tag = "size-full-0 auto-y col align-x-center", 
        LayoutOrder = v10.layoutOrder
    }, {
        Icon = v1.createElement(v3.Image, {
            LayoutOrder = 1, 
            Image = v9.assetId, 
            imageStyle = v12.Color.Content.Emphasis, 
            ScaleType = Enum.ScaleType.Fit, 
            Size = UDim2.new(0, v14, 0, v13), 
            tag = "position-top-center anchor-top-center"
        }), 
        TextTitle = v1.createElement(v3.Text, {
            LayoutOrder = 2, 
            tag = "auto-y size-full-0 padding-bottom-small text-heading-small content-emphasis", 
            Text = v11.titleText
        }), 
        TextBody = v1.createElement(v3.Text, {
            LayoutOrder = 3, 
            tag = "auto-y size-full-0 text-body-medium", 
            Text = if v6 then v11.emptyStateBodyText else v11.emptyStatePromptText
        })
    });
end;