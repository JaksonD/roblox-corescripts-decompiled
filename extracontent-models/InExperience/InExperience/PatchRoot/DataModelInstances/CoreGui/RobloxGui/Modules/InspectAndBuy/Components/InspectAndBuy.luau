local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_Players_0 = game:GetService("Players");
local l_MouseIconOverrideService_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService;
local v9 = require(l_CorePackages_0.Packages.Roact);
local v10 = require(l_CorePackages_0.Packages.Rodux);
local v11 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Symbol_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Symbol;
local v13 = require(l_CoreGui_0.RobloxGui.Modules.Common.renderWithCoreScriptsStyleProvider);
local l_SelectionCursorProvider_0 = require(l_CorePackages_0.Packages.UIBlox).App.SelectionImage.SelectionCursorProvider;
local v15 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v16 = game:DefineFastString("AXInspectAndBuyLayerName", "Experience.Menu");
local v17 = game:DefineFastFlag("AXEnableInspectAndBuyExposureLogging", false);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v19 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_FocusNavigableSurfaceIdentifierEnum_0 = v19.FocusNavigableSurfaceIdentifierEnum;
local l_FocusRoot_0 = v19.FocusRoot;
local l_CoreScriptsRootProvider_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider;
local l_Chrome_0 = l_RobloxGui_0.Modules.Chrome;
local l_Enabled_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled;
local v25 = if l_Enabled_0() then require(l_Chrome_0.Service) else nil;
local l_FFlagEnableConsoleExpControls_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls;
local l_Parent_0 = script.Parent.Parent;
local v28 = require(l_Parent_0.Actions.SetDetailsInformation);
local v29 = require(l_Parent_0.Actions.SetTryingOnInfo);
local v30 = require(l_Parent_0.Thunk);
local v31 = require(l_Parent_0.Services.Network);
local v32 = require(l_Parent_0.Services.Analytics);
local v33 = require(l_Parent_0.Reducers.InspectAndBuyReducer);
local v34 = require(l_Parent_0.Components.Container);
local v35 = require(l_Parent_0.Components.InspectAndBuyBaseContainer);
local v36 = require(l_Parent_0.Constants);
local v37 = require(l_Parent_0.CompactView);
local v38 = require(l_Parent_0.WideView);
local v39 = require(l_Parent_0.WideLandscapeView);
local v40 = require(l_Parent_0.Actions.SetGamepadEnabled);
local v41 = require(l_Parent_0.Actions.SetView);
local v42 = require(l_Parent_0.Actions.SetPlayerId);
local v43 = require(l_Parent_0.Actions.SetPlayerName);
local v44 = require(l_Parent_0.Actions.SetLocale);
local v45 = require(l_Parent_0.Actions.SetItemBeingPurchased);
local v46 = require(l_Parent_0.Actions.SetIsSubjectToChinaPolicies);
local v47 = require(l_Parent_0.Actions.UpdateStoreId);
local v48 = if require(l_Parent_0.Flags.FFlagAXEnableFetchAvatarPreview) then require(l_Parent_0.Thunks.GetAssetsFromHumanoidDescriptionV2) else require(l_Parent_0.Thunks.GetAssetsFromHumanoidDescription);
local v49 = require(l_Parent_0.Thunks.UpdateOwnedStatus);
local v50 = require(l_Parent_0.Thunks.GetCharacterModelFromUserId);
local v51 = require(l_Parent_0.Thunks.GetPlayerName);
local v52 = require(l_Parent_0.Components.InspectAndBuyContext);
local v53 = require(l_Parent_0.Actions.CloseOverlay);
local v54 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceInspectAndBuy);
local l_getViewType_0 = v54.Utils.getViewType;
local l_InspectAndBuyVersion_0 = v54.Enums.InspectAndBuyVersion;
local v57 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagEnableInspectAndBuyV2RootFlag_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableInspectAndBuyV2RootFlag;
local v59 = require(l_Parent_0.Flags.FFlagAXEnableInspectAndBuyVersionAnalytics);
local l_FFlagAXEnableInspectAndBuyFocusNavigation_0 = v57.FFlagAXEnableInspectAndBuyFocusNavigation;
local v61 = require(l_CorePackages_0.Workspace.Packages.CachedPolicyService);
local v62 = require(l_Parent_0.Flags.FFlagAXEnableNewInspectAndBuyContainer);
local v63 = l_Symbol_0.named("OverrideCursorInspectMenu");
local v64 = v9.PureComponent:extend("InspectAndBuy");
v64.pushMouseIconOverride = function(_) --[[ Line: 87 ]] --[[ Name: pushMouseIconOverride ]]
    -- upvalues: l_UserInputService_0 (copy), l_MouseIconOverrideService_0 (copy), v63 (copy)
    if l_UserInputService_0:GetLastInputType().Name:find("Gamepad") then
        l_MouseIconOverrideService_0.push(v63, Enum.OverrideMouseIconBehavior.ForceHide);
        return;
    else
        l_MouseIconOverrideService_0.push(v63, Enum.OverrideMouseIconBehavior.ForceShow);
        return;
    end;
