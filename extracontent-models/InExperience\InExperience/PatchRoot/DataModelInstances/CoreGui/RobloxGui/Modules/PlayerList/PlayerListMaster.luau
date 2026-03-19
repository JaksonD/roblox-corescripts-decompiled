local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v8 = require(l_RobloxGui_0.Modules.TenFootInterface);
local v9 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v10 = require(l_CorePackages_0.Workspace.Packages.CachedPolicyService);
local v11 = require(l_CorePackages_0.Packages.Roact);
local v12 = require(l_CorePackages_0.Packages.Rodux);
local v13 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Constants_0 = require(l_CorePackages_0.Packages.UIBlox).App.Style.Constants;
local v15 = require(l_CoreGui_0.RobloxGui.Modules.ApolloClient);
local l_ApolloProvider_0 = require(l_CorePackages_0.Packages.ApolloClient).ApolloProvider;
local l_Parent_0 = script.Parent;
local v18 = require(l_CorePackages_0.Packages.Signals);
local v19 = require(l_CorePackages_0.Workspace.Packages.InExperienceTopBar);
local v20 = require(l_Parent_0.Reducers.Reducer);
local v21 = require(l_Parent_0.GlobalConfig);
local v22 = require(l_Parent_0.PlayerListSwitcher);
local v23 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local v24 = require(l_CorePackages_0.Workspace.Packages.PlayerIconInfoStore);
local l_Constants_1 = v23.Common.Constants;
local v26 = require(l_Parent_0.Actions.SetPlayerListEnabled);
local v27 = require(l_Parent_0.Actions.SetPlayerListVisibility);
local v28 = require(l_Parent_0.Actions.SetTempHideKey);
local v29 = require(l_Parent_0.Actions.SetTenFootInterface);
local v30 = require(l_Parent_0.Actions.SetSmallTouchDevice);
local v31 = require(l_Parent_0.Actions.SetIsUsingGamepad);
local v32 = require(l_Parent_0.Actions.SetMinimized);
local v33 = require(l_Parent_0.Actions.SetSubjectToChinaPolicies);
local v34 = require(l_Parent_0.Actions.SetSettings);
if not l_Players_0.LocalPlayer then
    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
end;
local l_FFlagUseNewPlayerList_0 = v23.Flags.FFlagUseNewPlayerList;
local l_FFlagAddNewPlayerListFocusNav_0 = v23.Flags.FFlagAddNewPlayerListFocusNav;
local v37 = require(l_Parent_0.Flags.FStringPlayerListOverrideType);
local l_FFlagReplacePlayerIconRoduxWithSignal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagReplacePlayerIconRoduxWithSignal;
local l_FFlagAddNewPlayerListMobileFocusNav_0 = v23.Flags.FFlagAddNewPlayerListMobileFocusNav;
local l_FFlagEnableMobilePlayerListOnConsole_0 = v23.Flags.FFlagEnableMobilePlayerListOnConsole;
local l_FFlagPlayerListUseMobileOnSmallDisplay_0 = v23.Flags.FFlagPlayerListUseMobileOnSmallDisplay;
local l_FFlagPlayerListIgnoreDevGamepadBindings_0 = v23.Flags.FFlagPlayerListIgnoreDevGamepadBindings;
local l_PlayerListContainer_0 = v23.Container.PlayerListContainer;
local l_LeaderboardStoreInstanceManager_0 = v23.LeaderboardStoreInstanceManager;
local l_PlayerIconInfoStore_0 = v24.PlayerIconInfoStore;
local l_FFlagTopBarSignalizeSetCores_0 = v19.Flags.FFlagTopBarSignalizeSetCores;
local function v50() --[[ Line: 66 ]] --[[ Name: isSmallTouchScreen ]]
    -- upvalues: l_FFlagPlayerListUseMobileOnSmallDisplay_0 (copy), l_GuiService_0 (copy), l_FFlagEnableMobilePlayerListOnConsole_0 (copy), l_UserInputService_0 (copy), v9 (copy), v37 (copy)
    if _G.__TESTEZ_RUNNING_TEST__ then
        return false;
    else
        local v47 = if l_FFlagPlayerListUseMobileOnSmallDisplay_0 then l_GuiService_0.ViewportDisplaySize == Enum.DisplaySize.Small else false;
        local v48 = if l_FFlagEnableMobilePlayerListOnConsole_0 then l_GuiService_0.ViewportDisplaySize == Enum.DisplaySize.Large else false;
        local v49 = if not not l_FFlagEnableMobilePlayerListOnConsole_0 or l_FFlagPlayerListUseMobileOnSmallDisplay_0 then l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch or l_UserInputService_0.PreferredInput == Enum.PreferredInput.Gamepad else false;
        return v9:IsSmallTouchScreen() or l_FFlagEnableMobilePlayerListOnConsole_0 and v48 and v49 or l_FFlagPlayerListUseMobileOnSmallDisplay_0 and v47 and v49 or v37 == "mobile";
    end;
