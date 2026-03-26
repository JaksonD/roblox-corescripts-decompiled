local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v2.Roact;
local l_withLocalization_0 = v2.withLocalization;
local l_UIBlox_0 = v2.UIBlox;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v9 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v10 = require(l_script_FirstAncestor_0.Common.Constants);
local l_AppFonts_0 = require(l_Parent_0.Style).AppFonts;
local v12 = require(l_Parent_0.Cryo);
local v13 = require(l_Parent_0.Foundation);
local l_Image_0 = v13.Image;
local l_useTokens_0 = v13.Hooks.useTokens;
local v16 = require(l_Parent_0.FoundationCloudAssets);
local l_Assets_0 = v16.Assets;
local l_preloadAsset_0 = v16.preloadAsset;
local v19 = game:DefineFastFlag("MigrateEmptyResultsViewToFoundation", false);
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local v21 = l_Roact_0.PureComponent:extend("EmptyResultsView");
v21.defaultProps = {
    layoutOrder = 0, 
    pageLoadingTimeReport = nil
};
local function _(v22) --[[ Line: 45 ]] --[[ Name: loadFoundationCloudAsset ]]
    -- upvalues: l_preloadAsset_0 (copy), l_Assets_0 (copy)
    l_preloadAsset_0(v22);
    local v23 = l_Assets_0[v22];
    return v23.assetId, v23.size;
end;
v21.render = function(v25) --[[ Line: 51 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), v9 (copy), l_Roact_0 (copy), v10 (copy), v19 (copy), l_Image_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_AppFonts_0 (copy)
    return l_withStyle_0(function(v26) --[[ Line: 52 ]]
        -- upvalues: l_withLocalization_0 (ref), l_FFlagConnectionsToFriendsRename_0 (ref), v9 (ref), l_Roact_0 (ref), v10 (ref), v25 (copy), v19 (ref), l_Image_0 (ref), l_ImageSetLabel_0 (ref), l_Images_0 (ref), l_AppFonts_0 (ref)
        return l_withLocalization_0({
            noResultsText = "CommonUI.Messages.Response.NoResults", 
            addFriendsBtn = if l_FFlagConnectionsToFriendsRename_0 then v9.ADD_FRIENDS_BTN else v9.ADD_CONNECTIONS_BTN
        })(function(v27) --[[ Line: 58 ]]
            -- upvalues: l_Roact_0 (ref), v10 (ref), v25 (ref), v19 (ref), l_Image_0 (ref), l_ImageSetLabel_0 (ref), l_Images_0 (ref), v26 (copy), l_AppFonts_0 (ref)
            return l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, -(v10.TOP_BAR_HEIGHT + 45)), 
                LayoutOrder = v25.props.layoutOrder, 
                BackgroundTransparency = 1
            }, {
                IndicatorInner = l_Roact_0.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Size = UDim2.new(0, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(0.5, 0, 0.4, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.4)
                }, {
                    UIList = l_Roact_0.createElement("UIListLayout", {
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = UDim.new(0, 0)
                    }), 
                    Imagelabel = if v19 then l_Roact_0.createElement(l_Image_0, {
                        Image = v25.props.assetId, 
                        Size = UDim2.fromOffset(v25.props.assetSize.X, v25.props.assetSize.Y), 
                        LayoutOrder = 1
                    }) else l_Roact_0.createElement(l_ImageSetLabel_0, {
                        BackgroundTransparency = 1, 
                        Image = l_Images_0["icons/status/oof_xlarge"], 
                        ImageColor3 = v26.Theme.TextMuted.Color, 
                        ImageTransparency = v26.Theme.TextMuted.Transparency, 
                        LayoutOrder = 1, 
                        Size = UDim2.new(0, 96, 0, 96)
                    }), 
                    Textlabel = l_Roact_0.createElement("TextLabel", {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        Font = l_AppFonts_0.default:getDefault(), 
                        LayoutOrder = 2, 
                        Size = UDim2.new(0, 0, 0, 0), 
                        Text = v27.noResultsText, 
                        TextColor3 = v26.Theme.TextMuted.Color, 
                        TextSize = v26.Font.Header2.RelativeSize * v26.Font.BaseSize, 
                        TextTransparency = v26.Theme.TextMuted.Transparency
                    })
                })
            });
        end);
    end);
end;
local function v33(v28) --[[ Line: 109 ]] --[[ Name: EmptyResultsViewContainer ]]
    -- upvalues: l_preloadAsset_0 (copy), l_Assets_0 (copy), l_useTokens_0 (copy), l_Roact_0 (copy), v21 (copy), v12 (copy)
    l_preloadAsset_0("pictograms/collaborators");
    local v29 = l_Assets_0["pictograms/collaborators"];
    local l_assetId_0 = v29.assetId;
    local l_size_0 = v29.size;
    v29 = l_useTokens_0();
    local v32 = l_size_0 / 3;
    return l_Roact_0.createElement(v21, v12.Dictionary.join(v28, {
        assetSize = v32, 
        assetId = l_assetId_0, 
        tokens = v29
    }));
end;
if v19 then
    return v33;
else
    return v21;
end;