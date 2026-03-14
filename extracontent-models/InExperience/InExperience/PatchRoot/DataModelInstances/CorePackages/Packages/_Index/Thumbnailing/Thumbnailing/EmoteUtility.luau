local l_AnimationClipProvider_0 = game:GetService("AnimationClipProvider");
local l_InsertService_0 = game:GetService("InsertService");
local v2 = game:DefineFastString("EmoteUtilityFallbackKeyframeSequenceAssetId", "10921261056");
local v3 = game:DefineFastFlag("FixKeyframeGeneration", false);
local v4 = game:DefineFastFlag("EmoteUtilityDefaultMoodFromCharacter", false);
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v6 = {
    FallbackKeyframeSequenceAssetId = v2, 
    debugLoadAssetsFromFiles = false, 
    mapAssetIdToFileName = nil, 
    FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL = "http://www.roblox.com/asset/?id=" .. v2
};
local v7 = {};
local function _() --[[ Line: 70 ]] --[[ Name: clearJointBlacklist ]]
    -- upvalues: v7 (ref)
    v7 = {};
end;
local function _(v9) --[[ Line: 74 ]] --[[ Name: blacklistJoint ]]
    -- upvalues: v7 (ref)
    v7[v9] = true;
end;
local function _(v11) --[[ Line: 78 ]] --[[ Name: jointIsBlacklisted ]]
    -- upvalues: v7 (ref)
    if not v7[v11] then
        return false;
    else
        return true;
    end;
end;
local function _(v13, v14) --[[ Line: 85 ]] --[[ Name: getCameraOffset ]]
    local l_X_0 = v14.X;
    local l_Y_0 = v14.Y;
    local l_Z_0 = v14.Z;
    local v18 = math.sqrt(l_X_0 ^ 2 + l_Y_0 ^ 2 + l_Z_0 ^ 2);
    local v19 = 1 / math.tan(math.rad(v13) / 2);
    return v18 / 2 * v19;
end;
local function _() --[[ Line: 95 ]] --[[ Name: isOnRCC ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 101 ]]
        return game.GetService(game, "ThumbnailGenerator") ~= nil;
    end);
    return l_status_0 and l_result_0;
end;
local _ = function(v24, v25) --[[ Line: 111 ]] --[[ Name: reportCounter ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy)
    local _ = nil;
    local _ = nil;
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 101 ]]
        return game.GetService(game, "ThumbnailGenerator") ~= nil;
    end);
    local v30 = (l_status_1 and l_result_1 and "RCC" or "Client") .. "_" .. v24 .. "_" .. (v25 and "Success" or "Failure");
    l_RbxAnalyticsService_0:ReportCounter(v30);
end;
local function v49(v32) --[[ Line: 134 ]] --[[ Name: getAnimationAndIsIdle ]]
    -- upvalues: v6 (copy), l_RbxAnalyticsService_0 (copy)
    local v33 = true;
    if typeof(v32) ~= "number" then
        v33 = typeof(v32) == "string";
    end;
    assert(v33, "getAnimationAndIsIdle expects animationAssetIdOrUrl to be a number or string");
    local v34 = nil;
    v33 = nil;
    local v35 = nil;
    if typeof(v32) == "number" then
        local v36 = nil;
        local v37, v38 = v6.LoadAsset(v32);
        v33 = v37;
        v36 = v38;
        if v33 and v36 then
            v34 = v36:GetChildren()[1];
        end;
        v35 = "EmoteUtility_LoadAsset";
    else
        local v39 = nil;
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 153 ]]
            -- upvalues: v32 (copy)
            return game:GetObjects(v32)[1];
        end);
        v33 = l_status_2;
        v39 = l_result_2;
        if v33 and v39 then
            v34 = v39;
        end;
        v35 = "EmoteUtility_GetObjects";
    end;
    local l_v35_0 = v35;
    local l_v33_0 = v33;
    local v44 = nil;
    local v45 = nil;
    local l_status_3, l_result_3 = pcall(function() --[[ Line: 101 ]]
        return game.GetService(game, "ThumbnailGenerator") ~= nil;
    end);
    local v48 = (l_status_3 and l_result_3 and "RCC" or "Client") .. "_" .. l_v35_0 .. "_" .. (l_v33_0 and "Success" or "Failure");
    l_RbxAnalyticsService_0:ReportCounter(v48);
    if not v33 or not v34 then
        l_v35_0 = nil;
        v44, v45 = pcall(function() --[[ Line: 101 ]]
            return game.GetService(game, "ThumbnailGenerator") ~= nil;
        end);
        l_v35_0 = v44 and v45 and "RCC" or "Client";
        l_v33_0 = v35 .. "_Failed";
        l_RbxAnalyticsService_0:SendEventDeferred(l_v35_0, "EmoteUtility_getPoseAsset", l_v33_0, {
            animationAssetIdOrUrl = v32
        });
        return nil, nil;
    else
        assert(v34, "animation is non-nil. Silence type checker.");
        l_v35_0 = false;
        if v34.ClassName == "Folder" then
            l_v35_0 = true;
            l_v33_0 = v34:FindFirstChild("Pose", true) or v34:FindFirstChild("pose", true);
            if l_v33_0 == nil then
                l_v33_0 = v34:FindFirstChild("Idle", true) or v34:FindFirstChild("idle", true);
            end;
            v34 = if l_v33_0 then l_v33_0:FindFirstChildWhichIsA("Animation", true) else v34:FindFirstChildWhichIsA("Animation", true);
        end;
        return v34, l_v35_0;
    end;
