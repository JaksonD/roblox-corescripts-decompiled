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
local v22 = game:DefineFastFlag("PPVBackgroundUnthrottleProfileV2", false) and game:GetEngineFeature("IsGetThrottleFramerateEnabledAvailable");
local l_FFlagPPVEnable3DBackground_0 = require(l_Parent_0.SharedFlags).FFlagPPVEnable3DBackground;
local v24 = game:DefineFastFlag("PPVBackgroundParallelAssetLoading", false);
local l_FFlagPPVBackgroundPrefetchAvatar_0 = require(l_Parent_0.SharedFlags).FFlagPPVBackgroundPrefetchAvatar;
local v26 = if l_FFlagPPVBackgroundPrefetchAvatar_0 then require(l_script_FirstAncestor_0.Common.AvatarModelPrefetch) else nil;
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v28 = game:DefineFastFlag("DisplayBackgroundUseToolAnimation", false);
local l_InsertService_0 = game:GetService("InsertService");
local function v37(v30) --[[ Line: 99 ]] --[[ Name: playToolAnimation ]]
    local l_Animate_0 = v30:FindFirstChild("Animate");
    assert(l_Animate_0 ~= nil, "Expected animate to always exist");
    local l_toolnone_0 = l_Animate_0:FindFirstChild("toolnone");
    assert(l_toolnone_0 ~= nil, "Expected tool animation to always exist");
    local v33 = l_toolnone_0:GetChildren()[1];
    if v33 == nil then
        return;
    else
        assert(v33:IsA("Animation"), "Unexpected type for tool animation");
        local l_Humanoid_0 = v30:FindFirstChild("Humanoid");
        assert(l_Humanoid_0 ~= nil, "Expected humanoid to always exist");
        local l_Animator_0 = l_Humanoid_0:FindFirstChild("Animator");
        assert(l_Animator_0 ~= nil, "Expected Animator to always exist");
        assert(l_Animator_0:IsA("Animator"), "Animator should be of type Animator");
        local v36 = l_Animator_0:LoadAnimation(v33);
        v36.Looped = true;
        v36:Play();
        return;
    end;