end;
local function v53(v51) --[[ Line: 79 ]] --[[ Name: setupSettings ]]
    -- upvalues: v34 (copy), l_UserGameSettings_0 (copy)
    local function _() --[[ Line: 80 ]] --[[ Name: updateSettings ]]
        -- upvalues: v51 (copy), v34 (ref), l_UserGameSettings_0 (ref)
        v51:dispatch(v34({
            reducedMotion = l_UserGameSettings_0.ReducedMotion, 
            preferredTransparency = l_UserGameSettings_0.PreferredTransparency
        }));
    end;
    v51:dispatch(v34({
        reducedMotion = l_UserGameSettings_0.ReducedMotion, 
        preferredTransparency = l_UserGameSettings_0.PreferredTransparency
    }));
    l_UserGameSettings_0:GetPropertyChangedSignal("PreferredTransparency"):Connect(function() --[[ Line: 89 ]]
        -- upvalues: v51 (copy), v34 (ref), l_UserGameSettings_0 (ref)
        v51:dispatch(v34({
            reducedMotion = l_UserGameSettings_0.ReducedMotion, 
            preferredTransparency = l_UserGameSettings_0.PreferredTransparency
        }));
    end);
    l_UserGameSettings_0:GetPropertyChangedSignal("ReducedMotion"):Connect(function() --[[ Line: 92 ]]
        -- upvalues: v51 (copy), v34 (ref), l_UserGameSettings_0 (ref)
        v51:dispatch(v34({
            reducedMotion = l_UserGameSettings_0.ReducedMotion, 
            preferredTransparency = l_UserGameSettings_0.PreferredTransparency
        }));
    end);
