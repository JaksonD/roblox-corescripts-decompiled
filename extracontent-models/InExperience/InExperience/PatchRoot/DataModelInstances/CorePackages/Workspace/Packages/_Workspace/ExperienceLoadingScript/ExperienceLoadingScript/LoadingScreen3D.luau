local l_Parent_0 = script:FindFirstAncestor("ExperienceLoadingScript").Parent;
local l_RunService_0 = game:GetService("RunService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_GuiService_0 = game:GetService("GuiService");
local l_TweenService_0 = game:GetService("TweenService");
local l_SplashScreenManager_0 = require(l_Parent_0.SplashScreenManager).SplashScreenManager;
local v7 = game:DefineFastFlag("LoadingRemoveRemoteCallErrorPrint", false);
local l_Create_0 = require(l_Parent_0.AppCommonLib).Create;
local function v9(v10, v11, v12) --[[ Line: 22 ]] --[[ Name: FadeElements ]]
    -- upvalues: l_TweenService_0 (copy), v9 (copy)
    v12 = v12 or 0.5;
    if v10 == nil then
        return;
    else
        local v13 = TweenInfo.new(v12, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
        if v10:IsA("ImageLabel") or v10:IsA("ImageButton") then
            l_TweenService_0:Create(v10, v13, {
                ImageTransparency = v11
            }):Play();
        end;
        if v10:IsA("GuiObject") then
            l_TweenService_0:Create(v10, v13, {
                BackgroundTransparency = v11
            }):Play();
        end;
        if v10:IsA("TextLabel") or v10:IsA("TextBox") or v10:IsA("TextButton") then
            l_TweenService_0:Create(v10, v13, {
                TextTransparency = v11
            }):Play();
        end;
        for _, v15 in pairs(v10:GetChildren()) do
            v9(v15, v11, v12);
        end;
        return;
    end;
end;
local v16 = {};
local l_BindableEvent_0 = Instance.new("BindableEvent");
v16.Finished = false;
v16.GameAssetInfo = nil;
v16.LoadingFinishedEvent = l_BindableEvent_0.Event;
v16.GetGameName = function(v18) --[[ Line: 51 ]] --[[ Name: GetGameName ]]
    if v18.GameAssetInfo ~= nil then
        return v18.GameAssetInfo.Name;
    else
        return "";
    end;
end;
v16.GetCreatorName = function(v19) --[[ Line: 59 ]] --[[ Name: GetCreatorName ]]
    if v19.GameAssetInfo ~= nil then
        return v19.GameAssetInfo.Creator.Name;
    else
        return "";
    end;
end;
v16.IsReady = function(v20) --[[ Line: 67 ]] --[[ Name: IsReady ]]
    return v20.Finished;
end;
local l_l_BindableEvent_0_0 = l_BindableEvent_0 --[[ copy: 12 -> 28 ]];
v16.LoadAssetsAsync = function(v22) --[[ Line: 71 ]] --[[ Name: LoadAssetsAsync ]]
    -- upvalues: l_MarketplaceService_0 (copy), v7 (copy), l_l_BindableEvent_0_0 (copy)
    spawn(function() --[[ Line: 72 ]]
        -- upvalues: v22 (copy), l_MarketplaceService_0 (ref), v7 (ref), l_l_BindableEvent_0_0 (ref)
        while game.PlaceId <= 0 do
            wait();
        end;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 78 ]]
            -- upvalues: v22 (ref), l_MarketplaceService_0 (ref)
            if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                v22.GameAssetInfo = l_MarketplaceService_0:GetProductInfoAsync(game.PlaceId);
                return;
            else
                v22.GameAssetInfo = l_MarketplaceService_0:GetProductInfo(game.PlaceId);
                return;
            end;
        end);
        if not v7 and not l_status_0 then
            print("LoadingScript->GameInfoProvider:LoadAssets:", l_result_0);
        end;
        v22.Finished = true;
        l_l_BindableEvent_0_0:Fire();
    end);
