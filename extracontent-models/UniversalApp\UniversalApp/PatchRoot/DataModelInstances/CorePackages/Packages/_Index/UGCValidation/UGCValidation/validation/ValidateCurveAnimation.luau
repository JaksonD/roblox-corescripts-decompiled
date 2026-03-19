local l_CollectionService_0 = game:GetService("CollectionService");
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Analytics);
local v4 = require(l_Parent_0.Constants);
local l_util_0 = l_Parent_0.util;
local _ = require(l_util_0.Types);
local v7 = require(l_util_0.FailureReasonsAccumulator);
local v8 = require(l_util_0.AssetCalculator);
local l_validation_0 = l_Parent_0.validation;
local v10 = require(l_validation_0.validateAttributes);
local v11 = require(l_validation_0.validateTags);
local v12 = require(l_validation_0.ValidatePropertiesSensible);
local l_flags_0 = l_Parent_0.flags;
local v14 = require(l_flags_0.GetFStringUGCValidationMaxAnimationLength);
local v15 = require(l_flags_0.GetFStringUGCValidationMaxAnimationBounds);
local v16 = require(l_flags_0.GetFStringUGCValidationMaxAnimationDeltas);
local v17 = require(l_flags_0.getFFlagUGCValidateAddObjectValueToAcceptableTypes);
local v18 = require(l_flags_0.getFFlagUGCValidateDuplicatesInAnimation);
local v19 = require(l_flags_0.getFFlagUGCValidateMaxTotalInstances);
local v20 = require(l_flags_0.getFIntUGCValidateMaxAnimationFPS);
local v21 = require(l_flags_0.getFIntUGCValidateMaxMarkerCurveValueLength);
local v22 = require(l_flags_0.GetFStringUGCValidateMaxAnimationMovementPerPart);
local v23 = require(l_flags_0.GetFStringUGCValidateFrameDeltaKeyTimeTol);
local v24 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidatePropertiesSensible);
local v25 = require(l_flags_0.GetFStringUGCValidateAnimationHeightTol);
local v26 = require(l_flags_0.getFFlagUGCValidateFixCurveAnimFrameTimeErrorMessage);
local v27 = require(l_flags_0.getFFlagUGCValidateCurveAnimRotationSpeed);
local v28 = require(l_flags_0.getFIntUGCValidationMaxAnimationRotationSpeedPerSecond);
local v29 = require(l_flags_0.getFFlagUGCValidateCurveAnimFinalFrameBug);
local v30 = require(l_flags_0.getFFlagUGCValidateCurveAnimMinTimeFix);
local v31 = require(l_flags_0.GetFStringUGCValidateCurveAnimationMinLength);
local v32 = require(l_flags_0.getFFlagUGCValidateCurveAnimTimeErrorMessageFix);
local v33 = require(l_flags_0.getFFlagUGCValidateRestrictNumMarkerCurves);
local v34 = require(l_flags_0.getFIntUGCValidateMaxTotalMarkerCurves);
local v35 = require(l_flags_0.getFFlagUGCValidateRestrictNumFaceControls);
local v36 = require(l_flags_0.getFIntUGCValidateMaxTotalFaceControls);
local v37 = require(l_flags_0.getFFlagUGCValidateRestrictNumMarkersInsideMarkerCurves);
local v38 = require(l_flags_0.getFIntUGCValidateMaxTotalInternalMarkers);
local v39 = {};
local function v43(v40, v41, v42) --[[ Line: 64 ]] --[[ Name: reportFailure ]]
    -- upvalues: v3 (copy)
    v3.reportFailure(v41, nil, v42);
    return false, {
        v40
    };
end;
local v44 = nil;
local function _() --[[ Line: 77 ]] --[[ Name: getBodyPartToParentMap ]]
    -- upvalues: v44 (ref), v8 (copy)
    if not v44 then
        v44 = v8.getBodyPartsToParents();
    end;
    return v44;
end;
local function _(v46) --[[ Line: 85 ]] --[[ Name: isBodyPartFolderNameValid ]]
    -- upvalues: v44 (ref), v8 (copy)
    local v47 = true;
    if not v44 then
        v44 = v8.getBodyPartsToParents();
    end;
    if v44[v46] == nil then
        v47 = v46 == "HumanoidRootPart";
    end;
    return v47;
end;
local function v57(v49, v50) --[[ Line: 89 ]] --[[ Name: areChildrenAcceptable ]]
    if not v49 then
        return true;
    else
        local function v54(v51) --[[ Line: 94 ]] --[[ Name: findAndRemoveMatching ]]
            -- upvalues: v50 (copy)
            for v52, v53 in v50 do
                if v53.ClassName == v51.ClassName and v53.Name == v51.Name then
                    table.remove(v50, v52);
                    return true;
                end;
            end;
            return false;
        end;
        for _, v56 in v49:GetChildren() do
            if not v54(v56) then
                return false;
            end;
        end;
        return true;
    end;
end;
local function v62(v58) --[[ Line: 114 ]] --[[ Name: calculateAcceptableChildBodyPartFolders ]]
    -- upvalues: v44 (ref), v8 (copy)
    local v59 = {};
    if not v44 then
        v44 = v8.getBodyPartsToParents();
    end;
    for v60, v61 in v44 do
        if v61 == v58 then
            table.insert(v59, {
                ClassName = "Folder", 
                Name = v60
            });
        end;
    end;
    return v59;
end;
local function v66(v63, v64) --[[ Line: 128 ]] --[[ Name: calculateAcceptableBodyPartFolderChildrenArray ]]
    -- upvalues: v62 (copy)
    local v65 = v62(v63.Name);
    if v63.Name == "HumanoidRootPart" then
        return v65;
    else
        table.insert(v65, {
            ClassName = "Vector3Curve", 
            Name = "Position"
        });
        table.insert(v65, {
            ClassName = v64 and "EulerRotationCurve" or "RotationCurve", 
            Name = "Rotation"
        });
        if v63.Name ~= "Head" then
            return v65;
        else
            table.insert(v65, {
                ClassName = "Folder", 
                Name = "FaceControls"
            });
            return v65;
        end;
    end;
