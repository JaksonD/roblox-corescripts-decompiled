local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
if not l_LocalPlayer_0 then
    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v9 = require(l_CorePackages_0.Packages.Roact);
local v10 = require(l_CorePackages_0.Packages.Rodux);
local v11 = require(l_CorePackages_0.Packages.RoactRodux);
local v12 = require(l_CorePackages_0.Packages.UIBlox);
local v13 = require(l_CorePackages_0.Packages.Signals);
local v14 = require(l_CorePackages_0.Workspace.Packages.InExperienceTopBar);
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Actions_0 = l_Parent_0.Actions;
local l_Components_0 = l_Parent_0.Components;
local l_Reducers_0 = l_Parent_0.Reducers;
local l_Thunks_0 = l_Parent_0.Thunks;
local l_Utility_0 = l_Parent_0.Utility;
local v22 = require(l_Parent_1.BackpackScript);
local v23 = require(l_Parent_1.ChatSelector);
local v24 = require(l_Parent_1.TenFootInterface);
local v25 = require(l_Parent_1.TopBar.Constants);
local l_InExperienceAppChatModal_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).App.InExperienceAppChatModal;
local l_FFlagTopBarSignalizeSetCores_0 = v14.Flags.FFlagTopBarSignalizeSetCores;
local l_Constants_0 = v12.App.Style.Constants;
local l_UiModeStyleProvider_0 = require(l_CorePackages_0.Workspace.Packages.Style).UiModeStyleProvider;
local v30 = require(l_Utility_0.CanPlayEmotes);
local v31 = require(l_Parent_0.Constants);
local v32 = require(l_Components_0.EmotesMenu);
local v33 = require(l_Reducers_0.EmotesMenuReducer);
local v34 = require(l_Thunks_0.OpenMenu);
local v35 = require(l_Actions_0.HideMenu);
local v36 = require(l_Actions_0.EmotesChanged);
local v37 = require(l_Actions_0.EquippedEmotesChanged);
local v38 = require(l_Actions_0.NumberEmotesLoadedChanged);
local v39 = require(l_Actions_0.SetGuiInset);
local v40 = require(l_Actions_0.SetLayout);
local v41 = require(l_Actions_0.SetLocale);
local v42 = {};
v42.__index = v42;
local function _() --[[ Line: 64 ]] --[[ Name: isClient ]]
    -- upvalues: l_RunService_0 (copy)
    return l_RunService_0:IsClient() and not l_RunService_0:IsEdit() and not l_RunService_0:IsRunMode();
end;
v42.isOpen = function(v44) --[[ Line: 68 ]] --[[ Name: isOpen ]]
    return v44.store:getState().displayOptions.menuVisible;
end;
v42.isEmotesLoaded = function(v45) --[[ Line: 72 ]] --[[ Name: isEmotesLoaded ]]
    return v45.store:getState().emotesPage.numberEmotesLoaded > 0;
end;
v42.open = function(v46) --[[ Line: 76 ]] --[[ Name: open ]]
    -- upvalues: v34 (copy)
    v46.store:dispatch(v34());
end;
v42.close = function(v47) --[[ Line: 80 ]] --[[ Name: close ]]
    -- upvalues: v35 (copy)
    v47.store:dispatch(v35());
end;
v42.setTopBarEnabled = function(v48, v49) --[[ Line: 84 ]] --[[ Name: setTopBarEnabled ]]
    -- upvalues: l_StarterGui_0 (copy)
    v48.topBarEnabled = v49;
    local l_l_StarterGui_0_CoreGuiEnabled_0 = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu);
    if v49 and l_l_StarterGui_0_CoreGuiEnabled_0 and v48.canPlayEmotes then
        v48:_mount();
        return;
    else
        v48:_unmount();
        return;
    end;