end;
local v54 = {};
v54.__index = v54;
v54.new = function() --[[ Line: 100 ]] --[[ Name: new ]]
    -- upvalues: v54 (copy), v21 (copy), v11 (copy), v12 (copy), v20 (copy), v53 (copy), l_StarterGui_0 (copy), v26 (copy), v30 (copy), v50 (copy), l_FFlagEnableMobilePlayerListOnConsole_0 (copy), v29 (copy), v8 (copy), v33 (copy), v10 (copy), l_FFlagUseNewPlayerList_0 (copy), l_UserInputService_0 (copy), v31 (copy), l_Constants_0 (copy), v13 (copy), v22 (copy), l_ApolloProvider_0 (copy), v15 (copy), l_LeaderboardStoreInstanceManager_0 (copy), l_FFlagReplacePlayerIconRoduxWithSignal_0 (copy), l_PlayerIconInfoStore_0 (copy), l_PlayerListContainer_0 (copy), l_RobloxGui_0 (copy), l_CoreGui_0 (copy), l_FFlagAddNewPlayerListFocusNav_0 (copy), l_FFlagTopBarSignalizeSetCores_0 (copy), v18 (copy), v19 (copy)
    local v55 = setmetatable({}, v54);
    if v21.propValidation then
        v11.setGlobalConfig({
            propValidation = true
        });
    end;
    if v21.elementTracing then
        v11.setGlobalConfig({
            elementTracing = true
        });
    end;
    v55.layerCollectorRef = v11.createRef();
    v55.store = v12.Store.new(v20, nil, {
        v12.thunkMiddleware
    });
    v53(v55.store);
    if not l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.PlayerList) then
        v55.store:dispatch(v26(false));
    end;
    coroutine.wrap(function() --[[ Line: 126 ]]
        -- upvalues: v55 (copy), v30 (ref), v50 (ref)
        v55.store:dispatch(v30((v50())));
    end)();
    if l_FFlagEnableMobilePlayerListOnConsole_0 then
        v55.store:dispatch(v29(false));
    else
        v55.store:dispatch(v29(v8:IsEnabled()));
    end;
    coroutine.wrap(function() --[[ Line: 136 ]]
        -- upvalues: v55 (copy), v33 (ref), v10 (ref)
        v55.store:dispatch(v33(v10:IsSubjectToChinaPolicies()));
    end)();
    if not l_FFlagUseNewPlayerList_0 then
        local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
        local v57 = l_l_UserInputService_0_LastInputType_0 and l_l_UserInputService_0_LastInputType_0.Name:find("Gamepad");
        v55.store:dispatch(v31(v57 ~= nil));
    end;
    v55:_trackEnabled();
    local v58 = {
        themeName = l_Constants_0.ThemeName.Dark, 
        fontName = l_Constants_0.FontName.Gotham
    };
    v55.root = v11.createElement(v13.StoreProvider, {
        store = v55.store
    }, {
        Switcher = v11.createElement(v22, {
            appStyleForUiModeStyleProvider = v58, 
            setLayerCollectorEnabled = function(v59) --[[ Line: 158 ]] --[[ Name: setLayerCollectorEnabled ]]
                -- upvalues: v55 (copy)
                if not v55.layerCollectorRef.current then
                    return;
                else
                    v55.layerCollectorRef.current.Enabled = v59;
                    return;
                end;
            end
        })
    });
    v55.root = v11.createElement(l_ApolloProvider_0, {
        client = v15
    }, {
        StoreProvider = v55.root
    });
    v55._setIsUsingGamepad = function() --[[ Line: 172 ]]
        -- upvalues: l_UserInputService_0 (ref), v55 (copy), v31 (ref)
        local l_l_UserInputService_0_LastInputType_1 = l_UserInputService_0:GetLastInputType();
        local v61 = l_l_UserInputService_0_LastInputType_1 and l_l_UserInputService_0_LastInputType_1.Name:find("Gamepad");
        v55.store:dispatch(v31(v61 ~= nil));
    end;
    v55._mountLeaderboardStore = function() --[[ Line: 178 ]]
        -- upvalues: l_LeaderboardStoreInstanceManager_0 (ref)
        l_LeaderboardStoreInstanceManager_0.createLeaderboardStoreInstance();
    end;
    v55._unmountLeaderboardStore = function() --[[ Line: 182 ]]
        -- upvalues: l_LeaderboardStoreInstanceManager_0 (ref)
        l_LeaderboardStoreInstanceManager_0.cleanUpInstance();
    end;
    v55._unmountPlayerIconInfoStore = l_FFlagReplacePlayerIconRoduxWithSignal_0 and function() --[[ Line: 186 ]]
        -- upvalues: l_PlayerIconInfoStore_0 (ref)
        l_PlayerIconInfoStore_0.cleanUp();
    end or nil;
    if l_FFlagUseNewPlayerList_0 then
        v55._mountLeaderboardStore();
        v55._setIsUsingGamepad();
        v55.root = v11.createElement(l_PlayerListContainer_0, {
            leaderboardStore = l_LeaderboardStoreInstanceManager_0.getLeaderboardStoreInstance, 
            TopBarConstants = require(l_RobloxGui_0.Modules.TopBar.Constants), 
            isTenFoot = not l_FFlagEnableMobilePlayerListOnConsole_0 and v8:IsEnabled()
        }, {
            PlayerListMaster = v55.root
        });
    end;
    v55.root = v11.createElement("ScreenGui", {
        AutoLocalize = false, 
        IgnoreGuiInset = true, 
        DisplayOrder = 1, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        [v11.Ref] = v55.layerCollectorRef
    }, {
        PlayerListMaster = v55.root
    });
    v55.element = v11.mount(v55.root, l_CoreGui_0, "PlayerList");
    v55.topBarEnabled = true;
    v55.mounted = true;
    v55.coreGuiEnabled = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.PlayerList);
    v55:_updateMounted();
    v55.SetVisibleChangedEvent = Instance.new("BindableEvent");
    if l_FFlagAddNewPlayerListFocusNav_0 then
        v55.VisibilityChangedEvent = Instance.new("BindableEvent");
    end;
    if l_FFlagTopBarSignalizeSetCores_0 then
        v55.disposeEffect = v18.createEffect(function(v62) --[[ Line: 225 ]]
            -- upvalues: v19 (ref), v55 (copy)
            local l_GetTopBarStore_0 = v19.Stores.GetTopBarStore;
            if l_GetTopBarStore_0 then
                v55:SetTopBarEnabled(l_GetTopBarStore_0(v62).getTopBarCoreGuiEnabled(v62));
            end;
        end);
    end;
    v55.store.changed:connect(function(v64, v65) --[[ Line: 233 ]]
        -- upvalues: v55 (copy), l_FFlagAddNewPlayerListFocusNav_0 (ref)
        if v64.displayOptions.setVisible ~= v65.displayOptions.setVisible then
            v55.SetVisibleChangedEvent:Fire(v64.displayOptions.setVisible);
        end;
        if l_FFlagAddNewPlayerListFocusNav_0 and v64.displayOptions.isVisible ~= v65.displayOptions.isVisible then
            v55.VisibilityChangedEvent:Fire(v64.displayOptions.isVisible);
        end;
    end);
    return v55;