end;
v64.popMouseIconOverride = function(_) --[[ Line: 98 ]] --[[ Name: popMouseIconOverride ]]
    -- upvalues: l_MouseIconOverrideService_0 (copy), v63 (copy)
    l_MouseIconOverrideService_0.pop(v63);
end;
v64.configureInputType = function(v67, v68) --[[ Line: 102 ]] --[[ Name: configureInputType ]]
    -- upvalues: l_UserInputService_0 (copy), v40 (copy)
    if (v68 or l_UserInputService_0:GetLastInputType()).Name:find("Gamepad") then
        v67.state.store:dispatch(v40(true));
        return;
    else
        v67.state.store:dispatch(v40(false));
        return;
    end;
end;
v64.updateView = function(v69) --[[ Line: 113 ]] --[[ Name: updateView ]]
    -- upvalues: v62 (copy), v41 (copy), l_getViewType_0 (copy), v36 (copy)
    local l_ViewportSize_0 = workspace.CurrentCamera.ViewportSize;
    if v62 then
        v69.state.store:dispatch(v41(l_getViewType_0(l_ViewportSize_0)));
        return;
    else
        local l_Wide_0 = v36.View.Wide;
        if l_ViewportSize_0.X < 600 then
            l_Wide_0 = v36.View.Compact;
        elseif l_ViewportSize_0.X > l_ViewportSize_0.Y and l_ViewportSize_0.X < 800 then
            l_Wide_0 = v36.View.WideLandscape;
        end;
        v69.state.store:dispatch(v41(l_Wide_0));
        return;
    end;
end;
v64.init = function(v72) --[[ Line: 131 ]] --[[ Name: init ]]
    -- upvalues: v31 (copy), v59 (copy), v32 (copy), l_FFlagEnableInspectAndBuyV2RootFlag_0 (copy), l_InspectAndBuyVersion_0 (copy), v10 (copy), v33 (copy), v30 (copy), v36 (copy), v37 (copy), v38 (copy), v39 (copy), v47 (copy), v43 (copy), v44 (copy), l_LocalizationService_0 (copy), v42 (copy), v48 (copy), v49 (copy), v45 (copy)
    local l_playerId_0 = v72.props.playerId;
    local l_playerName_0 = v72.props.playerName;
    local l_ctx_0 = v72.props.ctx;
    v72.connections = {};
    v72.network = v72.props.network or v31.new();
    v72.analytics = if v59 then v32.new(l_playerId_0, l_ctx_0, if l_FFlagEnableInspectAndBuyV2RootFlag_0 then l_InspectAndBuyVersion_0.Version2 else l_InspectAndBuyVersion_0.Version1) else v32.new(l_playerId_0, l_ctx_0);
    v72.humanoidDescription = v72.props.humanoidDescription;
    v72.analytics.reportOpenInspectMenu();
    v72.state = {
        store = v10.Store.new(v33, {}, {
            v30.middleware({
                [v31] = v72.network, 
                [v32] = v72.analytics
            })
        }), 
        views = {
            [v36.View.Compact] = v37, 
            [v36.View.Wide] = v38, 
            [v36.View.WideLandscape] = v39
        }
    };
    v72.state.store:dispatch(v47());
    v72.state.store:dispatch(v43(l_playerName_0));
    v72.state.store:dispatch(v44(l_LocalizationService_0.RobloxLocaleId));
    if l_playerId_0 then
        v72.state.store:dispatch(v42(l_playerId_0));
    end;
    if v72.humanoidDescription then
        v72.state.store:dispatch(v48(v72.humanoidDescription, false));
    end;
    v72.onPromptPurchaseFinished = function(_, v77, v78) --[[ Line: 184 ]]
        -- upvalues: v72 (copy), v36 (ref), v49 (ref), v45 (ref)
        local l_itemBeingPurchased_0 = v72.state.store:getState().itemBeingPurchased;
        v72.analytics.sendCounter(v36.Counters.PurchaseFinished);
        if v78 and tostring(v77) == l_itemBeingPurchased_0.itemId then
            v72.analytics.reportPurchaseSuccess(l_itemBeingPurchased_0.itemType, l_itemBeingPurchased_0.itemId);
            v72.state.store:dispatch(v49(l_itemBeingPurchased_0.itemId, l_itemBeingPurchased_0.itemType));
            if l_itemBeingPurchased_0.itemType == v36.ItemType.Asset then
                v72.analytics.sendCounter(v36.Counters.PurchaseSucceededAsset);
            elseif l_itemBeingPurchased_0.itemType == v36.ItemType.Bundle then
                v72.analytics.sendCounter(v36.Counters.PurchaseSucceededBundle);
            else
                v72.analytics.sendCounter(v36.Counters.PurchaseSucceededOther);
            end;
        end;
        v72.state.store:dispatch(v45(nil, nil));
    end;
