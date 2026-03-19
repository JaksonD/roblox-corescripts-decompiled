local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExperienceLoadingScript");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Players_0 = require(l_Parent_0.MockableProxyServices).Players;
local l_ReplicatedFirst_0 = require(l_Parent_0.MockableProxyServices).ReplicatedFirst;
local l_RunService_0 = require(l_Parent_0.MockableProxyServices).RunService;
local l_VRService_0 = require(l_Parent_0.MockableProxyServices).VRService;
local l_SplashScreenManager_0 = require(l_Parent_0.SplashScreenManager).SplashScreenManager;
local l_IsVRAppBuild_0 = require(l_Parent_0.AppCommonLib).IsVRAppBuild;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_game_0 = require(l_Parent_0.MockableProxyServices).game;
local l_waitProxy_0 = require(l_Parent_0.MockableProxyServices).waitProxy;
local l_settingsProxy_0 = require(l_Parent_0.MockableProxyServices).settingsProxy;
game:DefineFastInt("FPSAwareSplashScreenTimeout", 30);
local v12 = game:DefineFastFlag("ExperienceLoadingScreenFixStyleLink", false);
local v13 = require(l_Parent_0.UIBlox);
local l_UIBloxInGameConfig_0 = require(l_Parent_0.CoreScriptsInitializer).UIBloxInGameConfig;
v13.init(l_UIBloxInGameConfig_0);
local l_Constants_0 = v13.App.Style.Constants;
local l_UiModeStyleProvider_0 = require(l_Parent_0.Style).UiModeStyleProvider;
local l_Create_0 = require(l_Parent_0.AppCommonLib).Create;
local v18 = require(l_script_FirstAncestor_0.LoadingScreen);
local v19 = require(l_script_FirstAncestor_0.Reducers.LoadingScreenReducer);
local v20 = require(l_Parent_0.LoggingProtocol);
local function v22() --[[ Line: 37 ]] --[[ Name: GenerateDevGUIBlackoutCurtain ]]
    -- upvalues: l_Create_0 (copy), l_CoreGui_0 (copy)
    local v21 = l_Create_0("ScreenGui")({
        Name = "DevGUIBlackoutCurtain", 
        DisplayOrder = 8, 
        IgnoreGuiInset = true
    });
    l_Create_0("Frame")({
        Name = "BlackFrame", 
        BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
        BackgroundTransparency = 0, 
        Size = UDim2.fromScale(10, 10), 
        Position = UDim2.fromOffset(0, 0), 
        Active = true, 
        Parent = v21
    });
    v21.Parent = l_CoreGui_0;
    return v21;