end;
v54._updateMounted = function(v66) --[[ Line: 247 ]] --[[ Name: _updateMounted ]]
    -- upvalues: l_FFlagEnableMobilePlayerListOnConsole_0 (copy), v8 (copy), l_FFlagUseNewPlayerList_0 (copy), v11 (copy), l_CoreGui_0 (copy)
    if l_FFlagEnableMobilePlayerListOnConsole_0 or not v8:IsEnabled() then
        local v67 = v66.coreGuiEnabled and v66.topBarEnabled;
        if v67 and not v66.mounted then
            if l_FFlagUseNewPlayerList_0 then
                v66._mountLeaderboardStore();
                v66._setIsUsingGamepad();
            end;
            v66.element = v11.mount(v66.root, l_CoreGui_0, "PlayerList");
            v66.mounted = true;
            return;
        elseif not v67 and v66.mounted then
            v11.unmount(v66.element);
            if l_FFlagUseNewPlayerList_0 then
                v66._unmountLeaderboardStore();
                if v66._unmountPlayerIconInfoStore then
                    v66._unmountPlayerIconInfoStore();
                end;
            end;
            v66.mounted = false;
            if v66.inspector then
                v66.inspector:destroy();
                v66.inspector = nil;
            end;
        end;
    end;
end;
v54._trackEnabled = function(v68) --[[ Line: 274 ]] --[[ Name: _trackEnabled ]]
    -- upvalues: l_StarterGui_0 (copy), v26 (copy), l_FFlagPlayerListIgnoreDevGamepadBindings_0 (copy), l_GuiService_0 (copy), l_Constants_1 (copy)
    l_StarterGui_0.CoreGuiChangedSignal:Connect(function(v69, v70) --[[ Line: 275 ]]
        -- upvalues: v68 (copy), v26 (ref), l_FFlagPlayerListIgnoreDevGamepadBindings_0 (ref), l_GuiService_0 (ref), l_Constants_1 (ref)
        if v69 == Enum.CoreGuiType.All or v69 == Enum.CoreGuiType.PlayerList then
            v68.coreGuiEnabled = v70;
            v68:_updateMounted();
            v68.store:dispatch(v26(v70));
            if l_FFlagPlayerListIgnoreDevGamepadBindings_0 and not v70 then
                l_GuiService_0:SetMenuIsOpen(false, l_Constants_1.PLAYER_LIST_MENU);
            end;
        end;
    end);
end;
if l_FFlagAddNewPlayerListMobileFocusNav_0 then
    v54.GetIsModal = function(v71) --[[ Line: 290 ]] --[[ Name: GetIsModal ]]
        return v71.store:getState().displayOptions.isSmallTouchDevice;
    end;
end;
v54.GetVisibility = function(v72) --[[ Line: 295 ]] --[[ Name: GetVisibility ]]
    return v72.store:getState().displayOptions.isVisible;
end;
if l_FFlagAddNewPlayerListFocusNav_0 then
    v54.GetVisibilityChangedEvent = function(v73) --[[ Line: 300 ]] --[[ Name: GetVisibilityChangedEvent ]]
        return v73.VisibilityChangedEvent;
    end;
end;
v54.GetSetVisible = function(v74) --[[ Line: 305 ]] --[[ Name: GetSetVisible ]]
    return v74.store:getState().displayOptions.setVisible;
end;
v54.GetSetVisibleChangedEvent = function(v75) --[[ Line: 309 ]] --[[ Name: GetSetVisibleChangedEvent ]]
    return v75.SetVisibleChangedEvent;
end;
v54.SetVisibility = function(v76, v77) --[[ Line: 313 ]] --[[ Name: SetVisibility ]]
    -- upvalues: v27 (copy)
    v76.store:dispatch(v27(v77));
end;
v54.HideTemp = function(v78, v79, v80) --[[ Line: 317 ]] --[[ Name: HideTemp ]]
    -- upvalues: v28 (copy)
    if v80 == false then
        v80 = nil;
    end;
    v78.store:dispatch(v28(v79, v80));
end;
v54.SetTopBarEnabled = function(v81, v82) --[[ Line: 324 ]] --[[ Name: SetTopBarEnabled ]]
    v81.topBarEnabled = v82;
    v81:_updateMounted();
end;
v54.SetMinimized = function(v83, v84) --[[ Line: 329 ]] --[[ Name: SetMinimized ]]
    -- upvalues: v32 (copy)
    v83.store:dispatch(v32(v84));
end;
return v54;