end;
v64.didMount = function(v80) --[[ Line: 204 ]] --[[ Name: didMount ]]
    -- upvalues: v17 (copy), v15 (copy), v16 (copy), l_FFlagEnableConsoleExpControls_0 (copy), l_Enabled_0 (copy), v25 (copy), l_UserInputService_0 (copy), l_LocalizationService_0 (copy), v44 (copy), l_GuiService_0 (copy), v61 (copy), v46 (copy), l_MarketplaceService_0 (copy), l_Players_0 (copy), v50 (copy), v48 (copy), v51 (copy)
    local l_playerId_1 = v80.props.playerId;
    v80.isMounted = true;
    v80:updateView();
    v80:bindButtonB();
    v80:configureInputType();
    v80:pushMouseIconOverride();
    if v17 then
        v15.logLayerExposure(v16);
    end;
    if l_FFlagEnableConsoleExpControls_0 and l_Enabled_0() then
        v25:setHideShortcutBar("InspectAndBuy", true);
    end;
    local v83 = l_UserInputService_0.LastInputTypeChanged:Connect(function(v82) --[[ Line: 221 ]]
        -- upvalues: v80 (copy)
        v80:configureInputType(v82);
    end);
    local v84 = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 227 ]]
        -- upvalues: v80 (copy)
        v80:updateView();
    end);
    local v85 = l_LocalizationService_0:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function() --[[ Line: 231 ]]
        -- upvalues: v80 (copy), v44 (ref), l_LocalizationService_0 (ref)
        v80.state.store:dispatch(v44(l_LocalizationService_0.RobloxLocaleId));
    end);
    local v86 = l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 235 ]]
        -- upvalues: v80 (copy), l_GuiService_0 (ref)
        v80:popMouseIconOverride();
        l_GuiService_0.SelectedCoreObject = nil;
    end);
    local v87 = l_GuiService_0.MenuClosed:Connect(function() --[[ Line: 240 ]]
        -- upvalues: v80 (copy)
        v80:pushMouseIconOverride();
    end);
    coroutine.wrap(function() --[[ Line: 244 ]]
        -- upvalues: v61 (ref), v80 (copy), v46 (ref)
        local v88 = v61:IsSubjectToChinaPolicies();
        v80.state.store:dispatch(v46(v88));
    end)();
    local v89 = l_MarketplaceService_0.PromptPurchaseFinished:Connect(v80.onPromptPurchaseFinished);
    local v90 = l_MarketplaceService_0.PromptBundlePurchaseFinished:Connect(v80.onPromptPurchaseFinished);
    local v93 = v80.state.store.changed:connect(function(v91, v92) --[[ Line: 257 ]]
        -- upvalues: v80 (copy)
        v80:update(v91, v92);
    end);
    table.insert(v80.connections, v84);
    table.insert(v80.connections, v85);
    table.insert(v80.connections, v86);
    table.insert(v80.connections, v87);
    table.insert(v80.connections, v83);
    table.insert(v80.connections, v89);
    table.insert(v80.connections, v90);
    table.insert(v80.connections, v93);
    local l_UserId_0 = l_Players_0.LocalPlayer.UserId;
    v80.state.store:dispatch(v50(l_UserId_0, true, function(v95) --[[ Line: 271 ]]
        -- upvalues: v80 (copy), v48 (ref)
        if v80 and v80.isMounted then
            v80.localPlayerModel = v95;
            local l_HumanoidDescription_0 = v95.Humanoid.HumanoidDescription;
            if l_HumanoidDescription_0 then
                v80.state.store:dispatch(v48(l_HumanoidDescription_0, true));
            end;
            v80:setState({
                obtainedLocalPlayerModel = true
            });
        end;
    end));
    if l_playerId_1 then
        v80.state.store:dispatch(v50(l_playerId_1, false, function(v97) --[[ Line: 287 ]]
            -- upvalues: v80 (copy), v48 (ref)
            if v80 and v80.isMounted then
                v80.playerModel = v97;
                local l_HumanoidDescription_1 = v80.playerModel.Humanoid.HumanoidDescription;
                if l_HumanoidDescription_1 then
                    v80.state.store:dispatch(v48(l_HumanoidDescription_1, false));
                end;
                v80:setState({
                    obtainedPlayerModel = true
                });
            end;
        end));
        v80.state.store:dispatch(v51(l_playerId_1));
    end;