end;
local function v67() --[[ Line: 159 ]] --[[ Name: calculateAcceptableCurveChildrenArray ]]
    return {
        {
            ClassName = "FloatCurve", 
            Name = "X"
        }, 
        {
            ClassName = "FloatCurve", 
            Name = "Y"
        }, 
        {
            ClassName = "FloatCurve", 
            Name = "Z"
        }
    };
end;
local function _(v68) --[[ Line: 176 ]] --[[ Name: containsGrandChildren ]]
    if not v68 then
        return false;
    else
        return #v68:GetDescendants() > #v68:GetChildren();
    end;
end;
local function v78(v70) --[[ Line: 183 ]] --[[ Name: validateBodyPartFolderChildren ]]
    -- upvalues: v66 (copy), v57 (copy), v67 (copy), v35 (copy), v36 (copy)
    local v71 = v66(v70, true);
    if v57(v70, v71) then
        local v72 = v67();
        if not v57(v70:FindFirstChild("Position"), v72) then
            return false;
        else
            v72 = v67();
            if not v57(v70:FindFirstChild("Rotation"), v72) then
                return false;
            else
                local l_FaceControls_0 = v70:FindFirstChild("FaceControls");
                if l_FaceControls_0 then
                    local l_l_FaceControls_0_Children_0 = l_FaceControls_0:GetChildren();
                    if v35() and #l_l_FaceControls_0_Children_0 > v36() then
                        return false;
                    else
                        for _, v76 in l_l_FaceControls_0_Children_0 do
                            if not v76:IsA("FloatCurve") then
                                return false;
                            end;
                        end;
                    end;
                end;
                local l_Position_0 = v70:FindFirstChild("Position");
                if not not l_Position_0 and #l_Position_0:GetDescendants() > #l_Position_0:GetChildren() then
                    return false;
                else
                    l_Position_0 = v70:FindFirstChild("Rotation");
                    if not not l_Position_0 and #l_Position_0:GetDescendants() > #l_Position_0:GetChildren() then
                        return false;
                    elseif not not l_FaceControls_0 and #l_FaceControls_0:GetDescendants() > #l_FaceControls_0:GetChildren() then
                        return false;
                    else
                        return true;
                    end;
                end;
            end;
        end;
    else
        return false;
    end;
end;
local _ = function(v79, v80) --[[ Line: 234 ]] --[[ Name: validateCurveAnimationBodyPartFolder ]]
    -- upvalues: v18 (copy), v78 (copy), v43 (copy), v3 (copy), v44 (ref), v8 (copy)
    local function v81(v82) --[[ Line: 238 ]] --[[ Name: validateBodyPartFolderInternal ]]
        -- upvalues: v18 (ref), v78 (ref), v43 (ref), v3 (ref), v80 (copy), v81 (copy), v44 (ref), v8 (ref)
        if v18() then
            if not v78(v82) then
                return v43(string.format("CurveAnimation contains body part Folder %s which has an invalid hierarchy (it has children that are not allowed or set-up incorrectly)", v82.Name), v3.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, v80);
            else
                for _, v84 in v82:GetChildren() do
                    if v84:IsA("Folder") and v84.Name ~= "FaceControls" then
                        local v85, v86 = v81(v84);
                        if not v85 then
                            return false, v86;
                        end;
                    end;
                end;
                return true;
            end;
        else
            for _, v88 in v82:GetChildren() do
                if v88:IsA("Folder") then
                    if v88.Name == "HumanoidRootPart" then
                        return false;
                    else
                        if not v44 then
                            v44 = v8.getBodyPartsToParents();
                        end;
                        local v89 = v44[v88.Name];
                        if v89 then
                            if v89 ~= v82.Name then
                                return false;
                            else
                                return v81(v88);
                            end;
                        end;
                    end;
                end;
            end;
            return true;
        end;
    end;
    local l_Name_0 = v79.Name;
    local v91 = true;
    if not v44 then
        v44 = v8.getBodyPartsToParents();
    end;
    if v44[l_Name_0] == nil then
        v91 = l_Name_0 == "HumanoidRootPart";
    end;
    if not v91 then
        return true;
    else
        return v81(v79);
    end;
end;
local function v100(v93, v94) --[[ Line: 287 ]] --[[ Name: validateSingleBodyRoot ]]
    -- upvalues: v44 (ref), v8 (copy), v43 (copy), v3 (copy), v18 (copy)
    local v95 = 0;
    for _, v97 in v93:GetChildren() do
        if v97:IsA("Folder") then
            local l_Name_1 = v97.Name;
            local v99 = true;
            if not v44 then
                v44 = v8.getBodyPartsToParents();
            end;
            if v44[l_Name_1] == nil then
                v99 = l_Name_1 == "HumanoidRootPart";
            end;
            if v99 then
                v95 = v95 + 1;
                if v95 > 1 then
                    return v43("CurveAnimation contains more than one body part or HumanoidRootPart Folder children. Please ensure there is only one child Folder named after a body part or HumanoidRootPart.", v3.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, v94);
                end;
            end;
        end;
    end;
    if v18() and v95 == 0 then
        return v43("CurveAnimation contains zero body part or HumanoidRootPart Folder children. Please ensure there is one (and only one) child Folder named after a body part or HumanoidRootPart.", v3.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, v94);
    else
        return true;
    end;
end;
v39.validateMarkerCurves = function(v101, v102) --[[ Line: 317 ]] --[[ Name: validateMarkerCurves ]]
    -- upvalues: v34 (copy), v43 (copy), v3 (copy)
    local v103 = v34();
    local v104 = 0;
    for _, v106 in v101:GetDescendants() do
        if v106:IsA("MarkerCurve") then
            v104 = v104 + 1;
            if v103 < v104 then
                return v43(("CurveAnimation contains more than %* MarkerCurve(s). Please ensure there is no more than %* MarkerCurve descendant(s)."):format(v103, v103), v3.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, v102);
            end;
        end;
    end;
    return true;
