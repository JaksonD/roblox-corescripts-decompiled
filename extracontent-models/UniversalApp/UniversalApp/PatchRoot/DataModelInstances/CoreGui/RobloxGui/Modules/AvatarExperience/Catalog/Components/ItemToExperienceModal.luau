local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v6 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_ContextualMenu_0 = v7.App.Menu.ContextualMenu;
local l_MenuDirection_0 = v7.App.Menu.MenuDirection;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v12 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v14 = require(l_Modules_0.LuaApp.Thunks.OpenGameDetails);
local l_ApiFetchGameIcons_0 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux).GameIcons.ApiFetchGameIcons;
local _ = require(l_Modules_0.AvatarExperience.Common.Models.CollectibleInstance);
local l_GameIconReducer_0 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux).GameIcons.GameIconReducer;
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local v19 = game:DefineFastFlag("AXOpenExperienceDetailsInFullView", false);
return v13(function(v20) --[[ Line: 45 ]] --[[ Name: ItemToExperienceModal ]]
    -- upvalues: l_useDispatch_0 (copy), v12 (copy), v6 (copy), v2 (copy), l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy), l_GameIconReducer_0 (copy), v3 (copy), l_ApiFetchGameIcons_0 (copy), v4 (copy), l_AvatarScreen_0 (copy), v14 (copy), v19 (copy), l_ContextualMenu_0 (copy), l_MenuDirection_0 (copy)
    local v21 = l_useDispatch_0();
    local v22 = v12(v6);
    local v23, v24 = v2.useState(nil);
    local v26 = l_useSelector_0(function(v25) --[[ Line: 50 ]]
        return v25.ScreenSize;
    end, l_getUseSelectorDeepEquals_0());
    local v28 = l_useSelector_0(function(v27) --[[ Line: 54 ]]
        -- upvalues: l_GameIconReducer_0 (ref)
        return v27[l_GameIconReducer_0.key];
    end, l_getUseSelectorDeepEquals_0());
    local v29 = v3({
        soldOutTitle = "Feature.Catalog.Label.ItemExperienceSoldOutTitle", 
        soldOutMessage = "Feature.Catalog.Label.ItemExperienceSoldOut", 
        limitReachedTitle = "Feature.Catalog.Label.ItemExperienceLimitReachedTitle", 
        limitReachedMessage = "Feature.Catalog.Label.ItemExperienceLimitReached"
    });
    local l_params_0 = v20.navigation.state.params;
    local l_collectibleData_0 = l_params_0.collectibleData;
    local l_isLimited_0 = l_params_0.isLimited;
    local v33 = l_collectibleData_0 and l_collectibleData_0.experiences;
    local v34 = if v33 then #v33 else 0;
    local v36 = l_useSelector_0(function(v35) --[[ Line: 71 ]]
        -- upvalues: l_collectibleData_0 (copy)
        if l_collectibleData_0 and l_collectibleData_0.collectibleItemId then
            return v35.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances[l_collectibleData_0.collectibleItemId] or {};
        else
            return {};
        end;
    end, l_getUseSelectorDeepEquals_0());
    v2.useEffect(function() --[[ Line: 81 ]]
        -- upvalues: v33 (copy), v21 (copy), l_ApiFetchGameIcons_0 (ref), v22 (copy), v34 (copy), v24 (copy)
        if not v33 then
            return;
        else
            local v37 = {};
            for _, v39 in ipairs(v33) do
                table.insert(v37, v39.id);
            end;
            v21(l_ApiFetchGameIcons_0(v22, v37));
            if v34 == 1 then
                v24(v33[1]);
            end;
            return;
        end;
    end, {
        v33, 
        v22
    });
    v2.useEffect(function() --[[ Line: 100 ]]

    end, {
        v28
    });
    v2.useEffect(function() --[[ Line: 104 ]]
        -- upvalues: v23 (copy), v36 (copy), v4 (ref), v20 (copy), l_collectibleData_0 (copy), l_isLimited_0 (copy), v29 (copy), l_AvatarScreen_0 (ref), v21 (copy), v14 (ref), v19 (ref)
        if not v23 then
            return;
        else
            assert(v23, "");
            local v40 = tostring(v23.id);
            local v41 = 0;
            for _, _ in v36 do
                v41 = v41 + 1;
            end;
            v4.closeOverlay(v20.navigation);
            local v44 = nil;
            local v45 = nil;
            if l_collectibleData_0.unitsAvailableForConsumption == 0 and l_isLimited_0 then
                v44 = v29.soldOutTitle;
                v45 = v29.soldOutMessage;
            elseif l_collectibleData_0.quantityLimitPerUser > 0 and l_collectibleData_0.quantityLimitPerUser <= v41 then
                v44 = v29.limitReachedTitle;
                v45 = v29.limitReachedMessage;
            end;
            if v44 or v45 then
                v20.navigation.navigate(l_AvatarScreen_0.OpenExperienceTraversalPrompt, {
                    gameName = v23.name, 
                    gameUniverseId = v40, 
                    overrideTitle = v44, 
                    overrideBody = if v45 then v45:gsub("{EXPERIENCE_NAME}", v23.name) else nil, 
                    hideConfirmationButton = true
                });
                return;
            else
                v21(v14(v40, if v19 then {
                    mountAsFullView = true
                } else {}));
                return;
            end;
        end;
    end, {
        v23, 
        l_collectibleData_0
    });
    local v46 = v2.useCallback(function() --[[ Line: 153 ]]
        -- upvalues: v4 (ref), v20 (copy)
        v4.closeOverlay(v20.navigation);
    end, {
        v20.navigation
    });
    if not v33 or v34 == 1 then
        return;
    else
        local v47 = {};
        for _, v49 in ipairs(v33) do
            local v50 = v28[tostring(v49.id)];
            table.insert(v47, {
                icon = if v50 then v50.url else nil, 
                text = v49.name, 
                onActivated = function() --[[ Line: 171 ]] --[[ Name: onActivated ]]
                    -- upvalues: v24 (copy), v49 (copy)
                    v24(v49);
                end
            });
        end;
        return v2.createElement(l_ContextualMenu_0, {
            buttonProps = v47, 
            open = true, 
            menuDirection = if l_params_0.menuDirection then l_params_0.menuDirection else l_MenuDirection_0.Up, 
            openPositionY = if l_params_0.openPositionY then l_params_0.openPositionY else UDim.new(1, -76), 
            openPositionX = UDim.new(0.35, 0), 
            closeBackgroundVisible = false, 
            screenSize = v26, 
            onDismiss = v46
        });
    end;
end);