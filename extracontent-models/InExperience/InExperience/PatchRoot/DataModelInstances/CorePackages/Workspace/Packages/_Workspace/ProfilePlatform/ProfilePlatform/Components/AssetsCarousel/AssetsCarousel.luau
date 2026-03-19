local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v4 = require(l_script_FirstAncestor_0.Common.Enums);
local l_CollectionCarousel_0 = require(l_Parent_0.CollectionViews).CollectionCarousel;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local l_useScreenSize_1 = require(l_Parent_0.CoreScriptsRoactCommon).useScreenSize;
local v9 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v10 = require(l_script_FirstAncestor_0.Hooks.useDynamicSizeMargin);
local l_FormFactor_0 = require(l_Parent_0.FormFactor).Enums.FormFactor;
local v12 = require(l_Parent_0.Responsive);
local l_useBreakpointX_0 = v12.useBreakpointX;
local l_useIsSpatial_0 = require(l_Parent_0.Responsive).useIsSpatial;
local v15 = require(l_Parent_0.Foundation);
local v16 = require(script.Parent.AssetTile);
local _ = require(l_script_FirstAncestor_0.Common.AssetInfo);
local v18 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_FFlagProfilePlatformEnableInventory_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformEnableInventory;
local v20 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableVR);
local l_FFlagAddIEMProfilePage_0 = require(l_Parent_0.SharedFlags).FFlagAddIEMProfilePage;
local v22 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformFixResaleLimitedPrice);
local l_FFlagProfilePlatformEnableBundlesInAssetsCarousel_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformEnableBundlesInAssetsCarousel;
local v24 = game:DefineFastFlag("SeeMoreCurrentlyWearingCompact", false);
local v25 = game:DefineFastFlag("SeeMoreCurrentlyWearingWide", false);
local v26 = game:DefineFastFlag("ProfilePlatformUseNewLayoutForAssetsCarousel", false);
local l_useTokens_0 = v15.Hooks.useTokens;
local v28 = 2;
return function(v29) --[[ Line: 62 ]] --[[ Name: AssetsCarousel ]]
    -- upvalues: l_FFlagAddIEMProfilePage_0 (copy), v9 (copy), v26 (copy), l_useTokens_0 (copy), v20 (copy), l_useIsSpatial_0 (copy), l_useScreenSize_0 (copy), l_useScreenSize_1 (copy), v4 (copy), v10 (copy), v2 (copy), l_FFlagProfilePlatformEnableInventory_0 (copy), l_useLocalization_0 (copy), v18 (copy), v24 (copy), v25 (copy), l_useSelector_0 (copy), l_FormFactor_0 (copy), v28 (ref), l_useBreakpointX_0 (copy), v12 (copy), v16 (copy), v22 (copy), l_FFlagProfilePlatformEnableBundlesInAssetsCarousel_0 (copy), l_CollectionCarousel_0 (copy)
    local v30 = if l_FFlagAddIEMProfilePage_0 then v9().sourceInfo.source else nil;
    local v31 = if v26 then l_useTokens_0() else nil;
    local v32 = if v20 then l_useIsSpatial_0() else nil;
    local v33 = l_useScreenSize_0();
    local v34 = if l_FFlagAddIEMProfilePage_0 then l_useScreenSize_1() else nil;
    if l_FFlagAddIEMProfilePage_0 and v30 == v4.Sources.InExperienceProfile then
        v33 = v34;
    end;
    local v35, v36 = v10();
    local v37, v38 = v2.useState(0);
    local v39 = if l_FFlagProfilePlatformEnableInventory_0 then v29.title else l_useLocalization_0({
        currentlyWearing = v18.CurrentlyWearing
    });
    if v24 or v25 then
        local v41 = l_useSelector_0(function(v40) --[[ Line: 82 ]]
            -- upvalues: l_FormFactor_0 (ref)
            return v40.FormFactor == l_FormFactor_0.WIDE;
        end);
        if v25 and v41 then
            v28 = 4;
        elseif v24 and not v41 then
            v28 = 3;
        end;
    end;
    local v42 = if l_FFlagAddIEMProfilePage_0 then l_useBreakpointX_0() else nil;
    if l_FFlagAddIEMProfilePage_0 and v30 == v4.Sources.InExperienceProfile then
        if v42 == v12.Keys.XSmall then
            v28 = 2;
        elseif v42 == v12.Keys.Small then
            v28 = 3;
        else
            v28 = 5;
        end;
    end;
    local v46 = v2.useCallback(function(v43, v44, v45) --[[ Line: 104 ]]
        -- upvalues: v2 (ref), v16 (ref), v22 (ref), l_FFlagProfilePlatformEnableBundlesInAssetsCarousel_0 (ref), v20 (ref), v32 (copy), v29 (copy)
        return v2.createElement("Frame", {
            Size = v45, 
            BackgroundTransparency = 1, 
            LayoutOrder = v44
        }, {
            [("%*"):format(v43.name)] = v2.createElement(v16, {
                name = v43.name, 
                price = v43.price, 
                isOffSale = v43.isOffSale and true or nil, 
                lowestResalePrice = if v22 then v43.lowestResalePrice else nil, 
                assetId = v43.id, 
                itemType = if l_FFlagProfilePlatformEnableBundlesInAssetsCarousel_0 then v43.itemType else "Asset", 
                onActivated = function() --[[ Line: 122 ]] --[[ Name: onActivated ]]
                    -- upvalues: v20 (ref), v32 (ref), v29 (ref), v43 (copy), v44 (copy)
                    if v20 and v32 then
                        return;
                    else
                        v29.openItemDetails(v43.id, v43.itemType, nil, nil, v44);
                        return;
                    end;
                end
            })
        }), "CW_Tile";
    end, {
        v29.openItemDetails
    });
    local v48 = v2.useCallback(function(v47) --[[ Line: 134 ]]
        -- upvalues: v38 (copy), l_FFlagAddIEMProfilePage_0 (ref), v30 (copy), v4 (ref)
        v38(v47);
        return v47 + 42 + (l_FFlagAddIEMProfilePage_0 and v30 == v4.Sources.InExperienceProfile and 16 or 0);
    end, {});
    local v49 = #v29.assets > v28;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v37 + 42 + (l_FFlagAddIEMProfilePage_0 and v30 == v4.Sources.InExperienceProfile and 16 or 0) + (v49 and 0 or 60 + v33.Y * 0.01)), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v29.layoutOrder, 
        [v2.Change.AbsoluteSize] = v36
    }, {
        CollectionCarousel = v2.createElement(l_CollectionCarousel_0, {
            LayoutOrder = v29.layoutOrder, 
            title = if l_FFlagProfilePlatformEnableInventory_0 then v29.title else v39.currentlyWearing, 
            items = v29.assets, 
            renderItem = v46, 
            getItemHeight = v48, 
            numColumns = v28, 
            fractionalItemAmount = 0.8, 
            columnGap = if v26 then v31.Gap.Medium else 8, 
            sideMargin = v35, 
            onActivateHeader = if not l_FFlagProfilePlatformEnableInventory_0 or v32 then nil else v29.onActivateHeader
        })
    });
end;