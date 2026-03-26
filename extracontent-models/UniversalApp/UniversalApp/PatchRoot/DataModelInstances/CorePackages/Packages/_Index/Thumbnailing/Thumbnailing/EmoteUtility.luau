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
local function v96(v82, v83) --[[ Line: 288 ]] --[[ Name: applyKeyframeInner ]]
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
            if not v93:IsA("Folder") then
                for _, v95 in v93:GetChildren() do
                    v84(v93, v95);
                end;
            end;
        end;
    end;
end;
local function v102(v97, v98) --[[ Line: 324 ]] --[[ Name: getRotatedKeyframe ]]
    if not v98 or v98 == 0 then
        return v97;
    else
        assert(v98, "rotationDegrees is non-nil. Silence type checker.");
        local v99 = v97:Clone();
        local v100 = v99:GetPoses()[1];
        if v100 then
            local v101 = v100:GetSubPoses()[1];
            if v101 then
                v101.CFrame = v101.CFrame * CFrame.Angles(0, math.rad(v98), 0);
            end;
        end;
        return v99;
    end;
end;
local function v105(v103, v104) --[[ Line: 345 ]] --[[ Name: getRotationCFrame ]]
    if v103:IsA("EulerRotationCurve") then
        return v103:GetRotationAtTime(v104);
    elseif v103:IsA("RotationCurve") then
        return v103:GetValueAtTime(v104);
    else
        error("Unsupported rotation type:" .. v103.ClassName);
        return nil;
    end;
end;
local function v106(v107, v108) --[[ Line: 356 ]] --[[ Name: findAttachmentsRecur ]]
    -- upvalues: v106 (copy)
    for _, v110 in pairs(v107:GetChildren()) do
        if v110:IsA("Attachment") then
            v108[v110.Name] = v110;
        elseif not v110:IsA("Tool") and not v110:IsA("Accoutrement") then
            v106(v110, v108);
        end;
    end;
end;
local function _(v111) --[[ Line: 367 ]] --[[ Name: findAttachmentsInTool ]]
    -- upvalues: v106 (copy)
    local v112 = {};
    v106(v111, v112);
    return v112;
end;
local function _(v114) --[[ Line: 373 ]] --[[ Name: findAttachmentsInCharacter ]]
    -- upvalues: v106 (copy)
    local v115 = {};
    v106(v114, v115);
    return v115;
end;
local function _(v117, v118) --[[ Line: 379 ]] --[[ Name: weldAttachments ]]
    local l_Weld_0 = Instance.new("Weld");
    l_Weld_0.Part0 = v117.Parent;
    l_Weld_0.Part1 = v118.Parent;
    l_Weld_0.C0 = v117.CFrame;
    l_Weld_0.C1 = v118.CFrame;
    l_Weld_0.Parent = v117.Parent;
    return l_Weld_0;
end;
local function v134(v121, v122, v123) --[[ Line: 389 ]] --[[ Name: attachToolToCharacter ]]
    -- upvalues: v106 (copy)
    local v124 = {};
    v106(v121, v124);
    local l_v124_0 = v124;
    local v126 = {};
    v106(v123, v126);
    v124 = v126;
    v126 = false;
    for _, v128 in pairs(v124) do
        local v129 = l_v124_0[v128.Name];
        if v129 then
            v126 = true;
            local l_Weld_1 = Instance.new("Weld");
            l_Weld_1.Part0 = v129.Parent;
            l_Weld_1.Part1 = v128.Parent;
            l_Weld_1.C0 = v129.CFrame;
            l_Weld_1.C1 = v128.CFrame;
            l_Weld_1.Parent = v129.Parent;
        end;
    end;
    if v126 then
        v123.Parent = v121;
        return;
    else
        v123.Parent = nil;
        local l_Handle_0 = v123:FindFirstChild("Handle");
        local l_Grip_0 = v123.Grip;
        if l_Handle_0 and l_Grip_0 then
            local l_RightGripAttachment_0 = l_v124_0.RightGripAttachment;
            if l_RightGripAttachment_0 then
                l_Handle_0.CFrame = l_RightGripAttachment_0.Parent.CFrame * l_RightGripAttachment_0.CFrame * l_Grip_0:Inverse();
            end;
        end;
        v122:EquipTool(v123);
        return;
    end;
