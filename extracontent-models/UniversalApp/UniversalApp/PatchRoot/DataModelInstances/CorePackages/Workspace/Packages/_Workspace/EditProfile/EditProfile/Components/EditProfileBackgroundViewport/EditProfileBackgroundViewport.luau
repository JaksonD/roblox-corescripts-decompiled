local l_Parent_0 = script:FindFirstAncestor("EditProfile").Parent;
local v1 = require(l_Parent_0.React);
local l_View_0 = require(l_Parent_0.Foundation).View;
local v3 = require(l_Parent_0.RoactUtils);
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_useSelectedTheme_0 = v3.Hooks.useSelectedTheme;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_getDisplayBackgroundId_0 = require(l_Parent_0.EditProfileBackground).BackgroundUtils.getDisplayBackgroundId;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v9 = Color3.fromRGB(185, 185, 185);
local v10 = Color3.fromRGB(200, 200, 200);
local l_InsertService_0 = game:GetService("InsertService");
return function(v12) --[[ Line: 38 ]] --[[ Name: EditProfileBackgroundViewport ]]
    -- upvalues: v1 (copy), l_useSelectedTheme_0 (copy), l_useLocalUserId_0 (copy), l_useSelector_0 (copy), l_InsertService_0 (copy), l_getDisplayBackgroundId_0 (copy), v9 (copy), v10 (copy), l_dependencyArray_0 (copy), l_View_0 (copy)
    local v13 = v1.useRef(nil);
    local v14 = v1.useRef(nil);
    local v15 = v1.useRef(nil);
    local v16 = l_useSelectedTheme_0();
    local v17 = l_useLocalUserId_0();
    local v20 = l_useSelector_0(function(v18) --[[ Line: 45 ]]
        -- upvalues: v17 (copy)
        if v18.ProfilePlatform and v18.ProfilePlatform.Profiles and v17 then
            local v19 = v18.ProfilePlatform.Profiles.User[tostring(v17)];
            if v19 and v19.components and v19.components.ProfileBackground then
                return v19.components.ProfileBackground.assetId;
            end;
        end;
        return -1;
    end);
    v1.useEffect(function() --[[ Line: 55 ]]
        -- upvalues: v20 (copy), l_InsertService_0 (ref), l_getDisplayBackgroundId_0 (ref), v16 (copy), v14 (copy), v13 (copy), v9 (ref), v10 (ref)
        task.defer(function() --[[ Line: 57 ]]
            -- upvalues: v20 (ref), l_InsertService_0 (ref), l_getDisplayBackgroundId_0 (ref), v16 (ref), v14 (ref), v13 (ref), v9 (ref), v10 (ref)
            if not v20 then
                return;
            else
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 62 ]]
                    -- upvalues: l_InsertService_0 (ref), l_getDisplayBackgroundId_0 (ref), v20 (ref), v16 (ref)
                    return l_InsertService_0:LoadAsset(l_getDisplayBackgroundId_0(v20, v16));
                end);
                if l_status_0 and l_result_0 then
                    if v14.current then
                        for _, v24 in pairs(v14.current:GetChildren()) do
                            v24:Destroy();
                        end;
                    end;
                    local l_Model_0 = Instance.new("Model");
                    l_Model_0.Name = "BackgroundModel";
                    l_Model_0.Parent = v14.current;
                    for _, v27 in pairs(l_result_0:GetChildren()) do
                        v27.Parent = l_Model_0;
                    end;
                    l_Model_0:PivotTo(CFrame.new(0, 7, -4.5));
                    l_result_0:Destroy();
                    local l_current_0 = v13.current;
                    if l_current_0 then
                        l_current_0.Ambient = v9;
                        l_current_0.LightColor = v10;
                        l_current_0.LightDirection = Vector3.new(0, 0.20000000298023224, 0.20000000298023224, 0);
                    end;
                end;
                return;
            end;
        end);
    end, l_dependencyArray_0(v20, v16));
    v1.useEffect(function() --[[ Line: 95 ]]
        -- upvalues: v13 (copy), v15 (copy)
        if v13.current and v15.current then
            v13.current.CurrentCamera = v15.current;
        end;
    end);
    return v1.createElement(l_View_0, {
        Size = UDim2.new(1, 0, 0, v12.height)
    }, {
        Background = v1.createElement("ViewportFrame", {
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 1, 
            ref = v13, 
            Ambient = v9, 
            LightColor = v10, 
            BackgroundTransparency = 1
        }, {
            WorldModel = v1.createElement("WorldModel", {
                ref = v14
            }), 
            Camera = v1.createElement("Camera", {
                CameraType = Enum.CameraType.Scriptable, 
                CFrame = CFrame.lookAt(Vector3.new(0, 7, 4, 0), (Vector3.new(0, 7, 10, 0))), 
                ref = v15
            })
        })
    });
end;