end;
v39.validateSingleAnimationRigData = function(v107, v108) --[[ Line: 339 ]] --[[ Name: validateSingleAnimationRigData ]]
    -- upvalues: v43 (copy), v3 (copy)
    local v109 = 0;
    for _, v111 in v107:GetChildren() do
        if v111:IsA("AnimationRigData") then
            v109 = v109 + 1;
            if v109 > 1 then
                return v43("CurveAnimation contains more than one AnimationRigData children. Please ensure there is only one AnimationRigData child.", v3.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, v108);
            end;
        end;
    end;
    if v109 == 0 then
        return v43("CurveAnimation contains zero AnimationRigData children. Please ensure there is one (and only one) AnimationRigData children.", v3.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, v108);
    else
        return true;
    end;
end;
v39.validateAnimationRigDataInternals = function(v112, v113) --[[ Line: 367 ]] --[[ Name: validateAnimationRigDataInternals ]]
    -- upvalues: v43 (copy), v3 (copy)
    for _, v115 in v112:GetChildren() do
        if v115:IsA("AnimationRigData") and not v115:IsValidR15() then
            return v43("AnimationRigData failed internal validation. Please ensure the AnimationRigData is set up correctly.", v3.ErrorType.validateCurveAnimation_IncorrectAnimationRigData, v113);
        end;
    end;
    return true;
end;
local function _(v116, v117) --[[ Line: 387 ]] --[[ Name: validateAnimationRigData ]]
    -- upvalues: v39 (copy)
    local v118, v119 = v39.validateSingleAnimationRigData(v116, v117);
    if not v118 then
        return false, v119;
    else
        local v120, v121 = v39.validateAnimationRigDataInternals(v116, v117);
        v118 = v120;
        v119 = v121;
        if not v118 then
            return false, v119;
        else
            return true;
        end;
    end;
end;
local function v127(v123, v124) --[[ Line: 403 ]] --[[ Name: validateScripts ]]
    -- upvalues: v43 (copy), v3 (copy)
    for _, v126 in v123:GetDescendants() do
        if v126:IsA("Script") or v126:IsA("ModuleScript") then
            return v43("CurveAnimation hierarchy contains Scripts, LocalScripts, or ModuleScripts. Please remove them.", v3.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, v124);
        end;
    end;
    return true;
end;
local v128 = {
    "MarkerCurve", 
    "AnimationRigData", 
    "Folder", 
    "Vector3Curve", 
    "EulerRotationCurve", 
    "FloatCurve"
};
if v17() then
    table.insert(v128, "ObjectValue");
end;
local function v136(v129, v130) --[[ Line: 432 ]] --[[ Name: validateExtraInstances ]]
    -- upvalues: v128 (copy), v43 (copy), v3 (copy)
    for _, v132 in v129:GetDescendants() do
        local v133 = false;
        for _, v135 in v128 do
            if v132:IsA(v135) then
                v133 = true;
                break;
            end;
        end;
        if not v133 then
            return v43(("CurveAnimation hierarchy can only contain %*. Please remove any other Instance types."):format((table.concat(v128, ", "))), v3.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, v130);
        end;
    end;
    return true;
end;
v39.validateExtraInstancesUnitTest = function(v137, v138) --[[ Line: 456 ]] --[[ Name: validateExtraInstancesUnitTest ]]
    -- upvalues: v136 (copy)
    return v136(v137, v138);
end;
v39.validateScriptsUnitTest = function(v139, v140) --[[ Line: 463 ]] --[[ Name: validateScriptsUnitTest ]]
    -- upvalues: v127 (copy)
    return v127(v139, v140);