end;
local function v67(v50) --[[ Line: 206 ]] --[[ Name: getAnimationClipByAssetId ]]
    -- upvalues: v6 (copy), l_AnimationClipProvider_0 (copy), l_RbxAnalyticsService_0 (copy)
    local v51 = nil;
    local v52 = nil;
    if v6.debugLoadAssetsFromFiles then
        local v53 = nil;
        for v54 in string.gmatch(v50, ".*id=([0-9]+)") do
            v53 = v54;
        end;
        assert(v53, "assetId should be non-nil");
        local v55 = tonumber(v53);
        assert(v55, "assetIdAsNumber should be non-nil");
        local v56 = nil;
        local v57, v58 = v6.LoadAsset(v55);
        v51 = v57;
        v56 = v58;
        if v51 and v56 then
            v52 = v56;
        end;
    else
        local l_status_4, l_result_4 = pcall(function() --[[ Line: 223 ]]
            -- upvalues: l_AnimationClipProvider_0 (ref), v50 (copy)
            return l_AnimationClipProvider_0:GetAnimationClipAsync(v50);
        end);
        v51 = l_status_4;
        v52 = l_result_4;
    end;
    local l_v51_0 = v51;
    local _ = nil;
    local v63 = nil;
    local l_status_5, l_result_5 = pcall(function() --[[ Line: 101 ]]
        return game.GetService(game, "ThumbnailGenerator") ~= nil;
    end);
    local v66 = (l_status_5 and l_result_5 and "RCC" or "Client") .. "_" .. "EmoteUtility_GetAnimationClipAsync" .. "_" .. (l_v51_0 and "Success" or "Failure");
    l_RbxAnalyticsService_0:ReportCounter(v66);
    if not v51 then
        l_v51_0 = nil;
        v63, v66 = pcall(function() --[[ Line: 101 ]]
            return game.GetService(game, "ThumbnailGenerator") ~= nil;
        end);
        l_v51_0 = v63 and v66 and "RCC" or "Client";
        l_RbxAnalyticsService_0:SendEventDeferred(l_v51_0, "EmoteUtility_GetAnimationClip", "EmoteUtility_GetAnimationClip_GetAnimationClipAsyncFailed", {
            keyframeSequenceId = v50
        });
        return nil;
    else
        return v52;
    end;
end;
local function _(v68, v69, v70) --[[ Line: 250 ]] --[[ Name: trySetProperty ]]
    pcall(function() --[[ Line: 251 ]]
        -- upvalues: v68 (copy), v69 (copy), v70 (copy)
        v68[v69] = v70;
    end);
end;
local function v81(v72, v73, v74) --[[ Line: 259 ]] --[[ Name: applyControlsFolder ]]
    if not v73 then
        return;
    else
        assert(v73, "parentPose is non-nil. Silence type checker.");
        local l_v72_FirstChild_0 = v72:FindFirstChild(v73.Name);
        if not l_v72_FirstChild_0 then
            return;
        else
            local l_l_v72_FirstChild_0_FirstChild_0 = l_v72_FirstChild_0:FindFirstChild(v74.Name);
            if not l_l_v72_FirstChild_0_FirstChild_0 then
                return;
            else
                for _, v78 in v74:GetChildren() do
                    if v78:IsA("NumberPose") then
                        local l_Name_0 = v78.Name;
                        local l_Value_0 = v78.Value;
                        pcall(function() --[[ Line: 251 ]]
                            -- upvalues: l_l_v72_FirstChild_0_FirstChild_0 (copy), l_Name_0 (copy), l_Value_0 (copy)
                            l_l_v72_FirstChild_0_FirstChild_0[l_Name_0] = l_Value_0;
                        end);
                    end;
                end;
                return;
            end;
        end;
    end;
