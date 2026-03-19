local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_useStyle_0 = v4.Core.Style.useStyle;
local v7 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v8.Enums.AvatarScreen;
local l_useAvatarRoute_0 = v8.AvatarRoute.Hooks.useAvatarRoute;
local l_Panel3D_0 = v4.Core.VR.Panel3D;
local l_AvatarScreenProperties_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties;
local v13 = require(l_Modules_0.LuaApp.Navigation.CurrentTabContext);
local v14 = require(l_Modules_0.LuaApp.Navigation.SwitchNavigatorVisibleContext);
local v15 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_RoundedCornersFrame_0 = require(l_CorePackages_0.Workspace.Packages.VrCompatibility).RoundedCornersFrame;
local l_GetFFlagVRPanelWidthIXPEnabled_0 = v7.GetFFlagVRPanelWidthIXPEnabled;
local l_FFlagLuaAppForceVrAppPanelWidthRollout_0 = v7.FFlagLuaAppForceVrAppPanelWidthRollout;
local l_VRPanelWidthIXP_0 = require(l_CorePackages_0.Workspace.Packages.VrCompatibility).VRPanelWidthIXP;
local v20 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local function v29(v21, v22) --[[ Line: 43 ]] --[[ Name: getZOffset ]]
    -- upvalues: l_AvatarScreenProperties_0 (copy), v15 (copy)
    local v23 = {};
    local v24 = v21.previousPages or {};
    for _, v26 in v24 do
        local l_VRPanelPlacement_0 = l_AvatarScreenProperties_0[v26.name].VRPanelPlacement;
        if l_VRPanelPlacement_0 == "None" then
            l_VRPanelPlacement_0 = "Left";
        end;
        l_VRPanelPlacement_0 = l_VRPanelPlacement_0 or "Left";
        v23[l_VRPanelPlacement_0] = (v23[l_VRPanelPlacement_0] or 0) + 1;
    end;
    local v28 = v23[v22] or 0;
    if v21.isOverlayVisible then
        v28 = v28 + 1;
    end;
    return (Vector3.new(0, 0, v28 * v15.VR.SPACE_BETWEEN_STACKED_PANELS));
end;
return function(v30) --[[ Line: 69 ]]
    -- upvalues: l_useAvatarRoute_0 (copy), l_useStyle_0 (copy), v15 (copy), l_FFlagLuaAppForceVrAppPanelWidthRollout_0 (copy), l_GetFFlagVRPanelWidthIXPEnabled_0 (copy), v20 (copy), l_VRPanelWidthIXP_0 (copy), v2 (copy), v29 (copy), v13 (copy), v3 (copy), v14 (copy), l_Panel3D_0 (copy), l_AvatarScreen_0 (copy), l_RoundedCornersFrame_0 (copy)
    local v31 = l_useAvatarRoute_0();
    local v32 = l_useStyle_0();
    local v33 = v15.VR.PanelInfo[v30.panelPlacement or "Left"];
    if v30.panelPlacement ~= "None" then
        local v34 = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and l_GetFFlagVRPanelWidthIXPEnabled_0() then v20.useTestVariables(l_VRPanelWidthIXP_0.VrAvatarPanelsSpreadMultiplier) else nil;
        local v35 = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and l_GetFFlagVRPanelWidthIXPEnabled_0() then v20.useTestVariables(l_VRPanelWidthIXP_0.VrAvatarPanelsDistanceOffset) else nil;
        local v36 = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and l_GetFFlagVRPanelWidthIXPEnabled_0() and v33 then CFrame.lookAt(Vector3.new(if v34 then v33.Offset.Position.X * v34 else v33.Offset.Position.X, v33.Offset.Position.Y, if v35 then v33.Offset.Position.Z + v35 else v33.Offset.Position.Z), (Vector3.new(0, v15.VR.PANELS_HEIGHT_OFFSET, 0))) else v33.Offset;
        local v37 = v2.useMemo(function() --[[ Line: 99 ]]
            -- upvalues: v29 (ref), v31 (copy), v30 (copy)
            return (v29(v31, v30.panelPlacement));
        end, {});
        return v2.createElement(v13.Consumer, {
            render = function(v38) --[[ Line: 103 ]] --[[ Name: render ]]
                -- upvalues: v3 (ref), v14 (ref), v2 (ref), l_Panel3D_0 (ref), v30 (copy), l_AvatarScreen_0 (ref), v33 (copy), v36 (copy), v37 (copy), l_RoundedCornersFrame_0 (ref), v32 (copy)
                return v3.createElement(v14.Consumer, {
                    render = function(v39) --[[ Line: 105 ]] --[[ Name: render ]]
                        -- upvalues: v2 (ref), l_Panel3D_0 (ref), v30 (ref), v38 (copy), l_AvatarScreen_0 (ref), v33 (ref), v36 (ref), v37 (ref), l_RoundedCornersFrame_0 (ref), v32 (ref), v3 (ref)
                        return v2.createElement(l_Panel3D_0, {
                            hidden = not v39 or v30.visible == false or v38 ~= l_AvatarScreen_0.AvatarExperienceRoot, 
                            partSize = v33.PartSize, 
                            offset = v36 + v37, 
                            virtualScreenSize = v33.VirtualScreenSize, 
                            panelName = v30.panelPlacement
                        }, if v30.roundedCornersFrame then v2.createElement(l_RoundedCornersFrame_0, {
                            cornerRadius = 10, 
                            backgroundColor = v32.Theme.BackgroundDefault.Color, 
                            backgroundTransparency = 0
                        }, v30[v3.Children]) else v30[v3.Children]);
                    end
                });
            end
        });
    else
        return v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            ClipsDescendants = false, 
            BorderSizePixel = 0
        }, v30[v3.Children]);
    end;
end;