end;
v42._connectCoreGuiListeners = function(v51) --[[ Line: 95 ]] --[[ Name: _connectCoreGuiListeners ]]
    -- upvalues: v22 (copy), v23 (copy), l_InExperienceAppChatModal_0 (copy)
    v22.StateChanged.Event:Connect(function(v52) --[[ Line: 96 ]]
        -- upvalues: v51 (copy)
        if not v52 then
            return;
        else
            if v51:isOpen() then
                v51:close();
            end;
            return;
        end;
    end);
    v23.VisibilityStateChanged:connect(function(v53) --[[ Line: 106 ]]
        -- upvalues: v51 (copy)
        if not v53 then
            return;
        else
            if v51:isOpen() then
                v51:close();
            end;
            return;
        end;
    end);
    l_InExperienceAppChatModal_0.default.visibilitySignal.Event:Connect(function(v54) --[[ Line: 116 ]]
        -- upvalues: v51 (copy)
        if v54 and v51:isOpen() then
            v51:close();
        end;
    end);
end;
v42._connectApiListeners = function(v55) --[[ Line: 123 ]] --[[ Name: _connectApiListeners ]]
    -- upvalues: l_StarterGui_0 (copy), l_GuiService_0 (copy)
    l_StarterGui_0.CoreGuiChangedSignal:connect(function(v56, v57) --[[ Line: 124 ]]
        -- upvalues: v55 (copy)
        if not v55.topBarEnabled then
            return;
        elseif not v55.canPlayEmotes then
            return;
        else
            if v56 == Enum.CoreGuiType.EmotesMenu or v56 == Enum.CoreGuiType.All then
                if v57 then
                    v55:_mount();
                    return;
                else
                    v55:_unmount();
                end;
            end;
            return;
        end;
    end);
    l_GuiService_0.EmotesMenuOpenChanged:Connect(function(v58) --[[ Line: 142 ]]
        -- upvalues: v55 (copy)
        if v58 then
            if not v55:isOpen() then
                v55:open();
                return;
            end;
        elseif v55:isOpen() then
            v55:close();
        end;
    end);
end;
v42._onEquippedEmotesChanged = function(v59, v60) --[[ Line: 155 ]] --[[ Name: _onEquippedEmotesChanged ]]
    -- upvalues: v37 (copy)
    v59.store:dispatch(v37(v60));
end;
v42._onEmotesChanged = function(v61, v62) --[[ Line: 159 ]] --[[ Name: _onEmotesChanged ]]
    -- upvalues: v36 (copy)
    v61.store:dispatch(v36(v62));
end;
v42._onNumberEmotesLoadedChanged = function(v63, v64) --[[ Line: 163 ]] --[[ Name: _onNumberEmotesLoadedChanged ]]
    -- upvalues: v38 (copy)
    v63.store:dispatch(v38(v64));
    v63.EmotesLoaded:Fire(v64 > 0);
end;
v42._onHumanoidDescriptionChanged = function(v65, v66) --[[ Line: 168 ]] --[[ Name: _onHumanoidDescriptionChanged ]]
    if v65.equippedEmotesChangedConn then
        v65.equippedEmotesChangedConn:Disconnect();
        v65.equippedEmotesChangedConn = nil;
    end;
    if v65.emotesChangedConn then
        v65.emotesChangedConn:Disconnect();
        v65.emotesChangedConn = nil;
    end;
    if v65.numberEmotesLoadedChangedConn then
        v65.numberEmotesLoadedChangedConn:Disconnect();
        v65.numberEmotesLoadedChangedConn = nil;
    end;
    if v65.humanoidDescriptionAncestryConn then
        v65.humanoidDescriptionAncestryConn:Disconnect();
        v65.humanoidDescriptionAncestryConn = nil;
    end;
    if v66 then
        v65.equippedEmotesChangedConn = v66.EquippedEmotesChanged:Connect(function(v67) --[[ Line: 190 ]]
            -- upvalues: v65 (copy)
            v65:_onEquippedEmotesChanged(v67);
        end);
        v65:_onEquippedEmotesChanged(v66:GetEquippedEmotes());
        v65.emotesChangedConn = v66.EmotesChanged:Connect(function(v68) --[[ Line: 195 ]]
            -- upvalues: v65 (copy)
            v65:_onEmotesChanged(v68);
        end);
        v65:_onEmotesChanged(v66:GetEmotes());
        v65.numberEmotesLoadedChangedConn = v66:GetPropertyChangedSignal("NumberEmotesLoaded"):Connect(function(v69) --[[ Line: 202 ]]
            -- upvalues: v65 (copy)
            v65:_onNumberEmotesLoadedChanged(v69);
        end);
        v65:_onNumberEmotesLoadedChanged(v66.NumberEmotesLoaded);
        v65.humanoidDescriptionAncestryConn = v66.AncestryChanged:Connect(function(v70, v71) --[[ Line: 207 ]]
            -- upvalues: v66 (copy), v65 (copy)
            if v70 == v66 and v71 == nil then
                v65:_onHumanoidDescriptionChanged(nil);
            end;
        end);
        return;
    else
        v65:_onEquippedEmotesChanged({});
        v65:_onEmotesChanged({});
        v65:_onNumberEmotesLoadedChanged(-1);
        return;
    end;