end;
l_BindableEvent_0 = l_Create_0("Frame")({
    Name = "VRLoadingScreenContainer", 
    Size = UDim2.new(1, 0, 1, 0), 
    BackgroundTransparency = 1, 
    BackgroundColor3 = Color3.new(0, 0, 0)
});
local v25 = l_Create_0("ImageLabel")({
    Name = "LoadingBackground", 
    Position = UDim2.new(0.25, 0, 0.25, 0), 
    Size = UDim2.new(0.5, 0, 0.5, 0), 
    Image = "rbxasset://textures/ui/LoadingScreen/BackgroundLight.png", 
    ScaleType = Enum.ScaleType.Slice, 
    SliceCenter = Rect.new(70, 70, 110, 110), 
    BackgroundTransparency = 1, 
    Parent = l_BindableEvent_0, 
    ImageColor3 = Color3.new(0, 0, 0)
});
local v26 = 0;
local v27 = l_Create_0("ImageLabel")({
    Name = "Spinner", 
    Size = UDim2.new(0.25, 0, 0.25, 0), 
    SizeConstraint = Enum.SizeConstraint.RelativeYY, 
    Position = UDim2.new(0.375, 0, 0.325, 0), 
    Image = "rbxasset://textures/ui/LoadingScreen/LoadingSpinner.png", 
    BackgroundTransparency = 1, 
    Parent = v25
});
local v28 = l_Create_0("TextLabel")({
    Name = "LoadingText", 
    Text = "Loading...", 
    BackgroundTransparency = 1, 
    Font = Enum.Font.SourceSans, 
    FontSize = Enum.FontSize.Size60, 
    Position = UDim2.new(0.5, 0, 0.2, 0), 
    Parent = v25, 
    TextColor3 = Color3.new(0.30196078431372547, 0.6392156862745098, 0.8784313725490196)
});
local v29 = l_Create_0("TextLabel")({
    Name = "GameNameText", 
    Text = "", 
    BackgroundTransparency = 1, 
    Font = Enum.Font.SourceSans, 
    FontSize = Enum.FontSize.Size60, 
    Size = UDim2.new(0.9, 0, 0.1, 0), 
    Position = UDim2.new(0.05, 0, 0.65, 0), 
    ClipsDescendants = true, 
    Parent = v25, 
    TextColor3 = Color3.new(0.058823529411764705, 0.9294117647058824, 1)
});
local v30 = l_Create_0("Frame")({
    Name = "CreatorTextContainer", 
    Size = UDim2.new(0.9, 0, 0.1, 0), 
    Position = UDim2.new(0.05, 0, 0.77, 0), 
    BackgroundTransparency = 1, 
    ClipsDescendants = true, 
    Parent = v25
});
local v31 = 0;
local v32 = l_Create_0("TextLabel")({
    Name = "CreatorText", 
    Text = "", 
    BackgroundTransparency = 1, 
    Font = Enum.Font.SourceSans, 
    FontSize = Enum.FontSize.Size42, 
    Size = UDim2.new(1, 0, 1, 0), 
    Parent = v30, 
    TextColor3 = Color3.new(0.058823529411764705, 0.9294117647058824, 1)
});
local v33 = false;
local v34 = true;
delay(2.5, function() --[[ Line: 173 ]]
    -- upvalues: v34 (ref)
    v34 = false;
end);
local function v38(v35) --[[ Line: 176 ]] --[[ Name: UpdateLayout ]]
    -- upvalues: v32 (copy), v30 (copy), v34 (ref), v31 (ref), l_TweenService_0 (copy), v33 (ref), v29 (copy), v27 (copy), v28 (copy)
    if v32.TextBounds.X < v30.AbsoluteSize.X then
        v32.Position = UDim2.new(0, 0, 0, 0);
        v32.Size = UDim2.new(1, 0, 1, 0);
    elseif v35 ~= nil then
        v32.Size = UDim2.new(0, v32.TextBounds.X, 1, 0);
        if not v34 then
            local v36 = v31 - v35 * 25;
            if v36 + v32.AbsoluteSize.X < v30.AbsoluteSize.X then
                v34 = true;
                spawn(function() --[[ Line: 186 ]]
                    -- upvalues: l_TweenService_0 (ref), v32 (ref), v33 (ref), v31 (ref), v34 (ref)
                    local v37 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
                    l_TweenService_0:Create(v32, v37, {
                        TextTransparency = 1
                    }):Play();
                    wait(1.5);
                    if v33 then
                        return;
                    else
                        v31 = 0;
                        l_TweenService_0:Create(v32, v37, {
                            TextTransparency = 0
                        }):Play();
                        wait(1.5);
                        v34 = false;
                        return;
                    end;
                end);
            else
                v31 = v36;
            end;
        end;
        v32.Position = UDim2.new(0, v31, 0, 0);
    end;
    if not v29.TextFits then
        v29.Size = UDim2.new(0.9, 0, 0.3, 0);
        v29.Position = UDim2.new(0.05, 0, 0.5, 0);
        v29.TextScaled = true;
        v29.TextWrapped = true;
        v27.Position = UDim2.new(0.375, 0, 0.225, 0);
        v28.Position = UDim2.new(0.5, 0, 0.15, 0);
    end;
