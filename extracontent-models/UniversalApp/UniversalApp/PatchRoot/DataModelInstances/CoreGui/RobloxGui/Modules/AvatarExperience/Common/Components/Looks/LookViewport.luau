local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.React);
local l_usePrevious_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.usePrevious;
local l_CameraPresetsUtility_0 = require(l_CorePackages_0.Packages.Thumbnailing).CameraPresetsUtility;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v8 = require(script.Parent.LookViewportUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v10 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXLookViewportCameraAlignment);
local v11 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXLookViewportUseFallbackEmote);
local v12 = game:DefineFastInt("AXLookViewportCameraFOV", 56);
local v13 = game:DefineFastString("AXLookViewportFallbackEmoteId", "136596589997464");
local v14 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXAnimatedLooksThumbnails);
return function(v15) --[[ Line: 29 ]] --[[ Name: LookViewport ]]
    -- upvalues: v4 (copy), l_usePrevious_0 (copy), l_HttpService_0 (copy), v8 (copy), v10 (copy), v11 (copy), v13 (copy), l_CameraPresetsUtility_0 (copy), v12 (copy), v14 (copy)
    local v16 = v4.useRef(nil);
    local v17 = v4.useRef(nil);
    local v18 = v4.useRef(nil);
    local v19 = v4.useRef("");
    local v20, v21 = v4.useBinding(CFrame.new());
    local v22 = l_usePrevious_0(v15.lookDetails);
    v4.useEffect(function() --[[ Line: 37 ]]
        -- upvalues: v18 (copy), v17 (copy)
        if v18.current then
            v18.current.CurrentCamera = v17.current;
        end;
    end, {
        v18, 
        v17
    });
    local v32 = v4.useCallback(function(v23) --[[ Line: 45 ]]
        -- upvalues: v16 (copy), l_HttpService_0 (ref), v19 (copy), v8 (ref), v10 (ref), v11 (ref), v13 (ref), l_CameraPresetsUtility_0 (ref), v12 (ref), v21 (copy), v14 (ref), v15 (copy)
        if v16.current then
            v16.current:ClearAllChildren();
        end;
        if not v23 then
            return;
        else
            local v24 = l_HttpService_0:GenerateGUID(false);
            v19.current = v24;
            local v25 = v8.createAvatarModel(v23);
            if v10() then
                local v26 = v23.displayProperties and v23.displayProperties.emoteAssetId;
                local v27 = false;
                if v11() and not v26 then
                    v27 = true;
                    v26 = v13;
                end;
                do
                    local l_v26_0 = v26;
                    local function v29() --[[ Line: 70 ]]
                        -- upvalues: l_v26_0 (ref), v8 (ref), v25 (copy)
                        if l_v26_0 then
                            v8.applyPose(l_v26_0, v25);
                        end;
                    end;
                    local v30 = l_CameraPresetsUtility_0.GetCameraCFrame_ForAvatarR15Action_LookAtGoldenRatioOfTheHumanoid(v25, v29, v27, v12);
                    v21(v30);
                end;
            end;
            if v19.current ~= v24 then
                v25:Destroy();
                return;
            else
                v25.Parent = v16.current;
                if not v10() then
                    v25:PivotTo(CFrame.new(0, 0, 0));
                    local l_v25_Pivot_0 = v25:GetPivot();
                    v21(CFrame.new(l_v25_Pivot_0.Position + l_v25_Pivot_0.LookVector * 6, l_v25_Pivot_0.Position) - Vector3.new(0, 0.75, 0, 0));
                end;
                if v14() and v15.avatarModelRef then
                    v15.avatarModelRef.current = v25;
                end;
                return;
            end;
        end;
    end, {
        v16
    });
    v4.useEffect(function() --[[ Line: 105 ]]
        -- upvalues: v8 (ref), v22 (copy), v15 (copy), v32 (copy)
        if v8.areLooksDifferent(v22, v15.lookDetails) then
            task.spawn(function() --[[ Line: 107 ]]
                -- upvalues: v32 (ref), v15 (ref)
                v32(v15.lookDetails);
            end);
        end;
    end, {
        v15.lookDetails, 
        v22, 
        v32
    });
    return v4.createElement("ViewportFrame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        LightColor = Color3.fromRGB(218, 203, 173), 
        LightDirection = Vector3.new(-1, -1, 2, 0), 
        ref = v18
    }, {
        WorldModel = v4.createElement("WorldModel", {
            ref = v16
        }), 
        Camera = v4.createElement("Camera", {
            CameraType = Enum.CameraType.Scriptable, 
            CFrame = v20, 
            ref = v17
        })
    });
end;