end;
v42._onHumanoidChanged = function(v72, v73) --[[ Line: 219 ]] --[[ Name: _onHumanoidChanged ]]
    if v72.humanoidChildAddedConn then
        v72.humanoidChildAddedConn:Disconnect();
        v72.humanoidChildAddedConn = nil;
    end;
    if v72.humanoidAncestryChangedConn then
        v72.humanoidAncestryChangedConn:Disconnect();
        v72.humanoidAncestryChangedConn = nil;
    end;
    if v73 then
        v72.humanoidChildAddedConn = v73.ChildAdded:Connect(function(v74) --[[ Line: 231 ]]
            -- upvalues: v72 (copy)
            if v74:IsA("HumanoidDescription") then
                v72:_onHumanoidDescriptionChanged(v74);
            end;
        end);
        local l_HumanoidDescription_0 = v73:FindFirstChildOfClass("HumanoidDescription");
        if l_HumanoidDescription_0 then
            v72:_onHumanoidDescriptionChanged(l_HumanoidDescription_0);
        end;
        v72.humanoidAncestryChangedConn = v73.AncestryChanged:Connect(function(v76, v77) --[[ Line: 242 ]]
            -- upvalues: v73 (copy), v72 (copy)
            if v76 == v73 and v77 == nil then
                v72:_onHumanoidChanged(nil);
            end;
        end);
        return;
    else
        v72:_onHumanoidDescriptionChanged(nil);
        return;
    end;
end;
v42._onCharacterAdded = function(v78, v79) --[[ Line: 252 ]] --[[ Name: _onCharacterAdded ]]
    if v78.characterChildAddedConn then
        v78.characterChildAddedConn:Disconnect();
        v78.characterChildAddedConn = nil;
    end;
    v78.characterChildAddedConn = v79.ChildAdded:Connect(function(v80) --[[ Line: 258 ]]
        -- upvalues: v78 (copy)
        if v80:IsA("Humanoid") then
            v78:_onHumanoidChanged(v80);
        end;
    end);
    local l_Humanoid_0 = v79:FindFirstChildWhichIsA("Humanoid");
    if l_Humanoid_0 then
        v78:_onHumanoidChanged(l_Humanoid_0);
    end;
end;
v42._connectListeners = function(v82) --[[ Line: 270 ]] --[[ Name: _connectListeners ]]
    -- upvalues: l_LocalPlayer_0 (ref), l_LocalizationService_0 (copy), v41 (copy), v30 (copy), l_StarterGui_0 (copy), l_FFlagTopBarSignalizeSetCores_0 (copy), v13 (copy), v14 (copy)
    v82:_connectCoreGuiListeners();
    v82:_connectApiListeners();
    l_LocalPlayer_0.CharacterAdded:Connect(function(v83) --[[ Line: 274 ]]
        -- upvalues: v82 (copy)
        v82:_onCharacterAdded(v83);
    end);
    if l_LocalPlayer_0.Character then
        v82:_onCharacterAdded(l_LocalPlayer_0.Character);
    end;
    l_LocalizationService_0:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function() --[[ Line: 282 ]]
        -- upvalues: v82 (copy), v41 (ref), l_LocalizationService_0 (ref)
        v82.store:dispatch(v41(l_LocalizationService_0.RobloxLocaleId));
    end);
    v30.ChangedEvent.Event:connect(function(v84) --[[ Line: 286 ]]
        -- upvalues: v82 (copy), l_StarterGui_0 (ref)
        v82.canPlayEmotes = v84;
        local l_l_StarterGui_0_CoreGuiEnabled_1 = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu);
        if v84 and v82.topBarEnabled and l_l_StarterGui_0_CoreGuiEnabled_1 then
            v82:_mount();
            return;
        else
            v82:_unmount();
            return;
        end;
    end);
    if l_FFlagTopBarSignalizeSetCores_0 then
        v82.disposeEffect = v13.createEffect(function(v86) --[[ Line: 298 ]]
            -- upvalues: v14 (ref), v82 (copy)
            local l_GetTopBarStore_0 = v14.Stores.GetTopBarStore;
            if l_GetTopBarStore_0 then
                v82:setTopBarEnabled(l_GetTopBarStore_0(v86).getTopBarCoreGuiEnabled(v86));
            end;
        end);
    end;