end;
local function v142(v135, v136, v137, v138, v139, v140, v141) --[[ Line: 421 ]] --[[ Name: applyR15KeyframeWithTool ]]
    -- upvalues: v96 (copy), v134 (copy)
    if v141 then
        v96(v135, v141);
        v96(v135, v139);
    else
        v96(v135, v140);
        if v138 ~= nil then
            v96(v135, v139);
        end;
    end;
    v134(v135, v136, v137);
end;
local function v161(v143, v144, v145, v146) --[[ Line: 475 ]] --[[ Name: getMainThumbnailKeyframe ]]
    -- upvalues: v49 (copy), v6 (copy), v67 (copy)
    local v147 = nil;
    local v148 = false;
    local v149 = nil;
    if v144 then
        v149 = v144;
        local v150, v151 = v49(v144);
        if v150 == nil then
            return nil, v148, v149;
        else
            assert(v150, "animation is non-nil. Silence type checker.");
            if not v151 then
                v148 = true;
            end;
            local v152 = v6.GetNumberValueWithDefault(v150, "ThumbnailKeyframe", nil);
            local v153 = v6.GetNumberValueWithDefault(v150, "ThumbnailTime", nil);
            local v154 = 0;
            if v145 then
                v154 = v6.GetNumberValueWithDefault(v150, "ThumbnailCharacterRotation", 0);
            end;
            local v155 = v6.GetAnimationClip(v150);
            if v155 then
                if v155:IsA("KeyframeSequence") then
                    return v6.GetThumbnailKeyframe(v152, v155, v154), v148, v149;
                elseif v155:IsA("CurveAnimation") then
                    return v6.GetThumbnailKeyframeFromCurve(v153, v155, v154), v148, v149;
                else
                    error("Unsupported Animation type:" .. v155.ClassName);
                    return v147, v148, v149;
                end;
            end;
        end;
    elseif v146 then
        local l_FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL_0 = v6.FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL;
        local l_Animate_0 = v143:FindFirstChild("Animate");
        if l_Animate_0 then
            local v158 = l_Animate_0:FindFirstChild("Pose") or l_Animate_0:FindFirstChild("pose");
            if v158 then
                local l_Animation_0 = v158:FindFirstChildOfClass("Animation");
                if l_Animation_0 then
                    l_FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL_0 = l_Animation_0.AnimationId;
                end;
            end;
        end;
        v149 = l_FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL_0;
        local v160 = v67(l_FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL_0);
        if v160 then
            if not v160:IsA("KeyframeSequence") then
                return nil, false, v149;
            else
                v147 = v160:GetKeyframes()[1];
            end;
        end;
    end;
    return v147, v148, v149;
end;
local function v169(v162) --[[ Line: 559 ]] --[[ Name: getMoodThumbnailKeyframe ]]
    -- upvalues: v49 (copy), v6 (copy)
    local v163 = nil;
    if not v162 then
        return nil;
    else
        assert(v162, "moodAssetId is non-nil. Silence type checker.");
        local v164, _ = v49(v162);
        if v164 == nil then
            return nil;
        else
            assert(v164, "animation is non-nil. Silence type checker.");
            local v166 = v6.GetNumberValueWithDefault(v164, "ThumbnailKeyframe", nil);
            local v167 = v6.GetNumberValueWithDefault(v164, "ThumbnailTime", nil);
            local v168 = v6.GetAnimationClip(v164);
            if v168 then
                if v168:IsA("KeyframeSequence") then
                    return (v6.GetThumbnailKeyframe(v166, v168, 0));
                elseif v168:IsA("CurveAnimation") then
                    return (v6.GetThumbnailKeyframeFromCurve(v167, v168, 0));
                else
                    error("Unsupported Animation type:" .. v168.ClassName);
                end;
            end;
            return v163;
        end;
    end;