end;
return function(v38) --[[ Line: 125 ]] --[[ Name: BackgroundDisplay ]]
    -- upvalues: l_useLocalUserId_0 (copy), l_useSelectedTheme_0 (copy), v2 (copy), v22 (copy), l_FFlagPPVEnable3DBackground_0 (copy), l_InsertService_0 (copy), l_getDisplayBackgroundId_0 (copy), v18 (copy), v19 (copy), l_RunService_0 (copy), v28 (copy), v37 (copy), v3 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v24 (copy), v12 (copy), l_FFlagPPVBackgroundPrefetchAvatar_0 (copy), v26 (copy), l_Players_0 (copy), l_ErrorTypes_0 (copy), v20 (copy), l_UserInputService_0 (copy), l_View_0 (copy), l_FFlagPPVBackgroundUse2DAsLoadingState_0 (copy), l_LoadableImage_0 (copy), l_LoadingSpinner_0 (copy)
    local v39 = l_useLocalUserId_0();
    local v40 = v38.userId or v39 and tonumber(v39);
    local v41 = l_useSelectedTheme_0();
    local v42 = v2.useRef(nil);
    local v43 = v2.useRef(nil);
    local v44 = v2.useRef(nil);
    local v45 = v2.useRef(nil);
    local v46, v47 = v2.useState(true);
    local v48 = if v22 then v2.useRef(nil) else nil;
    if l_FFlagPPVEnable3DBackground_0 then
        v2.useEffect(function() --[[ Line: 139 ]]
            -- upvalues: v38 (copy), l_InsertService_0 (ref), l_getDisplayBackgroundId_0 (ref), v41 (copy), v43 (copy), v42 (copy), v18 (ref), v19 (ref)
            task.defer(function() --[[ Line: 141 ]]
                -- upvalues: v38 (ref), l_InsertService_0 (ref), l_getDisplayBackgroundId_0 (ref), v41 (ref), v43 (ref), v42 (ref), v18 (ref), v19 (ref)
                if not v38.currentBackgroundId then
                    return;
                else
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 146 ]]
                        -- upvalues: l_InsertService_0 (ref), l_getDisplayBackgroundId_0 (ref), v38 (ref), v41 (ref)
                        return l_InsertService_0:LoadAsset(l_getDisplayBackgroundId_0(v38.currentBackgroundId, v41));
                    end);
                    if l_status_0 and l_result_0 then
                        if v43.current then
                            for _, v52 in pairs(v43.current:GetChildren()) do
                                if v52.Name ~= "Character" then
                                    v52:Destroy();
                                end;
                            end;
                        end;
                        local l_Model_0 = Instance.new("Model");
                        l_Model_0.Name = "BackgroundModel";
                        l_Model_0.Parent = v43.current;
                        for _, v55 in pairs(l_result_0:GetChildren()) do
                            v55.Parent = l_Model_0;
                        end;
                        l_Model_0:PivotTo(CFrame.new(0, 7, -4.5));
                        l_result_0:Destroy();
                        local l_current_0 = v42.current;
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
            v38.currentBackgroundId
        });
    end;
    if v22 then
        v2.useEffect(function() --[[ Line: 183 ]]
            -- upvalues: v48 (copy), l_RunService_0 (ref)
            v48.current = l_RunService_0:getThrottleFramerateEnabled();
            l_RunService_0:setThrottleFramerateEnabled(false);
            return function() --[[ Line: 186 ]]
                -- upvalues: l_RunService_0 (ref), v48 (ref)
                l_RunService_0:setThrottleFramerateEnabled(v48.current or true);
            end;
        end, {});
    end;
    local v66 = v2.useCallback(function(v57, v58) --[[ Line: 192 ]]
        -- upvalues: v28 (ref), v37 (ref)
        if not v57 or not v58 then
            return;
        else
            local l_RightHand_0 = v57:FindFirstChild("RightHand");
            if not l_RightHand_0 or not l_RightHand_0:IsA("BasePart") then
                return;
            else
                local l_RightGripAttachment_0 = l_RightHand_0:FindFirstChild("RightGripAttachment");
                if not l_RightGripAttachment_0 or not l_RightGripAttachment_0:IsA("Attachment") then
                    return;
                else
                    local v61 = nil;
                    if not v28 then
                        v61 = v57:FindFirstChild("RightShoulder", true);
                        if not v61 or not v61:IsA("Motor6D") then
                            return;
                        end;
                    end;
                    local l_Handle_0 = v58:FindFirstChild("Handle");
                    if not l_Handle_0 or not l_Handle_0:IsA("BasePart") then
                        return;
                    else
                        for _, v64 in ipairs(v58:GetDescendants()) do
                            if v64:IsA("Script") or v64:IsA("LocalScript") then
                                v64.Disabled = true;
                            end;
                        end;
                        v58.Parent = v57;
                        if v28 then
                            v37(v57);
                        else
                            v61.C0 = v61.C0 * CFrame.Angles(1.5707963267948966, 0, 0);
                        end;
                        l_Handle_0.CFrame = l_RightGripAttachment_0.WorldCFrame;
                        local l_Weld_0 = Instance.new("Weld");
                        l_Weld_0.Parent = v58;
                        l_Weld_0.Part0 = l_Handle_0;
                        l_Weld_0.Part1 = l_RightHand_0;
                        l_Weld_0.C0 = v58.Grip;
                        l_Weld_0.C1 = l_RightGripAttachment_0.CFrame;
                        return;
                    end;
                end;
            end;
        end;
    end, {});
    local v77 = v2.useCallback(function(v67, v68) --[[ Line: 242 ]]
        if not v67 or not v68 then
            return;
        else
            local l_v67_FirstChild_0 = v67:FindFirstChild("Right Arm");
            if not l_v67_FirstChild_0 or not l_v67_FirstChild_0:IsA("BasePart") then
                return;
            else
                local l_RightGripAttachment_1 = l_v67_FirstChild_0:FindFirstChild("RightGripAttachment");
                if not l_RightGripAttachment_1 or not l_RightGripAttachment_1:IsA("Attachment") then
                    return;
                else
                    local l_v67_FirstChild_1 = v67:FindFirstChild("Right Shoulder", true);
                    if not l_v67_FirstChild_1 or not l_v67_FirstChild_1:IsA("Motor6D") then
                        return;
                    else
                        local l_Handle_1 = v68:FindFirstChild("Handle");
                        if not l_Handle_1 or not l_Handle_1:IsA("BasePart") then
                            return;
                        else
                            for _, v74 in ipairs(v68:GetDescendants()) do
                                if v74:IsA("Script") or v74:IsA("LocalScript") then
                                    v74.Disabled = true;
                                end;
                            end;
                            v68.Parent = v67;
                            l_v67_FirstChild_1.C0 = l_v67_FirstChild_1.C0 * CFrame.Angles(0, 0, 1.5707963267948966);
                            l_Handle_1.CFrame = l_RightGripAttachment_1.WorldCFrame;
                            local v75 = CFrame.new(0, -1, 0) * CFrame.Angles(-1.5707963267948966, 0, 0);
                            local l_Weld_1 = Instance.new("Weld");
                            l_Weld_1.Parent = v68;
                            l_Weld_1.Part0 = l_Handle_1;
                            l_Weld_1.Part1 = l_v67_FirstChild_0;
                            l_Weld_1.C0 = v68.Grip;
                            l_Weld_1.C1 = v75;
                            return;
                        end;
                    end;
                end;
            end;
        end;
    end, {});
    local v85 = v2.useCallback(function(v78) --[[ Line: 279 ]]
        -- upvalues: v3 (ref), l_InsertService_0 (ref)
        local v81 = v3.List.findWhere(v78.assets, function(v79, _) --[[ Line: 280 ]]
            if v79.assetType.name == "Gear" then
                return true;
            else
                return false;
            end;
        end);
        if not v81 then
            return nil;
        else
            local v82 = v78.assets[v81];
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 292 ]]
                -- upvalues: l_InsertService_0 (ref), v82 (copy)
                return l_InsertService_0:LoadAsset(v82.id):FindFirstChildOfClass("Tool");
            end);
            if not l_status_1 or not l_result_1 or not l_result_1:IsA("Tool") then
                return nil;
            else
                return l_result_1;
            end;
        end;
    end, {});
    local v90 = v2.useCallback(function(v86, v87) --[[ Line: 302 ]]
        -- upvalues: v85 (copy), v66 (copy), v77 (copy)
        local l_playerAvatarType_0 = v87.playerAvatarType;
        local v89 = v85(v87);
        if v89 and l_playerAvatarType_0 == "R15" then
            v66(v86, v89);
            return;
        else
            if v89 and l_playerAvatarType_0 == "R6" then
                v77(v86, v89);
            end;
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v85, 
        v66, 
        v77
    } else l_dependencyArray_0(v85, v66, v77));
    v2.useEffect(function() --[[ Line: 316 ]]
        -- upvalues: v40 (copy), v47 (copy), v24 (ref), v12 (ref), l_FFlagPPVBackgroundPrefetchAvatar_0 (ref), v26 (ref), l_Players_0 (ref), l_InsertService_0 (ref), v3 (ref), v38 (copy), l_ErrorTypes_0 (ref), v43 (copy), v20 (ref), v45 (copy), v66 (copy), v77 (copy), v22 (ref), l_UserInputService_0 (ref), v90 (copy)
        task.defer(function() --[[ Line: 318 ]]
            -- upvalues: v40 (ref), v47 (ref), v24 (ref), v12 (ref), l_FFlagPPVBackgroundPrefetchAvatar_0 (ref), v26 (ref), l_Players_0 (ref), l_InsertService_0 (ref), v3 (ref), v38 (ref), l_ErrorTypes_0 (ref), v43 (ref), v20 (ref), v45 (ref), v66 (ref), v77 (ref), v22 (ref), l_UserInputService_0 (ref), v90 (ref)
            if not v40 then
                return;
            else
                v47(true);
                if v24 then
                    local v91 = v12.resolve(nil);
                    local v92 = v12.resolve(nil);
                    local v97 = if l_FFlagPPVBackgroundPrefetchAvatar_0 then v26.get(v40) else v12.new(function(v93, v94) --[[ Line: 331 ]]
                        -- upvalues: l_Players_0 (ref), v40 (ref)
                        local l_status_2, l_result_2 = pcall(function() --[[ Line: 332 ]]
                            -- upvalues: l_Players_0 (ref), v40 (ref)
                            if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                                return l_Players_0:CreateHumanoidModelFromUserIdAsync(v40);
                            else
                                return game.Players:CreateHumanoidModelFromUserId(v40);
                            end;
                        end);
                        if l_status_2 and l_result_2 then
                            v93(l_result_2);
                            return;
                        else
                            v94("CharacterModelCreationFailed");
                            return;
                        end;
                    end);
                    local v110 = v12.new(function(v98) --[[ Line: 346 ]]
                        -- upvalues: v40 (ref), v91 (ref), v12 (ref), l_InsertService_0 (ref), v3 (ref), v92 (ref)
                        local l_status_3, l_result_3 = pcall(function() --[[ Line: 347 ]]
                            -- upvalues: v40 (ref)
                            return game.Players:GetCharacterAppearanceInfoAsync(v40);
                        end);
                        if l_status_3 and l_result_3 then
                            if l_result_3.emotes and #l_result_3.emotes > 0 then
                                v91 = v12.new(function(v101) --[[ Line: 352 ]]
                                    -- upvalues: l_InsertService_0 (ref), l_result_3 (copy)
                                    local l_status_4, l_result_4 = pcall(function() --[[ Line: 353 ]]
                                        -- upvalues: l_InsertService_0 (ref), l_result_3 (ref)
                                        return (l_InsertService_0:LoadAsset(l_result_3.emotes[1].assetId):FindFirstChildOfClass("Animation"));
                                    end);
                                    v101(if l_status_4 then l_result_4 else nil);
                                end);
                            end;
                            if l_result_3.assets then
                                local v105 = v3.List.findWhere(l_result_3.assets, function(v104) --[[ Line: 362 ]]
                                    return v104.assetType.name == "Gear";
                                end);
                                if v105 then
                                    local v106 = l_result_3.assets[v105];
                                    v92 = v12.new(function(v107) --[[ Line: 367 ]]
                                        -- upvalues: l_InsertService_0 (ref), v106 (copy)
                                        local l_status_5, l_result_5 = pcall(function() --[[ Line: 368 ]]
                                            -- upvalues: l_InsertService_0 (ref), v106 (ref)
                                            return l_InsertService_0:LoadAsset(v106.id):FindFirstChildOfClass("Tool");
                                        end);
                                        v107(if l_status_5 and l_result_5 and l_result_5:IsA("Tool") then l_result_5 else nil);
                                    end);
                                end;
                            end;
                        end;
                        v98(if l_status_3 then l_result_3 else nil);
                    end);
                    local v111, v112 = v12.all({
                        v97, 
                        v110:catch(function() --[[ Line: 388 ]]
                            return nil;
                        end)
                    }):await();
                    if not v111 then
                        if v38.analytics then
                            v38.analytics.fireAnalyticsEvent("EditProfileBackgroundFailure", {
                                errorType = l_ErrorTypes_0.CharacterModelCreationFailed
                            });
                        end;
                        v47(false);
                        return;
                    else
                        local v113 = v112[1];
                        local v114 = v112[2];
                        if l_FFlagPPVBackgroundPrefetchAvatar_0 then
                            v26.clear(v40);
                        end;
                        v113.Name = "Character";
                        v113.Parent = v43.current;
                        if v113.PrimaryPart then
                            v113.PrimaryPart.CFrame = v20;
                        end;
                        v45.current = v113;
                        if v114 then
                            local _, v116 = v92:await();
                            if v116 then
                                local l_playerAvatarType_1 = v114.playerAvatarType;
                                if l_playerAvatarType_1 == "R15" then
                                    v66(v113, v116);
                                elseif l_playerAvatarType_1 == "R6" then
                                    v77(v113, v116);
                                end;
                            end;
                        end;
                        local l_Humanoid_1 = v113:FindFirstChild("Humanoid");
                        if l_Humanoid_1 then
                            v12.race({
                                v12.fromEvent(l_Humanoid_1.ClusterCompositionFinished), 
                                v12.delay(3)
                            }):await();
                        end;
                        if v113.PrimaryPart then
                            v113.PrimaryPart.CFrame = CFrame.lookAt(Vector3.new(0, 0, 0, 0), (Vector3.new(0, 0, -10, 0)));
                            local v119 = v113:FindFirstChild("RightFoot") or v113:FindFirstChild("Right Leg");
                            if v119 and v119:IsA("BasePart") then
                                local v120 = v119.Position.Y - v119.Size.Y / 2;
                                local v121 = v113.PrimaryPart.Position.Y + (-3 - v120);
                                v113.PrimaryPart.CFrame = CFrame.lookAt(Vector3.new(0, v121, 0), (Vector3.new(0, 0, -10, 0)));
                            end;
                        end;
                        v47(false);
                        if v22 or l_UserInputService_0.PreferredInput ~= Enum.PreferredInput.Touch then
                            local l_status_6, _ = pcall(function() --[[ Line: 460 ]]
                                -- upvalues: v91 (ref), v113 (copy)
                                local _, v123 = v91:await();
                                local l_Animation1_0 = v113:FindFirstChild("Animate"):FindFirstChild("idle"):FindFirstChild("Animation1");
                                local l_Animator_1 = v113:FindFirstChild("Humanoid"):FindFirstChild("Animator");
                                if l_Animation1_0 and l_Animator_1 and l_Animator_1:IsA("Animator") then
                                    local v126 = l_Animator_1:LoadAnimation(l_Animation1_0);
                                    if v123 then
                                        local v127 = l_Animator_1:LoadAnimation(v123);
                                        v127.Looped = false;
                                        v127:Play();
                                        v127.Stopped:Connect(function() --[[ Line: 475 ]]
                                            -- upvalues: v126 (copy)
                                            v126:Play();
                                        end);
                                        return;
                                    else
                                        v126:Play();
                                    end;
                                end;
                            end);
                            if not l_status_6 and v38.analytics then
                                v38.analytics.fireAnalyticsEvent("EditProfileBackgroundFailure", {
                                    errorType = l_ErrorTypes_0.CharacterAnimationFailed
                                });
                            end;
                        end;
                        return;
                    end;
                else
                    local v130 = nil;
                    local v131 = nil;
                    if l_FFlagPPVBackgroundPrefetchAvatar_0 then
                        local v132, v133 = v26.get(v40):await();
                        v130 = v132;
                        v131 = v133;
                        v26.clear(v40);
                    else
                        local l_status_7, l_result_7 = pcall(function() --[[ Line: 498 ]]
                            -- upvalues: l_Players_0 (ref), v40 (ref)
                            if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                                return l_Players_0:CreateHumanoidModelFromUserIdAsync(v40);
                            else
                                return game.Players:CreateHumanoidModelFromUserId(v40);
                            end;
                        end);
                        v130 = l_status_7;
                        v131 = l_result_7;
                    end;
                    if not v130 or not v131 then
                        if v38.analytics then
                            v38.analytics.fireAnalyticsEvent("EditProfileBackgroundFailure", {
                                errorType = l_ErrorTypes_0.CharacterModelCreationFailed
                            });
                        end;
                        v47(false);
                        return;
                    else
                        v131.Name = "Character";
                        v131.Parent = v43.current;
                        if v131.PrimaryPart then
                            v131.PrimaryPart.CFrame = v20;
                        end;
                        v45.current = v131;
                        local v136 = nil;
                        local v137 = nil;
                        local l_status_8, l_result_8 = pcall(function() --[[ Line: 528 ]]
                            -- upvalues: v40 (ref)
                            return game.Players:GetCharacterAppearanceInfoAsync(v40);
                        end);
                        v136 = l_status_8;
                        v137 = l_result_8;
                        if v136 and v137 then
                            v90(v131, v137);
                        end;
                        l_status_8 = v131:FindFirstChild("Humanoid");
                        if l_status_8 then
                            v12.race({
                                v12.fromEvent(l_status_8.ClusterCompositionFinished), 
                                v12.delay(3)
                            }):await();
                        end;
                        if v131.PrimaryPart then
                            v131.PrimaryPart.CFrame = CFrame.lookAt(Vector3.new(0, 0, 0, 0), (Vector3.new(0, 0, -10, 0)));
                            l_result_8 = v131:FindFirstChild("RightFoot") or v131:FindFirstChild("Right Leg");
                            if l_result_8 and l_result_8:IsA("BasePart") then
                                local v140 = l_result_8.Position.Y - l_result_8.Size.Y / 2;
                                local v141 = v131.PrimaryPart.Position.Y + (-3 - v140);
                                v131.PrimaryPart.CFrame = CFrame.lookAt(Vector3.new(0, v141, 0), (Vector3.new(0, 0, -10, 0)));
                            end;
                        end;
                        v47(false);
                        if v22 or l_UserInputService_0.PreferredInput ~= Enum.PreferredInput.Touch then
                            local v142;
                            l_result_8, v142 = pcall(function() --[[ Line: 564 ]]
                                -- upvalues: v136 (ref), v137 (ref), l_InsertService_0 (ref), v131 (ref)
                                local v143 = nil;
                                local v144 = nil;
                                if v136 and v137 then
                                    local l_emotes_0 = v137.emotes;
                                    local l_l_emotes_0_0 = l_emotes_0 --[[ copy: 2 -> 6 ]];
                                    local l_status_9, l_result_9 = pcall(function() --[[ Line: 568 ]]
                                        -- upvalues: l_l_emotes_0_0 (copy), l_InsertService_0 (ref)
                                        if not l_l_emotes_0_0 or #l_l_emotes_0_0 == 0 then
                                            return;
                                        else
                                            return (l_InsertService_0:LoadAsset(l_l_emotes_0_0[1].assetId):FindFirstChildOfClass("Animation"));
                                        end;
                                    end);
                                    v143 = l_status_9;
                                    v144 = l_result_9;
                                end;
                                local l_Animation1_1 = v131:FindFirstChild("Animate"):FindFirstChild("idle"):FindFirstChild("Animation1");
                                local l_Animator_2 = v131:FindFirstChild("Humanoid"):FindFirstChild("Animator");
                                if l_Animation1_1 and l_Animator_2 and l_Animator_2:IsA("Animator") then
                                    local v151 = l_Animator_2:LoadAnimation(l_Animation1_1);
                                    if v143 and v144 then
                                        local v152 = l_Animator_2:LoadAnimation(v144);
                                        v152.Looped = false;
                                        v152:Play();
                                        v152.Stopped:Connect(function() --[[ Line: 588 ]]
                                            -- upvalues: v151 (copy)
                                            v151:Play();
                                        end);
                                        return;
                                    else
                                        v151:Play();
                                    end;
                                end;
                            end);
                            if not l_result_8 and v38.analytics then
                                v38.analytics.fireAnalyticsEvent("EditProfileBackgroundFailure", {
                                    errorType = l_ErrorTypes_0.CharacterAnimationFailed
                                });
                            end;
                        end;
                        return;
                    end;
                end;
            end;
        end);
    end, {
        v40
    });
    v2.useEffect(function() --[[ Line: 610 ]]
        -- upvalues: v42 (copy), v44 (copy)
        if v42.current and v44.current then
            v42.current.CurrentCamera = v44.current;
        end;
    end);
    return v2.createElement(l_View_0, {
        Size = UDim2.new(1, 0, 0, v38.height), 
        ZIndex = 2
    }, {
        Background = v2.createElement("ViewportFrame", {
            Size = UDim2.fromScale(1, 1), 
            ref = v42, 
            Ambient = v18, 
            LightColor = v19, 
            BackgroundTransparency = 1
        }, {
            WorldModel = v2.createElement("WorldModel", {
                ref = v43
            }), 
            Camera = v2.createElement("Camera", {
                CameraType = Enum.CameraType.Scriptable, 
                CFrame = CFrame.lookAt(Vector3.new(0, 0, -8, 0), (Vector3.new(0, 1, 10, 0))), 
                ref = v44
            })
        }), 
        LoadingFrame = v46 and v2.createElement(l_View_0, {
            tag = "size-full-full", 
            ZIndex = 2
        }, {
            if l_FFlagPPVBackgroundUse2DAsLoadingState_0 then v2.createElement(l_LoadableImage_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, v24 and -24 or 48), 
                Size = UDim2.new(1, v24 and -48 or 48, 1, v24 and -48 or 48), 
                ScaleType = Enum.ScaleType.Fit, 
                BackgroundTransparency = 1, 
                Image = v38.userThumbnail, 
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