end;
local function _() --[[ Line: 217 ]] --[[ Name: CleanUp ]]
    -- upvalues: v33 (ref), v9 (copy), l_BindableEvent_0 (copy), l_RunService_0 (copy)
    if v33 then
        return;
    else
        v33 = true;
        v9(l_BindableEvent_0, 1, 2.5);
        wait(2.5);
        l_RunService_0:UnbindFromRenderStep("LoadingGui3D");
        l_BindableEvent_0.Parent = nil;
        return;
    end;
end;
local function v41() --[[ Line: 230 ]] --[[ Name: OnGameInfoLoaded ]]
    -- upvalues: v16 (copy), v29 (copy), v32 (copy)
    local l_v16_CreatorName_0 = v16:GetCreatorName();
    if l_v16_CreatorName_0 and l_v16_CreatorName_0 ~= "" then
        l_v16_CreatorName_0 = string.format("By %s", (tostring(l_v16_CreatorName_0)));
    end;
    v29.Text = v16:GetGameName();
    v32.Text = l_v16_CreatorName_0;
end;
local function v42() --[[ Line: 239 ]] --[[ Name: OnDefaultLoadingGuiRemoved ]]
    -- upvalues: v33 (ref), v9 (copy), l_BindableEvent_0 (copy), l_RunService_0 (copy)
    if v33 then
        return;
    else
        v33 = true;
        v9(l_BindableEvent_0, 1, 2.5);
        wait(2.5);
        l_RunService_0:UnbindFromRenderStep("LoadingGui3D");
        l_BindableEvent_0.Parent = nil;
        return;
    end;
end;
local v43 = tick();
do
    local l_v43_0 = v43;
    l_RunService_0:BindToRenderStep("LoadingGui3D", Enum.RenderPriority.Last.Value, function() --[[ Line: 245 ]]
        -- upvalues: l_v43_0 (ref), v38 (copy), v26 (ref), v27 (copy)
        local v45 = tick();
        local v46 = v45 - l_v43_0;
        v38(v46);
        local v47 = v46 * 0.5 * 360;
        v26 = v26 + v47;
        v27.Rotation = v26;
        l_v43_0 = v45;
    end);
    v38();
end;
v16:LoadAssetsAsync();
if v16:IsReady() then
    v43 = v16:GetCreatorName();
    if v43 and v43 ~= "" then
        v43 = string.format("By %s", (tostring(v43)));
    end;
    v29.Text = v16:GetGameName();
    v32.Text = v43;
end;
v16.LoadingFinishedEvent:Connect(v41);
if l_ReplicatedFirst_0:IsDefaultLoadingGuiRemoved() then
    if not v33 then
        v33 = true;
        v9(l_BindableEvent_0, 1, 2.5);
        wait(2.5);
        l_RunService_0:UnbindFromRenderStep("LoadingGui3D");
        l_BindableEvent_0.Parent = nil;
    end;
else
    l_ReplicatedFirst_0.RemoveDefaultLoadingGuiSignal:connect(v42);
end;
l_GuiService_0.ErrorMessageChanged:connect(function() --[[ Line: 272 ]]

end);
l_GuiService_0.UiMessageChanged:connect(function(_, _) --[[ Line: 276 ]]

end);
l_SplashScreenManager_0.addStatusChangeListener(function(v50) --[[ Line: 280 ]]
    -- upvalues: v33 (ref), v9 (copy), l_BindableEvent_0 (copy), l_RunService_0 (copy)
    if v50 then
        if v33 then
            return;
        else
            v33 = true;
            v9(l_BindableEvent_0, 1, 2.5);
            wait(2.5);
            l_RunService_0:UnbindFromRenderStep("LoadingGui3D");
            l_BindableEvent_0.Parent = nil;
        end;
    end;
end);
return l_BindableEvent_0;