end;
local function v94(v82, v83) --[[ Line: 288 ]] --[[ Name: applyKeyframeInner ]]
    -- upvalues: v6 (copy), v7 (ref), v81 (copy)
    local function v84(v85, v86) --[[ Line: 289 ]] --[[ Name: recurApplyPoses ]]
        -- upvalues: v82 (copy), v6 (ref), v7 (ref), v81 (ref), v84 (copy)
        if v85 and v86:IsA("Pose") then
            local l_v82_FirstChild_0 = v82:FindFirstChild(v85.Name);
            local l_v82_FirstChild_1 = v82:FindFirstChild(v86.Name);
            local v89 = v6.GetMotor6DBetween(l_v82_FirstChild_0, l_v82_FirstChild_1);
            if v89 and not not not v7[v89] then
                assert(v89, "motor6d is non-nil. Silence type checker.");
                v89.Transform = v86.CFrame;
                v7[v89] = true;
            end;
        end;
        if v86:IsA("Folder") then
            v81(v82, v85, v86);
            return;
        else
            for _, v91 in v86:GetChildren() do
                v84(v86, v91);
            end;
            return;
        end;
    end;
    if v83 then
        for _, v93 in pairs(v83:GetPoses()) do
            v84(nil, v93);
        end;
    end;
end;
local function v100(v95, v96) --[[ Line: 324 ]] --[[ Name: getRotatedKeyframe ]]
    if not v96 or v96 == 0 then
        return v95;
    else
        assert(v96, "rotationDegrees is non-nil. Silence type checker.");
        local v97 = v95:Clone();
        local v98 = v97:GetPoses()[1];
        if v98 then
            local v99 = v98:GetSubPoses()[1];
            if v99 then
                v99.CFrame = v99.CFrame * CFrame.Angles(0, math.rad(v96), 0);
            end;
        end;
        return v97;
    end;
end;
local function v103(v101, v102) --[[ Line: 345 ]] --[[ Name: getRotationCFrame ]]
    if v101:IsA("EulerRotationCurve") then
        return v101:GetRotationAtTime(v102);
    elseif v101:IsA("RotationCurve") then
        return v101:GetValueAtTime(v102);
    else
        error("Unsupported rotation type:" .. v101.ClassName);
        return nil;
    end;
end;
local function v104(v105, v106) --[[ Line: 356 ]] --[[ Name: findAttachmentsRecur ]]
    -- upvalues: v104 (copy)
    for _, v108 in pairs(v105:GetChildren()) do
        if v108:IsA("Attachment") then
            v106[v108.Name] = v108;
        elseif not v108:IsA("Tool") and not v108:IsA("Accoutrement") then
            v104(v108, v106);
        end;
    end;
end;
local function _(v109) --[[ Line: 367 ]] --[[ Name: findAttachmentsInTool ]]
    -- upvalues: v104 (copy)
    local v110 = {};
    v104(v109, v110);
    return v110;
end;
local function _(v112) --[[ Line: 373 ]] --[[ Name: findAttachmentsInCharacter ]]
    -- upvalues: v104 (copy)
    local v113 = {};
    v104(v112, v113);
    return v113;
end;
local function _(v115, v116) --[[ Line: 379 ]] --[[ Name: weldAttachments ]]
    local l_Weld_0 = Instance.new("Weld");
    l_Weld_0.Part0 = v115.Parent;
    l_Weld_0.Part1 = v116.Parent;
    l_Weld_0.C0 = v115.CFrame;
    l_Weld_0.C1 = v116.CFrame;
    l_Weld_0.Parent = v115.Parent;
    return l_Weld_0;
end;
local function v132(v119, v120, v121) --[[ Line: 389 ]] --[[ Name: attachToolToCharacter ]]
    -- upvalues: v104 (copy)
    local v122 = {};
    v104(v119, v122);
    local l_v122_0 = v122;
    local v124 = {};
    v104(v121, v124);
    v122 = v124;
    v124 = false;
    for _, v126 in pairs(v122) do
        local v127 = l_v122_0[v126.Name];
        if v127 then
            v124 = true;
            local l_Weld_1 = Instance.new("Weld");
            l_Weld_1.Part0 = v127.Parent;
            l_Weld_1.Part1 = v126.Parent;
            l_Weld_1.C0 = v127.CFrame;
            l_Weld_1.C1 = v126.CFrame;
            l_Weld_1.Parent = v127.Parent;
        end;
    end;
    if v124 then
        v121.Parent = v119;
        return;
    else
        v121.Parent = nil;
        local l_Handle_0 = v121:FindFirstChild("Handle");
        local l_Grip_0 = v121.Grip;
        if l_Handle_0 and l_Grip_0 then
            local l_RightGripAttachment_0 = l_v122_0.RightGripAttachment;
            if l_RightGripAttachment_0 then
                l_Handle_0.CFrame = l_RightGripAttachment_0.Parent.CFrame * l_RightGripAttachment_0.CFrame * l_Grip_0:Inverse();
            end;
        end;
        v120:EquipTool(v121);
        return;
    end;
end;
local function v140(v133, v134, v135, v136, v137, v138, v139) --[[ Line: 421 ]] --[[ Name: applyR15KeyframeWithTool ]]
    -- upvalues: v94 (copy), v132 (copy)
    if v139 then
        v94(v133, v139);
        v94(v133, v137);
    else
        v94(v133, v138);
        if v136 ~= nil then
            v94(v133, v137);
        end;
    end;
    v132(v133, v134, v135);
