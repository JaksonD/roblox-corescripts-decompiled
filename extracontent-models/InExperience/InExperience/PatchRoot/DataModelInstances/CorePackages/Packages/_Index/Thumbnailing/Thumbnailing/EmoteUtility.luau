local l_AnimationClipProvider_0 = game:GetService("AnimationClipProvider");
local l_InsertService_0 = game:GetService("InsertService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v3 = game:DefineFastString("EmoteUtilityFallbackKeyframeSequenceAssetId", "10921261056");
local v4 = game:DefineFastFlag("EmoteUtilityDefaultMoodFromCharacter", false);
local v5 = game:DefineFastFlag("EmoteUtilitySupportAJU", false);
local v6 = {
    FallbackKeyframeSequenceAssetId = v3, 
    debugLoadAssetsFromFiles = false, 
    mapAssetIdToFileName = nil, 
    EmoteUtilitySupportAJU = v5, 
    FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL = "http://www.roblox.com/asset/?id=" .. v3
};
local v7 = {};
local function _() --[[ Line: 73 ]] --[[ Name: clearJointBlacklist ]]
    -- upvalues: v7 (ref)
    v7 = {};
end;
local function _(v9) --[[ Line: 77 ]] --[[ Name: blacklistJoint ]]
    -- upvalues: v7 (ref)
    v7[v9] = true;
end;
local function _(v11) --[[ Line: 81 ]] --[[ Name: jointIsBlacklisted ]]
    -- upvalues: v7 (ref)
    if not v7[v11] then
        return false;
    else
        return true;
    end;
end;
local function _(v13, v14) --[[ Line: 88 ]] --[[ Name: getCameraOffset ]]
    local l_X_0 = v14.X;
    local l_Y_0 = v14.Y;
    local l_Z_0 = v14.Z;
    local v18 = math.sqrt(l_X_0 ^ 2 + l_Y_0 ^ 2 + l_Z_0 ^ 2);
    local v19 = 1 / math.tan(math.rad(v13) / 2);
    return v18 / 2 * v19;
end;
local function _() --[[ Line: 98 ]] --[[ Name: isOnRCC ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 104 ]]
        return game.GetService(game, "ThumbnailGenerator") ~= nil;
    end);
    return l_status_0 and l_result_0;
end;
local _ = function(v24, v25) --[[ Line: 114 ]] --[[ Name: reportCounter ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy)
    local _ = nil;
    local _ = nil;
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 104 ]]
        return game.GetService(game, "ThumbnailGenerator") ~= nil;
    end);
    local v30 = (l_status_1 and l_result_1 and "RCC" or "Client") .. "_" .. v24 .. "_" .. (v25 and "Success" or "Failure");
    l_RbxAnalyticsService_0:ReportCounter(v30);