end;
v42._onStateChanged = function(v88, v89, v90) --[[ Line: 307 ]] --[[ Name: _onStateChanged ]]
    -- upvalues: l_GuiService_0 (copy)
    if v90.displayOptions.menuVisible ~= v89.displayOptions.menuVisible then
        v88.EmotesMenuToggled:Fire(v89.displayOptions.menuVisible);
        l_GuiService_0:SetEmotesMenuOpen(v89.displayOptions.menuVisible);
    end;
end;
v42._mount = function(v91) --[[ Line: 315 ]] --[[ Name: _mount ]]
    -- upvalues: l_Constants_0 (copy), v9 (copy), v11 (copy), l_UiModeStyleProvider_0 (copy), v32 (copy), l_RobloxGui_0 (copy)
    local v92 = {
        themeName = l_Constants_0.ThemeName.Dark, 
        fontName = l_Constants_0.FontName.Gotham
    };
    if not v91.instance then
        local v93 = v9.createElement(v11.StoreProvider, {
            store = v91.store
        }, {
            StyleProvider = v9.createElement(l_UiModeStyleProvider_0, {
                style = v92
            }, {
                EmotesMenu = v9.createElement(v32)
            })
        });
        local v94 = v9.createElement("Folder", {
            Name = "EmotesMenu"
        }, v93);
        v91.instance = v9.mount(v94, l_RobloxGui_0, "EmotesMenu");
        v91.MenuIsVisible = true;
        v91.MenuVisibilityChanged:Fire(true);
    end;
end;
v42._unmount = function(v95) --[[ Line: 343 ]] --[[ Name: _unmount ]]
    -- upvalues: v9 (copy)
    if v95.instance then
        v9.unmount(v95.instance);
        v95.instance = nil;
        v95.MenuIsVisible = false;
        v95.MenuVisibilityChanged:Fire(false);
    end;
end;
v42.new = function() --[[ Line: 353 ]] --[[ Name: new ]]
    -- upvalues: v42 (copy), v30 (copy), v10 (copy), v33 (copy), l_RunService_0 (copy), v41 (copy), l_LocalizationService_0 (copy), v24 (copy), v40 (copy), v31 (copy), v25 (copy), l_RobloxGui_0 (copy), v39 (copy)
    local v96 = setmetatable({}, v42);
    v96.canPlayEmotes = v30.Value;
    v96.topBarEnabled = true;
    v96.EmotesMenuToggled = Instance.new("BindableEvent");
    v96.MenuIsVisible = false;
    v96.MenuVisibilityChanged = Instance.new("BindableEvent");
    v96.EmotesLoaded = Instance.new("BindableEvent");
    v96.store = v10.Store.new(v33, {}, {
        v10.thunkMiddleware
    });
    if not (l_RunService_0:IsClient() and not l_RunService_0:IsEdit() and not l_RunService_0:IsRunMode()) then
        return v96;
    else
        v96.store.changed:connect(function(v97, v98) --[[ Line: 383 ]]
            -- upvalues: v96 (copy)
            v96:_onStateChanged(v97, v98);
        end);
        v96.store:dispatch(v41(l_LocalizationService_0.RobloxLocaleId));
        if v24:IsEnabled() then
            v96.store:dispatch(v40(v31.Layout.TenFoot));
        end;
        local v99 = v25.ApplyDisplayScale(v25.TopBarHeight);
        if not l_RobloxGui_0.IgnoreGuiInset then
            v96.store:dispatch(v39(v99));
        end;
        v96:_mount();
        v96:_connectListeners();
        return v96;
    end;
end;
return v42.new();