end;
local function v180(v170, v171) --[[ Line: 607 ]] --[[ Name: getToolKeyframes ]]
    -- upvalues: v6 (copy)
    local v172 = nil;
    local v173 = nil;
    local l_Tool_0 = v170:FindFirstChildOfClass("Tool");
    if not l_Tool_0 then
        return nil, nil;
    else
        assert(l_Tool_0, "tool is non-nil. Silence type checker.");
        local v175 = false;
        if not v171 then
            v172 = l_Tool_0:FindFirstChild("ThumbnailPose");
            if v172 and v172:IsA("Keyframe") then
                v175 = true;
            end;
        end;
        if not v175 then
            v172 = nil;
            local l_Animate_1 = v170:FindFirstChild("Animate");
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
                        local v179 = v6.GetAnimationClip(l_ToolNoneAnim_0);
                        if not v179 then
                            return nil, nil;
                        else
                            assert(v179, "toolAnimationClip is non-nil. Silence type checker.");
                            assert(v179:IsA("KeyframeSequence"), "ToolNoneAnim must be a KeyframeSequence");
                            v173 = v6.GetThumbnailKeyframe(nil, v179, 0);
                            if not l_Tool_0:IsDescendantOf(v170) then
                                return nil, nil;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        return v172, v173;
    end;
end;
v6.ForceAnimationToStep = function(v181) --[[ Line: 670 ]]
    local l_Humanoid_0 = v181:FindFirstChildOfClass("Humanoid");
    if l_Humanoid_0 then
        local l_Animator_0 = l_Humanoid_0:FindFirstChildOfClass("Animator");
        if l_Animator_0 then
            l_Animator_0:StepAnimations(0.1);
        end;
    end;
end;
v6.LoadAsset = function(v184) --[[ Line: 684 ]]
    -- upvalues: v6 (copy), l_InsertService_0 (copy)
    local l_status_6, l_result_6 = pcall(function() --[[ Line: 685 ]]
        -- upvalues: v6 (ref), v184 (copy), l_InsertService_0 (ref)
        if v6.debugLoadAssetsFromFiles and v6.mapAssetIdToFileName then
            local v185 = "rbxasset://" .. v6.mapAssetIdToFileName(v184);
            return l_InsertService_0:LoadLocalAsset(v185);
        else
            return l_InsertService_0:LoadAsset(v184);
        end;
    end);
    return l_status_6, l_result_6;
end;
v6.SetDebugLoadAssetsFromFiles = function(v188, v189) --[[ Line: 706 ]]
    -- upvalues: v6 (copy)
    v6.debugLoadAssetsFromFiles = v188;
    v6.mapAssetIdToFileName = v189;
end;
v6.GetMotor6DBetween = function(v190, v191) --[[ Line: 714 ]]
    if not v190 or not v191 then
        return nil;
    else
        assert(v190, "part0 is non-nil. Silence type checker.");
        assert(v191, "part1 is non-nil. Silence type checker.");
        for _, v193 in pairs(v191:GetChildren()) do
            if v193:IsA("Motor6D") and v193.Part0 == v190 then
                return v193;
            end;
        end;
        return nil;
    end;
end;
v6.PoseKeyframeHasFaceAnimation = function(v194) --[[ Line: 733 ]]
    if not v194 then
        return false;
    else
        assert(v194, "poseKeyframe is non-nil. Silence type checker.");
        local function v195(v196) --[[ Line: 739 ]] --[[ Name: recurHasFaceAnimation ]]
            -- upvalues: v195 (copy)
            if v196:IsA("Folder") then
                return true;
            else
                for _, v198 in v196:GetChildren() do
                    if v195(v198) then
                        return true;
                    end;
                end;
                return false;
            end;
        end;
        for _, v200 in pairs(v194:GetPoses()) do
            if v195(v200) then
                return true;
            end;
        end;
        return false;
    end;
