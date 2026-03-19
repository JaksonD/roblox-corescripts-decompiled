local l_script_FirstAncestor_0 = script:FindFirstAncestor("TnSAvatarIdentification");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Flags.GetFFlagReportAnythingFixConvexHullCalculation);
local l_GetFFlagAvatarIdentificationSafeAreaFix_0 = require(l_Parent_0.SharedFlags).GetFFlagAvatarIdentificationSafeAreaFix;
local v4 = nil;
if l_GetFFlagAvatarIdentificationSafeAreaFix_0() then
    v4 = game:GetService("CoreGui");
end;
local function v10() --[[ Line: 24 ]] --[[ Name: getViewportInfo ]]
    -- upvalues: v4 (ref)
    assert(v4, "getViewportInfo requires CoreGui to be available");
    local l__FullscreenTestGui_AvatarID_0 = v4:FindFirstChild("_FullscreenTestGui_AvatarID");
    if not l__FullscreenTestGui_AvatarID_0 then
        l__FullscreenTestGui_AvatarID_0 = Instance.new("ScreenGui");
        l__FullscreenTestGui_AvatarID_0.Name = "_FullscreenTestGui_AvatarID";
        l__FullscreenTestGui_AvatarID_0.Parent = v4;
        l__FullscreenTestGui_AvatarID_0.ScreenInsets = Enum.ScreenInsets.None;
    end;
    local l__DeviceTestGui_AvatarID_0 = v4:FindFirstChild("_DeviceTestGui_AvatarID");
    if not l__DeviceTestGui_AvatarID_0 then
        l__DeviceTestGui_AvatarID_0 = Instance.new("ScreenGui");
        l__DeviceTestGui_AvatarID_0.Name = "_DeviceTestGui_AvatarID";
        l__DeviceTestGui_AvatarID_0.Parent = v4;
        l__DeviceTestGui_AvatarID_0.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets;
    end;
    local v7 = l__DeviceTestGui_AvatarID_0.AbsolutePosition - l__FullscreenTestGui_AvatarID_0.AbsolutePosition;
    local v8 = l__FullscreenTestGui_AvatarID_0.AbsolutePosition + l__FullscreenTestGui_AvatarID_0.AbsoluteSize - (l__DeviceTestGui_AvatarID_0.AbsolutePosition + l__DeviceTestGui_AvatarID_0.AbsoluteSize);
    local v9 = {
        left = v7.X, 
        top = v7.Y, 
        right = v8.X, 
        bottom = v8.Y
    };
    return {
        width = l__FullscreenTestGui_AvatarID_0.AbsoluteSize.X, 
        height = l__FullscreenTestGui_AvatarID_0.AbsoluteSize.Y, 
        insets = v9
    };
end;
local v11 = Vector2.new(0, 0);
local v12 = Vector2.new(1e999, 1e999);
local function _(v13) --[[ Line: 59 ]]
    local v14 = true;
    if v13.Y >= 0 then
        v14 = true;
        if v13.Y <= 1 then
            v14 = true;
            if v13.X >= 0 then
                v14 = v13.X > 1;
            end;
        end;
    end;
    return v14;
end;
worldToFullViewportPointNormalized = function(v16, v17, v18) --[[ Line: 63 ]] --[[ Name: worldToFullViewportPointNormalized ]]
    local v19, _ = v17:WorldToViewportPoint(v16);
    local v21 = Vector2.new((v19.X + v18.insets.left) / v18.width, (v19.Y + v18.insets.top) / v18.height);
    local l_v21_0 = v21;
    local l_Z_0 = v19.Z;
    local v24 = true;
    if v21.Y >= 0 then
        v24 = true;
        if v21.Y <= 1 then
            v24 = true;
            if v21.X >= 0 then
                v24 = v21.X > 1;
            end;
        end;
    end;
    return l_v21_0, l_Z_0, not v24 and v19.Z > 0;
end;
getViewportCorners = function(v25, v26, v27) --[[ Line: 80 ]] --[[ Name: getViewportCorners ]]
    -- upvalues: v12 (copy), v11 (copy), l_GetFFlagAvatarIdentificationSafeAreaFix_0 (copy), v2 (copy)
    local l_v12_0 = v12;
    local l_v11_0 = v11;
    local l_ViewportSize_0 = v26.ViewportSize;
    local v31 = 0;
    for v32, v33 in ipairs(v25) do
        local v34 = nil;
        local v35 = nil;
        local v36 = nil;
        if l_GetFFlagAvatarIdentificationSafeAreaFix_0() then
            assert(v27, "getViewportCorners requires viewportInfo when FFlagAvatarIdentificationSafeAreaFix is enabled");
            local v37, v38, v39 = worldToFullViewportPointNormalized(v33, v26, v27);
            v34 = v37;
            v32 = v38;
            v36 = v39;
        else
            local v40, v41 = v26:WorldToViewportPoint(v33);
            v35 = v40;
            v36 = v41;
            v34 = Vector2.new(v35.X / l_ViewportSize_0.X, v35.Y / l_ViewportSize_0.Y);
        end;
        if not v36 then
            v34 = Vector2.new(math.clamp(v34.X, 0, 1), (math.clamp(v34.Y, 0, 1)));
        end;
        if v2() then
            if v36 then
                v31 = v31 + 1;
            end;
        else
            v31 = v31 + 1;
        end;
        l_v12_0 = l_v12_0:Min(v34);
        l_v11_0 = l_v11_0:Max(v34);
    end;
    if v31 <= 2 then
        return v12, v11;
    else
        return l_v12_0, l_v11_0;
    end;
end;
shouldIgnoreLocalCharacter = function(v42) --[[ Line: 125 ]] --[[ Name: shouldIgnoreLocalCharacter ]]
    local l_Head_0 = v42:FindFirstChild("Head");
    if l_Head_0 and l_Head_0:IsA("BasePart") then
        return l_Head_0.LocalTransparencyModifier >= 0.95;
    else
        return false;
    end;
end;
getLocalCharacterPosition = function(v44) --[[ Line: 134 ]] --[[ Name: getLocalCharacterPosition ]]
    local l_HumanoidRootPart_0 = v44:FindFirstChild("HumanoidRootPart");
    if not l_HumanoidRootPart_0 then
        return nil;
    else
        return l_HumanoidRootPart_0.Position;
    end;
end;
return {
    getViewportInfo = v10, 
    getViewportCorners = getViewportCorners, 
    worldToFullViewportPointNormalized = worldToFullViewportPointNormalized, 
    shouldIgnoreLocalCharacter = shouldIgnoreLocalCharacter, 
    getLocalCharacterPosition = getLocalCharacterPosition, 
    defaultMin = v12
};