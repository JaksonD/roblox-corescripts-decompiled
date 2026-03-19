local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfileBackground");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local l_View_0 = require(l_Parent_0.Foundation).View;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useSelectedTheme_0 = require(l_Parent_0.RoactUtils).Hooks.useSelectedTheme;
local l_getDisplayBackgroundId_0 = require(l_script_FirstAncestor_0.Common.BackgroundUtils).getDisplayBackgroundId;
local l_ErrorTypes_0 = require(l_script_FirstAncestor_0.Analytics).ErrorTypes;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local v12 = require(l_Parent_0.Promise);
local v13 = require(l_Parent_0.UIBlox);
local l_LoadableImage_0 = v13.App.Loading.LoadableImage;
local l_LoadingSpinner_0 = v13.App.Loading.LoadingSpinner;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local function _() --[[ Line: 24 ]] --[[ Name: shouldEnableAnimation ]]
    -- upvalues: l_UserInputService_0 (copy)
    return l_UserInputService_0.PreferredInput ~= Enum.PreferredInput.Touch;
end;
local v18 = Color3.fromRGB(210, 210, 210);
local v19 = Color3.fromRGB(250, 250, 250);
local v20 = CFrame.new((Vector3.new(0, 1000, 0, 0)));
local l_FFlagPPVBackgroundUse2DAsLoadingState_0 = require(l_Parent_0.SharedFlags).FFlagPPVBackgroundUse2DAsLoadingState;
local v22 = game:DefineFastFlag("PPVBackgroundEquipGearV2", false);
local v23 = game:DefineFastFlag("PPVBackgroundAddAnimation", false);
local v24 = game:DefineFastFlag("PPVBackgroundUnthrottleProfileV2", false) and game:GetEngineFeature("IsGetThrottleFramerateEnabledAvailable");
local l_FFlagPPVEnable3DBackground_0 = require(l_Parent_0.SharedFlags).FFlagPPVEnable3DBackground;
local v26 = game:DefineFastFlag("PPVBackgroundParallelAssetLoading", false);
local l_InsertService_0 = game:GetService("InsertService");
return function(v28) --[[ Line: 92 ]] --[[ Name: BackgroundDisplay ]]
    -- upvalues: l_useLocalUserId_0 (copy), l_useSelectedTheme_0 (copy), v2 (copy), v24 (copy), l_FFlagPPVEnable3DBackground_0 (copy), l_InsertService_0 (copy), l_getDisplayBackgroundId_0 (copy), v18 (copy), v19 (copy), l_RunService_0 (copy), v22 (copy), v3 (copy), l_dependencyArray_0 (copy), v26 (copy), v12 (copy), l_Players_0 (copy), v23 (copy), l_ErrorTypes_0 (copy), v20 (copy), l_UserInputService_0 (copy), l_View_0 (copy), l_FFlagPPVBackgroundUse2DAsLoadingState_0 (copy), l_LoadableImage_0 (copy), l_LoadingSpinner_0 (copy)
    local v29 = l_useLocalUserId_0();
    local v30 = v28.userId or v29 and tonumber(v29);
    local v31 = l_useSelectedTheme_0();
    local v32 = v2.useRef(nil);
    local v33 = v2.useRef(nil);
    local v34 = v2.useRef(nil);
    local v35 = v2.useRef(nil);
    local v36, v37 = v2.useState(true);
    local v38 = if v24 then v2.useRef(nil) else nil;
    if l_FFlagPPVEnable3DBackground_0 then
        v2.useEffect(function() --[[ Line: 106 ]]
            -- upvalues: v28 (copy), l_InsertService_0 (ref), l_getDisplayBackgroundId_0 (ref), v31 (copy), v33 (copy), v32 (copy), v18 (ref), v19 (ref)
            task.defer(function() --[[ Line: 108 ]]
                -- upvalues: v28 (ref), l_InsertService_0 (ref), l_getDisplayBackgroundId_0 (ref), v31 (ref), v33 (ref), v32 (ref), v18 (ref), v19 (ref)
                if not v28.currentBackgroundId then
                    return;
                else
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 113 ]]
                        -- upvalues: l_InsertService_0 (ref), l_getDisplayBackgroundId_0 (ref), v28 (ref), v31 (ref)
                        return l_InsertService_0:LoadAsset(l_getDisplayBackgroundId_0(v28.currentBackgroundId, v31));
                    end);
                    if l_status_0 and l_result_0 then
                        if v33.current then
                            for _, v42 in pairs(v33.current:GetChildren()) do
                                if v42.Name ~= "Character" then
                                    v42:Destroy();
                                end;
                            end;
                        end;
                        local l_Model_0 = Instance.new("Model");
                        l_Model_0.Name = "BackgroundModel";
                        l_Model_0.Parent = v33.current;
                        for _, v45 in pairs(l_result_0:GetChildren()) do
                            v45.Parent = l_Model_0;
                        end;
                        l_Model_0:PivotTo(CFrame.new(0, 7, -4.5));
                        l_result_0:Destroy();
                        local l_current_0 = v32.current;
                        if l_current_0 then
                            l_current_0.Ambient = v18;
                            l_current_0.LightColor = v19;
                            l_current_0.LightDirection = Vector3.new(-0.5, 0.20000000298023224, 0.20000000298023224, 0);
                        end;
                    end;
                    return;
                end;
            end);
        end, {
            v28.currentBackgroundId
        });
    end;
    if v24 then
        v2.useEffect(function() --[[ Line: 150 ]]
            -- upvalues: v38 (copy), l_RunService_0 (ref)
            v38.current = l_RunService_0:getThrottleFramerateEnabled();
            l_RunService_0:setThrottleFramerateEnabled(false);
            return function() --[[ Line: 153 ]]
                -- upvalues: l_RunService_0 (ref), v38 (ref)
                l_RunService_0:setThrottleFramerateEnabled(v38.current or true);
            end;
        end, {});
    end;
    local v56 = if v22 then v2.useCallback(function(v47, v48) --[[ Line: 160 ]]
        if not v47 or not v48 then
            return;
        else
            local l_RightHand_0 = v47:FindFirstChild("RightHand");
            if not l_RightHand_0 or not l_RightHand_0:IsA("BasePart") then
                return;
            else
                local l_RightGripAttachment_0 = l_RightHand_0:FindFirstChild("RightGripAttachment");
                if not l_RightGripAttachment_0 or not l_RightGripAttachment_0:IsA("Attachment") then
                    return;
                else
                    local l_v47_FirstChild_0 = v47:FindFirstChild("RightShoulder", true);
                    if not l_v47_FirstChild_0 or not l_v47_FirstChild_0:IsA("Motor6D") then
                        return;
                    else
                        local l_Handle_0 = v48:FindFirstChild("Handle");
                        if not l_Handle_0 or not l_Handle_0:IsA("BasePart") then
                            return;
                        else
                            for _, v54 in ipairs(v48:GetDescendants()) do
                                if v54:IsA("Script") or v54:IsA("LocalScript") then
                                    v54.Disabled = true;
                                end;
                            end;
                            v48.Parent = v47;
                            l_v47_FirstChild_0.C0 = l_v47_FirstChild_0.C0 * CFrame.Angles(1.5707963267948966, 0, 0);
                            l_Handle_0.CFrame = l_RightGripAttachment_0.WorldCFrame;
                            local l_Weld_0 = Instance.new("Weld");
                            l_Weld_0.Parent = v48;
                            l_Weld_0.Part0 = l_Handle_0;
                            l_Weld_0.Part1 = l_RightHand_0;
                            l_Weld_0.C0 = v48.Grip;
                            l_Weld_0.C1 = l_RightGripAttachment_0.CFrame;
                            return;
                        end;
                    end;
                end;
            end;
        end;
    end, {}) else nil;
    local v67 = if v22 then v2.useCallback(function(v57, v58) --[[ Line: 200 ]]
        if not v57 or not v58 then
            return;
        else
            local l_v57_FirstChild_0 = v57:FindFirstChild("Right Arm");
            if not l_v57_FirstChild_0 or not l_v57_FirstChild_0:IsA("BasePart") then
                return;
            else
                local l_RightGripAttachment_1 = l_v57_FirstChild_0:FindFirstChild("RightGripAttachment");
                if not l_RightGripAttachment_1 or not l_RightGripAttachment_1:IsA("Attachment") then
                    return;
                else
                    local l_v57_FirstChild_1 = v57:FindFirstChild("Right Shoulder", true);
                    if not l_v57_FirstChild_1 or not l_v57_FirstChild_1:IsA("Motor6D") then
                        return;
                    else
                        local l_Handle_1 = v58:FindFirstChild("Handle");
                        if not l_Handle_1 or not l_Handle_1:IsA("BasePart") then
                            return;
                        else
                            for _, v64 in ipairs(v58:GetDescendants()) do
                                if v64:IsA("Script") or v64:IsA("LocalScript") then
                                    v64.Disabled = true;
                                end;
                            end;
                            v58.Parent = v57;
                            l_v57_FirstChild_1.C0 = l_v57_FirstChild_1.C0 * CFrame.Angles(0, 0, 1.5707963267948966);
                            l_Handle_1.CFrame = l_RightGripAttachment_1.WorldCFrame;
                            local v65 = CFrame.new(0, -1, 0) * CFrame.Angles(-1.5707963267948966, 0, 0);
                            local l_Weld_1 = Instance.new("Weld");
                            l_Weld_1.Parent = v58;
                            l_Weld_1.Part0 = l_Handle_1;
                            l_Weld_1.Part1 = l_v57_FirstChild_0;
                            l_Weld_1.C0 = v58.Grip;
                            l_Weld_1.C1 = v65;
                            return;
                        end;
                    end;
                end;
            end;
        end;
    end, {}) else nil;
    local v75 = if v22 then v2.useCallback(function(v68) --[[ Line: 239 ]]
        -- upvalues: v3 (ref), l_InsertService_0 (ref)
        local v71 = v3.List.findWhere(v68.assets, function(v69, _) --[[ Line: 240 ]]
            if v69.assetType.name == "Gear" then
                return true;
            else
                return false;
            end;
        end);
        if not v71 then
            return nil;
        else
            local v72 = v68.assets[v71];
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 252 ]]
                -- upvalues: l_InsertService_0 (ref), v72 (copy)
                return l_InsertService_0:LoadAsset(v72.id):FindFirstChildOfClass("Tool");
            end);
            if not l_status_1 or not l_result_1 or not l_result_1:IsA("Tool") then
                return nil;
            else
                return l_result_1;
            end;
        end;
    end, {}) else nil;
    local v80 = if v22 then v2.useCallback(function(v76, v77) --[[ Line: 263 ]]
        -- upvalues: v75 (copy), v56 (copy), v67 (copy)
        local l_playerAvatarType_0 = v77.playerAvatarType;
        local v79 = v75(v77);
        if v79 and l_playerAvatarType_0 == "R15" then
            v56(v76, v79);
            return;
        else
            if v79 and l_playerAvatarType_0 == "R6" then
                v67(v76, v79);
            end;
            return;
        end;
    end, l_dependencyArray_0(v75, v56, v67)) else nil;
    v2.useEffect(function() --[[ Line: 274 ]]
        -- upvalues: v30 (copy), v37 (copy), v26 (ref), v12 (ref), l_Players_0 (ref), v22 (ref), v23 (ref), l_InsertService_0 (ref), v3 (ref), v28 (copy), l_ErrorTypes_0 (ref), v33 (copy), v20 (ref), v35 (copy), v56 (copy), v67 (copy), v24 (ref), l_UserInputService_0 (ref), v80 (copy)
        task.defer(function() --[[ Line: 276 ]]
            -- upvalues: v30 (ref), v37 (ref), v26 (ref), v12 (ref), l_Players_0 (ref), v22 (ref), v23 (ref), l_InsertService_0 (ref), v3 (ref), v28 (ref), l_ErrorTypes_0 (ref), v33 (ref), v20 (ref), v35 (ref), v56 (ref), v67 (ref), v24 (ref), l_UserInputService_0 (ref), v80 (ref)
            if not v30 then
                return;
            else
                v37(true);
                if v26 then
                    local v81 = v12.resolve(nil);
                    local v82 = v12.resolve(nil);
                    local v87 = v12.new(function(v83, v84) --[[ Line: 287 ]]
                        -- upvalues: l_Players_0 (ref), v30 (ref)
                        local l_status_2, l_result_2 = pcall(function() --[[ Line: 288 ]]
                            -- upvalues: l_Players_0 (ref), v30 (ref)
                            if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                                return l_Players_0:CreateHumanoidModelFromUserIdAsync(v30);
                            else
                                return game.Players:CreateHumanoidModelFromUserId(v30);
                            end;
                        end);
                        if l_status_2 and l_result_2 then
                            v83(l_result_2);
                            return;
                        else
                            v84("CharacterModelCreationFailed");
                            return;
                        end;
                    end);
                    local v100 = if not not v22 or v23 then v12.new(function(v88) --[[ Line: 303 ]]
                        -- upvalues: v30 (ref), v23 (ref), v81 (ref), v12 (ref), l_InsertService_0 (ref), v22 (ref), v3 (ref), v82 (ref)
                        local l_status_3, l_result_3 = pcall(function() --[[ Line: 304 ]]
                            -- upvalues: v30 (ref)
                            return game.Players:GetCharacterAppearanceInfoAsync(v30);
                        end);
                        if l_status_3 and l_result_3 then
                            if v23 and l_result_3.emotes and #l_result_3.emotes > 0 then
                                v81 = v12.new(function(v91) --[[ Line: 309 ]]
                                    -- upvalues: l_InsertService_0 (ref), l_result_3 (copy)
                                    local l_status_4, l_result_4 = pcall(function() --[[ Line: 310 ]]
                                        -- upvalues: l_InsertService_0 (ref), l_result_3 (ref)
                                        return (l_InsertService_0:LoadAsset(l_result_3.emotes[1].assetId):FindFirstChildOfClass("Animation"));
                                    end);
                                    v91(if l_status_4 then l_result_4 else nil);
                                end);
                            end;
                            if v22 and l_result_3.assets then
                                local v95 = v3.List.findWhere(l_result_3.assets, function(v94) --[[ Line: 319 ]]
                                    return v94.assetType.name == "Gear";
                                end);
                                if v95 then
                                    local v96 = l_result_3.assets[v95];
                                    v82 = v12.new(function(v97) --[[ Line: 324 ]]
                                        -- upvalues: l_InsertService_0 (ref), v96 (copy)
                                        local l_status_5, l_result_5 = pcall(function() --[[ Line: 325 ]]
                                            -- upvalues: l_InsertService_0 (ref), v96 (ref)
                                            return l_InsertService_0:LoadAsset(v96.id):FindFirstChildOfClass("Tool");
                                        end);
                                        v97(if l_status_5 and l_result_5 and l_result_5:IsA("Tool") then l_result_5 else nil);
                                    end);
                                end;
                            end;
                        end;
                        v88(if l_status_3 then l_result_3 else nil);
                    end) else v12.resolve(nil);
                    local v101, v102 = v12.all({
                        v87, 
                        v100:catch(function() --[[ Line: 346 ]]
                            return nil;
                        end)
                    }):await();
                    if not v101 then
                        if v28.analytics then
                            v28.analytics.fireAnalyticsEvent("EditProfileBackgroundFailure", {
                                errorType = l_ErrorTypes_0.CharacterModelCreationFailed
                            });
                        end;
                        v37(false);
                        return;
                    else
                        local v103 = v102[1];
                        local v104 = v102[2];
                        v103.Name = "Character";
                        v103.Parent = v33.current;
                        if v103.PrimaryPart then
                            v103.PrimaryPart.CFrame = v20;
                        end;
                        v35.current = v103;
                        if v22 and v104 then
                            local _, v106 = v82:await();
                            if v106 then
                                local l_playerAvatarType_1 = v104.playerAvatarType;
                                if l_playerAvatarType_1 == "R15" then
                                    v56(v103, v106);
                                elseif l_playerAvatarType_1 == "R6" then
                                    v67(v103, v106);
                                end;
                            end;
                        end;
                        local l_Humanoid_0 = v103:FindFirstChild("Humanoid");
                        if l_Humanoid_0 then
                            v12.race({
                                v12.fromEvent(l_Humanoid_0.ClusterCompositionFinished), 
                                v12.delay(3)
                            }):await();
                        end;
                        if v103.PrimaryPart then
                            v103.PrimaryPart.CFrame = CFrame.lookAt(Vector3.new(0, 0, 0, 0), (Vector3.new(0, 0, -10, 0)));
                            local v109 = v103:FindFirstChild("RightFoot") or v103:FindFirstChild("Right Leg");
                            if v109 and v109:IsA("BasePart") then
                                local v110 = v109.Position.Y - v109.Size.Y / 2;
                                local v111 = v103.PrimaryPart.Position.Y + (-3 - v110);
                                v103.PrimaryPart.CFrame = CFrame.lookAt(Vector3.new(0, v111, 0), (Vector3.new(0, 0, -10, 0)));
                            end;
                        end;
                        if v23 then
                            v37(false);
                        end;
                        if v24 or l_UserInputService_0.PreferredInput ~= Enum.PreferredInput.Touch then
                            local l_status_6, _ = pcall(function() --[[ Line: 417 ]]
                                -- upvalues: v81 (ref), v103 (copy), v23 (ref)
                                local _, v113 = v81:await();
                                local l_Animation1_0 = v103:FindFirstChild("Animate"):FindFirstChild("idle"):FindFirstChild("Animation1");
                                local l_Animator_0 = v103:FindFirstChild("Humanoid"):FindFirstChild("Animator");
                                if l_Animation1_0 and l_Animator_0 and l_Animator_0:IsA("Animator") then
                                    if v23 then
                                        local v116 = l_Animator_0:LoadAnimation(l_Animation1_0);
                                        if v113 then
                                            local v117 = l_Animator_0:LoadAnimation(v113);
                                            v117.Looped = false;
                                            v117:Play();
                                            v117.Stopped:Connect(function() --[[ Line: 433 ]]
                                                -- upvalues: v116 (copy)
                                                v116:Play();
                                            end);
                                            return;
                                        else
                                            v116:Play();
                                            return;
                                        end;
                                    else
                                        l_Animator_0:LoadAnimation(l_Animation1_0):Play();
                                    end;
                                end;
                            end);
                            if not l_status_6 and v28.analytics then
                                v28.analytics.fireAnalyticsEvent("EditProfileBackgroundFailure", {
                                    errorType = l_ErrorTypes_0.CharacterAnimationFailed
                                });
                            end;
                        end;
                        if not v23 then
                            v37(false);
                        end;
                        return;
                    end;
                else
                    local l_status_7, l_result_7 = pcall(function() --[[ Line: 457 ]]
                        -- upvalues: l_Players_0 (ref), v30 (ref)
                        if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                            return l_Players_0:CreateHumanoidModelFromUserIdAsync(v30);
                        else
                            return game.Players:CreateHumanoidModelFromUserId(v30);
                        end;
                    end);
                    if not l_status_7 or not l_result_7 then
                        if v28.analytics then
                            v28.analytics.fireAnalyticsEvent("EditProfileBackgroundFailure", {
                                errorType = l_ErrorTypes_0.CharacterModelCreationFailed
                            });
                        end;
                        v37(false);
                        return;
                    else
                        l_result_7.Name = "Character";
                        l_result_7.Parent = v33.current;
                        if l_result_7.PrimaryPart then
                            l_result_7.PrimaryPart.CFrame = v20;
                        end;
                        v35.current = l_result_7;
                        local v122 = nil;
                        local v123 = nil;
                        if v22 or v23 then
                            local l_status_8, l_result_8 = pcall(function() --[[ Line: 487 ]]
                                -- upvalues: v30 (ref)
                                return game.Players:GetCharacterAppearanceInfoAsync(v30);
                            end);
                            v122 = l_status_8;
                            v123 = l_result_8;
                        end;
                        if v22 and v122 and v123 then
                            v80(l_result_7, v123);
                        end;
                        local l_Humanoid_1 = l_result_7:FindFirstChild("Humanoid");
                        if l_Humanoid_1 then
                            v12.race({
                                v12.fromEvent(l_Humanoid_1.ClusterCompositionFinished), 
                                v12.delay(3)
                            }):await();
                        end;
                        if l_result_7.PrimaryPart then
                            l_result_7.PrimaryPart.CFrame = CFrame.lookAt(Vector3.new(0, 0, 0, 0), (Vector3.new(0, 0, -10, 0)));
                            local v127 = l_result_7:FindFirstChild("RightFoot") or l_result_7:FindFirstChild("Right Leg");
                            if v127 and v127:IsA("BasePart") then
                                local v128 = v127.Position.Y - v127.Size.Y / 2;
                                local v129 = l_result_7.PrimaryPart.Position.Y + (-3 - v128);
                                l_result_7.PrimaryPart.CFrame = CFrame.lookAt(Vector3.new(0, v129, 0), (Vector3.new(0, 0, -10, 0)));
                            end;
                        end;
                        if v23 then
                            v37(false);
                        end;
                        if v24 or l_UserInputService_0.PreferredInput ~= Enum.PreferredInput.Touch then
                            local l_status_10, _ = pcall(function() --[[ Line: 530 ]]
                                -- upvalues: v23 (ref), v122 (ref), v123 (ref), l_InsertService_0 (ref), l_result_7 (copy)
                                local v130 = nil;
                                local v131 = nil;
                                if v23 and v122 and v123 then
                                    local l_emotes_0 = v123.emotes;
                                    local l_l_emotes_0_0 = l_emotes_0 --[[ copy: 2 -> 6 ]];
                                    local l_status_9, l_result_9 = pcall(function() --[[ Line: 534 ]]
                                        -- upvalues: l_l_emotes_0_0 (copy), l_InsertService_0 (ref)
                                        if not l_l_emotes_0_0 or #l_l_emotes_0_0 == 0 then
                                            return;
                                        else
                                            return (l_InsertService_0:LoadAsset(l_l_emotes_0_0[1].assetId):FindFirstChildOfClass("Animation"));
                                        end;
                                    end);
                                    v130 = l_status_9;
                                    v131 = l_result_9;
                                end;
                                local l_Animation1_1 = l_result_7:FindFirstChild("Animate"):FindFirstChild("idle"):FindFirstChild("Animation1");
                                local l_Animator_1 = l_result_7:FindFirstChild("Humanoid"):FindFirstChild("Animator");
                                if l_Animation1_1 and l_Animator_1 and l_Animator_1:IsA("Animator") then
                                    if v23 then
                                        local v138 = l_Animator_1:LoadAnimation(l_Animation1_1);
                                        if v130 and v131 then
                                            local v139 = l_Animator_1:LoadAnimation(v131);
                                            v139.Looped = false;
                                            v139:Play();
                                            v139.Stopped:Connect(function() --[[ Line: 555 ]]
                                                -- upvalues: v138 (copy)
                                                v138:Play();
                                            end);
                                            return;
                                        else
                                            v138:Play();
                                            return;
                                        end;
                                    else
                                        l_Animator_1:LoadAnimation(l_Animation1_1):Play();
                                    end;
                                end;
                            end);
                            if not l_status_10 and v28.analytics then
                                v28.analytics.fireAnalyticsEvent("EditProfileBackgroundFailure", {
                                    errorType = l_ErrorTypes_0.CharacterAnimationFailed
                                });
                            end;
                        end;
                        if not v23 then
                            v37(false);
                        end;
                        return;
                    end;
                end;
            end;
        end);
    end, {
        v30
    });
    v2.useEffect(function() --[[ Line: 583 ]]
        -- upvalues: v32 (copy), v34 (copy)
        if v32.current and v34.current then
            v32.current.CurrentCamera = v34.current;
        end;
    end);
    return v2.createElement(l_View_0, {
        Size = UDim2.new(1, 0, 0, v28.height), 
        ZIndex = 2
    }, {
        Background = v2.createElement("ViewportFrame", {
            Size = UDim2.fromScale(1, 1), 
            ref = v32, 
            Ambient = v18, 
            LightColor = v19, 
            BackgroundTransparency = 1
        }, {
            WorldModel = v2.createElement("WorldModel", {
                ref = v33
            }), 
            Camera = v2.createElement("Camera", {
                CameraType = Enum.CameraType.Scriptable, 
                CFrame = CFrame.lookAt(Vector3.new(0, 0, -8, 0), (Vector3.new(0, 1, 10, 0))), 
                ref = v34
            })
        }), 
        LoadingFrame = v36 and v2.createElement(l_View_0, {
            tag = "size-full-full", 
            ZIndex = 2
        }, {
            if l_FFlagPPVBackgroundUse2DAsLoadingState_0 then v2.createElement(l_LoadableImage_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, v26 and -24 or 48), 
                Size = UDim2.new(1, v26 and -48 or 48, 1, v26 and -48 or 48), 
                ScaleType = Enum.ScaleType.Fit, 
                BackgroundTransparency = 1, 
                Image = v28.userThumbnail, 
                useShimmerAnimationWhileLoading = true, 
                ZIndex = 2
            }) else v2.createElement(l_LoadingSpinner_0, {
                size = UDim2.fromOffset(48, 48), 
                position = UDim2.fromScale(0.5, 0.5), 
                anchorPoint = Vector2.new(0.5, 0.5)
            })
        })
    });
end;