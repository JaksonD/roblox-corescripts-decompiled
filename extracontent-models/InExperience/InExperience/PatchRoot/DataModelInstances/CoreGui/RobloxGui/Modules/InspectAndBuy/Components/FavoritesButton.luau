local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Parent_0 = script.Parent.Parent;
local v5 = require(l_Parent_0.Colors);
local v6 = require(l_Parent_0.Thunks.CreateFavoriteForAsset);
local v7 = require(l_Parent_0.Thunks.DeleteFavoriteForAsset);
local v8 = require(l_Parent_0.Thunks.CreateFavoriteForBundle);
local v9 = require(l_Parent_0.Thunks.DeleteFavoriteForBundle);
local v10 = require(l_Parent_0.Thunks.GetFavoriteForAsset);
local v11 = require(l_Parent_0.Thunks.GetFavoriteForBundle);
local v12 = require(l_Parent_0.Selectors.GotFavoriteForDetailsItem);
local v13 = require(l_Parent_0.Selectors.IsDetailsItemPartOfBundleAndOffsale);
local v14 = require(l_Parent_0.Selectors.GetIsFavorite);
local v15 = require(l_Parent_0.UtilityFunctions);
local v16 = require(l_Parent_0.getSelectionImageObjectRounded);
local l_Favorite_0 = require(script.Parent.Common.ControllerShortcutKeycodes).Favorite;
local v18 = v2.PureComponent:extend("FavoritesButton");
v18.init = function(v19) --[[ Line: 28 ]] --[[ Name: init ]]
    -- upvalues: v16 (copy), l_ContextActionService_0 (copy), l_Favorite_0 (copy)
    v19.selectedImage = v16();
    v19.fetchFavoriteRetries = 0;
    l_ContextActionService_0:BindCoreAction("FavoriteGamepadShortcut", function(_, v21, _) --[[ Line: 32 ]]
        -- upvalues: v19 (copy)
        if v21 == Enum.UserInputState.End then
            v19:activateButton();
            return Enum.ContextActionResult.Sink;
        else
            return Enum.ContextActionResult.Pass;
        end;
    end, false, l_Favorite_0);
end;
v18.willUpdate = function(v23, v24) --[[ Line: 41 ]] --[[ Name: willUpdate ]]
    -- upvalues: v15 (copy)
    local l_gotFavoriteForDetailsItem_0 = v24.gotFavoriteForDetailsItem;
    local l_getFavoriteForAsset_0 = v23.props.getFavoriteForAsset;
    local l_getFavoriteForBundle_0 = v23.props.getFavoriteForBundle;
    if v24 and v24.assetInfo and not l_gotFavoriteForDetailsItem_0 and v23.fetchFavoriteRetries < 10 then
        local l_assetInfo_0 = v24.assetInfo;
        local v29 = l_assetInfo_0 and l_assetInfo_0.parentBundleId ~= nil;
        coroutine.wrap(function() --[[ Line: 55 ]]
            -- upvalues: v29 (copy), l_getFavoriteForAsset_0 (copy), l_assetInfo_0 (copy), v15 (ref), l_getFavoriteForBundle_0 (copy)
            if not v29 then
                l_getFavoriteForAsset_0(l_assetInfo_0.assetId);
                return;
            else
                local v30 = v15.getBundleId(l_assetInfo_0);
                l_getFavoriteForBundle_0(v30);
                return;
            end;
        end)();
        v23.fetchFavoriteRetries = v23.fetchFavoriteRetries + 1;
    end;