end;
v6.ApplyKeyframe = function(v201, v202) --[[ Line: 764 ]]
    -- upvalues: v7 (ref), v96 (copy), v6 (copy)
    v7 = {};
    v96(v201, v202);
    v7 = {};
    local l_status_7, l_result_7 = pcall(function() --[[ Line: 101 ]]
        return game.GetService(game, "ThumbnailGenerator") ~= nil;
    end);
    if l_status_7 and l_result_7 then
        v6.ForceAnimationToStep(v201);
    end;
end;
v6.GetNumberValueWithDefault = function(v205, v206, v207) --[[ Line: 773 ]]
    local l_v207_0 = v207;
    local l_v205_FirstChild_0 = v205:FindFirstChild(v206);
    if l_v205_FirstChild_0 and l_v205_FirstChild_0:IsA("NumberValue") then
        l_v207_0 = l_v205_FirstChild_0.Value;
    end;
    return l_v207_0;
end;
v6.GetAnimationClip = function(v210) --[[ Line: 786 ]]
    -- upvalues: v67 (copy)
    if v210:IsA("KeyframeSequence") then
        return v210;
    elseif v210:IsA("CurveAnimation") then
        return v210;
    elseif v210:IsA("Animation") then
        return (v67(v210.AnimationId));
    else
        error("Cannot get AnimationClip from type:" .. v210.ClassName);
        return nil;
    end;
end;
v6.GetThumbnailKeyframe = function(v211, v212, v213) --[[ Line: 802 ]]
    -- upvalues: v102 (copy)
    local l_v212_Keyframes_0 = v212:GetKeyframes();
    local v215 = nil;
    v215 = if v211 and v211 > 0 and v211 <= #l_v212_Keyframes_0 then l_v212_Keyframes_0[v211] else l_v212_Keyframes_0[math.ceil(#l_v212_Keyframes_0 / 2)];
    return (v102(v215, v213));
end;
v6.GetCurveAnimationTimeLength = function(v216) --[[ Line: 820 ]]
    -- upvalues: v3 (copy)
    local v217 = 0;
    for _, v219 in v216:GetDescendants() do
        if v219:IsA("FloatCurve") and (not v3 or v219.Length ~= 0) then
            v217 = math.max(v217, v219:GetKeyAtIndex(v219.Length).Time);
        end;
    end;
    return v217;
