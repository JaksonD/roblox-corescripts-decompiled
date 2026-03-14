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
local v20 = l_Roact_0.PureComponent:extend("EmptyResultsView");
v20.defaultProps = {
    layoutOrder = 0, 
    pageLoadingTimeReport = nil
};
local function _(v21) --[[ Line: 44 ]] --[[ Name: loadFoundationCloudAsset ]]
    -- upvalues: l_preloadAsset_0 (copy), l_Assets_0 (copy)
    l_preloadAsset_0(v21);
    local v22 = l_Assets_0[v21];
    return v22.assetId, v22.size;
end;
v20.render = function(v24) --[[ Line: 50 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withLocalization_0 (copy), v9 (copy), l_Roact_0 (copy), v10 (copy), v19 (copy), l_Image_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_AppFonts_0 (copy)
    return l_withStyle_0(function(v25) --[[ Line: 51 ]]
        -- upvalues: l_withLocalization_0 (ref), v9 (ref), l_Roact_0 (ref), v10 (ref), v24 (copy), v19 (ref), l_Image_0 (ref), l_ImageSetLabel_0 (ref), l_Images_0 (ref), l_AppFonts_0 (ref)
        return l_withLocalization_0({
            noResultsText = "CommonUI.Messages.Response.NoResults", 
            addFriendsBtn = v9.ADD_CONNECTIONS_BTN
        })(function(v26) --[[ Line: 55 ]]
            -- upvalues: l_Roact_0 (ref), v10 (ref), v24 (ref), v19 (ref), l_Image_0 (ref), l_ImageSetLabel_0 (ref), l_Images_0 (ref), v25 (copy), l_AppFonts_0 (ref)
            return l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, -(v10.TOP_BAR_HEIGHT + 45)), 
                LayoutOrder = v24.props.layoutOrder, 
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
                        Image = v24.props.assetId, 
                        Size = UDim2.fromOffset(v24.props.assetSize.X, v24.props.assetSize.Y), 
                        LayoutOrder = 1
                    }) else l_Roact_0.createElement(l_ImageSetLabel_0, {
                        BackgroundTransparency = 1, 
                        Image = l_Images_0["icons/status/oof_xlarge"], 
                        ImageColor3 = v25.Theme.TextMuted.Color, 
                        ImageTransparency = v25.Theme.TextMuted.Transparency, 
                        LayoutOrder = 1, 
                        Size = UDim2.new(0, 96, 0, 96)
                    }), 
                    Textlabel = l_Roact_0.createElement("TextLabel", {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        Font = l_AppFonts_0.default:getDefault(), 
                        LayoutOrder = 2, 
                        Size = UDim2.new(0, 0, 0, 0), 
                        Text = v26.noResultsText, 
                        TextColor3 = v25.Theme.TextMuted.Color, 
                        TextSize = v25.Font.Header2.RelativeSize * v25.Font.BaseSize, 
                        TextTransparency = v25.Theme.TextMuted.Transparency
                    })
                })
            });
        end);
    end);
end;
local function v32(v27) --[[ Line: 106 ]] --[[ Name: EmptyResultsViewContainer ]]
    -- upvalues: l_preloadAsset_0 (copy), l_Assets_0 (copy), l_useTokens_0 (copy), l_Roact_0 (copy), v20 (copy), v12 (copy)
    l_preloadAsset_0("pictograms/collaborators");
    local v28 = l_Assets_0["pictograms/collaborators"];
    local l_assetId_0 = v28.assetId;
    local l_size_0 = v28.size;
    v28 = l_useTokens_0();
    local v31 = l_size_0 / 3;
    return l_Roact_0.createElement(v20, v12.Dictionary.join(v27, {
        assetSize = v31, 
        assetId = l_assetId_0, 
        tokens = v28
    }));
end;
if v19 then
    return v32;
else
    return v20;
end;