local l_AvatarCreationService_0 = game:GetService("AvatarCreationService");
local v23 = {
    rigAttachmentToParentMap = {
        Head = "NeckRigAttachment", 
        UpperTorso = "WaistRigAttachment", 
        LowerTorso = "RootRigAttachment", 
        RightHand = "RightWristRigAttachment", 
        RightLowerArm = "RightElbowRigAttachment", 
        RightUpperArm = "RightShoulderRigAttachment", 
        LeftHand = "LeftWristRigAttachment", 
        LeftLowerArm = "LeftElbowRigAttachment", 
        LeftUpperArm = "LeftShoulderRigAttachment", 
        RightFoot = "RightAnkleRigAttachment", 
        RightLowerLeg = "RightKneeRigAttachment", 
        RightUpperLeg = "RightHipRigAttachment", 
        LeftFoot = "LeftAnkleRigAttachment", 
        LeftLowerLeg = "LeftKneeRigAttachment", 
        LeftUpperLeg = "LeftHipRigAttachment"
    }, 
    getRules = function(v1) --[[ Line: 35 ]] --[[ Name: getRules ]]
        -- upvalues: l_AvatarCreationService_0 (copy)
        if not v1.rules then
            v1.rules = l_AvatarCreationService_0:GetValidationRules();
        end;
        return v1.rules;
    end, 
    getBodyPartMaxTrianglesRule = function(v2, v3) --[[ Line: 43 ]] --[[ Name: getBodyPartMaxTrianglesRule ]]
        return v2:getRules().MeshRules.BodyPartMaxTriangles[v3];
    end, 
    getMakeupRules = function(v4) --[[ Line: 47 ]] --[[ Name: getMakeupRules ]]
        local l_MakeupRules_0 = v4:getRules().MakeupRules;
        local v6 = {};
        for v7, v8 in l_MakeupRules_0 do
            if v7 ~= "ExcludeUVBounds" and v7 ~= "IncludeUVBounds" then
                v6[v7] = v8;
            end;
        end;
        local v9 = {};
        for v10, v11 in l_MakeupRules_0.ExcludeUVBounds do
            if not v9[v10] then
                v9[v10] = {};
            end;
            for _, v13 in v11 do
                table.insert(v9[v10], {
                    isIncludeBound = false, 
                    MinBound = v13.MinBound, 
                    MaxBound = v13.MaxBound
                });
            end;
        end;
        for v14, v15 in l_MakeupRules_0.IncludeUVBounds do
            if not v9[v14] then
                v9[v14] = {};
            end;
            table.insert(v9[v14], {
                isIncludeBound = true, 
                MinBound = v15.MinBound, 
                MaxBound = v15.MaxBound
            });
        end;
        v6.AssetUVBounds = v9;
        return v6;
    end, 
    getAccessoryRules = function(v16, v17) --[[ Line: 88 ]] --[[ Name: getAccessoryRules ]]
        for v18, v19 in v16:getRules().AccessoryRules do
            local v20 = {
                rigidAllowed = v19.RigidAllowed, 
                attachmentNames = {}, 
                bounds = {}
            };
            for _, v22 in v19.Attachments do
                table.insert(v20.attachmentNames, v22.Name);
                v20.bounds[v22.Name] = {
                    size = v22.Size, 
                    offset = v22.Offset
                };
            end;
            v17[v18] = v20;
        end;
    end
};
v23.getBodyPartRules = function(v24, v25) --[[ Line: 106 ]] --[[ Name: getBodyPartRules ]]
    -- upvalues: v23 (copy)
    for v26, v27 in v24:getRules().BodyPartRules do
        local v28 = {
            isBodyPart = true, 
            bounds = {}, 
            subParts = {}
        };
        for v29, v30 in v27.Bounds do
            v28.bounds[v29] = {
                minSize = v30.MinSize, 
                maxSize = v30.MaxSize
            };
        end;
        for v31, v32 in v27.SubParts do
            local v33 = {
                rigAttachmentToParent = {}, 
                otherAttachments = {}
            };
            local v34 = v23.rigAttachmentToParentMap[v31];
            for v35, v36 in v32 do
                if v34 == v35 then
                    v33.rigAttachmentToParent = {
                        name = v35, 
                        bounds = {
                            min = v36.LowerBound, 
                            max = v36.UpperBound
                        }
                    };
                else
                    v33.otherAttachments[v35] = {
                        bounds = {
                            min = v36.LowerBound, 
                            max = v36.UpperBound
                        }
                    };
                end;
            end;
            v28.subParts[v31] = v33;
        end;
        v25[v26] = v28;
    end;
end;
v23.getFullBodyRulesBounds = function(v37) --[[ Line: 149 ]] --[[ Name: getFullBodyRulesBounds ]]
    local v38 = {};
    for v39, v40 in v37:getRules().FullBodyRules.Bounds do
        v38[v39] = {
            minSize = v40.MinSize, 
            maxSize = v40.MaxSize
        };
    end;
    return v38;
end;
return v23;