end;
local function v159(v141, v142, v143, v144) --[[ Line: 475 ]] --[[ Name: getMainThumbnailKeyframe ]]
    -- upvalues: v49 (copy), v6 (copy), v67 (copy)
    local v145 = nil;
    local v146 = false;
    local v147 = nil;
    if v142 then
        v147 = v142;
        local v148, v149 = v49(v142);
        if v148 == nil then
            return nil, v146, v147;
        else
            assert(v148, "animation is non-nil. Silence type checker.");
            if not v149 then
                v146 = true;
            end;
            local v150 = v6.GetNumberValueWithDefault(v148, "ThumbnailKeyframe", nil);
            local v151 = v6.GetNumberValueWithDefault(v148, "ThumbnailTime", nil);
            local v152 = 0;
            if v143 then
                v152 = v6.GetNumberValueWithDefault(v148, "ThumbnailCharacterRotation", 0);
            end;
            local v153 = v6.GetAnimationClip(v148);
            if v153 then
                if v153:IsA("KeyframeSequence") then
                    return v6.GetThumbnailKeyframe(v150, v153, v152), v146, v147;
                elseif v153:IsA("CurveAnimation") then
                    return v6.GetThumbnailKeyframeFromCurve(v151, v153, v152), v146, v147;
                else
                    error("Unsupported Animation type:" .. v153.ClassName);
                    return v145, v146, v147;
                end;
            end;
        end;
    elseif v144 then
        local l_FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL_0 = v6.FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL;
        local l_Animate_0 = v141:FindFirstChild("Animate");
        if l_Animate_0 then
            local v156 = l_Animate_0:FindFirstChild("Pose") or l_Animate_0:FindFirstChild("pose");
            if v156 then
                local l_Animation_0 = v156:FindFirstChildOfClass("Animation");
                if l_Animation_0 then
                    l_FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL_0 = l_Animation_0.AnimationId;
                end;
            end;
        end;
        v147 = l_FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL_0;
        local v158 = v67(l_FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL_0);
        if v158 then
            if not v158:IsA("KeyframeSequence") then
                return nil, false, v147;
            else
                v145 = v158:GetKeyframes()[1];
            end;
        end;
    end;
    return v145, v146, v147;
end;
local function v167(v160) --[[ Line: 559 ]] --[[ Name: getMoodThumbnailKeyframe ]]
    -- upvalues: v49 (copy), v6 (copy)
    local v161 = nil;
    if not v160 then
        return nil;
    else
        assert(v160, "moodAssetId is non-nil. Silence type checker.");
        local v162, _ = v49(v160);
        if v162 == nil then
            return nil;
        else
            assert(v162, "animation is non-nil. Silence type checker.");
            local v164 = v6.GetNumberValueWithDefault(v162, "ThumbnailKeyframe", nil);
            local v165 = v6.GetNumberValueWithDefault(v162, "ThumbnailTime", nil);
            local v166 = v6.GetAnimationClip(v162);
            if v166 then
                if v166:IsA("KeyframeSequence") then
                    return (v6.GetThumbnailKeyframe(v164, v166, 0));
                elseif v166:IsA("CurveAnimation") then
                    return (v6.GetThumbnailKeyframeFromCurve(v165, v166, 0));
                else
                    error("Unsupported Animation type:" .. v166.ClassName);
                end;
            end;
            return v161;
        end;
    end;
end;
local function v178(v168, v169) --[[ Line: 607 ]] --[[ Name: getToolKeyframes ]]
    -- upvalues: v6 (copy)
    local v170 = nil;
    local v171 = nil;
    local l_Tool_0 = v168:FindFirstChildOfClass("Tool");
    if not l_Tool_0 then
        return nil, nil;
    else
        assert(l_Tool_0, "tool is non-nil. Silence type checker.");
        local v173 = false;
        if not v169 then
            v170 = l_Tool_0:FindFirstChild("ThumbnailPose");
            if v170 and v170:IsA("Keyframe") then
                v173 = true;
            end;
        end;
        if not v173 then
            v170 = nil;
            local l_Animate_1 = v168:FindFirstChild("Animate");
            if not l_Animate_1 then
                return nil, nil;
            else
                assert(l_Animate_1, "animateScript is non-nil. Silence type checker.");
                local l_toolnone_0 = l_Animate_1:FindFirstChild("toolnone");
                if not l_toolnone_0 then
                    return nil, nil;
                else
                    assert(l_toolnone_0, "toolNoneStringValue is non-nil. Silence type checker.");
                    local l_ToolNoneAnim_0 = l_toolnone_0:FindFirstChild("ToolNoneAnim");
                    if l_ToolNoneAnim_0 then
                        local v177 = v6.GetAnimationClip(l_ToolNoneAnim_0);
                        if not v177 then
                            return nil, nil;
                        else
                            assert(v177, "toolAnimationClip is non-nil. Silence type checker.");
                            assert(v177:IsA("KeyframeSequence"), "ToolNoneAnim must be a KeyframeSequence");
                            v171 = v6.GetThumbnailKeyframe(nil, v177, 0);
                            if not l_Tool_0:IsDescendantOf(v168) then
                                return nil, nil;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        return v170, v171;
    end;