end;
local function v179(v141, v142) --[[ Line: 472 ]] --[[ Name: validateAnimationHierarchy ]]
    -- upvalues: v3 (copy), v19 (copy), v43 (copy), v100 (copy), v39 (copy), v33 (copy), v18 (copy), v44 (ref), v8 (copy), v78 (copy), v7 (copy), v127 (copy), v136 (copy)
    if not v141:IsA("CurveAnimation") then
        v3.reportFailure(v3.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, nil, v142);
        return false, {
            "Referenced Animation is not a CurveAnimation. Please ensure the animation is uploaded correctly."
        };
    else
        local v143 = #v141:GetDescendants();
        if v19() < v143 then
            return v43(("CurveAnimation has %* descendants. Maximum allowed is %*. Please reduce the number of descendants."):format(v143, (v19())), v3.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, v142);
        else
            local v144, v145 = v100(v141, v142);
            if not v144 then
                return false, v145;
            else
                local v146, v147 = v39.validateSingleAnimationRigData(v141, v142);
                local v148, v149;
                if not v146 then
                    v148 = false;
                    v149 = v147;
                else
                    local v150, v151 = v39.validateAnimationRigDataInternals(v141, v142);
                    v146 = v150;
                    v147 = v151;
                    if not v146 then
                        v148 = false;
                        v149 = v147;
                    else
                        v148 = true;
                        v149 = nil;
                    end;
                end;
                v144 = v148;
                v145 = v149;
                if not v144 then
                    return false, v145;
                else
                    if v33() then
                        v148, v149 = v39.validateMarkerCurves(v141, v142);
                        v144 = v148;
                        v145 = v149;
                        if not v144 then
                            return false, v145;
                        end;
                    end;
                    for _, v153 in v141:GetChildren() do
                        if v153:IsA("MarkerCurve") or v153:IsA("AnimationRigData") then
                            if v18() and #v153:GetChildren() > 0 then
                                return v43("CurveAnimation child MarkerCurves and AnimationRigData cannot have children", v3.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, v142);
                            end;
                        elseif v153:IsA("Folder") then
                            if v18() then
                                local l_Name_2 = v153.Name;
                                local v155 = true;
                                if not v44 then
                                    v44 = v8.getBodyPartsToParents();
                                end;
                                if v44[l_Name_2] == nil then
                                    v155 = l_Name_2 == "HumanoidRootPart";
                                end;
                                if not v155 then
                                    return v43("CurveAnimation contains unexpected child: " .. v153.Name, v3.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, v142);
                                else
                                    local function v156(v157) --[[ Line: 238 ]] --[[ Name: validateBodyPartFolderInternal ]]
                                        -- upvalues: v18 (ref), v78 (ref), v43 (ref), v3 (ref), v142 (copy), v156 (copy), v44 (ref), v8 (ref)
                                        if v18() then
                                            if not v78(v157) then
                                                return v43(string.format("CurveAnimation contains body part Folder %s which has an invalid hierarchy (it has children that are not allowed or set-up incorrectly)", v157.Name), v3.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, v142);
                                            else
                                                for _, v159 in v157:GetChildren() do
                                                    if v159:IsA("Folder") and v159.Name ~= "FaceControls" then
                                                        local v160, v161 = v156(v159);
                                                        if not v160 then
                                                            return false, v161;
                                                        end;
                                                    end;
                                                end;
                                                return true;
                                            end;
                                        else
                                            for _, v163 in v157:GetChildren() do
                                                if v163:IsA("Folder") then
                                                    if v163.Name == "HumanoidRootPart" then
                                                        return false;
                                                    else
                                                        if not v44 then
                                                            v44 = v8.getBodyPartsToParents();
                                                        end;
                                                        local v164 = v44[v163.Name];
                                                        if v164 then
                                                            if v164 ~= v157.Name then
                                                                return false;
                                                            else
                                                                return v156(v163);
                                                            end;
                                                        end;
                                                    end;
                                                end;
                                            end;
                                            return true;
                                        end;
                                    end;
                                    local l_Name_3 = v153.Name;
                                    local v166 = true;
                                    if not v44 then
                                        v44 = v8.getBodyPartsToParents();
                                    end;
                                    if v44[l_Name_3] == nil then
                                        v166 = l_Name_3 == "HumanoidRootPart";
                                    end;
                                    if not v166 then
                                        v155 = true;
                                        l_Name_2 = nil;
                                    else
                                        v166, l_Name_3 = v156(v153);
                                        v155 = v166;
                                        l_Name_2 = l_Name_3;
                                    end;
                                    v144 = v155;
                                    v145 = l_Name_2;
                                    if not v144 then
                                        return false, v145;
                                    end;
                                end;
                            else
                                local v167 = nil;
                                local l_v167_0 = v167 --[[ copy: 12 -> 15 ]];
                                local function v169(v170) --[[ Line: 238 ]] --[[ Name: validateBodyPartFolderInternal ]]
                                    -- upvalues: v18 (ref), v78 (ref), v43 (ref), v3 (ref), l_v167_0 (copy), v169 (copy), v44 (ref), v8 (ref)
                                    if v18() then
                                        if not v78(v170) then
                                            return v43(string.format("CurveAnimation contains body part Folder %s which has an invalid hierarchy (it has children that are not allowed or set-up incorrectly)", v170.Name), v3.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, l_v167_0);
                                        else
                                            for _, v172 in v170:GetChildren() do
                                                if v172:IsA("Folder") and v172.Name ~= "FaceControls" then
                                                    local v173, v174 = v169(v172);
                                                    if not v173 then
                                                        return false, v174;
                                                    end;
                                                end;
                                            end;
                                            return true;
                                        end;
                                    else
                                        for _, v176 in v170:GetChildren() do
                                            if v176:IsA("Folder") then
                                                if v176.Name == "HumanoidRootPart" then
                                                    return false;
                                                else
                                                    if not v44 then
                                                        v44 = v8.getBodyPartsToParents();
                                                    end;
                                                    local v177 = v44[v176.Name];
                                                    if v177 then
                                                        if v177 ~= v170.Name then
                                                            return false;
                                                        else
                                                            return v169(v176);
                                                        end;
                                                    end;
                                                end;
                                            end;
                                        end;
                                        return true;
                                    end;
                                end;
                                local l_Name_4 = v153.Name;
                                v167 = true;
                                if not v44 then
                                    v44 = v8.getBodyPartsToParents();
                                end;
                                if v44[l_Name_4] == nil then
                                    v167 = l_Name_4 == "HumanoidRootPart";
                                end;
                                if not (not v167 or v169(v153)) then
                                    return v43("CurveAnimation contains child body part Folder " .. v153.Name .. " which has an invalid hierarchy", v3.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, v142);
                                end;
                            end;
                        else
                            return v43("CurveAnimation contains unexpected child: " .. v153.Name, v3.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, v142);
                        end;
                    end;
                    v148 = v7.new();
                    v148:updateReasons(v127(v141, v142));
                    v148:updateReasons(v136(v141, v142));
                    return v148:getFinalResults();
                end;
            end;
        end;
    end;
end;
local function v184(v180) --[[ Line: 570 ]] --[[ Name: createDefaultCharacter ]]
    -- upvalues: l_Players_0 (copy)
    local v181 = nil;
    v181 = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then l_Players_0:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15) else game.Players:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15);
    for _, v183 in v181:GetDescendants() do
        if v183:IsA("Decal") then
            v183.Transparency = 1;
        elseif v183:IsA("MeshPart") then
            v183.Transparency = 1;
            v183.CanCollide = false;
        elseif v183:IsA("Motor6D") and v180 then
            v183:Destroy();
        end;
    end;
    return v181;
end;
local v185 = 1 / v20();
local function v191(v186) --[[ Line: 604 ]] --[[ Name: getBodyPartFolderRoot ]]
    -- upvalues: v44 (ref), v8 (copy)
    for _, v188 in v186:GetChildren() do
        if v188:IsA("Folder") then
            local l_Name_5 = v188.Name;
            local v190 = true;
            if not v44 then
                v44 = v8.getBodyPartsToParents();
            end;
            if v44[l_Name_5] == nil then
                v190 = l_Name_5 == "HumanoidRootPart";
            end;
            if v190 then
                return v188;
            end;
        end;
    end;
    return nil;