end;
v6.GetThumbnailKeyframeFromCurve = function(v220, v221, v222) --[[ Line: 838 ]]
    -- upvalues: v6 (copy), v105 (copy), v3 (copy), v102 (copy)
    local v223 = v6.GetCurveAnimationTimeLength(v221);
    if not v220 or v220 < 0 or v223 < v220 then
        v220 = v223 / 2;
    end;
    assert(v220, "thumbnailTime should be non-nil. Silence type checker");
    local v224 = {
        Position = true, 
        Rotation = true
    };
    local _ = function(v225) --[[ Line: 856 ]] --[[ Name: hasSubFolders ]]
        for _, v227 in v225:GetChildren() do
            if v227:IsA("Folder") then
                return true;
            end;
        end;
        return false;
    end;
    local function v229(v230, v231) --[[ Line: 865 ]] --[[ Name: recurGenerateKeyframe ]]
        -- upvalues: v105 (ref), v220 (ref), v3 (ref), v224 (copy), v229 (copy)
        local v232 = false;
        local v233 = false;
        local v234 = nil;
        local l_Position_0 = v231:FindFirstChild("Position");
        local l_Rotation_0 = v231:FindFirstChild("Rotation");
        if l_Position_0 and l_Rotation_0 then
            local v237 = v105(l_Rotation_0, v220);
            if v237 then
                v237 = v237 + Vector3.new(table.unpack(l_Position_0:GetValueAtTime(v220)));
                local l_Pose_0 = Instance.new("Pose");
                l_Pose_0.CFrame = v237;
                l_Pose_0.Name = v231.Name;
                l_Pose_0.Parent = v230;
                v234 = l_Pose_0;
            end;
        else
            if v3 then
                local v239;
                for _, v241 in v231:GetChildren() do
                    if v241:IsA("Folder") then
                        v239 = true;
                        v232 = true;
                    end;
                    if v232 then
                        break;
                    end;
                end;
                if not v232 then
                    v239 = false;
                end;
                v232 = false;
                if v239 then
                    v239 = CFrame.new();
                    local l_Pose_1 = Instance.new("Pose");
                    l_Pose_1.CFrame = v239;
                    l_Pose_1.Name = v231.Name;
                    l_Pose_1.Parent = v230;
                    v234 = l_Pose_1;
                    v233 = true;
                end;
            end;
            if not v233 then
                local l_Folder_0 = Instance.new("Folder");
                l_Folder_0.Name = v231.Name;
                l_Folder_0.Parent = v230;
                v234 = l_Folder_0;
            end;
        end;
        v233 = false;
        for _, v245 in v231:GetChildren() do
            if v245:IsA("FloatCurve") and not v224[v245] then
                local l_NumberPose_0 = Instance.new("NumberPose");
                l_NumberPose_0.Name = v245.Name;
                local v247 = v245:GetValueAtTime(v220) or 0;
                assert(v247, "valueAtTime should be non-nil. Silence type checker.");
                l_NumberPose_0.Value = v247;
                l_NumberPose_0.Parent = v234;
            elseif v245:IsA("Folder") then
                v229(v234, v245);
            end;
        end;
    end;
    local l_Keyframe_0 = Instance.new("Keyframe");
    l_Keyframe_0.Name = v221.Name;
    l_Keyframe_0.Time = v220;
    for _, v250 in v221:GetChildren() do
        if v250:IsA("Folder") then
            v229(l_Keyframe_0, v250);
        end;
    end;
    return (v102(l_Keyframe_0, v222));
end;
v6.ClearPlayerCharacterFace = function(v251) --[[ Line: 931 ]]
    local l_v251_FirstChildWhichIsA_0 = v251:FindFirstChildWhichIsA("FaceControls", true);
    if l_v251_FirstChildWhichIsA_0 then
        local l_Parent_0 = l_v251_FirstChildWhichIsA_0.Parent;
        local l_l_v251_FirstChildWhichIsA_0_Children_0 = l_v251_FirstChildWhichIsA_0:GetChildren();
        local l_FaceControls_0 = Instance.new("FaceControls");
        l_FaceControls_0.Parent = l_Parent_0;
        for _, v257 in l_l_v251_FirstChildWhichIsA_0_Children_0 do
            v257.Parent = l_FaceControls_0;
        end;
        l_v251_FirstChildWhichIsA_0:Destroy();
    end;
end;
v6.AdjustArmOnR6ForTool = function(v258) --[[ Line: 948 ]]
    local l_Tool_1 = v258:FindFirstChildOfClass("Tool");
    local l_Torso_0 = v258:FindFirstChild("Torso");
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
v6.SetPlayerCharacterFace = function(v262, v263) --[[ Line: 970 ]]
    -- upvalues: v169 (copy), v6 (copy)
    if not v263 then
        return;
    elseif v263 == "" then
        return;
    elseif v263 == 0 then
        return;
    else
        local v264 = true;
        if typeof(v263) ~= "number" then
            v264 = typeof(v263) == "string";
        end;
        assert(v264, "EmoteUtility.SetPlayerCharacterFace expects animationAssetIdOrUrl to be a number or string");
        if not v262:FindFirstChildOfClass("Humanoid") then
            return;
        else
            v264 = v169(v263);
            if not v264 then
                return;
            else
                v6.ClearPlayerCharacterFace(v262);
                v6.ApplyKeyframe(v262, v264);
                return;
            end;
        end;
    end;
