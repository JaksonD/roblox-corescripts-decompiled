local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarSwitcher");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v3.Hooks.useTokens;
local v5 = require(l_Parent_0.SignalsReact);
local l_InventoryItemAvailability_0 = require(l_Parent_0.AvatarExperienceSlotBasedEditor).Enums.InventoryItemAvailability;
local v7 = require(l_script_FirstAncestor_0.Stores.getAvatarSwitcherStore);
local v8 = require(l_script_FirstAncestor_0.Components.SwitchAvatarButton);
local v9 = require(l_script_FirstAncestor_0.Components.AvatarPreview);
local v10 = require(l_script_FirstAncestor_0.Components.AvatarCompatibilityWarning);
local v11 = require(l_script_FirstAncestor_0.Components.OutfitViewport.OutfitViewportUtils);
local v12 = require(l_script_FirstAncestor_0.Enums.ExperienceAvatarSupportType);
local l_FFlagAvatarSwitcherAccurateAvatarWarning_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAvatarSwitcherAccurateAvatarWarning;
local l_FFlagAvatarSwitcherWarningLayoutFix_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAvatarSwitcherWarningLayoutFix;
local l_FFlagAvatarSwitcherExpiredItemsWarning_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAvatarSwitcherExpiredItemsWarning;
return function(v16) --[[ Line: 33 ]] --[[ Name: PreviewPanel ]]
    -- upvalues: v5 (copy), v7 (copy), l_useTokens_0 (copy), v2 (copy), l_FFlagAvatarSwitcherAccurateAvatarWarning_0 (copy), v11 (copy), l_FFlagAvatarSwitcherExpiredItemsWarning_0 (copy), l_InventoryItemAvailability_0 (copy), v3 (copy), l_FFlagAvatarSwitcherWarningLayoutFix_0 (copy), v9 (copy), v12 (copy), v8 (copy), v10 (copy)
    local v17 = v5.useSignalState(v7);
    local v18 = v5.useSignalState(v17.getSelectedOutfitId);
    local v19 = v5.useSignalState(v17.getSelectedOutfitDetails);
    local v20 = v5.useSignalState(v17.getExperienceAvatarSupportType);
    local v21 = v5.useSignalState(v17.getExperienceAvatarType);
    local v22 = l_useTokens_0();
    local v23 = v2.useCallback(function() --[[ Line: 41 ]]
        -- upvalues: v17 (copy)
        v17.toggleRespawnPrompt(true);
    end, {});
    local v24 = nil;
    local v25 = nil;
    local v26 = nil;
    if l_FFlagAvatarSwitcherAccurateAvatarWarning_0 then
        local v27, v28 = v2.useState(false);
        v24 = v27;
        v25 = v28;
        v26 = v2.useCallback(function(v29, v30) --[[ Line: 48 ]]
            -- upvalues: v19 (copy), v11 (ref), v25 (ref)
            local v31 = if v19 and v19.assetIds then v19.assetIds else {};
            local v32 = v11.hasMissingAssetsInDescription(v30, v31);
            local v33 = v11.hasMissingAccessoriesInHumanoid(v29, v30);
            v25(v32 or v33);
        end, {
            v19
        });
        v2.useEffect(function() --[[ Line: 60 ]]
            -- upvalues: v25 (ref)
            v25(false);
        end, {
            v18
        });
    end;
    local v34 = if v21 == Enum.HumanoidRigType.R6 then Enum.HumanoidRigType.R6 else if v19 then v19.rigType else nil;
    local v35 = false;
    if v19 ~= nil then
        v35 = true;
        if v19.rigType == v34 then
            v35 = l_FFlagAvatarSwitcherAccurateAvatarWarning_0 and v24;
        end;
    end;
    local v36 = nil;
    local v37 = nil;
    if l_FFlagAvatarSwitcherExpiredItemsWarning_0 then
        v36 = v19 and v19.availabilityStatus == l_InventoryItemAvailability_0.PartiallyAvailableWithExpiredSubitems;
        v37 = v35 and "Feature.AvatarSwitcher.Message.PartiallyUnsupported" or v36 and "Feature.AvatarSwitcher.Message.ExpiredItems" or nil;
    end;
    return (v2.createElement(v3.View, {
        tag = l_FFlagAvatarSwitcherWarningLayoutFix_0 and "size-full-full padding-x-xlarge padding-y-medium col gap-small" or "size-full-full padding-x-xlarge padding-y-medium col"
    }, {
        Content = v2.createElement(v3.View, {
            tag = "size-full-0 fill", 
            LayoutOrder = 1
        }, {
            AvatarPreview = v2.createElement(v9, {
                outfitId = v18, 
                rigType = v34, 
                imageScaleType = if v16.compactLayout then Enum.ScaleType.Fit else Enum.ScaleType.Crop, 
                showAvatarSupportWarning = v20 == v12.UnknownSupport, 
                showAvatarTypeCompatibilityWarning = if not l_FFlagAvatarSwitcherWarningLayoutFix_0 then v35 else nil, 
                messageBottomPadding = if v16.compactLayout then v22.Size.Size_800 + v22.Gap.Medium else v22.Gap.Medium, 
                onAvatarPreviewLoaded = if l_FFlagAvatarSwitcherAccurateAvatarWarning_0 then v26 else nil
            }), 
            FloatingButtonContainer = not l_FFlagAvatarSwitcherWarningLayoutFix_0 and v16.compactLayout and v2.createElement(v3.View, {
                tag = "auto-xy position-bottom-right anchor-bottom-right", 
                LayoutOrder = 2
            }, {
                SizeConstraint = v2.createElement("UISizeConstraint", {
                    MinSize = Vector2.new(100, 0)
                }), 
                SwitchButton = v2.createElement(v8, {
                    onActivated = v23
                })
            }), 
            FloatingBottomContainer = l_FFlagAvatarSwitcherWarningLayoutFix_0 and v16.compactLayout and v2.createElement(v3.View, {
                tag = "size-full-0 auto-y position-bottom-left anchor-bottom-left row gap-small align-x-right align-y-bottom"
            }, {
                AvatarCompatibilityWarningContainer = (if l_FFlagAvatarSwitcherExpiredItemsWarning_0 then v37 else v35) and v2.createElement(v3.View, {
                    tag = "grow auto-y", 
                    LayoutOrder = 1
                }, {
                    AvatarCompatibilityWarning = v2.createElement(v10, {
                        message = if l_FFlagAvatarSwitcherExpiredItemsWarning_0 then v37 else nil
                    })
                }), 
                FloatingButtonContainer = v2.createElement(v3.View, {
                    tag = "auto-xy position-bottom-right anchor-bottom-right", 
                    LayoutOrder = 2
                }, {
                    SizeConstraint = v2.createElement("UISizeConstraint", {
                        MinSize = Vector2.new(100, 0)
                    }), 
                    SwitchButton = v2.createElement(v8, {
                        onActivated = v23
                    })
                })
            })
        }), 
        AvatarCompatibilityWarning = l_FFlagAvatarSwitcherWarningLayoutFix_0 and not v16.compactLayout and (if l_FFlagAvatarSwitcherExpiredItemsWarning_0 then v37 else v35) and v2.createElement(v10, {
            LayoutOrder = 2, 
            message = if l_FFlagAvatarSwitcherExpiredItemsWarning_0 then v37 else nil
        }), 
        BottomButtonContainer = not v16.compactLayout and v2.createElement(v3.View, {
            tag = "size-full-0 auto-y", 
            LayoutOrder = l_FFlagAvatarSwitcherWarningLayoutFix_0 and 3 or 2
        }, {
            SwitchButton = v2.createElement(v8, {
                onActivated = v23
            })
        })
    }));
end;