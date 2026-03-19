local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v10 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v11 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v12 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v13 = require(l_Modules_0.AvatarExperience.Common.DeepLinkUtils);
local v14 = require(l_Modules_0.LuaApp.Thunks.FetchDataWithErrorToasts);
local v15 = require(l_Modules_0.LuaApp.Actions.SetSearchParameters);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_CatalogCategories_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Enums.CatalogCategories;
local l_Images_0 = v7.App.ImageSet.Images;
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.Landing.PageButton);
local v20 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v22 = require(l_CorePackages_0.Packages.t);
local v23 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCatalogSearchWithSponsoredItems);
local v24 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_Constants_0 = v24.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v24.Utils.getRbxthumbWithTypeSizeAndOptions;
local _ = require(l_Modules_0.AvatarExperience.Catalog.SearchTypes);
local _ = require(l_CorePackages_0.Packages.LuauPolyfill);
local l_Asset_0 = l_Constants_0.RbxthumbTypes.Asset;
local l_BundleThumbnail_0 = l_Constants_0.RbxthumbTypes.BundleThumbnail;
local v31 = l_Images_0["icons/menu/shop_large"];
local v32 = l_CatalogCategories_0.Recommended:rawValue();
local v33 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXDisableCatalogFetchOnDeepLinkForConsole);
local v34 = v5.PureComponent:extend("CatalogPageButton");
local v35 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXCatalogCategoriesStore_0 = v35.FFlagAXCatalogCategoriesStore;
local l_FFlagAXDefaultCatalogCategoryId_0 = v35.FFlagAXDefaultCatalogCategoryId;
v34.validateProps = v22.strictInterface({
    transparencyModifier = v22.number, 
    NextSelectionLeft = v22.optional(v22.table), 
    NextSelectionRight = v22.optional(v22.table), 
    NextSelectionUp = v22.optional(v22.table), 
    NextSelectionDown = v22.optional(v22.table), 
    onActivated = v22.callback, 
    networking = v22.callback, 
    forwardRef = v22.optional(v22.table), 
    catalogItem = v22.optional(v22.table), 
    dataStatus = v22.string, 
    externalNavigationRequest = if v33() then v22.optional(v22.table) else nil, 
    setSearchParameters = v22.callback, 
    fetchCatalogData = v22.callback
});
v34.defaultProps = {
    transparencyModifier = 0
};
local v38 = Vector2.new(0, 0);
v34.init = function(v39) --[[ Line: 94 ]] --[[ Name: init ]]
    -- upvalues: l_NotificationService_0 (copy), v11 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), l_FFlagAXDefaultCatalogCategoryId_0 (copy), v12 (copy), v32 (copy)
    v39.state = {
        style = string.lower(l_NotificationService_0.SelectedTheme)
    };
    v39.fetchInitialCatalogItems = function() --[[ Line: 99 ]]
        -- upvalues: v39 (copy), v11 (ref), l_FFlagAXCatalogCategoriesStore_0 (ref), l_FFlagAXDefaultCatalogCategoryId_0 (ref), v12 (ref), v32 (ref)
        local l_networking_0 = v39.props.networking;
        local v41 = v11.getCatalogCategoryInfo(1, 0);
        if l_FFlagAXCatalogCategoriesStore_0 then
            local v42 = if l_FFlagAXDefaultCatalogCategoryId_0 then v12.DefaultCatalogCategoryId else v32;
            v41 = v11.getCatalogCategoryInfoById(v42, nil);
        else
            local v43 = if l_FFlagAXDefaultCatalogCategoryId_0 then v12.DefaultCatalogCategoryId else v32;
            v41 = v11.getCatalogCategoryInfoById(v43, nil);
        end;
        local v44 = {
            searchUuid = v41.SearchUuid, 
            categoryInfo = v41
        };
        v39.props.setSearchParameters(v44.searchUuid, v44);
        return v39.props.fetchCatalogData(l_networking_0, v44);
    end;