end;
v6.SetPlayerCharacterNeutralPose = function(v265) --[[ Line: 1011 ]]
    -- upvalues: v6 (copy)
    local l_Humanoid_1 = v265:FindFirstChildOfClass("Humanoid");
    if not l_Humanoid_1 then
        return;
    else
        assert(l_Humanoid_1, "humanoid should be non-nil. Silence type checker.");
        l_Humanoid_1:BuildRigFromAttachments();
        if l_Humanoid_1.RigType ~= Enum.HumanoidRigType.R15 then
            return;
        else
            v6.ClearPlayerCharacterFace(v265);
            local function v267(v268) --[[ Line: 1026 ]] --[[ Name: recurResetJoint ]]
                -- upvalues: v267 (copy)
                if v268:IsA("Motor6D") then
                    v268.Transform = CFrame.new();
                end;
                for _, v270 in (v268:GetChildren()) do
                    v267(v270);
                end;
            end;
            v267(v265);
            return;
        end;
    end;
end;
v6.FindDefaultMoodAnimationId = function(v271) --[[ Line: 1041 ]]
    local l_Animate_2 = v271:FindFirstChild("Animate");
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
local function v293(v275, v276, v277, v278, v279) --[[ Line: 1060 ]] --[[ Name: loadKeyframesForPoseR15 ]]
    -- upvalues: v161 (copy), v180 (copy), v4 (copy), v6 (copy), v169 (copy), v67 (copy)
    local v280 = {
        originalAnimationAssetId = v276
    };
    local v281 = nil;
    v281 = not v279 or false;
    local v282, v283, v284 = v161(v275, v276, not v278, v281);
    local v285 = nil;
    local v286 = nil;
    if not v279 and v282 then
        local v287, v288 = v180(v275, v283);
        v285 = v287;
        v286 = v288;
    end;
    local v289 = nil;
    local v290 = false;
    if v4 or v277 and v277 ~= 0 then
        if v276 == nil then
            v290 = true;
        elseif not v6.PoseKeyframeHasFaceAnimation(v282) then
            v290 = true;
        end;
    end;
    if v290 then
        if v4 then
            if v277 and v277 ~= 0 then
                v289 = v169(v277);
            end;
            if not v289 then
                local v291 = v6.FindDefaultMoodAnimationId(v275);
                if v291 then
                    local v292 = v67(v291);
                    if v292 and v292:IsA("KeyframeSequence") then
                        v289 = v6.GetThumbnailKeyframe(nil, v292, 0);
                    end;
                end;
            end;
        else
            v289 = v169(v277);
        end;
    end;
    v280.poseKeyframe = v282;
    v280.moodKeyframe = v289;
    v280.defaultToolKeyframe = v286;
    v280.suggestedKeyframeFromTool = v285;
    v280.finalAnimationAssetIdOrUrl = v284;
    return v280;
end;
v6.LoadKeyframesForPose = function(v294, v295, v296, v297, v298) --[[ Line: 1161 ]]
    -- upvalues: v293 (copy)
    assert(v294, "character should be non-nil");
    if v295 ~= nil then
        assert(typeof(v295) == "number", "EmoteUtility.LoadKeyframesForPose expects animationAssetId to be a number or nil");
        assert(v295 > 0, "EmoteUtility.LoadKeyframesForPose expects animationAssetId to be a real asset ID (positive number)");
    end;
    if v296 ~= nil then
        assert(typeof(v296) == "number", "EmoteUtility.LoadKeyframesForPose expects moodAssetId to be a number or nil");
    end;
    local l_Humanoid_2 = v294:FindFirstChildOfClass("Humanoid");
    if not l_Humanoid_2 then
        return nil;
    else
        assert(l_Humanoid_2, "humanoid should be non-nil. Silence type checker.");
        if l_Humanoid_2.RigType == Enum.HumanoidRigType.R15 then
            return (v293(v294, v295, v296, v297, v298));
        else
            return {
                originalAnimationAssetId = v295
            };
        end;
    end;