end;
local function v197(v192) --[[ Line: 613 ]] --[[ Name: hasFloatCurveKeys ]]
    local l_X_0 = v192:FindFirstChild("X");
    local l_Y_0 = v192:FindFirstChild("Y");
    local l_Z_0 = v192:FindFirstChild("Z");
    local v196 = if l_X_0 then l_X_0:IsA("FloatCurve") and #l_X_0:GetKeys() > 0 else false;
    if not v196 then
        v196 = if l_Y_0 then l_Y_0:IsA("FloatCurve") and #l_Y_0:GetKeys() > 0 else false;
        if not v196 then
            if l_Z_0 then
                v196 = l_Z_0:IsA("FloatCurve");
                if v196 then
                    return #l_Z_0:GetKeys() > 0;
                end;
            else
                v196 = false;
            end;
        end;
    end;
    return v196;
end;
local function _(v198) --[[ Line: 623 ]] --[[ Name: hasPositionKeys ]]
    -- upvalues: v197 (copy)
    if not v198 then
        return false;
    elseif not v198:IsA("Vector3Curve") then
        return false;
    else
        return (v197(v198));
    end;
end;
local function _(v200) --[[ Line: 634 ]] --[[ Name: hasRotationKeys ]]
    -- upvalues: v197 (copy)
    if not v200 then
        return false;
    elseif not v200:IsA("EulerRotationCurve") then
        return false;
    else
        return (v197(v200));
    end;
end;
local function v254(v202) --[[ Line: 646 ]] --[[ Name: calculateAnimFramesAtOriginManual ]]
    -- upvalues: v18 (copy), v191 (copy), v44 (ref), v8 (copy), v197 (copy), v4 (copy), v184 (copy), v29 (copy), v185 (copy)
    local function v210() --[[ Line: 649 ]] --[[ Name: getCurveTracks ]]
        -- upvalues: v18 (ref), v191 (ref), v202 (copy), v44 (ref), v8 (ref), v197 (ref), v4 (ref)
        local v203 = {};
        local v204 = nil;
        if v18() then
            local v205 = v191(v202);
            assert(v205, "ValidateCurveAnimation.validateStructure() ensures CurveAnimation has one and only one body part Folder child or HumanoidRootPart child.");
            v204 = v205:GetDescendants();
            table.insert(v204, v205);
        else
            v204 = v202:GetDescendants();
        end;
        for _, v207 in v204 do
            if v207:IsA("Folder") then
                if not v44 then
                    v44 = v8.getBodyPartsToParents();
                end;
                if v44[v207.Name] then
                    local l_Position_1 = v207:FindFirstChild("Position");
                    local l_Rotation_0 = v207:FindFirstChild("Rotation");
                    v203[v207.Name] = {
                        pos = if not not l_Position_1 and if l_Position_1:IsA("Vector3Curve") then v197(l_Position_1) else false then l_Position_1 else nil, 
                        rot = if not not l_Rotation_0 and if l_Rotation_0:IsA("EulerRotationCurve") then v197(l_Rotation_0) else false then l_Rotation_0 else nil, 
                        faceControls = if v207.Name == v4.NAMED_R15_BODY_PARTS.Head then v207:FindFirstChild("FaceControls") else nil
                    };
                end;
            end;
        end;
        return v203;
    end;
    local function v221(v211) --[[ Line: 682 ]] --[[ Name: calculateCurveAnimLength ]]
        local v212 = -1;
        local function v218(v213) --[[ Line: 685 ]] --[[ Name: getMaxTimeFromFloatCurveChildren ]]
            -- upvalues: v212 (ref)
            if not v213 then
                return;
            else
                for _, v215 in v213:GetChildren() do
                    if v215:IsA("FloatCurve") then
                        for _, v217 in v215:GetKeys() do
                            v212 = math.max(v212, v217.Time);
                        end;
                    end;
                end;
                return;
            end;
        end;
        for _, v220 in v211 do
            v218(v220.pos);
            v218(v220.rot);
            v218(v220.faceControls);
        end;
        return v212;
    end;
    local function v228(v222, v223) --[[ Line: 708 ]] --[[ Name: calculateTransformsAtTime ]]
        local v224 = {};
        for v225, v226 in v223 do
            local v227 = if v226.pos then Vector3.new(unpack(v226.pos:GetValueAtTime(v222))) else Vector3.new(0, 0, 0, 0);
            v224[v225] = (if v226.rot then v226.rot:GetRotationAtTime(v222) else CFrame.new()) + v227;
        end;
        return v224;
    end;
    local function v234(v229, v230) --[[ Line: 718 ]] --[[ Name: calculatePositionMagnitudeResultsAtTime ]]
        local v231 = {};
        for v232, v233 in v230 do
            if v233.pos then
                v231[v232] = Vector3.new(unpack(v233.pos:GetValueAtTime(v229))).Magnitude;
            end;
        end;
        return v231;
    end;
    local v235 = v184(false);
    local v236 = {};
    for _, v238 in v235:GetChildren() do
        local l_Name_6 = v238.Name;
        local v240 = true;
        if not v44 then
            v44 = v8.getBodyPartsToParents();
        end;
        if v44[l_Name_6] == nil then
            v240 = l_Name_6 == "HumanoidRootPart";
        end;
        if v240 then
            v236[v238.Name] = v238;
        end;
    end;
    local v241 = v210();
    local v242 = v221(v241);
    local v243 = {};
    local v244 = {};
    local function _(v245) --[[ Line: 744 ]] --[[ Name: addData ]]
        -- upvalues: v228 (copy), v241 (copy), v8 (ref), v236 (copy), v243 (copy), v244 (copy), v234 (copy)
        local v246 = v228(v245, v241);
        local v247 = v8.calculateAllTransformsForFullBody(v236, v246);
        table.insert(v243, v247);
        table.insert(v244, (v234(v245, v241)));
    end;
    local v249 = 0;
    while v249 <= v242 do
        if v29() then
            local l_v249_0 = v249;
            local v251 = v228(l_v249_0, v241);
            table.insert(v243, (v8.calculateAllTransformsForFullBody(v236, v251)));
            table.insert(v244, (v234(l_v249_0, v241)));
        else
            local v252 = v228(v249, v241);
            table.insert(v243, (v8.calculateAllTransformsForFullBody(v236, v252)));
            table.insert(v244, (v234(v249, v241)));
        end;
        v249 = v249 + v185;
    end;
    if v29() and v242 >= 0 then
        local v253 = v228(v242, v241);
        table.insert(v243, (v8.calculateAllTransformsForFullBody(v236, v253)));
        table.insert(v244, (v234(v242, v241)));
    end;
    v235:Destroy();
    return v243, v242, v244, v241;
