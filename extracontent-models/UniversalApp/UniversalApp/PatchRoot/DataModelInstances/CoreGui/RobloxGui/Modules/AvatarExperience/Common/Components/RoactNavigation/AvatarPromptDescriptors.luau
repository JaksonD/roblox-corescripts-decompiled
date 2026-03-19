local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.UrlBuilder);
local v6 = require(l_Modules_0.LuaApp.AppPage);
local v7 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.Prompts.EquipOutfitConfirmation);
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.Prompts.CreateOrUpdateOutfitMenu);
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.Prompts.CommunityAvatarEntryMenu);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.LeaveCatalogToAvatarPrompt);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Components.LookDetails.CommunityAvatarSharePrompt);
local v13 = require(l_Modules_0.AvatarExperience.Catalog.Components.LookDetails.DeleteAvatarConfirmationPrompt);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.InsufficientRobuxPrompt);
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.PremiumSellOnlyPrompt);
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.PurchasePrompt);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.SellItemPrompt);
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.RemoveCurrentlySellingItemPrompt);
local v19 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Components.Prompts.RemoveItemPrompt);
local v20 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Components.Prompts.ResetLayeredItemsSortPrompt);
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.ResetToNewCharacterPrompt);
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.OutfitIncompletePrompt);
local v23 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.PurchaseLookPrompt);
local v24 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.PurchaseLookPromptMIS);
local v25 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.PurchaseOutfitPrompt);
local v26 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.CatalogContextFrame);
local v27 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.ContextFrame);
local v28 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Components.Prompts.LCSortContextFrame);
local v29 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarExperienceQuickMenu);
local v30 = require(l_Modules_0.AvatarExperience.Common.Components.AXTransitionContextualMenu);
local v31 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.CatalogReport);
local v32 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.Prompts.SaveOutfitPrompt);
local v33 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.Prompts.RenameOutfitPrompt);
local v34 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.Prompts.DeleteOutfitPrompt);
local v35 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.Prompts.DuplicateOutfitNamePrompt);
local v36 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.Prompts.DuplicateOutfitInfoPrompt);
local v37 = require(l_Modules_0.AvatarExperience.Common.Components.Prompts.R15UpgradePrompt);
local v38 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.Prompts.LayeredClothingR6SwitchPrompt);
local v39 = require(l_Modules_0.LuaApp.Components.AbuseReporting.CatalogReportContainer);
local v40 = require(l_Modules_0.LuaApp.Components.PremiumUpsell.PremiumUpsellContainer);
local v41 = require(l_Modules_0.LuaApp.Components.RobuxUpsell.RobuxUpsellContainer);
local v42 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.CollectiblesInfoPrompt);
local v43 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.ResaleFeePolicyPrompt);
local v44 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.GenericPrompt);
local v45 = require(l_Modules_0.AvatarExperience.Catalog.Components.ItemToExperienceModal);
local v46 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.OpenExperienceTraversalPrompt);
local v47 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Components.ProfilePictureEditorRevertToDefaultPrompt);
local v48 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Components.AccessoryAdjustmentUnsavedPrompt);
local v49 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Components.AccessoryAdjustmentResetPrompt);
local v50 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.LookComposer.LooksConfirmationPrompt);
local v51 = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Components.Prompts.SlotEditorClearAllConfirmationPrompt);
local v52 = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Components.SaveAvatarOnLeaveAvatarExperiencePrompt);
local v53 = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Components.Prompts.SlotsAvatarSwitcherFtuxPrompt);
local v54 = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Components.Prompts.SlotsCustomizeFtuxPrompt);
local v55 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.Prompts.EnhancedAvatarHeadsFtuxPrompt);
local v56 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.ItemInfoRowPrompt);
local l_TryOnMultipleItemsFtuxPrompt_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog).Components.Prompts.TryOnMultipleItemsFtuxPrompt;
local l_WearAvatarReplaceAllItemsPrompt_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog).Components.Prompts.WearAvatarReplaceAllItemsPrompt;
local l_ClearAllItemsOnAvatarPrompt_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog).Components.Prompts.ClearAllItemsOnAvatarPrompt;
local l_CartUnavailableItemsPrompt_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog).Components.Prompts.CartUnavailableItemsPrompt;
local l_ItemReplacedOnAvatarPrompt_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog).Components.Prompts.ItemReplacedOnAvatarPrompt;
local l_ItemsUnavailablePrompt_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog).Components.Prompts.ItemsUnavailablePrompt;
local l_MakeupMax6LayersPrompt_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog).Components.Prompts.MakeupMax6LayersPrompt;
local l_TimeoutStatusPrompt_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog).Components.Prompts.TimeoutStatusPrompt;
local l_MakeupReleaseFtuxPrompt_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog).Components.Prompts.MakeupReleaseFtuxPrompt;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v67 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v68 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableCollectiblesInfoPrompt);
local l_GetFFlagLuafiedReportEntryPoints_0 = v3.GetFFlagLuafiedReportEntryPoints;
local v70 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXEnableClearAllConfirmationPrompt);
local l_FFlagAXEnableManualSavingBlockingPrompt_0 = v67.FFlagAXEnableManualSavingBlockingPrompt;
local v72 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXEnableSlotsFtux);
local v73 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXEnableEnhancedAvatarHeadsFtux);
local l_FFlagAXMISEnableMultiShopping_0 = v67.FFlagAXMISEnableMultiShopping;
local l_FFlagAXAvatarTimeoutFlow_0 = v67.FFlagAXAvatarTimeoutFlow;
local l_FFlagAXCatalogMakeupSupport_0 = v67.FFlagAXCatalogMakeupSupport;
local l_FFlagAXMakeupReleaseFTUX_0 = v67.FFlagAXMakeupReleaseFTUX;
local v78 = {
    {
        [l_AvatarScreen_0.PremiumUpsellPrompt] = v40
    }, 
    {
        [l_AvatarScreen_0.CatalogReport] = v31
    }, 
    {
        [l_AvatarScreen_0.SaveOutfitPrompt] = v32
    }, 
    {
        [l_AvatarScreen_0.RenameOutfitPrompt] = v33
    }, 
    {
        [l_AvatarScreen_0.DeleteOutfitPrompt] = v34
    }, 
    {
        [l_AvatarScreen_0.DuplicateOutfitNamePrompt] = v35
    }, 
    {
        [l_AvatarScreen_0.DuplicateOutfitInfoPrompt] = v36
    }, 
    {
        [l_AvatarScreen_0.LayeredClothingR6SwitchPrompt] = v38
    }, 
    {
        [l_AvatarScreen_0.EquipOutfitConfirmation] = v8
    }, 
    {
        [l_AvatarScreen_0.LeaveCatalogToAvatarPrompt] = v11
    }, 
    {
        [l_AvatarScreen_0.InsufficientRobuxPrompt] = v14
    }, 
    {
        [l_AvatarScreen_0.RobuxUpsellPrompt] = v41
    }, 
    {
        [l_AvatarScreen_0.PremiumSellOnlyPrompt] = v15
    }, 
    {
        [l_AvatarScreen_0.SellItemPrompt] = v17
    }, 
    {
        [l_AvatarScreen_0.RemoveCurrentlySellingItemPrompt] = v18
    }, 
    {
        [l_AvatarScreen_0.RemoveItemPrompt] = v19
    }, 
    {
        [l_AvatarScreen_0.ResetLayeredItemsSortPrompt] = v20
    }, 
    {
        [l_AvatarScreen_0.ResetToNewCharacterPrompt] = v21
    }, 
    {
        [l_AvatarScreen_0.OutfitIncompletePrompt] = v22
    }, 
    {
        [l_AvatarScreen_0.PurchaseOutfitPrompt] = v25
    }, 
    {
        [l_AvatarScreen_0.PurchaseCatalogItem] = v16
    }, 
    {
        [l_AvatarScreen_0.CreateOrUpdateOutfitMenu] = v9
    }, 
    {
        [l_AvatarScreen_0.AvatarExperienceQuickMenu] = v29
    }, 
    {
        [l_AvatarScreen_0.CatalogContextMenu] = {
            screen = v26, 
            navigationOptions = {
                overlayTransparency = 1
            }
        }
    }, 
    {
        [l_AvatarScreen_0.LCSortContextMenu] = {
            screen = v28, 
            navigationOptions = {
                overlayTransparency = 1
            }
        }
    }, 
    {
        [l_AvatarScreen_0.AXTransitionContextualMenu] = {
            screen = v30, 
            navigationOptions = {
                overlayTransparency = 1
            }
        }
    }, 
    {
        [l_AvatarScreen_0.R15UpgradePrompt] = v37
    }, 
    {
        [l_AvatarScreen_0.AccessoryAdjustmentResetPrompt] = v49
    }, 
    {
        [l_AvatarScreen_0.AccessoryAdjustmentUnsavedPrompt] = v48
    }, 
    {
        [l_AvatarScreen_0.ItemExperiencesMenu] = v45
    }, 
    {
        [l_AvatarScreen_0.CommunityAvatarEntryMenu] = v10
    }, 
    {
        [l_AvatarScreen_0.ResaleFeePolicyPrompt] = v43
    }, 
    {
        [l_AvatarScreen_0.GenericPrompt] = v44
    }, 
    {
        [l_AvatarScreen_0.ContextMenu] = {
            screen = v27, 
            navigationOptions = {
                overlayTransparency = 1
            }
        }
    }, 
    {
        [l_AvatarScreen_0.PurchaseLookPrompt] = if l_FFlagAXMISEnableMultiShopping_0 then v24 else v23
    }, 
    {
        [l_AvatarScreen_0.OpenExperienceTraversalPrompt] = v46
    }, 
    {
        [l_AvatarScreen_0.CommunityAvatarSharePrompt] = v12
    }, 
    {
        [l_AvatarScreen_0.DeleteAvatarConfirmationPrompt] = v13
    }, 
    {
        [l_AvatarScreen_0.ProfilePictureEditorRevertToDefaultPrompt] = v47
    }, 
    {
        [l_AvatarScreen_0.ItemInfoRowPrompt] = v56
    }, 
    {
        [l_AvatarScreen_0.LooksConfirmationPrompt] = v50
    }
};
if v68() then
    table.insert(v78, {
        [l_AvatarScreen_0.CollectiblesInfoPrompt] = v42
    });
