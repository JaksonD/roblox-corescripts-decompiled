local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameInvite");
local l_Components_0 = l_script_FirstAncestor_0.Components;
local l_Context_0 = l_script_FirstAncestor_0.Context;
local l_Actions_0 = l_script_FirstAncestor_0.State.Actions;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v8 = require(l_Parent_0.React);
local v9 = require(l_Parent_0.RoactUtils);
local v10 = require(l_Parent_0.ReactRoblox);
local v11 = require(l_Parent_0.Promise);
local l_GetGameNameAndDescription_0 = require(l_Parent_0.GameDetailRodux).GetGameNameAndDescription;
local v13 = require(l_Parent_0.InputHandlers);
local v14 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigableSurfaceWrapper_0 = v14.FocusNavigableSurfaceWrapper;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v14.FocusNavigableSurfaceIdentifierEnum;
local l_FocusNavigationEventNameEnum_0 = v14.FocusNavigationEventNameEnum;
local _ = require(l_script_FirstAncestor_0.gameInviteModalType);
local v19 = require(l_script_FirstAncestor_0.GameInviteModalManager);
local v20 = require(l_Context_0.GameInviteModalLayoutProvider);
local v21 = require(l_Components_0.GameInviteModalWindow);
local v22 = require(l_Components_0.GameInviteContentWrapper);
local v23 = require(l_script_FirstAncestor_0.GameInviteDependencies);
local v24 = require(l_script_FirstAncestor_0.GameInviteConstants);
local v25 = require(l_Actions_0.ResetUserInviteStatus);
local v26 = require(l_Parent_0.IxpUtils);
local v27 = require(l_Parent_0.VrCompatibility);
local l_VRReadyWrapper_0 = v27.VRReadyWrapper;
local l_VRConstants_0 = v27.VRConstants;
local l_VRPanelWidthIXP_0 = v27.VRPanelWidthIXP;
local l_useDispatch_0 = v9.Hooks.RoactRodux.useDispatch;
local l_networkImpl_0 = v23.networkImpl;
game:DefineFastFlag("LuaEnableGameInviteModal2023V5", false);
local v33 = require(l_Parent_0.SharedFlags);
local l_GetFFlagEnableGameInviteModalVRSupport_0 = v33.GetFFlagEnableGameInviteModalVRSupport;
local l_GetFFlagVRPanelWidthIXPEnabled_0 = v33.GetFFlagVRPanelWidthIXPEnabled;
local l_isInExperienceUIVREnabled_0 = require(l_Parent_0.SharedExperimentDefinition).isInExperienceUIVREnabled;
local l_FFlagHideCloseButtonEdp_0 = v33.FFlagHideCloseButtonEdp;
local l_FFlagLuaAppForceVrAppPanelWidthRollout_0 = v33.FFlagLuaAppForceVrAppPanelWidthRollout;
local v39 = nil;
local v40 = nil;
local v41 = nil;
if l_isInExperienceUIVREnabled_0 then
    v39 = require(l_Parent_0.Responsive);
    local v42 = require(l_Parent_0.VrSpatialUi);
    v40 = v42.UIManager;
    v41 = v42.Constants.PanelType;