end;
v34.render = function(v45) --[[ Line: 130 ]] --[[ Name: render ]]
    -- upvalues: v12 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_BundleThumbnail_0 (copy), l_Asset_0 (copy), l_withLocalization_0 (copy), v5 (copy), v19 (copy), v38 (copy), v31 (copy)
    local l_catalogItem_0 = v45.props.catalogItem;
    local l_style_0 = v45.state.style;
    local l_transparencyModifier_0 = v45.props.transparencyModifier;
    local l_NextSelectionLeft_0 = v45.props.NextSelectionLeft;
    local l_NextSelectionRight_0 = v45.props.NextSelectionRight;
    local l_NextSelectionUp_0 = v45.props.NextSelectionUp;
    local l_NextSelectionDown_0 = v45.props.NextSelectionDown;
    local v53 = "rbxasset://textures/AvatarEditorImages/Catalog_LightTheme.png";
    if l_style_0 == "dark" then
        v53 = "rbxasset://textures/AvatarEditorImages/Catalog.png";
    end;
    local v54 = nil;
    local v55 = 420;
    if l_catalogItem_0 then
        if l_catalogItem_0.type == v12.ItemType.Bundle then
            v54 = l_getRbxthumbWithTypeSizeAndOptions_0(l_catalogItem_0.id, l_BundleThumbnail_0, 420);
            v55 = 420;
        else
            v54 = l_getRbxthumbWithTypeSizeAndOptions_0(l_catalogItem_0.id, l_Asset_0, 420);
            v55 = 420;
        end;
    end;
    local l_forwardRef_0 = v45.props.forwardRef;
    return l_withLocalization_0({
        catalogText = "Feature.Avatar.Action.Marketplace"
    })(function(v57) --[[ Line: 168 ]]
        -- upvalues: v5 (ref), v19 (ref), v53 (ref), v54 (ref), v55 (ref), v38 (ref), v31 (ref), l_transparencyModifier_0 (copy), l_NextSelectionLeft_0 (copy), l_NextSelectionRight_0 (copy), l_NextSelectionUp_0 (copy), l_NextSelectionDown_0 (copy), l_forwardRef_0 (copy), v45 (copy)
        return v5.createElement(v19, {
            Size = UDim2.new(1, 0, 1, 0), 
            backgroundImage = v53, 
            thumbnailImage = v54, 
            thumbnailSize = v55, 
            thumbnailScaleOffset = v38, 
            icon = v31, 
            text = v57.catalogText, 
            transparencyModifier = l_transparencyModifier_0, 
            NextSelectionLeft = l_NextSelectionLeft_0, 
            NextSelectionRight = l_NextSelectionRight_0, 
            NextSelectionUp = l_NextSelectionUp_0, 
            NextSelectionDown = l_NextSelectionDown_0, 
            [v5.Ref] = l_forwardRef_0, 
            onActivated = v45.props.onActivated
        });
    end);
end;
v34.checkFetchSortData = function(v58) --[[ Line: 191 ]] --[[ Name: checkFetchSortData ]]
    -- upvalues: v33 (copy), v13 (copy), v20 (copy)
    if v33() and v13.catalogDeepLinkExists(v58.props.externalNavigationRequest) then
        return;
    else
        local v59 = v58.props.dataStatus == v20.NotStarted;
        if v58.props.catalogItem == nil and v59 then
            v58.fetchInitialCatalogItems();
        end;
        return;
    end;
end;
v34.didUpdate = function(v60) --[[ Line: 213 ]] --[[ Name: didUpdate ]]
    v60:checkFetchSortData();
end;
v34.didMount = function(v61) --[[ Line: 217 ]] --[[ Name: didMount ]]
    -- upvalues: l_NotificationService_0 (copy)
    v61.themeChangedConn = l_NotificationService_0:GetPropertyChangedSignal("SelectedTheme"):Connect(function() --[[ Line: 218 ]]
        -- upvalues: v61 (copy), l_NotificationService_0 (ref)
        v61:setState({
            style = string.lower(l_NotificationService_0.SelectedTheme)
        });
    end);
    v61:checkFetchSortData();
end;
v34.willUnmount = function(v62) --[[ Line: 227 ]] --[[ Name: willUnmount ]]
    if v62.themeChangedConn then
        v62.themeChangedConn:Disconnect();
        v62.themeChangedConn = nil;
    end;
end;
local function v71(v63) --[[ Line: 234 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v11 (copy), l_PerformFetch_0 (copy), v33 (copy)
    local l_SearchUuid_0 = v11.getCatalogCategoryInfo(1, 0).SearchUuid;
    assert(l_SearchUuid_0 ~= nil, "searchUuid is not nil. Silence type checker");
    local v65 = v63.Search.SearchesInCatalog[l_SearchUuid_0] or {};
    local v66 = v65 and v65.items or {};
    local v67 = v11.getSearchKey(v63, l_SearchUuid_0);
    local v68 = v66[1];
    local v69 = l_PerformFetch_0.GetStatus(v63, v67);
    local v70 = if v33() then v63.AvatarExperience.ExternalNavigationRequest else {};
    return {
        catalogItem = v68, 
        dataStatus = v69, 
        externalNavigationRequest = if v33() then v70 else nil
    };
end;
local function v77(v72) --[[ Line: 259 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v14 (copy), v23 (copy), v15 (copy)
    return {
        fetchCatalogData = function(v73, v74) --[[ Line: 261 ]] --[[ Name: fetchCatalogData ]]
            -- upvalues: v72 (copy), v14 (ref), v23 (ref)
            return v72(v14(v23(v73, v74)));
        end, 
        setSearchParameters = function(v75, v76) --[[ Line: 270 ]] --[[ Name: setSearchParameters ]]
            -- upvalues: v72 (copy), v15 (ref)
            return v72(v15(v75, v76));
        end
    };
end;
v34 = l_RoactServices_0.connect({
    networking = v10
})(v34);
v34 = v6.connect(v71, v77)(v34);
return v5.forwardRef(function(v78, v79) --[[ Line: 282 ]]
    -- upvalues: v5 (copy), v34 (ref), v4 (copy)
    return v5.createElement(v34, v4.Dictionary.join(v78, {
        forwardRef = v79
    }));
end);