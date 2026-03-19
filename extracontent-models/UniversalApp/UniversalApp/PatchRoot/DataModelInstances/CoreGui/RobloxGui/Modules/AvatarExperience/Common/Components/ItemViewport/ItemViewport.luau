local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_sendAXCounterV2_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2;
local v6 = require(l_Modules_0.LuaApp.mutedError);
local v7 = require(l_CorePackages_0.Packages.React);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_LoadingSpinner_0 = require(l_CorePackages_0.Packages.UIBlox).App.Loading.LoadingSpinner;
local v11 = require(script.Parent.ItemViewportUtils);
local v12 = require(script.Parent.useItemViewportInteractions);
local v13 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXFixItemViewportErrors);
local v14 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXSupportShoesInItemViewport);
local v15 = Color3.fromRGB(218, 203, 173);
return function(v16) --[[ Line: 48 ]] --[[ Name: ItemViewport ]]
    -- upvalues: v7 (copy), l_useDesignTokens_0 (copy), v12 (copy), v14 (copy), l_HttpService_0 (copy), v4 (copy), v11 (copy), l_sendAXCounterV2_0 (copy), v13 (copy), v6 (copy), v15 (copy), l_LoadingSpinner_0 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy)
    local v17 = v7.useRef(nil);
    local v18 = v7.useRef(nil);
    local v19 = v7.useRef(nil);
    local v20 = v7.useRef("");
    local v21 = v7.useRef(0);
    local v22, v23 = v7.useState(true);
    local v24 = l_useDesignTokens_0();
    local v25 = not v22;
    local v26 = v12({
        setParentScrollingEnabled = v16.setParentScrollingEnabled, 
        defaultCameraDistanceRef = v21
    });
    local v44 = v7.useCallback(v14() and function(v27, v28, v29, v30) --[[ Line: 65 ]]
        -- upvalues: v23 (copy), v17 (copy), l_HttpService_0 (ref), v20 (copy), v4 (ref), v11 (ref), v16 (copy), l_sendAXCounterV2_0 (ref), v13 (ref), v6 (ref), v18 (copy), v21 (copy)
        v23(true);
        if v17.current then
            v17.current:ClearAllChildren();
        end;
        local v31 = l_HttpService_0:GenerateGUID(false);
        v20.current = v31;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 77 ]]
            -- upvalues: v28 (copy), v4 (ref), v27 (copy), v11 (ref), v29 (copy), v30 (copy)
            if v28 == v4.ItemType.Asset and tonumber(v27) then
                return v11.getAssetModel((tonumber(v27)));
            elseif v28 == v4.ItemType.Bundle and v29 and v30 then
                if v29 == v4.BundleTypeIdStrings.Shoes then
                    return v11.getShoesModel(v30);
                else
                    local v32 = v29 == v4.BundleTypeIdStrings.DynamicHead;
                    return v11.getAvatarModel(v30, v32);
                end;
            else
                return nil;
            end;
        end);
        if not l_status_0 or not l_result_0 then
            if v16.onLoadingFailed then
                v16.onLoadingFailed();
            end;
            l_sendAXCounterV2_0("ItemViewportLoadingFailed");
            if not _G.__TESTEZ_RUNNING_TEST__ then
                warn(("ItemViewport: failed to load 3D model for item %*"):format(v27), l_result_0);
                if not v13() then
                    v6((("ItemViewport: failed to load 3D model. itemId:%* itemType:%*"):format(v27, v28)));
                end;
            end;
            return;
        elseif v20.current ~= v31 then
            l_result_0:Destroy();
            return;
        else
            local v35 = if v18.current then v18.current.MaxAxisFieldOfView else 70;
            v21.current = v11.getCameraDistance(l_result_0, v35);
            l_result_0.Parent = v17.current;
            v23(false);
            return;
        end;
    end or function(v36, v37, v38, v39) --[[ Line: 117 ]]
        -- upvalues: v23 (copy), v17 (copy), l_HttpService_0 (ref), v20 (copy), v4 (ref), v11 (ref), v16 (copy), l_sendAXCounterV2_0 (ref), v13 (ref), v6 (ref), v18 (copy), v21 (copy)
        v23(true);
        if v17.current then
            v17.current:ClearAllChildren();
        end;
        local v40 = l_HttpService_0:GenerateGUID(false);
        v20.current = v40;
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 130 ]]
            -- upvalues: v37 (copy), v4 (ref), v36 (copy), v11 (ref), v38 (copy), v39 (copy)
            if v37 == v4.ItemType.Asset and tonumber(v36) then
                return v11.getAssetModel((tonumber(v36)));
            elseif v37 == v4.ItemType.Bundle and v38 and v39 and tonumber(v39) then
                return v11.getBundleModel(v38, (tonumber(v39)));
            else
                return nil;
            end;
        end);
        if not l_status_1 or not l_result_1 then
            if v16.onLoadingFailed then
                v16.onLoadingFailed();
            end;
            l_sendAXCounterV2_0("ItemViewportLoadingFailed");
            if not _G.__TESTEZ_RUNNING_TEST__ then
                warn(("ItemViewport: failed to load 3D model for item %*"):format(v36), l_result_1);
                if not v13() then
                    v6((("ItemViewport: failed to load 3D model. itemId:%* itemType:%*"):format(v36, v37)));
                end;
            end;
            return;
        elseif v20.current ~= v40 then
            l_result_1:Destroy();
            return;
        else
            local v43 = if v18.current then v18.current.MaxAxisFieldOfView else 70;
            v21.current = v11.getCameraDistance(l_result_1, v43);
            l_result_1.Parent = v17.current;
            v23(false);
            return;
        end;
    end, {
        v16.onLoadingFailed
    });
    if v14() then
        v7.useEffect(function() --[[ Line: 175 ]]
            -- upvalues: v44 (copy), v16 (copy)
            task.spawn(function() --[[ Line: 176 ]]
                -- upvalues: v44 (ref), v16 (ref)
                v44(v16.itemId, v16.itemType, v16.bundleType, v16.bundleItems);
            end);
        end, {
            v16.itemId, 
            v16.itemType, 
            v16.bundleType, 
            v16.bundleItems, 
            v44
        });
    else
        v7.useEffect(function() --[[ Line: 181 ]]
            -- upvalues: v44 (copy), v16 (copy)
            task.spawn(function() --[[ Line: 182 ]]
                -- upvalues: v44 (ref), v16 (ref)
                v44(v16.itemId, v16.itemType, v16.bundleType, v16.outfitId);
            end);
        end, {
            v16.itemId, 
            v16.itemType, 
            v16.bundleType, 
            v16.outfitId, 
            v44
        });
    end;
    v7.useLayoutEffect(function() --[[ Line: 189 ]]
        -- upvalues: v19 (copy), v18 (copy)
        if v19.current then
            v19.current.CurrentCamera = v18.current;
        end;
    end, {});
    return v7.createElement("ViewportFrame", {
        Size = v16.size or UDim2.fromScale(1, 1), 
        Position = v16.position, 
        AnchorPoint = v16.anchorPoint, 
        LightColor = v15, 
        LightDirection = Vector3.new(-1, -1, 2, 0), 
        BackgroundTransparency = 1, 
        ref = v19, 
        [v7.Event.InputBegan] = if v25 then v26.onInputBegan else nil, 
        [v7.Event.MouseWheelForward] = if v25 then v26.onMouseWheelForward else nil, 
        [v7.Event.MouseWheelBackward] = if v25 then v26.onMouseWheelBackward else nil, 
        [v7.Event.MouseEnter] = if v25 then v26.onMouseEnter else nil, 
        [v7.Event.MouseLeave] = if v25 then v26.onMouseLeave else nil
    }, {
        WorldModel = v7.createElement("WorldModel", {
            ref = v17
        }), 
        Camera = v7.createElement("Camera", {
            CameraType = Enum.CameraType.Scriptable, 
            CFrame = v26.cameraCFrame, 
            ref = v18
        }), 
        LoadingSpinner = if v22 then v7.createElement(l_LoadingSpinner_0, {
            position = UDim2.fromScale(0.5, 0.5), 
            size = UDim2.fromOffset(v24.Global.Size_600, v24.Global.Size_600), 
            anchorPoint = Vector2.new(0.5, 0.5)
        }) else nil, 
        InputChangedConnection = if v25 then v7.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.InputChanged, 
            callback = v26.onInputChanged
        }) else nil, 
        InputEndedConnection = if v25 then v7.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.InputEnded, 
            callback = v26.onInputEnded
        }) else nil, 
        TouchPinchConnection = if v25 then v7.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.TouchPinch, 
            callback = v26.onTouchPinch
        }) else nil
    });
end;