end;
v6.ForceAnimationToStep = function(v179) --[[ Line: 670 ]]
    local l_Humanoid_0 = v179:FindFirstChildOfClass("Humanoid");
    if l_Humanoid_0 then
        local l_Animator_0 = l_Humanoid_0:FindFirstChildOfClass("Animator");
        if l_Animator_0 then
            l_Animator_0:StepAnimations(0.1);
        end;
    end;
end;
v6.LoadAsset = function(v182) --[[ Line: 684 ]]
    -- upvalues: v6 (copy), l_InsertService_0 (copy)
    local l_status_6, l_result_6 = pcall(function() --[[ Line: 685 ]]
        -- upvalues: v6 (ref), v182 (copy), l_InsertService_0 (ref)
        if v6.debugLoadAssetsFromFiles and v6.mapAssetIdToFileName then
            local v183 = "rbxasset://" .. v6.mapAssetIdToFileName(v182);
            return l_InsertService_0:LoadLocalAsset(v183);
        else
            return l_InsertService_0:LoadAsset(v182);
        end;
    end);
    return l_status_6, l_result_6;
end;
v6.SetDebugLoadAssetsFromFiles = function(v186, v187) --[[ Line: 706 ]]
    -- upvalues: v6 (copy)
    v6.debugLoadAssetsFromFiles = v186;
    v6.mapAssetIdToFileName = v187;
end;
v6.GetMotor6DBetween = function(v188, v189) --[[ Line: 714 ]]
    if not v188 or not v189 then
        return nil;
    else
        assert(v188, "part0 is non-nil. Silence type checker.");
        assert(v189, "part1 is non-nil. Silence type checker.");
        for _, v191 in pairs(v189:GetChildren()) do
            if v191:IsA("Motor6D") and v191.Part0 == v188 then
                return v191;
            end;
        end;
        return nil;
    end;
end;
v6.PoseKeyframeHasFaceAnimation = function(v192) --[[ Line: 733 ]]
    if not v192 then
        return false;
    else
        assert(v192, "poseKeyframe is non-nil. Silence type checker.");
        local function v193(v194) --[[ Line: 739 ]] --[[ Name: recurHasFaceAnimation ]]
            -- upvalues: v193 (copy)
            if v194:IsA("Folder") then
                return true;
            else
                for _, v196 in v194:GetChildren() do
                    if v193(v196) then
                        return true;
                    end;
                end;
                return false;
            end;
        end;
        for _, v198 in pairs(v192:GetPoses()) do
            if v193(v198) then
                return true;
            end;
        end;
        return false;
    end;
end;
v6.ApplyKeyframe = function(v199, v200) --[[ Line: 764 ]]
    -- upvalues: v7 (ref), v94 (copy), v6 (copy)
    v7 = {};
    v94(v199, v200);
    v7 = {};
    local l_status_7, l_result_7 = pcall(function() --[[ Line: 101 ]]
        return game.GetService(game, "ThumbnailGenerator") ~= nil;
    end);
    if l_status_7 and l_result_7 then
        v6.ForceAnimationToStep(v199);
    end;
end;
v6.GetNumberValueWithDefault = function(v203, v204, v205) --[[ Line: 773 ]]
    local l_v205_0 = v205;
    local l_v203_FirstChild_0 = v203:FindFirstChild(v204);
    if l_v203_FirstChild_0 and l_v203_FirstChild_0:IsA("NumberValue") then
        l_v205_0 = l_v203_FirstChild_0.Value;
    end;
    return l_v205_0;
end;
v6.GetAnimationClip = function(v208) --[[ Line: 786 ]]
    -- upvalues: v67 (copy)
    if v208:IsA("KeyframeSequence") then
        return v208;
    elseif v208:IsA("CurveAnimation") then
        return v208;
    elseif v208:IsA("Animation") then
        return (v67(v208.AnimationId));
    else
        error("Cannot get AnimationClip from type:" .. v208.ClassName);
        return nil;
    end;
end;
v6.GetThumbnailKeyframe = function(v209, v210, v211) --[[ Line: 802 ]]
    -- upvalues: v100 (copy)
    local l_v210_Keyframes_0 = v210:GetKeyframes();
    local v213 = nil;
    v213 = if v209 and v209 > 0 and v209 <= #l_v210_Keyframes_0 then l_v210_Keyframes_0[v209] else l_v210_Keyframes_0[math.ceil(#l_v210_Keyframes_0 / 2)];
    return (v100(v213, v211));