end;
v6.ApplyKeyframesForPose = function(v300, v301) --[[ Line: 1209 ]]
    -- upvalues: v6 (copy), v7 (ref), v142 (copy), v96 (copy)
    assert(v300, "character should be non-nil");
    if not v301 then
        return;
    else
        assert(v301, "keyframesForPose should be non-nil. Silence type checker.");
        local l_Humanoid_3 = v300:FindFirstChildOfClass("Humanoid");
        if not l_Humanoid_3 then
            return;
        else
            assert(l_Humanoid_3, "humanoid should be non-nil. Silence type checker.");
            v6.SetPlayerCharacterNeutralPose(v300);
            v7 = {};
            local l_Tool_2 = v300:FindFirstChildOfClass("Tool");
            if l_Humanoid_3.RigType == Enum.HumanoidRigType.R15 then
                if l_Tool_2 then
                    local l_originalAnimationAssetId_0 = v301.originalAnimationAssetId;
                    v142(v300, l_Humanoid_3, l_Tool_2, l_originalAnimationAssetId_0, v301.poseKeyframe, v301.defaultToolKeyframe, v301.suggestedKeyframeFromTool);
                else
                    v96(v300, v301.poseKeyframe);
                end;
            else
                v6.AdjustArmOnR6ForTool(v300);
            end;
            if l_Humanoid_3.RigType == Enum.HumanoidRigType.R15 then
                v96(v300, v301.moodKeyframe);
            end;
            v7 = {};
            local l_status_8, l_result_8 = pcall(function() --[[ Line: 101 ]]
                return game.GetService(game, "ThumbnailGenerator") ~= nil;
            end);
            if l_status_8 and l_result_8 then
                v6.ForceAnimationToStep(v300);
            end;
            return;
        end;
    end;
end;
v6.SetPlayerCharacterPoseWithMoodFallback = function(v307, v308, v309, v310, v311) --[[ Line: 1275 ]]
    -- upvalues: v6 (copy)
    local l_Humanoid_4 = v307:FindFirstChildOfClass("Humanoid");
    if not l_Humanoid_4 then
        return;
    else
        assert(l_Humanoid_4, "humanoid should be non-nil.  Silence type checker.");
        local v313 = v6.LoadKeyframesForPose(v307, v308, v309, v310, v311);
        v6.ApplyKeyframesForPose(v307, v313);
        return;
    end;
end;
v6.ThumbnailZoomExtents = function(v314, v315, v316, v317, v318) --[[ Line: 1299 ]]
    local l_v314_ModelCFrame_0 = v314:GetModelCFrame();
    local l_LookVector_0 = l_v314_ModelCFrame_0.LookVector;
    local l_HumanoidRootPart_0 = v314:FindFirstChild("HumanoidRootPart");
    if l_HumanoidRootPart_0 then
        l_LookVector_0 = l_HumanoidRootPart_0.CFrame.LookVector;
    end;
    local v322 = CFrame.new(l_v314_ModelCFrame_0.Position + l_LookVector_0 * 5, l_v314_ModelCFrame_0.Position);
    local v323 = l_v314_ModelCFrame_0.Position + Vector3.new(v316, -v317, 0);
    local l_v314_ExtentsSize_0 = v314:GetExtentsSize();
    local l_X_1 = l_v314_ExtentsSize_0.X;
    local l_Y_1 = l_v314_ExtentsSize_0.Y;
    local l_Z_1 = l_v314_ExtentsSize_0.Z;
    local v328 = math.sqrt(l_X_1 ^ 2 + l_Y_1 ^ 2 + l_Z_1 ^ 2);
    local v329 = 1 / math.tan(math.rad(v315) / 2);
    local v330 = v328 / 2 * v329 * (1 / v318);
    return v322 - v322.Position + v323 + l_LookVector_0 * v330;
end;
return v6;