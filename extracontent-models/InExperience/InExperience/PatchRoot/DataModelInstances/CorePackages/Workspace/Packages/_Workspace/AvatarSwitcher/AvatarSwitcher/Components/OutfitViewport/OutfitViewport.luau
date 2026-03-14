local l_HttpService_0 = game:GetService("HttpService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script:FindFirstAncestor("AvatarSwitcher").Parent;
local v3 = require(l_Parent_0.React);
local l_EventConnection_0 = require(l_Parent_0.ReactUtils).EventConnection;
local v5 = require(l_Parent_0.Foundation);
local v6 = require(script.Parent.OutfitViewportUtils);
local v7 = require(script.Parent.useOutfitViewportInteractions);
local v8 = game:DefineFastFlag("AvatarSwitcherPlayRandomEmote", false);
local l_FFlagAvatarSwitcherAccurateAvatarWarning_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAvatarSwitcherAccurateAvatarWarning;
local v10 = Color3.fromRGB(218, 203, 173);
return v3.memo(function(v11) --[[ Line: 37 ]] --[[ Name: OutfitViewport ]]
    -- upvalues: v3 (copy), v7 (copy), l_HttpService_0 (copy), l_FFlagAvatarSwitcherAccurateAvatarWarning_0 (copy), v6 (copy), v8 (copy), v10 (copy), v5 (copy), l_EventConnection_0 (copy), l_UserInputService_0 (copy)
    local v12 = v3.useRef(nil);
    local v13 = v3.useRef(nil);
    local v14 = v3.useRef(nil);
    local v15, v16 = v3.useState(true);
    local v17 = v3.useRef("");
    local v18 = v3.useRef(0);
    local v19 = not v15;
    local v20 = v7({
        defaultCameraDistanceRef = v18
    });
    local v36 = v3.useCallback(function(v21, v22) --[[ Line: 50 ]]
        -- upvalues: v16 (copy), v12 (copy), l_HttpService_0 (ref), v17 (copy), l_FFlagAvatarSwitcherAccurateAvatarWarning_0 (ref), v6 (ref), v11 (copy), v18 (copy), v8 (ref)
        v16(true);
        if v12.current then
            v12.current:ClearAllChildren();
        end;
        if not v21 or not v22 then
            return;
        else
            local v23 = l_HttpService_0:GenerateGUID(false);
            v17.current = v23;
            local v24 = nil;
            local v25 = nil;
            if l_FFlagAvatarSwitcherAccurateAvatarWarning_0 then
                local v26 = nil;
                local v27 = nil;
                local v28, v29, v30 = pcall(function() --[[ Line: 71 ]]
                    -- upvalues: v6 (ref), v21 (copy), v22 (copy)
                    return v6.buildOutfitModel(v21, v22);
                end);
                v26 = v28;
                v24 = v29;
                v27 = v30;
                if not v26 or not v24 or not v27 then
                    if v11.onLoadingFailed then
                        v11.onLoadingFailed();
                    end;
                    return;
                else
                    v28 = v24:WaitForChild("Humanoid", 10);
                    v25 = v28 and v28.RootPart;
                    if not v28 or not v25 then
                        if v11.onLoadingFailed then
                            v11.onLoadingFailed();
                        end;
                        return;
                    elseif v17.current ~= v23 then
                        v24:Destroy();
                        return;
                    elseif v11.onLoaded then
                        v11.onLoaded(v28, v27);
                    end;
                end;
            else
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 99 ]]
                    -- upvalues: v6 (ref), v21 (copy), v22 (copy)
                    return v6.buildOutfitModel(v21, v22);
                end);
                if not l_status_0 or not l_result_0 then
                    if v11.onLoadingFailed then
                        v11.onLoadingFailed();
                    end;
                    return;
                else
                    v24 = l_result_0;
                    v25 = v24:WaitForChild("HumanoidRootPart", 10);
                    if not v25 then
                        if v11.onLoadingFailed then
                            v11.onLoadingFailed();
                        end;
                        return;
                    elseif v17.current ~= v23 then
                        v24:Destroy();
                        return;
                    end;
                end;
            end;
            v24.Parent = v12.current;
            local l_v24_BoundingBox_0, _ = v24:GetBoundingBox();
            v25.CFrame = CFrame.new(v25.CFrame.Position - l_v24_BoundingBox_0.Position);
            v18.current = v6.getCameraDistance(v24, 50);
            if v8 then
                v6.playRandomEmote(v24);
            else
                local v35 = v6.loadIdleAnimationForAvatar(v24);
                if v35 then
                    v35:Play();
                end;
            end;
            v16(false);
            return;
        end;
    end, {
        v11.onLoadingFailed
    });
    v3.useEffect(function() --[[ Line: 143 ]]
        -- upvalues: v36 (copy), v11 (copy)
        task.spawn(function() --[[ Line: 144 ]]
            -- upvalues: v36 (ref), v11 (ref)
            v36(v11.outfitId, v11.rigType);
        end);
    end, {
        v11.outfitId, 
        v11.rigType, 
        v36
    });
    v3.useLayoutEffect(function() --[[ Line: 150 ]]
        -- upvalues: v14 (copy), v13 (copy)
        if v14.current then
            v14.current.CurrentCamera = v13.current;
        end;
    end, {});
    local v40 = v3.useCallback(function(v37) --[[ Line: 159 ]]
        -- upvalues: v14 (copy)
        local v38 = v14.current and v14.current:FindFirstAncestorOfClass("ScreenGui");
        local v39 = v38 and v38:FindFirstChild("InputWrapper", true);
        if v39 and v39:IsA("Frame") then
            v39.Interactable = v37;
        end;
    end, {});
    return v3.createElement("ViewportFrame", {
        Size = UDim2.fromScale(1, 1), 
        LightColor = v10, 
        LightDirection = Vector3.new(-1, -1, 2, 0), 
        BackgroundTransparency = 1, 
        ref = v14, 
        [v3.Event.InputBegan] = if v19 then v20.onInputBegan else nil, 
        [v3.Event.MouseEnter] = function() --[[ Line: 176 ]]
            -- upvalues: v40 (copy)
            v40(false);
        end, 
        [v3.Event.MouseLeave] = function() --[[ Line: 179 ]]
            -- upvalues: v40 (copy)
            v40(true);
        end
    }, {
        WorldModel = v3.createElement("WorldModel", {
            ref = v12
        }), 
        Camera = v3.createElement("Camera", {
            CameraType = Enum.CameraType.Scriptable, 
            CFrame = v20.cameraCFrame, 
            FieldOfView = 50, 
            ref = v13
        }), 
        LoadingSpinner = v15 and v3.createElement(v5.Loading, {
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5)
        }), 
        InputChangedConnection = v19 and v3.createElement(l_EventConnection_0, {
            event = l_UserInputService_0.InputChanged, 
            callback = v20.onInputChanged
        }), 
        InputEndedConnection = v19 and v3.createElement(l_EventConnection_0, {
            event = l_UserInputService_0.InputEnded, 
            callback = v20.onInputEnded
        })
    });
end);