end;
local function v49(v32) --[[ Line: 137 ]] --[[ Name: getAnimationAndIsIdle ]]
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
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 156 ]]
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
    local l_status_3, l_result_3 = pcall(function() --[[ Line: 104 ]]
        return game.GetService(game, "ThumbnailGenerator") ~= nil;
    end);
    local v48 = (l_status_3 and l_result_3 and "RCC" or "Client") .. "_" .. l_v35_0 .. "_" .. (l_v33_0 and "Success" or "Failure");
    l_RbxAnalyticsService_0:ReportCounter(v48);
    if not v33 or not v34 then
        l_v35_0 = nil;
        v44, v45 = pcall(function() --[[ Line: 104 ]]
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
local function v67(v50) --[[ Line: 209 ]] --[[ Name: getAnimationClipByAssetId ]]
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
        local l_status_4, l_result_4 = pcall(function() --[[ Line: 226 ]]
            -- upvalues: l_AnimationClipProvider_0 (ref), v50 (copy)
            return l_AnimationClipProvider_0:GetAnimationClipAsync(v50);
        end);
        v51 = l_status_4;
        v52 = l_result_4;
    end;
    local l_v51_0 = v51;
    local _ = nil;
    local v63 = nil;
    local l_status_5, l_result_5 = pcall(function() --[[ Line: 104 ]]
        return game.GetService(game, "ThumbnailGenerator") ~= nil;
    end);
    local v66 = (l_status_5 and l_result_5 and "RCC" or "Client") .. "_" .. "EmoteUtility_GetAnimationClipAsync" .. "_" .. (l_v51_0 and "Success" or "Failure");
    l_RbxAnalyticsService_0:ReportCounter(v66);
    if not v51 then
        l_v51_0 = nil;
        v63, v66 = pcall(function() --[[ Line: 104 ]]
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
local function _(v68, v69, v70) --[[ Line: 253 ]] --[[ Name: trySetProperty ]]
    pcall(function() --[[ Line: 254 ]]
        -- upvalues: v68 (copy), v69 (copy), v70 (copy)
        v68[v69] = v70;
    end);
end;
local function v81(v72, v73, v74) --[[ Line: 262 ]] --[[ Name: applyControlsFolder ]]
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
                        pcall(function() --[[ Line: 254 ]]
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
local function v96(v82, v83) --[[ Line: 291 ]] --[[ Name: applyKeyframeInner ]]
    -- upvalues: v6 (copy), v7 (ref), v81 (copy)
    local function v84(v85, v86) --[[ Line: 292 ]] --[[ Name: recurApplyPoses ]]
        -- upvalues: v82 (copy), v6 (ref), v7 (ref), v81 (ref), v84 (copy)
        if v85 and v86:IsA("Pose") then
            local l_v82_FirstChild_0 = v82:FindFirstChild(v85.Name);
            local l_v82_FirstChild_1 = v82:FindFirstChild(v86.Name);
            local v89 = v6.GetJointBetween(l_v82_FirstChild_0, l_v82_FirstChild_1);
            if v89 and not not not v7[v89] then
                assert(v89, "joint is non-nil. Silence type checker.");
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
local function v102(v97, v98) --[[ Line: 329 ]] --[[ Name: getRotatedKeyframe ]]
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
local function v105(v103, v104) --[[ Line: 350 ]] --[[ Name: getRotationCFrame ]]
    if v103:IsA("EulerRotationCurve") then
        return v103:GetRotationAtTime(v104);
    elseif v103:IsA("RotationCurve") then
        return v103:GetValueAtTime(v104);
    else
        error("Unsupported rotation type:" .. v103.ClassName);
        return nil;
    end;
end;
local function v106(v107, v108) --[[ Line: 361 ]] --[[ Name: findAttachmentsRecur ]]
    -- upvalues: v106 (copy)
    for _, v110 in pairs(v107:GetChildren()) do
        if v110:IsA("Attachment") then
            v108[v110.Name] = v110;
        elseif not v110:IsA("Tool") and not v110:IsA("Accoutrement") then
            v106(v110, v108);
        end;
    end;
end;
local function _(v111) --[[ Line: 372 ]] --[[ Name: findAttachmentsInTool ]]
    -- upvalues: v106 (copy)
    local v112 = {};
    v106(v111, v112);
    return v112;
end;
local function _(v114) --[[ Line: 378 ]] --[[ Name: findAttachmentsInCharacter ]]
    -- upvalues: v106 (copy)
    local v115 = {};
    v106(v114, v115);
    return v115;
end;
local function _(v117, v118) --[[ Line: 384 ]] --[[ Name: weldAttachments ]]
    local l_Weld_0 = Instance.new("Weld");
    l_Weld_0.Part0 = v117.Parent;
    l_Weld_0.Part1 = v118.Parent;
    l_Weld_0.C0 = v117.CFrame;
    l_Weld_0.C1 = v118.CFrame;
    l_Weld_0.Parent = v117.Parent;
    return l_Weld_0;
end;
local function v134(v121, v122, v123) --[[ Line: 394 ]] --[[ Name: attachToolToCharacter ]]
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
local function v142(v135, v136, v137, v138, v139, v140, v141) --[[ Line: 426 ]] --[[ Name: applyR15KeyframeWithTool ]]
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
local function v161(v143, v144, v145, v146) --[[ Line: 480 ]] --[[ Name: getMainThumbnailKeyframe ]]
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
local function v169(v162) --[[ Line: 564 ]] --[[ Name: getMoodThumbnailKeyframe ]]
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
local function v180(v170, v171) --[[ Line: 612 ]] --[[ Name: getToolKeyframes ]]
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
local function v184(v181) --[[ Line: 671 ]] --[[ Name: getAttachmentCFrame ]]
    local l_CFrame_0 = v181.CFrame;
    local l_Parent_0 = v181.Parent;
    while l_Parent_0 and l_Parent_0:IsA("Bone") do
        l_CFrame_0 = l_Parent_0.CFrame * l_CFrame_0;
        l_Parent_0 = l_Parent_0.Parent;
    end;
    return l_CFrame_0;
end;
local function v188(v185) --[[ Line: 681 ]] --[[ Name: getJointParts ]]
    if v185:IsA("JointInstance") then
        return v185.Part0, v185.Part1;
    elseif v185:IsA("Constraint") then
        local l_Attachment0_0 = v185.Attachment0;
        local l_Attachment1_0 = v185.Attachment1;
        return l_Attachment0_0 and l_Attachment0_0:FindFirstAncestorWhichIsA("BasePart"), l_Attachment1_0 and l_Attachment1_0:FindFirstAncestorWhichIsA("BasePart");
    else
        return nil, nil;
    end;
end;
local function v195(v189, v190, v191, v192) --[[ Line: 694 ]] --[[ Name: applyCFrame ]]
    -- upvalues: v184 (copy)
    if v191:IsA("AnimationConstraint") then
        local l_Attachment0_1 = v191.Attachment0;
        local l_Attachment1_1 = v191.Attachment1;
        v190.CFrame = v189.CFrame * v184(l_Attachment0_1) * v192 * v184(l_Attachment1_1):Inverse();
        return;
    else
        if v191:IsA("Motor6D") then
            v191.C1 = v191.C1 * v192:Inverse();
        end;
        return;
    end;
end;
v6.ForceAnimationToStep = function(v196) --[[ Line: 708 ]]
    -- upvalues: v5 (copy), v188 (copy), v195 (copy)
    if v5 then
        local v197 = {
            (v196:FindFirstChild("HumanoidRootPart"))
        };
        local v198 = {};
        local v199 = {};
        while #v197 > 0 do
            local v200 = table.remove(v197, 1);
            if not v198[v200] then
                v198[v200] = true;
                for _, v202 in v200:GetJoints() do
                    local v203, v204 = v188(v202);
                    if v203 == v200 and v204 and not v198[v204] then
                        table.insert(v199, {
                            part0 = v200, 
                            part1 = v204, 
                            joint = v202
                        });
                        table.insert(v197, v204);
                    end;
                end;
            end;
        end;
        for _, v206 in v196:GetDescendants() do
            if v206:IsA("AnimationConstraint") then
                v206.Enabled = false;
            end;
        end;
        for _, v208 in v199 do
            local l_joint_0 = v208.joint;
            if l_joint_0:IsA("Motor6D") or l_joint_0:IsA("AnimationConstraint") then
                local l_Transform_0 = l_joint_0.Transform;
                v195(v208.part0, v208.part1, l_joint_0, l_Transform_0);
            end;
        end;
        return;
    else
        local l_Humanoid_0 = v196:FindFirstChildOfClass("Humanoid");
        if l_Humanoid_0 then
            local l_Animator_0 = l_Humanoid_0:FindFirstChildOfClass("Animator");
            if l_Animator_0 then
                l_Animator_0:StepAnimations(0.1);
            end;
        end;
        return;
    end;
end;
v6.LoadAsset = function(v213) --[[ Line: 761 ]]
    -- upvalues: v6 (copy), l_InsertService_0 (copy)
    local l_status_6, l_result_6 = pcall(function() --[[ Line: 762 ]]
        -- upvalues: v6 (ref), v213 (copy), l_InsertService_0 (ref)
        if v6.debugLoadAssetsFromFiles and v6.mapAssetIdToFileName then
            local v214 = "rbxasset://" .. v6.mapAssetIdToFileName(v213);
            return l_InsertService_0:LoadLocalAsset(v214);
        else
            return l_InsertService_0:LoadAsset(v213);
        end;
    end);
    return l_status_6, l_result_6;
end;
v6.SetDebugLoadAssetsFromFiles = function(v217, v218) --[[ Line: 783 ]]
    -- upvalues: v6 (copy)
    v6.debugLoadAssetsFromFiles = v217;
    v6.mapAssetIdToFileName = v218;
end;
v6.GetJointBetween = function(v219, v220) --[[ Line: 791 ]]
    -- upvalues: v5 (copy)
    if not v219 or not v220 then
        return nil;
    else
        assert(v219, "part0 is non-nil. Silence type checker.");
        assert(v220, "part1 is non-nil. Silence type checker.");
        for _, v222 in v220:GetChildren() do
            if v222:IsA("Motor6D") and v222.Part0 == v219 then
                return v222;
            elseif v5 and v222:IsA("AnimationConstraint") and v222.Part0 == v219 then
                return v222;
            end;
        end;
        return nil;
    end;
end;
v6.GetMotor6DBetween = v6.GetJointBetween;
v6.PoseKeyframeHasFaceAnimation = function(v223) --[[ Line: 815 ]]
    if not v223 then
        return false;
    else
        assert(v223, "poseKeyframe is non-nil. Silence type checker.");
        local function v224(v225) --[[ Line: 821 ]] --[[ Name: recurHasFaceAnimation ]]
            -- upvalues: v224 (copy)
            if v225:IsA("Folder") then
                return true;
            else
                for _, v227 in v225:GetChildren() do
                    if v224(v227) then
                        return true;
                    end;
                end;
                return false;
            end;
        end;
        for _, v229 in pairs(v223:GetPoses()) do
            if v224(v229) then
                return true;
            end;
        end;
        return false;
    end;
end;
v6.ApplyKeyframe = function(v230, v231) --[[ Line: 846 ]]
    -- upvalues: v7 (ref), v96 (copy), v6 (copy)
    v7 = {};
    v96(v230, v231);
    v7 = {};
    local l_status_7, l_result_7 = pcall(function() --[[ Line: 104 ]]
        return game.GetService(game, "ThumbnailGenerator") ~= nil;
    end);
    if l_status_7 and l_result_7 then
        v6.ForceAnimationToStep(v230);
    end;
end;
v6.GetNumberValueWithDefault = function(v234, v235, v236) --[[ Line: 855 ]]
    local l_v236_0 = v236;
    local l_v234_FirstChild_0 = v234:FindFirstChild(v235);
    if l_v234_FirstChild_0 and l_v234_FirstChild_0:IsA("NumberValue") then
        l_v236_0 = l_v234_FirstChild_0.Value;
    end;
    return l_v236_0;
end;
v6.GetAnimationClip = function(v239) --[[ Line: 868 ]]
    -- upvalues: v67 (copy)
    if v239:IsA("KeyframeSequence") then
        return v239;
    elseif v239:IsA("CurveAnimation") then
        return v239;
    elseif v239:IsA("Animation") then
        return (v67(v239.AnimationId));
    else
        error("Cannot get AnimationClip from type:" .. v239.ClassName);
        return nil;
    end;
end;
v6.GetThumbnailKeyframe = function(v240, v241, v242) --[[ Line: 884 ]]
    -- upvalues: v102 (copy)
    local l_v241_Keyframes_0 = v241:GetKeyframes();
    local v244 = nil;
    v244 = if v240 and v240 > 0 and v240 <= #l_v241_Keyframes_0 then l_v241_Keyframes_0[v240] else l_v241_Keyframes_0[math.ceil(#l_v241_Keyframes_0 / 2)];
    return (v102(v244, v242));
end;
v6.GetCurveAnimationTimeLength = function(v245) --[[ Line: 902 ]]
    local v246 = 0;
    for _, v248 in v245:GetDescendants() do
        if v248:IsA("FloatCurve") and v248.Length ~= 0 then
            v246 = math.max(v246, v248:GetKeyAtIndex(v248.Length).Time);
        end;
    end;
    return v246;
end;
v6.GetThumbnailKeyframeFromCurve = function(v249, v250, v251) --[[ Line: 920 ]]
    -- upvalues: v6 (copy), v105 (copy), v102 (copy)
    local v252 = v6.GetCurveAnimationTimeLength(v250);
    if not v249 or v249 < 0 or v252 < v249 then
        v249 = v252 / 2;
    end;
    assert(v249, "thumbnailTime should be non-nil. Silence type checker");
    local v253 = {
        Position = true, 
        Rotation = true
    };
    local _ = function(v254) --[[ Line: 938 ]] --[[ Name: hasSubFolders ]]
        for _, v256 in v254:GetChildren() do
            if v256:IsA("Folder") then
                return true;
            end;
        end;
        return false;
    end;
    local function v258(v259, v260) --[[ Line: 947 ]] --[[ Name: recurGenerateKeyframe ]]
        -- upvalues: v105 (ref), v249 (ref), v253 (copy), v258 (copy)
        local v261 = false;
        local v262 = nil;
        local l_Position_0 = v260:FindFirstChild("Position");
        local l_Rotation_0 = v260:FindFirstChild("Rotation");
        if l_Position_0 and l_Rotation_0 then
            local v265 = v105(l_Rotation_0, v249);
            if v265 then
                v265 = v265 + Vector3.new(table.unpack(l_Position_0:GetValueAtTime(v249)));
                local l_Pose_0 = Instance.new("Pose");
                l_Pose_0.CFrame = v265;
                l_Pose_0.Name = v260.Name;
                l_Pose_0.Parent = v259;
                v262 = l_Pose_0;
            end;
        else
            local v267;
            for _, v269 in v260:GetChildren() do
                if v269:IsA("Folder") then
                    v267 = true;
                    v261 = true;
                end;
                if v261 then
                    break;
                end;
            end;
            if not v261 then
                v267 = false;
            end;
            v261 = false;
            if v267 then
                v267 = CFrame.new();
                local l_Pose_1 = Instance.new("Pose");
                l_Pose_1.CFrame = v267;
                l_Pose_1.Name = v260.Name;
                l_Pose_1.Parent = v259;
                v262 = l_Pose_1;
            else
                v267 = Instance.new("Folder");
                v267.Name = v260.Name;
                v267.Parent = v259;
                v262 = v267;
            end;
        end;
        for _, v272 in v260:GetChildren() do
            if v272:IsA("FloatCurve") and not v253[v272] then
                local l_NumberPose_0 = Instance.new("NumberPose");
                l_NumberPose_0.Name = v272.Name;
                local v274 = v272:GetValueAtTime(v249) or 0;
                assert(v274, "valueAtTime should be non-nil. Silence type checker.");
                l_NumberPose_0.Value = v274;
                l_NumberPose_0.Parent = v262;
            elseif v272:IsA("Folder") then
                v258(v262, v272);
            end;
        end;
    end;
    local l_Keyframe_0 = Instance.new("Keyframe");
    l_Keyframe_0.Name = v250.Name;
    l_Keyframe_0.Time = v249;
    for _, v277 in v250:GetChildren() do
        if v277:IsA("Folder") then
            v258(l_Keyframe_0, v277);
        end;
    end;
    return (v102(l_Keyframe_0, v251));
end;
v6.ClearPlayerCharacterFace = function(v278) --[[ Line: 1013 ]]
    local l_v278_FirstChildWhichIsA_0 = v278:FindFirstChildWhichIsA("FaceControls", true);
    if l_v278_FirstChildWhichIsA_0 then
        local l_Parent_1 = l_v278_FirstChildWhichIsA_0.Parent;
        local l_l_v278_FirstChildWhichIsA_0_Children_0 = l_v278_FirstChildWhichIsA_0:GetChildren();
        local l_FaceControls_0 = Instance.new("FaceControls");
        l_FaceControls_0.Parent = l_Parent_1;
        for _, v284 in l_l_v278_FirstChildWhichIsA_0_Children_0 do
            v284.Parent = l_FaceControls_0;
        end;
        l_v278_FirstChildWhichIsA_0:Destroy();
    end;
end;
v6.AdjustArmOnR6ForTool = function(v285) --[[ Line: 1030 ]]
    local l_Tool_1 = v285:FindFirstChildOfClass("Tool");
    local l_Torso_0 = v285:FindFirstChild("Torso");
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
v6.SetPlayerCharacterFace = function(v289, v290) --[[ Line: 1052 ]]
    -- upvalues: v169 (copy), v6 (copy)
    if not v290 then
        return;
    elseif v290 == "" then
        return;
    elseif v290 == 0 then
        return;
    else
        local v291 = true;
        if typeof(v290) ~= "number" then
            v291 = typeof(v290) == "string";
        end;
        assert(v291, "EmoteUtility.SetPlayerCharacterFace expects animationAssetIdOrUrl to be a number or string");
        if not v289:FindFirstChildOfClass("Humanoid") then
            return;
        else
            v291 = v169(v290);
            if not v291 then
                return;
            else
                v6.ClearPlayerCharacterFace(v289);
                v6.ApplyKeyframe(v289, v291);
                return;
            end;
        end;
    end;
end;
v6.SetPlayerCharacterNeutralPose = function(v292) --[[ Line: 1093 ]]
    -- upvalues: v6 (copy), v5 (copy)
    local l_Humanoid_1 = v292:FindFirstChildOfClass("Humanoid");
    if not l_Humanoid_1 then
        return;
    else
        assert(l_Humanoid_1, "humanoid should be non-nil. Silence type checker.");
        l_Humanoid_1:BuildRigFromAttachments();
        if l_Humanoid_1.RigType ~= Enum.HumanoidRigType.R15 then
            return;
        else
            v6.ClearPlayerCharacterFace(v292);
            local function v294(v295) --[[ Line: 1108 ]] --[[ Name: recurResetJoint ]]
                -- upvalues: v5 (ref), v294 (copy)
                if v295:IsA("Motor6D") then
                    v295.Transform = CFrame.new();
                elseif v5 and v295:IsA("AnimationConstraint") then
                    v295.Transform = CFrame.new();
                end;
                for _, v297 in (v295:GetChildren()) do
                    v294(v297);
                end;
            end;
            v294(v292);
            return;
        end;
    end;
end;
v6.FindDefaultMoodAnimationId = function(v298) --[[ Line: 1125 ]]
    local l_Animate_2 = v298:FindFirstChild("Animate");
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
local function v320(v302, v303, v304, v305, v306) --[[ Line: 1144 ]] --[[ Name: loadKeyframesForPoseR15 ]]
    -- upvalues: v161 (copy), v180 (copy), v4 (copy), v6 (copy), v169 (copy), v67 (copy)
    local v307 = {
        originalAnimationAssetId = v303
    };
    local v308 = nil;
    v308 = not v306 or false;
    local v309, v310, v311 = v161(v302, v303, not v305, v308);
    local v312 = nil;
    local v313 = nil;
    if not v306 and v309 then
        local v314, v315 = v180(v302, v310);
        v312 = v314;
        v313 = v315;
    end;
    local v316 = nil;
    local v317 = false;
    if v4 or v304 and v304 ~= 0 then
        if v303 == nil then
            v317 = true;
        elseif not v6.PoseKeyframeHasFaceAnimation(v309) then
            v317 = true;
        end;
    end;
    if v317 then
        if v4 then
            if v304 and v304 ~= 0 then
                v316 = v169(v304);
            end;
            if not v316 then
                local v318 = v6.FindDefaultMoodAnimationId(v302);
                if v318 then
                    local v319 = v67(v318);
                    if v319 and v319:IsA("KeyframeSequence") then
                        v316 = v6.GetThumbnailKeyframe(nil, v319, 0);
                    end;
                end;
            end;
        else
            v316 = v169(v304);
        end;
    end;
    v307.poseKeyframe = v309;
    v307.moodKeyframe = v316;
    v307.defaultToolKeyframe = v313;
    v307.suggestedKeyframeFromTool = v312;
    v307.finalAnimationAssetIdOrUrl = v311;
    return v307;
end;
v6.LoadKeyframesForPose = function(v321, v322, v323, v324, v325) --[[ Line: 1245 ]]
    -- upvalues: v320 (copy)
    assert(v321, "character should be non-nil");
    if v322 ~= nil then
        assert(typeof(v322) == "number", "EmoteUtility.LoadKeyframesForPose expects animationAssetId to be a number or nil");
        assert(v322 > 0, "EmoteUtility.LoadKeyframesForPose expects animationAssetId to be a real asset ID (positive number)");
    end;
    if v323 ~= nil then
        assert(typeof(v323) == "number", "EmoteUtility.LoadKeyframesForPose expects moodAssetId to be a number or nil");
    end;
    local l_Humanoid_2 = v321:FindFirstChildOfClass("Humanoid");
    if not l_Humanoid_2 then
        return nil;
    else
        assert(l_Humanoid_2, "humanoid should be non-nil. Silence type checker.");
        if l_Humanoid_2.RigType == Enum.HumanoidRigType.R15 then
            return (v320(v321, v322, v323, v324, v325));
        else
            return {
                originalAnimationAssetId = v322
            };
        end;
    end;
end;
v6.ApplyKeyframesForPose = function(v327, v328) --[[ Line: 1293 ]]
    -- upvalues: v6 (copy), v7 (ref), v142 (copy), v96 (copy)
    assert(v327, "character should be non-nil");
    if not v328 then
        return;
    else
        assert(v328, "keyframesForPose should be non-nil. Silence type checker.");
        local l_Humanoid_3 = v327:FindFirstChildOfClass("Humanoid");
        if not l_Humanoid_3 then
            return;
        else
            assert(l_Humanoid_3, "humanoid should be non-nil. Silence type checker.");
            v6.SetPlayerCharacterNeutralPose(v327);
            v7 = {};
            local l_Tool_2 = v327:FindFirstChildOfClass("Tool");
            if l_Humanoid_3.RigType == Enum.HumanoidRigType.R15 then
                if l_Tool_2 then
                    local l_originalAnimationAssetId_0 = v328.originalAnimationAssetId;
                    v142(v327, l_Humanoid_3, l_Tool_2, l_originalAnimationAssetId_0, v328.poseKeyframe, v328.defaultToolKeyframe, v328.suggestedKeyframeFromTool);
                else
                    v96(v327, v328.poseKeyframe);
                end;
            else
                v6.AdjustArmOnR6ForTool(v327);
            end;
            if l_Humanoid_3.RigType == Enum.HumanoidRigType.R15 then
                v96(v327, v328.moodKeyframe);
            end;
            v7 = {};
            local l_status_8, l_result_8 = pcall(function() --[[ Line: 104 ]]
                return game.GetService(game, "ThumbnailGenerator") ~= nil;
            end);
            if l_status_8 and l_result_8 then
                v6.ForceAnimationToStep(v327);
            end;
            return;
        end;
    end;
end;
v6.SetPlayerCharacterPoseWithMoodFallback = function(v334, v335, v336, v337, v338) --[[ Line: 1359 ]]
    -- upvalues: v6 (copy)
    local l_Humanoid_4 = v334:FindFirstChildOfClass("Humanoid");
    if not l_Humanoid_4 then
        return;
    else
        assert(l_Humanoid_4, "humanoid should be non-nil.  Silence type checker.");
        local v340 = v6.LoadKeyframesForPose(v334, v335, v336, v337, v338);
        v6.ApplyKeyframesForPose(v334, v340);
        return;
    end;
end;
v6.ThumbnailZoomExtents = function(v341, v342, v343, v344, v345) --[[ Line: 1383 ]]
    local l_v341_ModelCFrame_0 = v341:GetModelCFrame();
    local l_LookVector_0 = l_v341_ModelCFrame_0.LookVector;
    local l_HumanoidRootPart_0 = v341:FindFirstChild("HumanoidRootPart");
    if l_HumanoidRootPart_0 then
        l_LookVector_0 = l_HumanoidRootPart_0.CFrame.LookVector;
    end;
    local v349 = CFrame.new(l_v341_ModelCFrame_0.Position + l_LookVector_0 * 5, l_v341_ModelCFrame_0.Position);
    local v350 = l_v341_ModelCFrame_0.Position + Vector3.new(v343, -v344, 0);
    local l_v341_ExtentsSize_0 = v341:GetExtentsSize();
    local l_X_1 = l_v341_ExtentsSize_0.X;
    local l_Y_1 = l_v341_ExtentsSize_0.Y;
    local l_Z_1 = l_v341_ExtentsSize_0.Z;
    local v355 = math.sqrt(l_X_1 ^ 2 + l_Y_1 ^ 2 + l_Z_1 ^ 2);
    local v356 = 1 / math.tan(math.rad(v342) / 2);
    local v357 = v355 / 2 * v356 * (1 / v345);
    return v349 - v349.Position + v350 + l_LookVector_0 * v357;
end;
return v6;