end;
v39.validateAnimationLength = function(v255, v256) --[[ Line: 777 ]] --[[ Name: validateAnimationLength ]]
    -- upvalues: v30 (copy), v31 (copy), v14 (copy), v32 (copy), v43 (copy), v3 (copy)
    local v257 = if v30() then v31.asNumber() else 0;
    if v255 <= v257 or v14.asNumber() < v255 then
        if v32() then
            return v43(("CurveAnimation must be between %* and %* seconds long. Please fix the animation."):format(v257, (v14.asString())), v3.ErrorType.validateCurveAnimation_UnacceptableLength, v256);
        else
            return v43(("CurveAnimation must be between 0 and %* seconds long. Please fix the animation."):format((v14.asString())), v3.ErrorType.validateCurveAnimation_UnacceptableLength, v256);
        end;
    else
        return true;
    end;
end;
v39.validateBounds = function(v258, v259, v260) --[[ Line: 804 ]] --[[ Name: validateBounds ]]
    -- upvalues: v32 (copy), v25 (copy), v15 (copy), v185 (copy), v43 (copy), v3 (copy), v7 (copy)
    local v261 = 1e999;
    local v262 = 0;
    local v263 = nil;
    local v264 = nil;
    if v32() then
        v263 = v25.asNumber();
        v264 = v15.asNumber();
    end;
    for v265, v266 in v258 do
        for v267, v268 in v266 do
            if v32() then
                if v268.Position.Y < v263 then
                    local v269 = string.format("In CurveAnimation at time %.2f seconds, body part %s is at height %.2f studs from the HumanoidRootPart. Body parts cannot be lower than %s studs from the HumanoidRootPart. Please fix the animation.", math.min(v260, (v265 - 1) * v185), v267, v268.Position.Y, v25.asString());
                    return v43(v269, v3.ErrorType.validateCurveAnimation_UnacceptableSizeBounds, v259);
                elseif v264 < v268.Position.Magnitude then
                    local v270 = string.format("In CurveAnimation at time %.2f seconds, body part %s is %.2f studs from the HumanoidRootPart. Body parts cannot be more than %s studs from the HumanoidRootPart. Please fix the animation.", math.min(v260, (v265 - 1) * v185), v267, v268.Position.Magnitude, v15.asString());
                    return v43(v270, v3.ErrorType.validateCurveAnimation_UnacceptableSizeBounds, v259);
                end;
            else
                v262 = math.max(v262, v268.Position.Magnitude);
                v261 = math.min(v261, v268.Position.Y);
            end;
        end;
    end;
    if not v32() then
        local v271 = v7.new();
        v271:updateReasons(v25.asNumber() <= v261, {
            (("Body parts in a CurveAnimation cannot be lower than %* studs from the HumanoidRootPart. Please fix the animation."):format((v25.asString())))
        });
        v271:updateReasons(v262 <= v15.asNumber(), {
            (("Body parts in a CurveAnimation cannot get more than %* studs from the HumanoidRootPart. Please fix the animation."):format((v15.asString())))
        });
        if not v271:getFinalResults() then
            v3.reportFailure(v3.ErrorType.validateCurveAnimation_UnacceptableSizeBounds, nil, v259);
        end;
        return v271:getFinalResults();
    else
        return true;
    end;
end;
v39.validateFrameDeltas = function(v272, v273) --[[ Line: 882 ]] --[[ Name: validateFrameDeltas ]]
    -- upvalues: v185 (copy), v16 (copy), v26 (copy), v43 (copy), v3 (copy)
    local v274 = v185 / 0.03333333333333333;
    local v275 = v16.asNumber() * v274;
    local v276 = nil;
    if v26() then
        v276 = v16.asNumber() * 30;
    end;
    local v277 = {};
    for v278, v279 in v272 do
        for v280, v281 in v279 do
            local v282 = v277[v280];
            if v282 then
                local l_Magnitude_0 = (v281.Position - v282.Position).Magnitude;
                if v275 < l_Magnitude_0 then
                    if v26() then
                        local v284 = (v278 - 1) * v185;
                        local v285 = l_Magnitude_0 / v274 * 30;
                        local v286 = string.format("In CurveAnimation at time %.2f seconds, body part %s is moving at a speed of %.2f studs/second. %.2f is the maximum studs/second speed. Please fix the animation.", v284, v280, v285, v276);
                        return v43(v286, v3.ErrorType.validateCurveAnimation_UnacceptableFrameDelta, v273);
                    else
                        return v43(("Body part %* in CurveAnimation moves more than %* studs between frames. Please fix the animation."):format(v280, (v16.asString())), v3.ErrorType.validateCurveAnimation_UnacceptableFrameDelta, v273);
                    end;
                end;
            end;
        end;
        v277 = v279;
    end;
    return true;
