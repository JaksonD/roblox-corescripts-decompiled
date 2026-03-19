local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchSellPageData);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCollectibleResellableInstances);
local v12 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v13 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_Images_0 = v4.App.ImageSet.Images;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_Interactable_0 = v4.Core.Control.Interactable;
local l_ControlState_0 = v4.Core.Control.Enum.ControlState;
local l_useSelectionCursor_0 = v4.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v4.App.SelectionImage.CursorKind;
local v21 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagL2ControllerSupport);
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local v23 = {
    [l_ControlState_0.Default] = "BackgroundUIDefault", 
    [l_ControlState_0.Hover] = "BackgroundOnHover", 
    [l_ControlState_0.Pressed] = "BackgroundOnPress"
};
local v24 = {
    onActivated = function() --[[ Line: 56 ]] --[[ Name: onActivated ]]

    end
};
return (v2.forwardRef(function(v25, v26) --[[ Line: 59 ]]
    -- upvalues: v3 (copy), v24 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy), v2 (copy), l_ControlState_0 (copy), v12 (copy), v13 (copy), v11 (copy), v10 (copy), v23 (copy), l_useLocalization_0 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), l_Focusable_0 (copy), l_Interactable_0 (copy), v21 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy)
    v25 = v3.Dictionary.join(v24, v25);
    local v27 = l_useStyle_0();
    local v28 = l_useDispatch_0();
    local l_collectibleItemId_0 = v25.collectibleItemId;
    local v37 = l_useSelector_0(function(v30) --[[ Line: 68 ]]
        -- upvalues: l_collectibleItemId_0 (copy), v25 (ref)
        if l_collectibleItemId_0 then
            local v31 = v30.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances[l_collectibleItemId_0];
            if not v31 then
                return nil;
            else
                local v32 = 0;
                for _, _ in v31 do
                    v32 = v32 + 1;
                end;
                return v32;
            end;
        else
            local v35 = v30.AvatarExperience.Catalog.Sell.AvailableToSellAssets[v25.itemId];
            local v36 = v30.AvatarExperience.Catalog.Sell.CurrentlySellingAssets[v25.itemId];
            if not v35 or not v36 then
                return nil;
            else
                return #v35 + #v36;
            end;
        end;
    end, l_getUseSelectorDeepEquals_0());
    local v39 = l_useSelector_0(function(v38) --[[ Line: 90 ]]
        return v38.LocalUserId;
    end, l_getUseSelectorDeepEquals_0());
    local v40, v41 = v2.useState(l_ControlState_0.Initialize);
    local v44 = v2.useCallback(function(_, v43) --[[ Line: 95 ]]
        -- upvalues: v41 (copy)
        v41(v43);
    end);
    local v45 = v12(v13);
    v2.useEffect(function() --[[ Line: 101 ]]
        -- upvalues: v45 (copy), l_collectibleItemId_0 (copy), v28 (copy), v11 (ref), v39 (copy), v10 (ref), v25 (ref)
        if not v45 then
            return;
        elseif l_collectibleItemId_0 then
            v28(v11(v45, l_collectibleItemId_0, v39));
            return;
        else
            v28(v10(v45, v25.itemId, v39));
            return;
        end;
    end, {
        v25.itemId, 
        v39, 
        l_collectibleItemId_0
    });
    local v46 = v27.Theme[v23[v40] or v23[l_ControlState_0.Default]];
    local v47 = l_useLocalization_0({
        itemOwned = {
            "Feature.Catalog.Label.ItemOwnedCount"; 
            itemCount = v37 or 0
        }
    });
    local v48 = l_useSelectionCursor_0(l_CursorKind_0.RoundedRect);
    return v2.createElement(l_Focusable_0[l_Interactable_0], {
        Size = v25.size, 
        AutomaticSize = v25.automaticSize, 
        BackgroundColor3 = v46.Color, 
        BackgroundTransparency = v46.Transparency, 
        BorderSizePixel = 0, 
        AutoButtonColor = false, 
        LayoutOrder = v25.layoutOrder, 
        onStateChanged = v44, 
        ref = if v21() then v26 else nil, 
        SelectionImageObject = if v21() then v48 else nil, 
        NextSelectionUp = if v21() then v25.NextSelectionUp else nil, 
        NextSelectionDown = if v21() then v25.NextSelectionDown else nil, 
        NextSelectionLeft = if v21() then v25.NextSelectionLeft else nil, 
        NextSelectionRight = if v21() then v25.NextSelectionRight else nil, 
        [v2.Event.Activated] = v25.onActivated
    }, {
        Corner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        Padding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 14), 
            PaddingRight = UDim.new(0, 14), 
            PaddingTop = UDim.new(0, 14), 
            PaddingBottom = UDim.new(0, 14)
        }), 
        ItemOwnedLabelContainer = v2.createElement("Frame", {
            Size = UDim2.fromScale(0, 1), 
            BorderSizePixel = 0
        }, {
            Layout = v2.createElement("UIListLayout", {
                Padding = UDim.new(0, 6), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                FillDirection = Enum.FillDirection.Horizontal
            }), 
            OwnedIcon = v2.createElement(l_ImageSetLabel_0, {
                Size = UDim2.fromOffset(16, 16), 
                Image = l_Images_0["icons/status/item/owned"], 
                ImageColor3 = v27.Theme.IconEmphasis.Color, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 1
            }), 
            ItemOwnedLabel = v2.createElement("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Text = v47.itemOwned, 
                Font = v27.Font.Body.Font, 
                TextSize = v27.Font.BaseSize * v27.Font.Body.RelativeSize, 
                TextColor3 = v27.Theme.TextDefault.Color, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            })
        }), 
        ItemCountLabelContainer = v2.createElement("Frame", {
            Size = UDim2.fromScale(0, 1), 
            Position = UDim2.fromScale(1, 0), 
            BorderSizePixel = 0
        }, {
            Layout = v2.createElement("UIListLayout", {
                Padding = UDim.new(0, 6), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                FillDirection = Enum.FillDirection.Horizontal
            }), 
            ArrowIcon = v2.createElement(l_ImageSetLabel_0, {
                Size = UDim2.fromOffset(16, 16), 
                Image = l_Images_0["icons/navigation/pushRight_small"], 
                ImageColor3 = v27.Theme.IconEmphasis.Color, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 2
            })
        })
    });
end));