end;
local v44 = {
    [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
        handler = v13.onRelease(function(v43) --[[ Line: 63 ]]
            -- upvalues: v19 (copy)
            v19:closeModal();
            v43:cancel();
        end)
    }
};
return function(v45) --[[ Line: 74 ]]
    -- upvalues: l_FFlagLuaAppForceVrAppPanelWidthRollout_0 (copy), l_GetFFlagVRPanelWidthIXPEnabled_0 (copy), v26 (copy), l_VRPanelWidthIXP_0 (copy), v8 (copy), l_RunService_0 (copy), v24 (copy), l_useDispatch_0 (copy), l_isInExperienceUIVREnabled_0 (copy), v39 (ref), v25 (copy), v19 (copy), l_GuiService_0 (copy), v11 (copy), l_RobloxReplicatedStorage_0 (copy), l_GetGameNameAndDescription_0 (copy), l_networkImpl_0 (copy), v21 (copy), v22 (copy), l_FFlagHideCloseButtonEdp_0 (copy), l_GetFFlagEnableGameInviteModalVRSupport_0 (copy), l_VRReadyWrapper_0 (copy), l_VRConstants_0 (copy), v20 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v44 (copy), v40 (ref), v41 (ref), v10 (copy)
    if not game:GetFastFlag("LuaEnableGameInviteModal2023V5") then
        return nil;
    else
        local v46 = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and l_GetFFlagVRPanelWidthIXPEnabled_0() then v26.useTestVariables(l_VRPanelWidthIXP_0.VrAppPanelWidthMultiplier) else nil;
        local v47 = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and l_GetFFlagVRPanelWidthIXPEnabled_0() then v26.useTestVariables(l_VRPanelWidthIXP_0.VrAppPanelCurvature) else nil;
        local v48, v49 = v8.useState(false);
        local v50, v51 = v8.useState(false);
        local v52, v53 = v8.useState({});
        local v54, v55 = v8.useState({});
        local v56, v57 = v8.useState("");
        local v58 = not l_RunService_0:IsStudio();
        local v59 = v45.renderLocation == v24.RenderLocation.CoreScripts;
        local v60 = v45.renderLocation == v24.RenderLocation.UniversalApp;
        local v61 = l_useDispatch_0();
        local v62 = nil;
        if l_isInExperienceUIVREnabled_0 then
            v62 = v39.useIsSpatial();
        end;
        local function v66(v63, v64, v65) --[[ Line: 107 ]]
            -- upvalues: v49 (copy), v51 (copy), v53 (copy), v60 (copy), v61 (copy), v25 (ref)
            v49(v63);
            v51(v64 or false);
            if v65 then
                v53(v65);
            end;
            if v60 and not v63 and v61 then
                v61(v25());
            end;
        end;
        v8.useEffect(function() --[[ Line: 119 ]]
            -- upvalues: v19 (ref), v66 (copy)
            local v67 = v19.ToggleGameInviteModalEvent.Event:Connect(v66);
            return function() --[[ Line: 121 ]]
                -- upvalues: v67 (copy)
                v67:Disconnect();
            end;
        end, {});
        v8.useEffect(function() --[[ Line: 127 ]]
            -- upvalues: v59 (copy), l_GuiService_0 (ref), v48 (copy), v19 (ref)
            if v59 then
                local v68 = l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 129 ]]
                    -- upvalues: v48 (ref), v19 (ref)
                    if v48 then
                        v19:closeModal();
                    end;
                end);
                return function() --[[ Line: 134 ]]
                    -- upvalues: v68 (copy)
                    v68:Disconnect();
                end;
            else
                return function() --[[ Line: 138 ]]

                end;
            end;
        end, {
            v48, 
            v59
        });
        v8.useEffect(function() --[[ Line: 143 ]]
            -- upvalues: v58 (copy), v48 (copy), v59 (copy), v56 (copy), v11 (ref), l_RobloxReplicatedStorage_0 (ref), v57 (copy), l_GetGameNameAndDescription_0 (ref), v54 (copy), l_networkImpl_0 (ref), v55 (copy)
            if v58 and v48 and v59 then
                if v56 == "" then
                    v11.try(function() --[[ Line: 147 ]]
                        -- upvalues: l_RobloxReplicatedStorage_0 (ref)
                        return l_RobloxReplicatedStorage_0:WaitForChild("GetServerType", 2):InvokeServer();
                    end):andThen(function(v69) --[[ Line: 150 ]]
                        -- upvalues: v57 (ref)
                        v57(v69);
                    end);
                end;
                if l_GetGameNameAndDescription_0 and not v54.Created then
                    l_GetGameNameAndDescription_0(l_networkImpl_0, game.GameId):andThen(function(v70) --[[ Line: 156 ]]
                        -- upvalues: v55 (ref)
                        v55(v70);
                    end);
                end;
            end;
        end, {
            v48
        });
        if v48 then
            local v71 = v8.createElement(v21, {}, {
                GameInviteModalContentWrapper = v8.createElement(v22, {
                    options = v52, 
                    serverType = v56, 
                    gameDetails = v54, 
                    isLoading = v50, 
                    isCoreScript = v59, 
                    disableSelectionParentManagement = v60, 
                    hideCloseButton = if l_FFlagHideCloseButtonEdp_0 then v52.hideCloseButton else nil
                })
            });
            if l_GetFFlagEnableGameInviteModalVRSupport_0() and v60 then
                return v8.createElement(l_VRReadyWrapper_0, {
                    component = "ScreenGui", 
                    props = {
                        DisplayOrder = v45.displayOrder, 
                        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                        IgnoreGuiInset = true, 
                        Name = v24.ParentComponentName
                    }, 
                    vrProps = {
                        partSize = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and v46 then Vector2.new(l_VRConstants_0.MainScreenSize.X * v46, l_VRConstants_0.MainScreenSize.Y) else l_VRConstants_0.MainScreenSize, 
                        offset = if not not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 or l_GetFFlagVRPanelWidthIXPEnabled_0() and v47 == 0 then CFrame.new(l_VRConstants_0.MainScreenPosition) * CFrame.fromEulerAnglesXYZ(0, -3.141592653589793, 0) else CFrame.lookAt(l_VRConstants_0.MainScreenPosition, l_VRConstants_0.DefaultCameraPosition), 
                        virtualScreenSize = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and v46 then Vector2.new(l_VRConstants_0.MainScreenResolution.X * v46, l_VRConstants_0.MainScreenResolution.Y) else l_VRConstants_0.MainScreenResolution, 
                        panelName = "GameInviteMenu", 
                        curvature = not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and v47 or l_VRConstants_0.MainScreenCurvature
                    }
                }, {
                    GameInviteModalLayoutProvider = v8.createElement(v20, {
                        isCoreScript = v59
                    }, {
                        ModalWindowContainer = if v60 then v8.createElement(l_FocusNavigableSurfaceWrapper_0, {
                            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp, 
                            isAutoFocusRoot = true, 
                            isIsolated = true, 
                            isFocusable = true, 
                            customEventHandlers = v44
                        }, {
                            ModalWindowContainer = v71
                        }) else v71
                    })
                });
            elseif l_isInExperienceUIVREnabled_0 and v62 then
                local v72 = v40.getInstance():getPanelObject(v41.MoreMenu);
                return v10.createPortal({
                    GameInviteModalLayoutProvider = v8.createElement(v20, {
                        isCoreScript = v59
                    }, {
                        ModalWindowContainer = v8.createElement(v21, {}, {
                            GameInviteModalContentWrapper = v8.createElement(v22, {
                                options = v52, 
                                serverType = v56, 
                                gameDetails = v54, 
                                isLoading = v50, 
                                isCoreScript = v59
                            })
                        })
                    })
                }, v72);
            else
                return v8.createElement("ScreenGui", {
                    DisplayOrder = v45.displayOrder, 
                    ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                    IgnoreGuiInset = true, 
                    Name = v24.ParentComponentName
                }, {
                    GameInviteModalLayoutProvider = v8.createElement(v20, {
                        isCoreScript = v59
                    }, {
                        ModalWindowContainer = if v60 then v8.createElement(l_FocusNavigableSurfaceWrapper_0, {
                            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp, 
                            isAutoFocusRoot = true, 
                            isFocusable = true, 
                            isIsolated = true, 
                            customEventHandlers = v44
                        }, {
                            ModalWindowContainer = v71
                        }) else v71
                    })
                });
            end;
        else
            return nil;
        end;
    end;
end;