end;
return function(v23, v24) --[[ Line: 61 ]]
    -- upvalues: v22 (copy), l_Parent_0 (copy), v19 (copy), v18 (copy), l_UiModeStyleProvider_0 (copy), l_Constants_0 (copy), v12 (copy), l_CoreGui_0 (copy), l_RunService_0 (copy), l_waitProxy_0 (copy), l_SplashScreenManager_0 (copy), l_script_FirstAncestor_0 (copy), l_Players_0 (copy), l_game_0 (copy), l_VRService_0 (copy), l_IsVRAppBuild_0 (copy), l_settingsProxy_0 (copy), l_ReplicatedFirst_0 (copy), v20 (copy)
    local v25 = true;
    local v26 = false;
    local v27 = false;
    local v28 = nil;
    local v29 = nil;
    local v30 = v22();
    local v31 = nil;
    local function _() --[[ Line: 74 ]]
        -- upvalues: v30 (ref)
        if v30 then
            v30.Enabled = false;
            v30:Destroy();
            v30 = nil;
        end;
    end;
    local function v40(v33) --[[ Line: 82 ]]
        -- upvalues: v31 (ref), l_Parent_0 (ref), v19 (ref), v18 (ref), l_UiModeStyleProvider_0 (ref), l_Constants_0 (ref), v12 (ref), l_CoreGui_0 (ref), l_RunService_0 (ref), v30 (ref)
        v31 = require(l_Parent_0.Roact);
        local v34 = require(l_Parent_0.Rodux);
        local v35 = require(l_Parent_0.RoactRodux);
        local v36 = v34.Store.new(v19, {}, {
            v34.thunkMiddleware
        });
        local v37 = v31.createElement(v18, {
            placeId = v33
        });
        local v38 = v31.createElement(v35.StoreProvider, {
            store = v36
        }, {
            v31.createElement(l_UiModeStyleProvider_0, {
                style = {
                    themeName = l_Constants_0.ThemeName.Dark, 
                    fontName = l_Constants_0.FontName.Gotham
                }
            }, {
                loadingScreenUI = v37
            })
        });
        if v12 then
            v38 = v31.createElement("Folder", nil, v38);
        end;
        local v39 = v31.mount(v38, l_CoreGui_0, "RobloxLoadingGUI");
        l_RunService_0.Heartbeat:Wait();
        v30.Enabled = false;
        return v39;
    end;
    local function _() --[[ Line: 113 ]]
        -- upvalues: v31 (ref), l_waitProxy_0 (ref), v29 (ref)
        if v31 then
            l_waitProxy_0(0.6);
            if v29 ~= nil then
                v31.unmount(v29);
                v29 = nil;
            end;
        end;
    end;
    local function v44(v42) --[[ Line: 124 ]]
        -- upvalues: v25 (ref), v31 (ref), l_waitProxy_0 (ref), v29 (ref), l_SplashScreenManager_0 (ref), v28 (ref), v30 (ref), l_script_FirstAncestor_0 (ref)
        v25 = false;
        if v31 then
            l_waitProxy_0(0.6);
            if v29 ~= nil then
                v31.unmount(v29);
                v29 = nil;
            end;
        end;
        l_SplashScreenManager_0.initialize(v42 / 2, game:GetFastInt("FPSAwareSplashScreenTimeout"), v42);
        l_SplashScreenManager_0.addStatusChangeListener(function(v43) --[[ Line: 130 ]]
            -- upvalues: v25 (ref), v28 (ref)
            v25 = v43;
            if v25 and v28 then
                v28();
            end;
        end);
        v30.Enabled = true;
        require(l_script_FirstAncestor_0.LoadingScreen3D).Parent = v30;
    end;
    local function _() --[[ Line: 143 ]]
        -- upvalues: l_Players_0 (ref)
        if l_Players_0.CharacterAutoLoads then
            local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
            if not l_LocalPlayer_0 then
                l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
                l_LocalPlayer_0 = l_Players_0.LocalPlayer;
            end;
            if not l_LocalPlayer_0.Character then
                l_LocalPlayer_0.CharacterAdded:Wait();
            end;
        end;
    end;
    local function v51() --[[ Line: 156 ]]
        -- upvalues: l_game_0 (ref), l_Players_0 (ref), v26 (ref), v28 (ref)
        if l_game_0:IsLoaded() then
            if l_Players_0.CharacterAutoLoads then
                local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
                if not l_LocalPlayer_1 then
                    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
                    l_LocalPlayer_1 = l_Players_0.LocalPlayer;
                end;
                if not l_LocalPlayer_1.Character then
                    l_LocalPlayer_1.CharacterAdded:Wait();
                end;
            end;
            v26 = true;
            if v28 then
                v28();
                return;
            end;
        else
            local v48 = nil;
            do
                local l_v48_0 = v48;
                l_v48_0 = l_game_0.Loaded:Connect(function() --[[ Line: 165 ]]
                    -- upvalues: l_v48_0 (ref), l_Players_0 (ref), v26 (ref), v28 (ref)
                    l_v48_0:Disconnect();
                    l_v48_0 = nil;
                    if l_Players_0.CharacterAutoLoads then
                        local l_LocalPlayer_2 = l_Players_0.LocalPlayer;
                        if not l_LocalPlayer_2 then
                            l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
                            l_LocalPlayer_2 = l_Players_0.LocalPlayer;
                        end;
                        if not l_LocalPlayer_2.Character then
                            l_LocalPlayer_2.CharacterAdded:Wait();
                        end;
                    end;
                    v26 = true;
                    if v28 then
                        v28();
                    end;
                end);
            end;
        end;
    end;
    if l_VRService_0.VREnabled or l_IsVRAppBuild_0() then
        v44(v24);
    else
        l_VRService_0:GetPropertyChangedSignal("VREnabled"):Connect(function() --[[ Line: 181 ]]
            -- upvalues: l_VRService_0 (ref), v44 (copy), v24 (copy)
            if l_VRService_0.VREnabled then
                v44(v24);
            end;
        end);
        v29 = v40(v23);
    end;
    v28 = function() --[[ Line: 191 ]]
        -- upvalues: l_VRService_0 (ref), v25 (ref), l_settingsProxy_0 (ref), v30 (ref), l_ReplicatedFirst_0 (ref), v20 (ref), v26 (ref), v27 (ref), v31 (ref), l_waitProxy_0 (ref), v29 (ref)
        if l_VRService_0.VREnabled then
            if v25 or l_settingsProxy_0().Rendering.QualityLevel ~= Enum.QualityLevel.Automatic then
                if v30 then
                    v30.Enabled = false;
                    v30:Destroy();
                    v30 = nil;
                end;
                l_ReplicatedFirst_0:SetDefaultLoadingGuiRemoved();
                v20.default:logEventOnce("first_experience_interactive");
                return;
            end;
        elseif v26 or v27 then
            if v31 then
                l_waitProxy_0(0.6);
                if v29 ~= nil then
                    v31.unmount(v29);
                    v29 = nil;
                end;
            end;
            if v30 then
                v30.Enabled = false;
                v30:Destroy();
                v30 = nil;
            end;
            l_ReplicatedFirst_0:SetDefaultLoadingGuiRemoved();
            v20.default:logEventOnce("first_experience_interactive");
        end;
    end;
    l_ReplicatedFirst_0.FinishedReplicating:Connect(v51);
    if l_ReplicatedFirst_0:IsFinishedReplicating() then
        v51();
    end;
    l_ReplicatedFirst_0.RemoveDefaultLoadingGuiSignal:Connect(function() --[[ Line: 221 ]]
        -- upvalues: v27 (ref), v28 (ref)
        v27 = true;
        if v28 then
            v28();
        end;
    end);
    if l_ReplicatedFirst_0:IsDefaultLoadingGuiRemoved() then
        v27 = true;
        if v28 then
            v28();
        end;
    end;
end;