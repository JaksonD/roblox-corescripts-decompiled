local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local l_Panel3D_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).Panel3D;
local _ = Color3.new(0.2, 0.2, 0.2);
local _ = Enum.FontSize.Size36;
local _ = Color3.new(1, 1, 1);
local v9 = CFrame.new(0, 0, -7) * CFrame.Angles(0, 3.141592653589793, 0);
local _ = l_Create_0("ImageLabel")({
    Name = "EmptySelectionImage", 
    Image = "", 
    BackgroundTransparency = 1, 
    ImageTransparency = 1
});
local v11 = l_Panel3D_0.Get("Dialog");
v11:SetType(l_Panel3D_0.Type.Fixed);
v11.localCF = v9;
v11:SetCanFade(true);
local v12 = 0;
local v13 = {};
local v14 = false;
local v15 = 0;
local function _(v16) --[[ Line: 46 ]] --[[ Name: positionDialogPanel ]]
    -- upvalues: v12 (ref), l_UserInputService_0 (copy), v11 (copy), v9 (copy)
    v12 = v16;
    local l_p_0 = l_UserInputService_0:GetUserCFrame(Enum.UserCFrame.Head).p;
    v11.localCF = CFrame.new(l_p_0) * CFrame.Angles(0, v16, 0) * v9;
end;
v11.CalculateTransparency = function(_) --[[ Line: 53 ]] --[[ Name: CalculateTransparency ]]
    -- upvalues: l_UserInputService_0 (copy), v15 (ref), v12 (ref), v14 (ref)
    local l_l_UserInputService_0_UserCFrame_0 = l_UserInputService_0:GetUserCFrame(Enum.UserCFrame.Head);
    local v21 = l_l_UserInputService_0_UserCFrame_0.lookVector * Vector3.new(1, 0, 1, 0);
    local v22 = math.asin(l_l_UserInputService_0_UserCFrame_0.lookVector.Y);
    local v23 = Vector3.new(math.cos(v15 + v12 + 1.5707963267948966), 0, -math.sin(v15 + v12 + 1.5707963267948966));
    if math.abs(v22) > 0.767944870877505 then
        v14 = true;
    end;
    return (math.min(math.max(0, (math.acos((v21:Dot(v23))) - 0.6544984694978736) / 0.11344640137963136), 1));
end;
local function v28() --[[ Line: 69 ]] --[[ Name: updatePanelPosition ]]
    -- upvalues: l_UserInputService_0 (copy), v15 (ref), v14 (ref), v12 (ref), v11 (copy), v9 (copy)
    local v24 = l_UserInputService_0:GetUserCFrame(Enum.UserCFrame.Head).lookVector * Vector3.new(1, 0, 1, 0);
    local v25 = (math.atan2(-v24.Z, v24.X) - 1.5707963267948966) % 6.283185307179586;
    local v26 = v15 + math.floor(v25 / 1.5707963267948966 + 0.5) * 1.5707963267948966;
    if v14 then
        v14 = false;
        v15 = v25;
    end;
    v12 = v26;
    local l_p_1 = l_UserInputService_0:GetUserCFrame(Enum.UserCFrame.Head).p;
    v11.localCF = CFrame.new(l_p_1) * CFrame.Angles(0, v26, 0) * v9;
end;
dialogPanelRenderUpdate = function() --[[ Line: 84 ]] --[[ Name: dialogPanelRenderUpdate ]]
    -- upvalues: v11 (copy), v14 (ref), v28 (copy), v13 (ref)
    if v11.transparency == 1 or v14 then
        v28();
    end;
    local v29 = 1 - v11.transparency;
    for v30, v31 in pairs(v13) do
        local v32 = 1 - v31 * v29;
        if v30:IsA("TextLabel") or v30:IsA("TextButton") then
            v30.TextTransparency = v32;
        elseif v30:IsA("ImageLabel") or v30:IsA("ImageButton") then
            v30.ImageTransparency = v32;
        elseif v30:IsA("Frame") then
            v30.BackgroundTransparency = v32;
        end;
    end;
end;
local v33 = {};
local v34 = nil;
local v35 = nil;
local function v43() --[[ Line: 107 ]] --[[ Name: updatePanel ]]
    -- upvalues: v33 (copy), v35 (ref), v11 (copy), v13 (ref), v34 (ref), v14 (ref), v28 (copy)
    local v36 = v33[1];
    if v35 and v35.content then
        v35.content.Parent = nil;
    end;
    if not v36 or not v36.content then
        v11:SetVisible(false);
        v13 = {};
        if v34 then
            v34:disconnect();
            v34 = nil;
            return;
        end;
    else
        v36.content.Parent = v11:GetGUI();
        v35 = v36;
        local l_AbsoluteSize_0 = v36.content.AbsoluteSize;
        v11:ResizePixels(l_AbsoluteSize_0.X, l_AbsoluteSize_0.Y, 100);
        v14 = true;
        v28();
        v11:SetVisible(true);
        v13 = {};
        local function v38(v39) --[[ Line: 131 ]] --[[ Name: search ]]
            -- upvalues: v13 (ref), v38 (copy)
            if v39:IsA("ImageLabel") or v39:IsA("ImageButton") then
                v13[v39] = 1 - v39.ImageTransparency;
            elseif v39:IsA("TextLabel") or v39:IsA("TextButton") then
                v13[v39] = 1 - v39.TextTransparency;
            elseif v39:IsA("Frame") then
                v13[v39] = 1 - v39.BackgroundTransparency;
            end;
            for _, v41 in pairs(v39:GetChildren()) do
                v38(v41);
            end;
        end;
        v38(v11:GetGUI());
        if v34 then
            v34:disconnect();
            v34 = nil;
        end;
        v34 = v11:GetGUI().DescendantAdded:connect(function(v42) --[[ Line: 148 ]]
            -- upvalues: v38 (copy)
            v38(v42);
        end);
    end;
end;
local v44 = {};
v44.__index = v44;
v44.new = function(v45) --[[ Line: 160 ]] --[[ Name: new ]]
    -- upvalues: v44 (copy)
    local v46 = setmetatable({}, v44);
    v46.content = v45;
    return v46;
end;
v44.SetContent = function(v47, v48) --[[ Line: 166 ]] --[[ Name: SetContent ]]
    if not v48 and v47.content then
        v47.content.Parent = nil;
    end;
    v47.content = v48;
end;
local v49 = false;
v44.Show = function(v50, v51) --[[ Line: 174 ]] --[[ Name: Show ]]
    -- upvalues: v49 (ref), l_RunService_0 (copy), v33 (copy), v43 (copy)
    if not v49 then
        v49 = true;
        l_RunService_0:BindToRenderStep("DialogPanel", Enum.RenderPriority.First.Value, dialogPanelRenderUpdate);
    end;
    if v51 then
        table.insert(v33, 1, v50);
    else
        table.insert(v33, v50);
    end;
    v43();
end;
v44.Close = function(v52) --[[ Line: 187 ]] --[[ Name: Close ]]
    -- upvalues: v33 (copy), v49 (ref), l_RunService_0 (copy), v43 (copy)
    for v53, v54 in pairs(v33) do
        if v54 == v52 then
            table.remove(v33, v53);
            break;
        end;
    end;
    if v49 and #v33 == 0 then
        v49 = false;
        l_RunService_0:UnbindFromRenderStep("DialogPanel");
    end;
    v43();
end;
return v44;