end;
if l_GetFFlagLuafiedReportEntryPoints_0() then
    table.insert(v78, {
        [l_AvatarScreen_0.ReportDialog] = v39
    });
end;
if v70 then
    table.insert(v78, {
        [l_AvatarScreen_0.SlotEditorClearAllConfirmationPrompt] = v51
    });
end;
if l_FFlagAXEnableManualSavingBlockingPrompt_0 then
    table.insert(v78, {
        [l_AvatarScreen_0.SaveAvatarOnLeaveAvatarExperiencePrompt] = v52
    });
end;
if v72 then
    table.insert(v78, {
        [l_AvatarScreen_0.SlotsAvatarSwitcherFtuxPrompt] = v53
    });
    table.insert(v78, {
        [l_AvatarScreen_0.SlotsCustomizeFtuxPrompt] = v54
    });
end;
if v73 then
    table.insert(v78, {
        [l_AvatarScreen_0.EnhancedAvatarHeadsFtuxPrompt] = v55
    });
end;
if l_FFlagAXMISEnableMultiShopping_0 then
    table.insert(v78, {
        [l_AvatarScreen_0.TryOnMultipleItemsFtuxPrompt] = l_TryOnMultipleItemsFtuxPrompt_0
    });
    table.insert(v78, {
        [l_AvatarScreen_0.WearAvatarReplaceAllItemsPrompt] = l_WearAvatarReplaceAllItemsPrompt_0
    });
    table.insert(v78, {
        [l_AvatarScreen_0.ClearAllItemsOnAvatarPrompt] = l_ClearAllItemsOnAvatarPrompt_0
    });
    table.insert(v78, {
        [l_AvatarScreen_0.CartUnavailableItemsPrompt] = l_CartUnavailableItemsPrompt_0
    });
    table.insert(v78, {
        [l_AvatarScreen_0.ItemReplacedOnAvatarPrompt] = l_ItemReplacedOnAvatarPrompt_0
    });