end;
v6.GetCurveAnimationTimeLength = function(v214) --[[ Line: 820 ]]
    -- upvalues: v3 (copy)
    local v215 = 0;
    for _, v217 in v214:GetDescendants() do
        if v217:IsA("FloatCurve") and (not v3 or v217.Length ~= 0) then
            v215 = math.max(v215, v217:GetKeyAtIndex(v217.Length).Time);
        end;
    end;
    return v215;
end;
v6.GetThumbnailKeyframeFromCurve = function(v218, v219, v220) --[[ Line: 838 ]]
    -- upvalues: v6 (copy), v103 (copy), v3 (copy), v100 (copy)
    local v221 = v6.GetCurveAnimationTimeLength(v219);
    if not v218 or v218 < 0 or v221 < v218 then
        v218 = v221 / 2;
    end;
    assert(v218, "thumbnailTime should be non-nil. Silence type checker");
    local v222 = {
        Position = true, 
        Rotation = true
    };
    local _ = function(v223) --[[ Line: 856 ]] --[[ Name: hasSubFolders ]]
        for _, v225 in v223:GetChildren() do
            if v225:IsA("Folder") then
                return true;
            end;
        end;
        return false;
    end;
    local function v227(v228, v229) --[[ Line: 865 ]] --[[ Name: recurGenerateKeyframe ]]
        -- upvalues: v103 (ref), v218 (ref), v3 (ref), v222 (copy), v227 (copy)
        local v230 = false;
        local v231 = false;
        local v232 = nil;
        local l_Position_0 = v229:FindFirstChild("Position");
        local l_Rotation_0 = v229:FindFirstChild("Rotation");
        if l_Position_0 and l_Rotation_0 then
            local v235 = v103(l_Rotation_0, v218);
            if v235 then
                v235 = v235 + Vector3.new(table.unpack(l_Position_0:GetValueAtTime(v218)));
                local l_Pose_0 = Instance.new("Pose");
                l_Pose_0.CFrame = v235;
                l_Pose_0.Name = v229.Name;
                l_Pose_0.Parent = v228;
                v232 = l_Pose_0;
            end;
        else
            if v3 then
                local v237;
                for _, v239 in v229:GetChildren() do
                    if v239:IsA("Folder") then
                        v237 = true;
                        v230 = true;
                    end;
                    if v230 then
                        break;
                    end;
                end;
                if not v230 then
                    v237 = false;
                end;
                v230 = false;
                if v237 then
                    v237 = CFrame.new();
                    local l_Pose_1 = Instance.new("Pose");
                    l_Pose_1.CFrame = v237;
                    l_Pose_1.Name = v229.Name;
                    l_Pose_1.Parent = v228;
                    v232 = l_Pose_1;
                    v231 = true;
                end;
            end;
            if not v231 then
                local l_Folder_0 = Instance.new("Folder");
                l_Folder_0.Name = v229.Name;
                l_Folder_0.Parent = v228;
                v232 = l_Folder_0;
            end;
        end;
        v231 = false;
        for _, v243 in v229:GetChildren() do
            if v243:IsA("FloatCurve") and not v222[v243] then
                local l_NumberPose_0 = Instance.new("NumberPose");
                l_NumberPose_0.Name = v243.Name;
                local v245 = v243:GetValueAtTime(v218) or 0;
                assert(v245, "valueAtTime should be non-nil. Silence type checker.");
                l_NumberPose_0.Value = v245;
                l_NumberPose_0.Parent = v232;
            elseif v243:IsA("Folder") then
                v227(v232, v243);
            end;
        end;
    end;
    local l_Keyframe_0 = Instance.new("Keyframe");
    l_Keyframe_0.Name = v219.Name;
    l_Keyframe_0.Time = v218;
    for _, v248 in v219:GetChildren() do
        if v248:IsA("Folder") then
            v227(l_Keyframe_0, v248);
        end;
    end;
    return (v100(l_Keyframe_0, v220));
end;
v6.ClearPlayerCharacterFace = function(v249) --[[ Line: 931 ]]
    local l_v249_FirstChildWhichIsA_0 = v249:FindFirstChildWhichIsA("FaceControls", true);
    if l_v249_FirstChildWhichIsA_0 then
        local l_Parent_0 = l_v249_FirstChildWhichIsA_0.Parent;
        local l_l_v249_FirstChildWhichIsA_0_Children_0 = l_v249_FirstChildWhichIsA_0:GetChildren();
        local l_FaceControls_0 = Instance.new("FaceControls");
        l_FaceControls_0.Parent = l_Parent_0;
        for _, v255 in l_l_v249_FirstChildWhichIsA_0_Children_0 do
            v255.Parent = l_FaceControls_0;
        end;
        l_v249_FirstChildWhichIsA_0:Destroy();
    end;