end;
v64.update = function(v99, v100, v101) --[[ Line: 306 ]] --[[ Name: update ]]
    -- upvalues: l_ContextActionService_0 (copy)
    if not v100.visible and v101.visible then
        l_ContextActionService_0:UnbindCoreAction("BackButtonInspectMenu");
        return;
    else
        if v100.visible and not v101.visible then
            v99:bindButtonB();
        end;
        return;
    end;
end;
v64.willUnmount = function(v102) --[[ Line: 314 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_ContextActionService_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), l_Enabled_0 (copy), v25 (copy)
    v102.isMounted = false;
    for _, v104 in pairs(v102.connections) do
        v104:disconnect();
    end;
    l_ContextActionService_0:UnbindCoreAction("BackButtonInspectMenu");
    v102:popMouseIconOverride();
    if l_FFlagEnableConsoleExpControls_0 and l_Enabled_0() then
        v25:setHideShortcutBar("InspectAndBuy", false);
    end;
end;
v64.render = function(v105) --[[ Line: 328 ]] --[[ Name: render ]]
    -- upvalues: v62 (copy), v9 (copy), l_CoreScriptsRootProvider_0 (copy), l_FFlagAXEnableInspectAndBuyFocusNavigation_0 (copy), v11 (copy), v35 (copy), l_FocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v52 (copy), v13 (copy), l_SelectionCursorProvider_0 (copy), v34 (copy)
    local l_localPlayerModel_0 = v105.localPlayerModel;
    if v62 then
        return v9.createElement("Folder", {
            Name = "InspectAndBuyApp"
        }, {
            CoreScriptsRootProvider = v9.createElement(l_CoreScriptsRootProvider_0, {}, if l_FFlagAXEnableInspectAndBuyFocusNavigation_0 then {
                StoreProvider = v9.createElement(v11.StoreProvider, {
                    store = v105.state.store
                }, {
                    Container = v9.createElement(v35, {
                        localPlayerModel = l_localPlayerModel_0, 
                        analytics = v105.analytics
                    })
                })
            } else {
                FocusNavigationWrapper = v9.createElement(l_FocusRoot_0, {
                    surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay
                }, {
                    StoreProvider = v9.createElement(v11.StoreProvider, {
                        store = v105.state.store
                    }, {
                        Container = v9.createElement(v35, {
                            localPlayerModel = l_localPlayerModel_0, 
                            analytics = v105.analytics
                        })
                    })
                })
            })
        });
    else
        return v9.createElement(v52.Provider, {
            value = v105.state.views
        }, {
            StoreProvider = v9.createElement(v11.StoreProvider, {
                store = v105.state.store
            }, {
                ThemeProvider = v13({
                    CursorProvider = v9.createElement(l_SelectionCursorProvider_0, {}, {
                        Container = v9.createElement(v34, {
                            localPlayerModel = l_localPlayerModel_0
                        })
                    })
                })
            })
        });
    end;
end;
v64.bindButtonB = function(v107) --[[ Line: 382 ]] --[[ Name: bindButtonB ]]
    -- upvalues: l_ContextActionService_0 (copy), v53 (copy), v28 (copy), v29 (copy), l_GuiService_0 (copy)
    l_ContextActionService_0:BindCoreAction("BackButtonInspectMenu", function(_, v109, v110) --[[ Line: 383 ]]
        -- upvalues: v107 (copy), v53 (ref), v28 (ref), v29 (ref), l_GuiService_0 (ref)
        if v109 == Enum.UserInputState.End and v110.KeyCode == Enum.KeyCode.ButtonB then
            local v111 = v107.state.store:getState();
            local l_viewingDetails_0 = v111.detailsInformation.viewingDetails;
            if v111.overlay and v111.overlay.overlay ~= nil then
                v107.state.store:dispatch(v53());
            elseif l_viewingDetails_0 then
                v107.state.store:dispatch(v28(false, nil));
                v107.state.store:dispatch(v29(false, nil));
            else
                l_GuiService_0:CloseInspectMenu();
            end;
        elseif v109 == Enum.UserInputState.Begin and v110.KeyCode == Enum.KeyCode.Escape or v110.KeyCode == Enum.KeyCode.ButtonStart then
            l_GuiService_0:CloseInspectMenu();
            return Enum.ContextActionResult.Pass;
        end;
        return Enum.ContextActionResult.Sink;
    end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape, Enum.KeyCode.ButtonStart);
end;
return v64;