end;
if l_FFlagAXMakeupReleaseFTUX_0 then
    table.insert(v78, {
        [l_AvatarScreen_0.MakeupReleaseFtuxPrompt] = l_MakeupReleaseFtuxPrompt_0
    });
end;
local v80 = v4.connect(nil, function(v79) --[[ Line: 351 ]]
    -- upvalues: v7 (copy), v6 (copy), v5 (copy)
    return {
        navigateDown = function() --[[ Line: 353 ]] --[[ Name: navigateDown ]]
            -- upvalues: v79 (copy), v7 (ref), v6 (ref), v5 (ref)
            return v79(v7({
                name = v6.GenericWebPage, 
                detail = v5.UrlBuilder.static.messages(), 
                extraProps = {
                    titleKey = "CommonUI.Features.Label.Messages"
                }
            }));
        end
    };
end)(l_ItemsUnavailablePrompt_0);
table.insert(v78, {
    [l_AvatarScreen_0.ItemsUnavailablePrompt] = v80
});
if l_FFlagAXCatalogMakeupSupport_0 then
    table.insert(v78, {
        [l_AvatarScreen_0.MakeupMax6LayersPrompt] = l_MakeupMax6LayersPrompt_0
    });
end;
if l_FFlagAXAvatarTimeoutFlow_0 then
    table.insert(v78, {
        [l_AvatarScreen_0.TimeoutStatusPrompt] = l_TimeoutStatusPrompt_0
    });
end;
return v78;