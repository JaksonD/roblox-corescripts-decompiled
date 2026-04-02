local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.Constants);
local v3 = require(l_Parent_0.util.R15plusUtils);
local l_flags_0 = l_Parent_0.flags;
local v5 = require(l_flags_0.getFFlagUGCValidationEnforceHRDUpload);
local v6 = {
    LeftHand = "LeftHand", 
    RightHand = "RightHand"
};
return function(v7, v8, _) --[[ Line: 14 ]] --[[ Name: createIndividualBodyPartSchema ]]
    -- upvalues: v2 (copy), v3 (copy), v5 (copy), v6 (copy)
    local v10 = v2.ASSET_TYPE_INFO[v7].subParts[v8];
    local v11 = {
        ClassName = "MeshPart", 
        Name = {
            v8
        }, 
        _children = {
            {
                Name = {
                    "AvatarPartScaleType"
                }, 
                ClassName = "StringValue"
            }, 
            {
                Name = {
                    v8, 
                    v8 .. "WrapTarget", 
                    "WrapTarget"
                }, 
                ClassName = "WrapTarget"
            }, 
            {
                Name = {
                    "SurfaceAppearance"
                }, 
                ClassName = "SurfaceAppearance", 
                _optional = true
            }
        }
    };
    table.insert(v11._children, {
        Name = {
            v10.rigAttachmentToParent.name
        }, 
        ClassName = "Attachment"
    });
    for v12 in pairs(v10.otherAttachments) do
        table.insert(v11._children, {
            Name = {
                v12
            }, 
            ClassName = "Attachment"
        });
    end;
    if v3.checkFlagEnabledForAllowHrd() then
        table.insert(v11._children, {
            Name = {
                "HumanoidRigDescription"
            }, 
            ClassName = "HumanoidRigDescription", 
            _optional = not v5()
        });
        if v6[v8] ~= nil then
            local v13 = ("%*Description"):format(v6[v8]);
            table.insert(v11._children, {
                Name = {
                    "DigitsRigDescription", 
                    v13
                }, 
                ClassName = "DigitsRigDescription", 
                _optional = true
            });
        end;
        local v14 = v3.getAvatarBoneSchema(v8);
        local v15 = v3.getNameWhitelistOfClassInSchema(v14, "Attachment");
        for _, v17 in v11._children do
            if v17.ClassName == "Attachment" and v15[v17.Name[1]] then
                v17._optional = true;
            end;
            if string.find(v17.Name[1], "ShoulderRigAttachment") then
                if v17._children == nil then
                    v17._children = {};
                end;
                table.insert(v17._children, {
                    Name = {
                        v3.JointRotationName
                    }, 
                    ClassName = "Attachment", 
                    _optional = true
                });
            end;
        end;
        for v18, v19 in (v3.getNameWhitelistOfClassInSchema(v14, "Bone")) do
            if v19 then
                table.insert(v11._children, {
                    Name = {
                        v18
                    }, 
                    ClassName = "Bone", 
                    _optional = true, 
                    _ignoreDescendants = true
                });
            end;
        end;
    end;
    return v11;
end;