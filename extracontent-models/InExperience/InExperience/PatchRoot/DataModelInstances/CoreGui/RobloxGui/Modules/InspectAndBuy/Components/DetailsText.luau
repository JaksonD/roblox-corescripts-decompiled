local l_CorePackages_0 = game:GetService("CorePackages");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_Images_0 = v5.App.ImageSet.Images;
local l_IconSize_0 = v5.App.Constant.IconSize;
local v9 = require(l_Parent_0.Components.Notification);
local v10 = require(l_Parent_0.Components.Favorites);
local v11 = require(l_Parent_0.UtilityFunctions);
local v12 = require(l_Parent_0.Colors);
local v13 = require(l_Parent_0.Constants);
local v14 = require(l_Parent_0.getSelectionImageObjectRegular);
local v15 = require(l_Parent_0.Components.InspectAndBuyContext);
local v16 = l_Images_0["icons/status/premium"];
local v17 = v2.PureComponent:extend("DetailsText");
v17.init = function(v18) --[[ Line: 29 ]] --[[ Name: init ]]
    -- upvalues: v14 (copy)
    v18.name = "";
    v18.creator = "";
    v18.selectedImage = v14();
end;
v17.setText = function(v19) --[[ Line: 39 ]] --[[ Name: setText ]]
    -- upvalues: v11 (copy)
    local v20 = v19.props.assetInfo or {};
    local v21 = v20.parentBundleId ~= nil;
    local v22 = v19.props.bundleInfo or {};
    if v21 then
        local v23 = v11.getBundleId(v20);
        if v22[v23] then
            v19.name = v22[v23].name or "";
            v19.creator = v22[v23].creatorName or "";
            return;
        end;
    elseif v20 then
        v19.name = v20.name or "";
        v19.creator = v20.creatorName or "";
    end;
end;
v17.render = function(v24) --[[ Line: 58 ]] --[[ Name: render ]]
    -- upvalues: l_IconSize_0 (copy), v13 (copy), v11 (copy), v2 (copy), v15 (copy), v9 (copy), v4 (copy), v16 (copy), l_AppFonts_0 (copy), v12 (copy), v10 (copy)
    v24:setText();
    local l_view_0 = v24.props.view;
    local l_showFavoritesCount_0 = v24.props.showFavoritesCount;
    local v27 = v24.props.assetInfo or {};
    local v28 = v27.parentBundleId ~= nil;
    local v29 = v24.props.assetBundles[v27.assetId];
    local v30 = v28 and #v29 > 1;
    local v31 = v27.premiumPricing ~= nil;
    local v32 = v31 and l_IconSize_0.Regular + 5 or 0;
    local v33 = false;
    if v13.LayeredAssetTypes[v27.assetTypeId] ~= nil then
        v33 = v24.props.localPlayerModel and v24.props.localPlayerModel.Humanoid.RigType == Enum.HumanoidRigType.R6;
    end;
    local v34 = v11.isLimited1Point0(v27);
    local v35 = nil;
    if v30 then
        v35 = v13.NotificationKeys.MultipleBundleNoticeKey;
    elseif v28 then
        v35 = v13.NotificationKeys.SingleBundleNoticeKey;
    elseif v34 then
        v35 = v13.NotificationKeys.LimitedItemNoticeKey;
    elseif v33 then
        v35 = v13.NotificationKeys.LayeredClothingOnR6Key;
    end;
    return v2.createElement(v15.Consumer, {
        render = function(v36) --[[ Line: 87 ]] --[[ Name: render ]]
            -- upvalues: l_view_0 (copy), v2 (ref), v35 (ref), v9 (ref), v31 (copy), v4 (ref), v16 (ref), l_IconSize_0 (ref), v32 (copy), v24 (copy), l_AppFonts_0 (ref), v12 (ref), l_showFavoritesCount_0 (copy), v10 (ref)
            local v37 = v36[l_view_0];
            return v2.createElement("Frame", {
                Position = v37.DetailsFramePosition, 
                Size = UDim2.new(1, 0, 0, 131), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                Layout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    FillDirection = Enum.FillDirection.Vertical
                }), 
                Notification = v35 and v2.createElement(v9, {
                    noticeKey = v35
                }), 
                AssetName = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, -10, 0, 50), 
                    LayoutOrder = 1
                }, {
                    PremiumIcon = v31 and v2.createElement("ImageLabel", v4.Dictionary.join(v16, {
                        AnchorPoint = Vector2.new(0, 0.5), 
                        Position = UDim2.new(0, 0, 0.5, 0), 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, l_IconSize_0.Regular, 0, l_IconSize_0.Regular), 
                        ImageColor3 = Color3.new(1, 1, 1)
                    })) or nil, 
                    PlayerName = v2.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(0, v32, 0, 0), 
                        Size = UDim2.new(1, v32, 0, 50), 
                        LayoutOrder = 1, 
                        Text = v24.name or "", 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextScaled = true, 
                        TextSize = 20, 
                        Font = l_AppFonts_0.default:getBold(), 
                        TextColor3 = v12.White
                    }, {
                        UITextSizeConstraint = v2.createElement("UITextSizeConstraint", {
                            MaxTextSize = 32
                        })
                    })
                }) or v2.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, -10, 0, 50), 
                    LayoutOrder = 1, 
                    Text = v24.name or "", 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextScaled = true, 
                    TextSize = 20, 
                    Font = l_AppFonts_0.default:getBold(), 
                    TextColor3 = v12.White
                }, {
                    UITextSizeConstraint = v2.createElement("UITextSizeConstraint", {
                        MaxTextSize = 32
                    })
                }), 
                FavoriteContainer = l_showFavoritesCount_0 and v2.createElement(v10)
            });
        end
    });
end;
return v3.connect(function(v38, _) --[[ Line: 158 ]]
    local l_assetId_0 = v38.detailsInformation.assetId;
    return {
        view = v38.view, 
        locale = v38.locale, 
        assetInfo = v38.assets[l_assetId_0], 
        bundleInfo = v38.bundles, 
        assetBundles = v38.assetBundles, 
        showFavoritesCount = not v38.isSubjectToChinaPolicies
    };
end)(v17);