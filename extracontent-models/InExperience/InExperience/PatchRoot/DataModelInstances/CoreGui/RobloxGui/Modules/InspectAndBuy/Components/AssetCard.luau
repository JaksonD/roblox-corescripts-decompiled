local l_CorePackages_0 = game:GetService("CorePackages");
local l_Parent_0 = script.Parent.Parent;
local l_Images_0 = require(l_CorePackages_0.Packages.UIBlox).App.ImageSet.Images;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local v6 = require(l_Parent_0.Colors);
local v7 = require(l_Parent_0.Constants);
local v8 = require(l_Parent_0.Actions.SetDetailsInformation);
local v9 = require(l_Parent_0.getSelectionImageObjectRegular);
local v10 = require(l_Parent_0.Components.InspectAndBuyContext);
local v11 = require(l_Parent_0.Components.LimitedLabel);
local v12 = require(l_Parent_0.UtilityFunctions);
local v13 = require(l_Parent_0.Flags.GetFFlagDisplayCollectiblesIcon);
local v14 = require(l_Parent_0.Flags.GetFFlagIBEnableCollectiblesSystemSupport);
local v15 = v3.Component:extend("AssetCard");
v15.init = function(v16) --[[ Line: 24 ]] --[[ Name: init ]]
    -- upvalues: v9 (copy)
    v16.selectedImage = v9();
end;
v15.render = function(v17) --[[ Line: 28 ]] --[[ Name: render ]]
    -- upvalues: l_Images_0 (copy), v3 (copy), v10 (copy), v13 (copy), v12 (copy), v14 (copy), v7 (copy), v6 (copy), l_AppFonts_0 (copy), v11 (copy)
    local l_view_0 = v17.props.view;
    local l_equipped_0 = v17.props.equipped;
    local l_assetInfo_0 = v17.props.assetInfo;
    local l_openDetails_0 = v17.props.openDetails;
    local l_assetCardSizeX_0 = v17.props.assetCardSizeX;
    local v23 = l_Images_0["icons/status/item/limited"];
    local v24 = v23 and v23.ImageRectSize / l_Images_0.ImagesResolutionScale or Vector2.new(0, 0);
    return v3.createElement(v10.Consumer, {
        render = function(v25) --[[ Line: 38 ]] --[[ Name: render ]]
            -- upvalues: l_view_0 (copy), v13 (ref), v12 (ref), l_assetInfo_0 (copy), v14 (ref), v7 (ref), v24 (copy), v3 (ref), v6 (ref), v17 (copy), l_openDetails_0 (copy), l_assetCardSizeX_0 (copy), l_AppFonts_0 (ref), l_equipped_0 (copy), v11 (ref)
            local v26 = v25[l_view_0];
            local v27 = v13() and v12.isCollectibles(l_assetInfo_0);
            local v28 = nil;
            local v29 = nil;
            local v30 = nil;
            if v14() then
                v28 = v12.hasLimitedQuantity(l_assetInfo_0);
                v29 = v12.isLimited1Point0_LimitedUnique(l_assetInfo_0) or v12.isLimited2Point0_Or_LimitedCollectible(l_assetInfo_0);
                local v31 = if v29 then v7.LimitedIconFrameSizeXOffset * 2 else v7.LimitedIconFrameSizeXOffset;
                v30 = UDim2.new(0, v24.X + v31, 0, v24.Y + v7.LimitedIconFrameSizeYOffset);
            end;
            return v3.createElement("ImageButton", {
                BackgroundTransparency = 0, 
                BorderSizePixel = 0, 
                BackgroundColor3 = v6.Gray2, 
                Selectable = true, 
                SelectionImageObject = v17.selectedImage, 
                [v3.Event.Activated] = function() --[[ Line: 66 ]]
                    -- upvalues: l_openDetails_0 (ref), l_assetInfo_0 (ref)
                    l_openDetails_0(l_assetInfo_0.assetId);
                end
            }, {
                AssetThumbnail = v3.createElement("ImageButton", {
                    Size = UDim2.new(1, 0, 0, l_assetCardSizeX_0), 
                    BackgroundTransparency = 0, 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v6.Graphite, 
                    Selectable = false, 
                    AutoButtonColor = false, 
                    Image = "rbxthumb://type=Asset&id=" .. l_assetInfo_0.assetId .. "&w=150&h=150", 
                    [v3.Event.Activated] = function() --[[ Line: 78 ]]
                        -- upvalues: l_openDetails_0 (ref), l_assetInfo_0 (ref)
                        l_openDetails_0(l_assetInfo_0.assetId);
                    end
                }), 
                AssetNameBackground = v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, -l_assetCardSizeX_0), 
                    Position = UDim2.new(0, 0, 0, l_assetCardSizeX_0), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = Color3.fromRGB(44, 45, 47)
                }, {
                    AssetName = v3.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, -10, 1, -10), 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        Position = UDim2.new(0, 5, 0, 5), 
                        TextWrapped = true, 
                        Text = l_assetInfo_0.name or "", 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextSize = 12, 
                        TextScaled = true, 
                        Font = l_AppFonts_0.default:getDefault(), 
                        TextColor3 = Color3.new(1, 1, 1)
                    }, {
                        UITextSizeConstraint = v3.createElement("UITextSizeConstraint", {
                            MaxTextSize = v26.AssetTextMaxSize
                        })
                    })
                }), 
                EquippedFrame = v3.createElement("ImageLabel", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    ZIndex = 2, 
                    Visible = l_equipped_0, 
                    Image = "rbxasset://textures/ui/InspectMenu/gr-item-selector.png", 
                    ImageColor3 = v6.Green, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(2.5, 2.5, 2.5, 2.5)
                }), 
                Corner = v3.createElement("ImageLabel", {
                    Position = UDim2.new(1, -25, 0, 0), 
                    Size = UDim2.new(0, 25, 0, 25), 
                    BackgroundTransparency = 1, 
                    ZIndex = 2, 
                    Visible = l_equipped_0, 
                    Image = "rbxasset://textures/ui/InspectMenu/gr-item-selector-triangle.png", 
                    ImageColor3 = v6.Green
                }), 
                LimitedLabel = (if v14() then v28 else v27) and v3.createElement(v11, {
                    frameSize = if v14() then v30 else UDim2.new(0, v24.X + 18, 0, v24.Y + 4), 
                    framePosition = UDim2.new(0, 16, 0, l_assetCardSizeX_0 - v24.Y - 20), 
                    imageSize = UDim2.new(0, v24.X, 0, v24.Y), 
                    imagePosition = UDim2.new(0, 5, 0, 2), 
                    textSize = UDim2.new(0, v24.X, 0, v24.Y), 
                    textPosition = UDim2.new(0, 5 + v24.X, 0, 2), 
                    text = (not v14() or v29) and "#" or nil
                })
            });
        end
    });
end;
return v4.UNSTABLE_connect2(function(v32, v33) --[[ Line: 146 ]]
    local l_assetId_0 = v33.assetInfo.assetId;
    return {
        view = v32.view, 
        equipped = v32.equippedAssets[l_assetId_0] == true, 
        locale = v32.locale
    };
end, function(v35) --[[ Line: 154 ]]
    -- upvalues: v8 (copy)
    return {
        openDetails = function(v36) --[[ Line: 156 ]] --[[ Name: openDetails ]]
            -- upvalues: v35 (copy), v8 (ref)
            v35(v8(true, v36));
        end
    };
end)(v15);