end;
v6.AdjustArmOnR6ForTool = function(v256) --[[ Line: 948 ]]
    local l_Tool_1 = v256:FindFirstChildOfClass("Tool");
    local l_Torso_0 = v256:FindFirstChild("Torso");
    if l_Torso_0 then
        local l_l_Torso_0_FirstChild_0 = l_Torso_0:FindFirstChild("Right Shoulder");
        if l_l_Torso_0_FirstChild_0 then
            if l_Tool_1 then
                l_l_Torso_0_FirstChild_0.CurrentAngle = 1.5707963267948966;
                l_l_Torso_0_FirstChild_0.DesiredAngle = 1.5707963267948966;
                return;
            else
                l_l_Torso_0_FirstChild_0.CurrentAngle = 0;
                l_l_Torso_0_FirstChild_0.DesiredAngle = 0;
            end;
        end;
    end;
end;
v6.SetPlayerCharacterFace = function(v260, v261) --[[ Line: 970 ]]
    -- upvalues: v167 (copy), v6 (copy)
    if not v261 then
        return;
    elseif v261 == "" then
        return;
    elseif v261 == 0 then
        return;
    else
        local v262 = true;
        if typeof(v261) ~= "number" then
            v262 = typeof(v261) == "string";
        end;
        assert(v262, "EmoteUtility.SetPlayerCharacterFace expects animationAssetIdOrUrl to be a number or string");
        if not v260:FindFirstChildOfClass("Humanoid") then
            return;
        else
            v262 = v167(v261);
            if not v262 then
                return;
            else
                v6.ClearPlayerCharacterFace(v260);
                v6.ApplyKeyframe(v260, v262);
                return;
            end;
        end;
    end;
end;
v6.SetPlayerCharacterNeutralPose = function(v263) --[[ Line: 1011 ]]
    -- upvalues: v6 (copy)
    local l_Humanoid_1 = v263:FindFirstChildOfClass("Humanoid");
    if not l_Humanoid_1 then
        return;
    else
        assert(l_Humanoid_1, "humanoid should be non-nil. Silence type checker.");
        l_Humanoid_1:BuildRigFromAttachments();
        if l_Humanoid_1.RigType ~= Enum.HumanoidRigType.R15 then
            return;
        else
            v6.ClearPlayerCharacterFace(v263);
            local function v265(v266) --[[ Line: 1026 ]] --[[ Name: recurResetJoint ]]
                -- upvalues: v265 (copy)
                if v266:IsA("Motor6D") then
                    v266.Transform = CFrame.new();
                end;
                for _, v268 in (v266:GetChildren()) do
                    v265(v268);
                end;
            end;
            v265(v263);
            return;
        end;
    end;
end;
v6.FindDefaultMoodAnimationId = function(v269) --[[ Line: 1041 ]]
    local l_Animate_2 = v269:FindFirstChild("Animate");
    if not l_Animate_2 then
        return nil;
    else
        local l_mood_0 = l_Animate_2:FindFirstChild("mood");
        if not l_mood_0 then
            return nil;
        else
            local l_Animation_1 = l_mood_0:FindFirstChildOfClass("Animation");
            if not l_Animation_1 or l_Animation_1.AnimationId == "" then
                return nil;
            else
                return l_Animation_1.AnimationId;
            end;
        end;
    end;
end;
local function v291(v273, v274, v275, v276, v277) --[[ Line: 1060 ]] --[[ Name: loadKeyframesForPoseR15 ]]
    -- upvalues: v159 (copy), v178 (copy), v4 (copy), v6 (copy), v167 (copy), v67 (copy)
    local v278 = {
        originalAnimationAssetId = v274
    };
    local v279 = nil;
    v279 = not v277 or false;
    local v280, v281, v282 = v159(v273, v274, not v276, v279);
    local v283 = nil;
    local v284 = nil;
    if not v277 and v280 then
        local v285, v286 = v178(v273, v281);
        v283 = v285;
        v284 = v286;
    end;
    local v287 = nil;
    local v288 = false;
    if v4 or v275 and v275 ~= 0 then
        if v274 == nil then
            v288 = true;
        elseif not v6.PoseKeyframeHasFaceAnimation(v280) then
            v288 = true;
        end;
    end;
    if v288 then
        if v4 then
            if v275 and v275 ~= 0 then
                v287 = v167(v275);
            end;
            if not v287 then
                local v289 = v6.FindDefaultMoodAnimationId(v273);
                if v289 then
                    local v290 = v67(v289);
                    if v290 and v290:IsA("KeyframeSequence") then
                        v287 = v6.GetThumbnailKeyframe(nil, v290, 0);
                    end;
                end;
            end;
        else
            v287 = v167(v275);
        end;
    end;
    v278.poseKeyframe = v280;
    v278.moodKeyframe = v287;
    v278.defaultToolKeyframe = v284;
    v278.suggestedKeyframeFromTool = v283;
    v278.finalAnimationAssetIdOrUrl = v282;
    return v278;
