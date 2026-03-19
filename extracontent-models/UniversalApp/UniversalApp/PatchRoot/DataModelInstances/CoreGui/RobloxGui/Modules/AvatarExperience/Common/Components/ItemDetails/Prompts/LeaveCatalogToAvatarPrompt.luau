local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.mutedError);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v12 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SetCategoryAndSubcategory);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_GoToCustomizeToEditPrompt_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog).Components.Prompts.GoToCustomizeToEditPrompt;
local v16 = require(l_CorePackages_0.Packages.UIBlox);
local l_InteractiveAlert_0 = v16.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v16.App.Button.Enum.ButtonType;
local v19 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorStructure);
local v20 = v2.PureComponent:extend("LeaveCatalogToAvatarPrompt");
local v21 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixBundleRedirectFromCatalogForSlots);
local v22 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixEmoteRedirectFromCatalogForSlots);
local l_FFlagAXLeaveCatalogToAvatarPromptHandleSubcategoryFilters_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXLeaveCatalogToAvatarPromptHandleSubcategoryFilters;
local l_FFlagAXMISEnableMultiShopping_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping;
v20.init = function(v25) --[[ Line: 47 ]] --[[ Name: init ]]
    -- upvalues: v22 (copy), v12 (copy), l_AvatarScreen_0 (copy), v14 (copy), v19 (copy), l_FFlagAXLeaveCatalogToAvatarPromptHandleSubcategoryFilters_0 (copy), v21 (copy), v5 (copy)
    v25.openAvatarPage = function() --[[ Line: 48 ]]
        -- upvalues: v25 (copy), v22 (ref), v12 (ref), l_AvatarScreen_0 (ref), v14 (ref), v19 (ref), l_FFlagAXLeaveCatalogToAvatarPromptHandleSubcategoryFilters_0 (ref), v21 (ref), v5 (ref)
        local l_itemType_0 = v25.props.itemType;
        local l_itemSubType_0 = v25.props.itemSubType;
        local v28 = nil;
        local v29 = nil;
        local v30 = nil;
        if v22 and l_itemSubType_0 == v12.AssetTypeIdStrings.EmoteAnimation then
            v25.props.navigation.navigate(l_AvatarScreen_0.AvatarEditor);
            v14.navigateFromOverlay(v25.props.navigation, l_AvatarScreen_0.EditEmotes);
            return;
        else
            if v25.props.categoryOverride then
                v28 = v25.props.categoryOverride;
                v29 = v25.props.subcategoryOverride;
            else
                local v31 = v19();
                if l_itemType_0 == v12.ItemType.Asset then
                    local v32 = v31.AssetTypeToCategorySubcategory[l_itemSubType_0];
                    if v32 then
                        v28 = v32.category;
                        v29 = v32.subcategory;
                        if l_FFlagAXLeaveCatalogToAvatarPromptHandleSubcategoryFilters_0 then
                            v30 = v32.subcategoryFilter;
                        end;
                    end;
                elseif l_itemType_0 == v12.ItemType.Bundle then
                    if v21 then
                        v28 = v31.BundleToCategorySubcategory[l_itemSubType_0].category;
                        v29 = v31.BundleToCategorySubcategory[l_itemSubType_0].subcategory;
                        if l_FFlagAXLeaveCatalogToAvatarPromptHandleSubcategoryFilters_0 then
                            v30 = v31.BundleToCategorySubcategory[l_itemSubType_0].subcategoryFilter;
                        end;
                    else
                        v28 = v31.BundleToCategorySubcategory.category;
                        v29 = v31.BundleToCategorySubcategory.subcategory;
                    end;
                end;
            end;
            local l_avatarAnalytics_0 = v25.props.avatarAnalytics;
            if v28 == nil then
                v5("[AvatarExperience] No category for itemType: " .. tostring(l_itemType_0) .. " / " .. tostring(l_itemSubType_0));
            else
                v25.props.setCategoryAndSubcategory(v28, v29, l_avatarAnalytics_0, v30);
            end;
            v14.navigateFromOverlay(v25.props.navigation, l_AvatarScreen_0.AvatarEditor);
            v25.props.catalogAnalytics.clickCustomizeAvatarFromItemDetailPage();
            return;
        end;
    end;
    v25.closePrompt = function() --[[ Line: 109 ]]
        -- upvalues: v14 (ref), v25 (copy)
        v14.closeOverlay(v25.props.navigation);
    end;
end;
v20.renderAlertLocalized = function(v34, v35) --[[ Line: 114 ]] --[[ Name: renderAlertLocalized ]]
    -- upvalues: v2 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    return v2.createElement(l_InteractiveAlert_0, {
        title = v35.titleText, 
        bodyText = v35.messageText, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v34.closePrompt, 
                        text = v35.cancelButtonText
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v34.openAvatarPage, 
                        text = v35.confirmButtonText
                    }
                }
            }
        }, 
        screenSize = v34.props.screenSize, 
        defaultChildRef = v34.props.defaultChildRef
    });
end;
if l_FFlagAXMISEnableMultiShopping_0 then
    v20.renderGoToCustomizePrompt = function(v36) --[[ Line: 142 ]] --[[ Name: renderGoToCustomizePrompt ]]
        -- upvalues: v2 (copy), l_GoToCustomizeToEditPrompt_0 (copy)
        return v2.createElement(l_GoToCustomizeToEditPrompt_0, {
            onConfirm = v36.openAvatarPage, 
            navigation = v36.props.navigation
        });
    end;
end;
v20.render = function(v37) --[[ Line: 150 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagAXMISEnableMultiShopping_0 (copy), l_withLocalization_0 (copy)
    if l_FFlagAXMISEnableMultiShopping_0 then
        return v37:renderGoToCustomizePrompt();
    else
        return l_withLocalization_0({
            titleText = "Feature.Catalog.Action.Customize", 
            messageText = "Feature.Catalog.Label.MarketplaceToAvatarPage", 
            confirmButtonText = "Feature.Catalog.Action.Customize", 
            cancelButtonText = "Feature.Catalog.Action.Cancel"
        })(function(v38) --[[ Line: 160 ]]
            -- upvalues: v37 (copy)
            return v37:renderAlertLocalized(v38);
        end);
    end;
end;
v20 = v3.connect(function(v39, _) --[[ Line: 165 ]]
    return {
        screenSize = v39.ScreenSize
    };
end, function(v41) --[[ Line: 169 ]]
    -- upvalues: v13 (copy)
    return {
        setCategoryAndSubcategory = function(v42, v43, v44, v45) --[[ Line: 171 ]] --[[ Name: setCategoryAndSubcategory ]]
            -- upvalues: v41 (copy), v13 (ref)
            v41(v13(v42, v43, v44, v45));
        end
    };
end)(v20);
return (v9((v10((l_RoactServices_0.connect({
    avatarAnalytics = v6, 
    catalogAnalytics = v7
})(v20))))));