end;
v18.activateButton = function(v31) --[[ Line: 67 ]] --[[ Name: activateButton ]]
    -- upvalues: v15 (copy)
    local l_isFavorited_0 = v31.props.isFavorited;
    local l_IsDetailsItemPartOfBundleAndOffsale_0 = v31.props.IsDetailsItemPartOfBundleAndOffsale;
    local l_createFavoriteForAsset_0 = v31.props.createFavoriteForAsset;
    local l_deleteFavoriteForAsset_0 = v31.props.deleteFavoriteForAsset;
    local l_createFavoriteForBundle_0 = v31.props.createFavoriteForBundle;
    local l_deleteFavoriteForBundle_0 = v31.props.deleteFavoriteForBundle;
    local l_assetInfo_1 = v31.props.assetInfo;
    if l_isFavorited_0 then
        if l_IsDetailsItemPartOfBundleAndOffsale_0 then
            l_deleteFavoriteForBundle_0((v15.getBundleId(l_assetInfo_1)));
            return;
        else
            l_deleteFavoriteForAsset_0(l_assetInfo_1.assetId);
            return;
        end;
    elseif l_IsDetailsItemPartOfBundleAndOffsale_0 then
        l_createFavoriteForBundle_0((v15.getBundleId(l_assetInfo_1)));
        return;
    else
        l_createFavoriteForAsset_0(l_assetInfo_1.assetId);
        return;
    end;
end;
v18.willUnmount = function(_) --[[ Line: 93 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindCoreAction("FavoriteGamepadShortcut");
end;
v18.render = function(v40) --[[ Line: 97 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v5 (copy)
    local l_isFavorited_1 = v40.props.isFavorited;
    local l_favoriteButtonRef_0 = v40.props.favoriteButtonRef;
    return v2.createElement("ImageButton", {
        AnchorPoint = Vector2.new(0.5, 0), 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, 44, 0, 44), 
        LayoutOrder = 1, 
        Image = "rbxasset://textures/ui/InspectMenu/Button_outline.png", 
        ImageColor3 = v5.White, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(5, 5, 120, 20), 
        SelectionImageObject = v40.selectedImage, 
        Visible = true, 
        [v2.Ref] = l_favoriteButtonRef_0, 
        [v2.Event.Activated] = function() --[[ Line: 114 ]]
            -- upvalues: v40 (copy)
            v40:activateButton();
        end
    }, {
        FavoriteIcon = v2.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 26, 0, 26), 
            Position = UDim2.new(0, 22, 0, 22), 
            Image = l_isFavorited_1 and "rbxasset://textures/ui/InspectMenu/ico_favorite.png" or "rbxasset://textures/ui/InspectMenu/ico_favorite_off.png", 
            ImageColor3 = v5.White
        })
    });
end;
return v3.UNSTABLE_connect2(function(v43, _) --[[ Line: 129 ]]
    -- upvalues: v12 (copy), v14 (copy), v13 (copy)
    local l_assetId_0 = v43.detailsInformation.assetId;
    return {
        view = v43.view, 
        assetInfo = v43.assets[l_assetId_0], 
        bundleInfo = v43.bundles, 
        gotFavoriteForDetailsItem = v12(v43), 
        isFavorited = v14(v43), 
        IsDetailsItemPartOfBundleAndOffsale = v13(v43)
    };
end, function(v46) --[[ Line: 140 ]]
    -- upvalues: v6 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy)
    return {
        createFavoriteForAsset = function(v47) --[[ Line: 142 ]] --[[ Name: createFavoriteForAsset ]]
            -- upvalues: v46 (copy), v6 (ref)
            v46(v6(v47));
        end, 
        deleteFavoriteForAsset = function(v48) --[[ Line: 145 ]] --[[ Name: deleteFavoriteForAsset ]]
            -- upvalues: v46 (copy), v7 (ref)
            v46(v7(v48));
        end, 
        createFavoriteForBundle = function(v49) --[[ Line: 148 ]] --[[ Name: createFavoriteForBundle ]]
            -- upvalues: v46 (copy), v8 (ref)
            v46(v8(v49));
        end, 
        deleteFavoriteForBundle = function(v50) --[[ Line: 151 ]] --[[ Name: deleteFavoriteForBundle ]]
            -- upvalues: v46 (copy), v9 (ref)
            v46(v9(v50));
        end, 
        getFavoriteForAsset = function(v51) --[[ Line: 154 ]] --[[ Name: getFavoriteForAsset ]]
            -- upvalues: v46 (copy), v10 (ref)
            v46(v10(v51));
        end, 
        getFavoriteForBundle = function(v52) --[[ Line: 157 ]] --[[ Name: getFavoriteForBundle ]]
            -- upvalues: v46 (copy), v11 (ref)
            v46(v11(v52));
        end
    };
end)(v18);