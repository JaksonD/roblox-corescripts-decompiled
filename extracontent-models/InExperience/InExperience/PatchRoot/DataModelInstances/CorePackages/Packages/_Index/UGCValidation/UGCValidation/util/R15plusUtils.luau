local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Constants);
local _ = require(l_Parent_0.util.Types);
local v3 = {};
local v4 = nil;
local l_flags_0 = l_Parent_0.flags;
local v6 = require(l_flags_0.getFFlagUGCValidationAllowHRDUpload);
local v7 = require(l_flags_0.getFFlagDebugAllowHRDUploadOnBundleBackend);
local v8 = require(l_flags_0.getFFlagUGCValidationExtendSchemaToIgnoreDescendants);
local v9 = {
    "Index", 
    "Middle", 
    "Pinky", 
    "Ring", 
    "Thumb"
};
local function v18(v10) --[[ Line: 16 ]] --[[ Name: buildDrdSchema ]]
    -- upvalues: v9 (copy)
    local v11 = {};
    for _, v13 in v9 do
        local v14 = ("%*Hand%*"):format(v10, v13);
        local v15 = ("%*1"):format(v14);
        local v16 = ("%*2"):format(v14);
        local v17 = ("%*3"):format(v14);
        v11[v15] = {
            ClassName = "Bone", 
            _children = {
                [v16] = {
                    ClassName = "Bone", 
                    _children = {
                        [v17] = {
                            ClassName = "Bone"
                        }
                    }
                }
            }
        };
    end;
    return v11;
end;
local v19 = {
    HeadBase = {
        ClassName = "Bone", 
        _children = {
            FaceCenterAttachment = {
                ClassName = "Attachment"
            }, 
            FaceFrontAttachment = {
                ClassName = "Attachment"
            }, 
            HairAttachment = {
                ClassName = "Attachment"
            }, 
            HatAttachment = {
                ClassName = "Attachment"
            }
        }
    }
};
local v20 = {
    Spine = {
        ClassName = "Bone", 
        _children = {
            Chest = {
                ClassName = "Bone", 
                _children = {
                    BodyBackAttachment = {
                        ClassName = "Attachment"
                    }, 
                    BodyFrontAttachment = {
                        ClassName = "Attachment"
                    }, 
                    NeckRigAttachment = {
                        ClassName = "Attachment"
                    }, 
                    NeckAttachment = {
                        ClassName = "Attachment"
                    }, 
                    LeftClavicle = {
                        ClassName = "Bone", 
                        _children = {
                            LeftCollarAttachment = {
                                ClassName = "Attachment"
                            }, 
                            LeftShoulderRigAttachment = {
                                ClassName = "Attachment"
                            }
                        }
                    }, 
                    RightClavicle = {
                        ClassName = "Bone", 
                        _children = {
                            RightCollarAttachment = {
                                ClassName = "Attachment"
                            }, 
                            RightShoulderRigAttachment = {
                                ClassName = "Attachment"
                            }
                        }
                    }
                }
            }
        }
    }
};
local v21 = {
    LeftToeBase = {
        ClassName = "Bone"
    }
};
local v22 = {
    RightToeBase = {
        ClassName = "Bone"
    }
};
local v23 = v18("Left");
local v24 = v18("Right");
v3.JointRotationName = "JointRotation";
local v25 = false;
v3.setIsBackendBundleUpload = function(v26) --[[ Line: 128 ]] --[[ Name: setIsBackendBundleUpload ]]
    -- upvalues: v25 (ref)
    v25 = v26;
end;
v3.checkFlagEnabledForAllowHrd = function() --[[ Line: 132 ]] --[[ Name: checkFlagEnabledForAllowHrd ]]
    -- upvalues: v8 (copy), v6 (copy), v7 (copy), v25 (ref)
    if not v8() then
        return false;
    elseif v6() then
        return true;
    elseif v7() and v25 then
        return true;
    else
        return false;
    end;
end;
local v27 = nil;
local v28 = nil;
v3.getHrdJointLabels = function() --[[ Line: 155 ]] --[[ Name: getHrdJointLabels ]]
    -- upvalues: v27 (ref)
    if v27 == nil then
        v27 = Instance.new("HumanoidRigDescription"):GetJointLabels();
    end;
    return v27;
end;
v3.getDrdJointLabels = function() --[[ Line: 162 ]] --[[ Name: getDrdJointLabels ]]
    -- upvalues: v28 (ref)
    if v28 == nil then
        v28 = Instance.new("DigitsRigDescription"):GetJointLabels();
    end;
    return v28;
end;
v3.getJointNameWhitelist = function() --[[ Line: 169 ]] --[[ Name: getJointNameWhitelist ]]
    -- upvalues: v4 (ref), v1 (copy), v3 (copy)
    if v4 ~= nil then
        return v4;
    else
        v4 = {};
        for v29, _ in v1.R15_STANDARD_JOINT_NAMES do
            v4[v29] = true;
        end;
        for _, v32 in v3.getHrdJointLabels() do
            v4[v32.Name] = true;
        end;
        for _, v34 in v3.getDrdJointLabels() do
            v4[("LeftHand%*"):format(v34.Name)] = true;
            v4[("RightHand%*"):format(v34.Name)] = true;
        end;
        return v4;
    end;
end;
v3.getNameWhitelistOfClassInSchema = function(v35, v36) --[[ Line: 191 ]] --[[ Name: getNameWhitelistOfClassInSchema ]]
    -- upvalues: v3 (copy)
    local v37 = {};
    for v38, v39 in v35 do
        if v39.ClassName == v36 then
            v37[v38] = true;
        end;
        if v39._children ~= nil then
            for v40, v41 in v3.getNameWhitelistOfClassInSchema(v39._children, v36) do
                v37[v40] = v41;
            end;
        end;
    end;
    return v37;
end;
v3.getSchemaFlatHierarchyList = function(v42, v43) --[[ Line: 211 ]] --[[ Name: getSchemaFlatHierarchyList ]]
    -- upvalues: v3 (copy)
    local v44 = {};
    for v45, v46 in v42 do
        local v47 = table.clone(v43);
        table.insert(v47, v45);
        v44[v45] = {
            ClassName = v46.ClassName, 
            path = v47
        };
        if v46._children ~= nil then
            for v48, v49 in v3.getSchemaFlatHierarchyList(v46._children, v47) do
                v44[v48] = v49;
            end;
        end;
    end;
    return v44;
end;
v3.getFingerFlatSuffixes = function() --[[ Line: 235 ]] --[[ Name: getFingerFlatSuffixes ]]
    -- upvalues: v9 (copy)
    return v9;
end;
v3.getDrdSchema = function(v50) --[[ Line: 239 ]] --[[ Name: getDrdSchema ]]
    -- upvalues: v23 (copy), v24 (copy)
    if v50 == "Left" then
        return v23;
    elseif v50 == "Right" then
        return v24;
    else
        error("Invalid side: " .. v50);
        return;
    end;
end;
v3.getAvatarBoneSchema = function(v51) --[[ Line: 249 ]] --[[ Name: getAvatarBoneSchema ]]
    -- upvalues: v19 (copy), v20 (copy), v21 (copy), v22 (copy), v23 (copy), v24 (copy)
    if v51 == "Head" then
        return v19;
    elseif v51 == "UpperTorso" then
        return v20;
    elseif v51 == "LeftFoot" then
        return v21;
    elseif v51 == "RightFoot" then
        return v22;
    elseif v51 == "LeftHand" then
        return v23;
    elseif v51 == "RightHand" then
        return v24;
    else
        return {};
    end;
end;
return v3;