local l_Parent_0 = script:FindFirstAncestor("EditProfile").Parent;
local v1 = require(l_Parent_0.React);
local l_View_0 = require(l_Parent_0.Foundation).View;
local v3 = require(l_Parent_0.RoactUtils);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_useSelectedTheme_0 = v3.Hooks.useSelectedTheme;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_getDisplayBackgroundId_0 = require(l_Parent_0.EditProfileBackground).BackgroundUtils.getDisplayBackgroundId;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v10 = Color3.fromRGB(185, 185, 185);
local v11 = Color3.fromRGB(200, 200, 200);
local l_InsertService_0 = game:GetService("InsertService");
return function(v13) --[[ Line: 40 ]] --[[ Name: EditProfileBackgroundViewport ]]
    -- upvalues: v1 (copy), l_useSelectedTheme_0 (copy), l_useLocalUserId_0 (copy), l_useSelector_0 (copy), l_InsertService_0 (copy), l_getDisplayBackgroundId_0 (copy), v10 (copy), v11 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_View_0 (copy)
    local v14 = v1.useRef(nil);
    local v15 = v1.useRef(nil);
    local v16 = v1.useRef(nil);
    local v17 = l_useSelectedTheme_0();
    local v18 = l_useLocalUserId_0();
    local v21 = l_useSelector_0(function(v19) --[[ Line: 47 ]]
        -- upvalues: v18 (copy)
        if v19.ProfilePlatform and v19.ProfilePlatform.Profiles and v18 then
            local v20 = v19.ProfilePlatform.Profiles.User[tostring(v18)];
            if v20 and v20.components and v20.components.ProfileBackground then
                return v20.components.ProfileBackground.assetId;
            end;
        end;
        return -1;
    end);
    v1.useEffect(function() --[[ Line: 58 ]]
        -- upvalues: v21 (copy), l_InsertService_0 (ref), l_getDisplayBackgroundId_0 (ref), v17 (copy), v15 (copy), v14 (copy), v10 (ref), v11 (ref)
        task.defer(function() --[[ Line: 60 ]]
            -- upvalues: v21 (ref), l_InsertService_0 (ref), l_getDisplayBackgroundId_0 (ref), v17 (ref), v15 (ref), v14 (ref), v10 (ref), v11 (ref)
            if not v21 then
                return;
            else
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 65 ]]
                    -- upvalues: l_InsertService_0 (ref), l_getDisplayBackgroundId_0 (ref), v21 (ref), v17 (ref)
                    return l_InsertService_0:LoadAsset(l_getDisplayBackgroundId_0(v21, v17));
                end);
                if l_status_0 and l_result_0 then
                    if v15.current then
                        for _, v25 in pairs(v15.current:GetChildren()) do
                            v25:Destroy();
                        end;
                    end;
                    local l_Model_0 = Instance.new("Model");
                    l_Model_0.Name = "BackgroundModel";
                    l_Model_0.Parent = v15.current;
                    for _, v28 in pairs(l_result_0:GetChildren()) do
                        v28.Parent = l_Model_0;
                    end;
                    l_Model_0:PivotTo(CFrame.new(0, 7, -4.5));
                    l_result_0:Destroy();
                    local l_current_0 = v14.current;
                    if l_current_0 then
                        l_current_0.Ambient = v10;
                        l_current_0.LightColor = v11;
                        l_current_0.LightDirection = Vector3.new(0, 0.20000000298023224, 0.20000000298023224, 0);
                    end;
                end;
                return;
            end;
        end);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v21, 
        v17
    } else l_dependencyArray_0(v21, v17));
    v1.useEffect(function() --[[ Line: 102 ]]
        -- upvalues: v14 (copy), v16 (copy)
        if v14.current and v16.current then
            v14.current.CurrentCamera = v16.current;
        end;
    end);
    return v1.createElement(l_View_0, {
        Size = UDim2.new(1, 0, 0, v13.height)
    }, {
        Background = v1.createElement("ViewportFrame", {
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 1, 
            ref = v14, 
            Ambient = v10, 
            LightColor = v11, 
            BackgroundTransparency = 1
        }, {
            WorldModel = v1.createElement("WorldModel", {
                ref = v15
            }), 
            Camera = v1.createElement("Camera", {
                CameraType = Enum.CameraType.Scriptable, 
                CFrame = CFrame.lookAt(Vector3.new(0, 7, 4, 0), (Vector3.new(0, 7, 10, 0))), 
                ref = v16
            })
        })
    });
end;