end;
v39.validateFrameRotationDeltas = function(v287, v288) --[[ Line: 940 ]] --[[ Name: validateFrameRotationDeltas ]]
    -- upvalues: v185 (copy), v20 (copy), v28 (copy), v43 (copy), v3 (copy)
    assert(math.abs(1 / v185 - v20()) < 1.0E-5, "frameDelta should be calculated as 1 / getFIntUGCValidateMaxAnimationFPS()");
    local v289 = v28();
    local v290 = v289 / v20();
    local v291 = {};
    for v292, v293 in v287 do
        for v294, v295 in v293 do
            local v296 = v291[v294];
            if v296 then
                local v297 = math.deg((math.abs((v295:AngleBetween(v296)))));
                if v290 < v297 then
                    local v298 = (v292 - 1) * v185;
                    local v299 = v297 * v20();
                    local v300 = string.format("In CurveAnimation at time %.2f seconds, body part %s is moving at a rotation speed of %.2f degrees/second. %.2f is the maximum degrees/second speed. Please fix the animation.", v298, v294, v299, v289);
                    return v43(v300, v3.ErrorType.validateCurveAnimation_UnacceptableFrameRotationDelta, v288);
                end;
            end;
        end;
        v291 = v293;
    end;
    return true;
end;
v39.validateMinimumTransformations = function(v301, v302) --[[ Line: 989 ]] --[[ Name: validateMinimumTransformations ]]
    -- upvalues: v43 (copy), v3 (copy)
    for _, v304 in v301 do
        if v304.pos or v304.rot then
            return true;
        end;
    end;
    return v43("CurveAnimation does not contain any joint manipulation.", v3.ErrorType.validateCurveAnimation_AnimationContainsNoJointManipulation, v302);
end;
v39.validateContainsJointManipulation = function(v305, v306) --[[ Line: 1006 ]] --[[ Name: validateContainsJointManipulation ]]
    -- upvalues: v18 (copy), v191 (copy), v44 (ref), v8 (copy), v43 (copy), v3 (copy)
    local v307 = nil;
    if v18() then
        local v308 = v191(v305);
        assert(v308, "ValidateCurveAnimation.validateStructure() ensures CurveAnimation has one and only one body part Folder child or HumanoidRootPart child.");
        v307 = v308:GetDescendants();
        table.insert(v307, v308);
    else
        v307 = v305:GetDescendants();
    end;
    for _, v310 in v307 do
        if v310:IsA("Folder") then
            if not v44 then
                v44 = v8.getBodyPartsToParents();
            end;
            if v44[v310.Name] then
                local l_Position_2 = v310:FindFirstChild("Position");
                local l_Rotation_1 = v310:FindFirstChild("Rotation");
                if l_Position_2 and l_Position_2:IsA("Vector3Curve") and l_Rotation_1 and l_Rotation_1:IsA("EulerRotationCurve") then
                    return true;
                end;
            end;
        end;
    end;
    return v43("CurveAnimation does not contain any joint manipulation.", v3.ErrorType.validateCurveAnimation_AnimationContainsNoJointManipulation, v306);
end;
local function _(v313) --[[ Line: 1043 ]] --[[ Name: isTimeStamp ]]
    if #v313 > 30 then
        return false;
    else
        return string.match(v313, "^[0-9]+$") ~= nil;
    end;
end;
v39.validateAllowedTags = function(v315, v316) --[[ Line: 1051 ]] --[[ Name: validateAllowedTags ]]
    -- upvalues: v11 (copy), l_CollectionService_0 (copy), v43 (copy), v3 (copy)
    local v317 = false;
    for _, v319 in v315:GetChildren() do
        local v320, v321 = v11(v319, v316);
        if not v320 then
            return v320, v321;
        end;
    end;
    local l_l_CollectionService_0_Tags_0 = l_CollectionService_0:GetTags(v315);
    local v323 = #l_l_CollectionService_0_Tags_0;
    if v323 > 0 then
        if v323 <= 1 then
            local v324 = l_l_CollectionService_0_Tags_0[1];
            v317 = #v324 <= 30 and string.match(v324, "^[0-9]+$") ~= nil;
        end;
        if not v317 then
            return v43("CurveAnimation can only contain a single timestamp tag. Please remove all other tags.", v3.ErrorType.validateTags, v316);
        end;
    end;
    v317 = false;
    return true;
end;
v39.validateStructure = function(v325, v326) --[[ Line: 1078 ]] --[[ Name: validateStructure ]]
    -- upvalues: v179 (copy)
    return v179(v325, v326);
end;
local function v335(...) --[[ Line: 1085 ]] --[[ Name: areNumbersGood ]]
    local function _(v327) --[[ Line: 1086 ]] --[[ Name: isNaN ]]
        return v327 ~= v327;
    end;
    local function _(v329) --[[ Line: 1090 ]] --[[ Name: isInfinite ]]
        local v330 = true;
        if v329 ~= 1e999 then
            v330 = v329 == -1e999;
        end;
        return v330;
    end;
    for _, v333 in {
        ...
    } do
        if v333 ~= v333 then
            return false;
        else
            local v334 = true;
            if v333 ~= 1e999 then
                v334 = v333 == -1e999;
            end;
            if v334 then
                return false;
            end;
        end;
    end;
    return true;