end;
v6.LoadKeyframesForPose = function(v292, v293, v294, v295, v296) --[[ Line: 1161 ]]
    -- upvalues: v291 (copy)
    assert(v292, "character should be non-nil");
    if v293 ~= nil then
        assert(typeof(v293) == "number", "EmoteUtility.LoadKeyframesForPose expects animationAssetId to be a number or nil");
        assert(v293 > 0, "EmoteUtility.LoadKeyframesForPose expects animationAssetId to be a real asset ID (positive number)");
    end;
    if v294 ~= nil then
        assert(typeof(v294) == "number", "EmoteUtility.LoadKeyframesForPose expects moodAssetId to be a number or nil");
    end;
    local l_Humanoid_2 = v292:FindFirstChildOfClass("Humanoid");
    if not l_Humanoid_2 then
        return nil;
    else
        assert(l_Humanoid_2, "humanoid should be non-nil. Silence type checker.");
        if l_Humanoid_2.RigType == Enum.HumanoidRigType.R15 then
            return (v291(v292, v293, v294, v295, v296));
        else
            return {
                originalAnimationAssetId = v293
            };
        end;
    end;
end;
v6.ApplyKeyframesForPose = function(v298, v299) --[[ Line: 1209 ]]
    -- upvalues: v6 (copy), v7 (ref), v140 (copy), v94 (copy)
    assert(v298, "character should be non-nil");
    if not v299 then
        return;
    else
        assert(v299, "keyframesForPose should be non-nil. Silence type checker.");
        local l_Humanoid_3 = v298:FindFirstChildOfClass("Humanoid");
        if not l_Humanoid_3 then
            return;
        else
            assert(l_Humanoid_3, "humanoid should be non-nil. Silence type checker.");
            v6.SetPlayerCharacterNeutralPose(v298);
            v7 = {};
            local l_Tool_2 = v298:FindFirstChildOfClass("Tool");
            if l_Humanoid_3.RigType == Enum.HumanoidRigType.R15 then
                if l_Tool_2 then
                    local l_originalAnimationAssetId_0 = v299.originalAnimationAssetId;
                    v140(v298, l_Humanoid_3, l_Tool_2, l_originalAnimationAssetId_0, v299.poseKeyframe, v299.defaultToolKeyframe, v299.suggestedKeyframeFromTool);
                else
                    v94(v298, v299.poseKeyframe);
                end;
            else
                v6.AdjustArmOnR6ForTool(v298);
            end;
            if l_Humanoid_3.RigType == Enum.HumanoidRigType.R15 then
                v94(v298, v299.moodKeyframe);
            end;
            v7 = {};
            local l_status_8, l_result_8 = pcall(function() --[[ Line: 101 ]]
                return game.GetService(game, "ThumbnailGenerator") ~= nil;
            end);
            if l_status_8 and l_result_8 then
                v6.ForceAnimationToStep(v298);
            end;
            return;
        end;
    end;
end;
v6.SetPlayerCharacterPoseWithMoodFallback = function(v305, v306, v307, v308, v309) --[[ Line: 1275 ]]
    -- upvalues: v6 (copy)
    local l_Humanoid_4 = v305:FindFirstChildOfClass("Humanoid");
    if not l_Humanoid_4 then
        return;
    else
        assert(l_Humanoid_4, "humanoid should be non-nil.  Silence type checker.");
        local v311 = v6.LoadKeyframesForPose(v305, v306, v307, v308, v309);
        v6.ApplyKeyframesForPose(v305, v311);
        return;
    end;
end;
v6.ThumbnailZoomExtents = function(v312, v313, v314, v315, v316) --[[ Line: 1299 ]]
    local l_v312_ModelCFrame_0 = v312:GetModelCFrame();
    local l_LookVector_0 = l_v312_ModelCFrame_0.LookVector;
    local l_HumanoidRootPart_0 = v312:FindFirstChild("HumanoidRootPart");
    if l_HumanoidRootPart_0 then
        l_LookVector_0 = l_HumanoidRootPart_0.CFrame.LookVector;
    end;
    local v320 = CFrame.new(l_v312_ModelCFrame_0.Position + l_LookVector_0 * 5, l_v312_ModelCFrame_0.Position);
    local v321 = l_v312_ModelCFrame_0.Position + Vector3.new(v314, -v315, 0);
    local l_v312_ExtentsSize_0 = v312:GetExtentsSize();
    local l_X_1 = l_v312_ExtentsSize_0.X;
    local l_Y_1 = l_v312_ExtentsSize_0.Y;
    local l_Z_1 = l_v312_ExtentsSize_0.Z;
    local v326 = math.sqrt(l_X_1 ^ 2 + l_Y_1 ^ 2 + l_Z_1 ^ 2);
    local v327 = 1 / math.tan(math.rad(v313) / 2);
    local v328 = v326 / 2 * v327 * (1 / v316);
    return v320 - v320.Position + v321 + l_LookVector_0 * v328;
end;
return v6;