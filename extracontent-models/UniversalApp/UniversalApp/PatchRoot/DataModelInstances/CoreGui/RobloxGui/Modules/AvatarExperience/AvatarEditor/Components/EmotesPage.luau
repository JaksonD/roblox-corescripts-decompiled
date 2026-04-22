local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v3.Focusable;
local v5 = require(l_CorePackages_0.Packages.Foundation);
local v6 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local v7 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v7.Enums.AvatarScreen;
local l_useAvatarRoute_0 = v7.AvatarRoute.Hooks.useAvatarRoute;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useTokens_0 = v5.Hooks.useTokens;
local v14 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.EquipSlots);
local v15 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.ItemsList);
local v16 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetSelectedEmoteSlot);
local v17 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_logOnOverlayClosed_0 = v7.Debug.logOnOverlayClosed;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local function v22(v21) --[[ Line: 39 ]] --[[ Name: selectAvatarType ]]
    return v21.AvatarExperience.AvatarEditor.Character.AvatarType;
end;
return v2.memo(v2.forwardRef(function(v23, v24) --[[ Line: 43 ]] --[[ Name: EmotesPage ]]
    -- upvalues: v2 (copy), v6 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), l_useSelector_0 (copy), v22 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v3 (copy), l_useTokens_0 (copy), l_AvatarScreen_0 (copy), l_logOnOverlayClosed_0 (copy), v17 (copy), v16 (copy), l_Focusable_0 (copy), v14 (copy), v15 (copy)
    local v25 = v2.useRef(nil);
    local v26 = v2.useRef(nil);
    local v27, v28 = v2.useState(false);
    local v29, v30 = v2.useState(false);
    local v31 = v6.usePreferredInput();
    local v32 = l_useDispatch_0();
    local v33 = l_useNavigation_0();
    local v34 = l_useAvatarRoute_0();
    local v35 = l_useSelector_0(v22);
    local v36 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v3.useFocusController();
    local v37 = l_useTokens_0();
    local v38 = v31 == v6.Input.Directional;
    local v39 = v38 and v34.current.name == l_AvatarScreen_0.ItemDetails;
    local v41 = v2.useCallback(function(v40) --[[ Line: 60 ]]
        -- upvalues: v28 (copy)
        v28(v40);
    end, {});
    local v43 = v2.useCallback(function(v42) --[[ Line: 64 ]]
        -- upvalues: v30 (copy)
        v30(v42);
    end, {});
    local v46 = v2.useCallback(function(v44) --[[ Line: 68 ]]
        -- upvalues: l_logOnOverlayClosed_0 (ref), v38 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v36 (copy), v35 (copy), v17 (ref), v33 (copy), l_AvatarScreen_0 (ref), v32 (copy), v16 (ref)
        local function v45() --[[ Line: 69 ]]
            -- upvalues: l_logOnOverlayClosed_0 (ref), v38 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v36 (ref)
            l_logOnOverlayClosed_0("EmotesPage", v38);
            if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v38 then
                v36.captureFocus();
            end;
        end;
        if v35 == v17.AvatarType.R6 then
            v33.navigate(l_AvatarScreen_0.R15UpgradePrompt, {
                onOverlayClosed = v45, 
                bodyTextKey = "Feature.Avatar.Message.R15EmotesPrompt"
            });
        end;
        v32(v16(v44));
    end, {
        v35, 
        v33, 
        v32, 
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v36, 
        v38
    });
    return v2.createElement(l_Focusable_0.Frame, {
        AnchorPoint = Vector2.new(0.5, 0), 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0.5, 0, 0, 0), 
        BackgroundTransparency = 1, 
        defaultChild = v25, 
        restorePreviousChildFocus = v23.restorePreviousChildFocus, 
        ref = v24
    }, {
        ListLayout = v2.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        EquipSlots = v2.createElement(v14, {
            slotsCount = v23.categoryInfo.EquipSlotsCount, 
            lockNavigationCallback = v23.lockNavigationCallback, 
            unlockNavigationCallback = v23.unlockNavigationCallback, 
            onActivated = v46, 
            LayoutOrder = 1, 
            NextSelectionUp = v23.NextSelectionUp, 
            itemsListRef = v26, 
            ref = v25, 
            onFocusChanged = v41, 
            itemsListFocused = v29, 
            darkenItemsGrid = v39
        }), 
        Tiles = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, -72), 
            LayoutOrder = 2
        }, {
            GamepadDarkOverlay = v27 and v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = v37.Color.Extended.Black.Black_50.Transparency, 
                BackgroundColor3 = v37.Color.Extended.Black.Black_50.Color3
            }), 
            ItemsList = v2.createElement(v15, {
                buttonBInputRef = v25, 
                ref = v26, 
                onFocusChanged = v43, 
                darkenItemsGrid = v39, 
                tagBasedImpressionsDetectorExtensions = {}, 
                NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v25 else nil
            })
        })
    });
end));