end;
v39.validateData = function(v336, v337) --[[ Line: 1105 ]] --[[ Name: validateData ]]
    -- upvalues: v185 (copy), v23 (copy), v14 (copy), v37 (copy), v38 (copy), v43 (copy), v3 (copy), v335 (copy), v21 (copy), v20 (copy)
    local v338 = v185 * v23.asNumber();
    local v339 = math.ceil(1 / v338 * v14.asNumber());
    for _, v341 in v336:GetDescendants() do
        if v341:IsA("MarkerCurve") then
            local l_v341_Markers_0 = v341:GetMarkers();
            if v37() then
                local v343 = math.min(v38(), v339);
                if v343 < #l_v341_Markers_0 then
                    return v43(("CurveAnimation contains a MarkerCurve with %* Markers. %* is the maximum per MarkerCurve. Please fix the animation."):format(#l_v341_Markers_0, v343), v3.ErrorType.validateCurveAnimation_IncorrectNumericalData, v337);
                end;
            elseif v339 < #l_v341_Markers_0 then
                return v43(("CurveAnimation contains MarkerCurve with too many markers. %* is the maximum per MarkerCurve. Please fix the animation."):format(v339), v3.ErrorType.validateCurveAnimation_IncorrectNumericalData, v337);
            end;
            for _, v345 in l_v341_Markers_0 do
                if not v345.Time or not v335(v345.Time) or not v345.Value or #v345.Value > v21() then
                    return v43("CurveAnimation contains MarkerCurves with invalid Time or Value, or Value is too long. Please fix the animation.", v3.ErrorType.validateCurveAnimation_IncorrectNumericalData, v337);
                end;
            end;
        elseif v341:IsA("FloatCurve") then
            local l_v341_Keys_0 = v341:GetKeys();
            if v339 < #l_v341_Keys_0 then
                return v43(("CurveAnimation contains Curves with too many keys. %* is the maximum per Curve. Please fix the animation."):format(v339), v3.ErrorType.validateCurveAnimation_IncorrectNumericalData, v337);
            else
                local v347 = nil;
                for _, v349 in l_v341_Keys_0 do
                    if not v349.Time or not v335(v349.Time) or not v349.Value or not v335(v349.Value) then
                        return v43("CurveAnimation contains Curves with invalid Time or Value. Please fix the animation.", v3.ErrorType.validateCurveAnimation_IncorrectNumericalData, v337);
                    else
                        if v347 then
                            if v347 + v338 > v349.Time then
                                local v350 = if v341.Parent.Parent then v341.Parent.Parent.Name else "-";
                                return v43(("CurveAnimation contains Curve %*.%*.%* with keys that are too close together in time for a maximum %* fps animation. Please fix the animation."):format(v350, v341.Parent.Name, v341.Name, (v20())), v3.ErrorType.validateCurveAnimation_IncorrectNumericalData, v337);
                            end;
                        elseif v349.Time < 0 then
                            local v351 = if v341.Parent.Parent then v341.Parent.Parent.Name else "-";
                            return v43(("CurveAnimation contains Curve %*.%*.%* with a key that has a negative time. Please fix the animation."):format(v351, v341.Parent.Name, v341.Name), v3.ErrorType.validateCurveAnimation_IncorrectNumericalData, v337);
                        end;
                        v347 = v349.Time;
                    end;
                end;
            end;
        end;
    end;
    return true;
end;
v39.validateCalculatedData = function(v352, v353, v354) --[[ Line: 1199 ]] --[[ Name: validateCalculatedData ]]
    -- upvalues: v335 (copy), v43 (copy), v3 (copy)
    for _, v356 in v352 do
        for _, v358 in v356 do
            if not v335(v358:GetComponents()) then
                return v43("CurveAnimation contains Curves with invalid numerical data. Please fix the animation.", v3.ErrorType.validateCurveAnimation_IncorrectNumericalData, v354);
            end;
        end;
    end;
    for _, v360 in v353 do
        for _, v362 in v360 do
            if not v335(v362) then
                return v43("CurveAnimation contains Curves with invalid numerical data. Please fix the animation.", v3.ErrorType.validateCurveAnimation_IncorrectNumericalData, v354);
            end;
        end;
    end;
    return true;
end;
v39.calculateAnimFramesAtOrigin = function(v363) --[[ Line: 1230 ]] --[[ Name: calculateAnimFramesAtOrigin ]]
    -- upvalues: v254 (copy)
    return v254(v363);
end;
v39.validatePositionMagnitudes = function(v364, v365) --[[ Line: 1236 ]] --[[ Name: validatePositionMagnitudes ]]
    -- upvalues: v4 (copy), v22 (copy), v43 (copy), v3 (copy)
    local v366 = {};
    for _, v368 in v364 do
        for v369, v370 in v368 do
            if v369 ~= v4.NAMED_R15_BODY_PARTS.LowerTorso then
                if not v366[v369] then
                    v366[v369] = v22.asNumber(v369);
                end;
                if v366[v369] < v370 then
                    return v43(("CurveAnimation contains positional separation of body parts. Only LowerTorso can change position. All other body parts can only change their orientation. %* moves more than %* studs from its parent. Please fix the animation."):format(v369, v366[v369]), v3.ErrorType.validateCurveAnimation_PositionalMovement, v365);
                end;
            end;
        end;
    end;
    return true;
end;
v39.validateFrames = function(v371, v372) --[[ Line: 1264 ]] --[[ Name: validateFrames ]]
    -- upvalues: v39 (copy), v7 (copy), v27 (copy)
    local v373, v374, v375, v376 = v39.calculateAnimFramesAtOrigin(v371);
    local v377, v378 = v39.validateCalculatedData(v373, v375, v372);
    if not v377 then
        return v377, v378;
    else
        local v379 = v7.new();
        v379:updateReasons(v39.validateMinimumTransformations(v376, v372));
        v379:updateReasons(v39.validatePositionMagnitudes(v375, v372));
        v379:updateReasons(v39.validateAnimationLength(v374, v372));
        v379:updateReasons(v39.validateBounds(v373, v372, v374));
        v379:updateReasons(v39.validateFrameDeltas(v373, v372));
        if v27() then
            v379:updateReasons(v39.validateFrameRotationDeltas(v373, v372));
        end;
        return v379:getFinalResults();
    end;
end;
v39.validate = function(v380, v381) --[[ Line: 1295 ]] --[[ Name: validate ]]
    -- upvalues: v39 (copy), v24 (copy), v12 (copy), v7 (copy), v10 (copy)
    local v382, v383 = v39.validateStructure(v380, v381);
    if not v382 then
        return v382, v383;
    else
        if v24() then
            local v384, v385 = v12.validate(v380, v381);
            if not v384 then
                return false, v385;
            end;
        end;
        local v386, v387 = v39.validateData(v380, v381);
        if not v386 then
            return v386, v387;
        else
            v386 = v7.new();
            v386:updateReasons(v10(v380, v381));
            v386:updateReasons(v39.validateAllowedTags(v380, v381));
            v386:updateReasons(v39.validateFrames(v380, v381));
            return v386:getFinalResults();
        end;
    end;
end;
return v39;