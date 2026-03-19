local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.calculateMinMax);
local v3 = require(l_Parent_0.util.getExpectedPartSize);
local v4 = require(l_Parent_0.ConstantsInterface);
local v5 = require(l_Parent_0.util.getPartNamesInHierarchyOrder);
local v24 = {
    calculateBounds = function(v6, v7, v8, v9, v10) --[[ Line: 21 ]] --[[ Name: calculateBounds ]]
        -- upvalues: v3 (copy), v2 (copy), v4 (copy)
        if v10 then
            local v11 = v3(v7, v10);
            local v12, v13 = v2(v9.minMeshCorner, v9.maxMeshCorner, v8:PointToWorldSpace(-(v11 / 2)), v8:PointToWorldSpace(-(v11 / 2)));
            v9.minMeshCorner = v12;
            v9.maxMeshCorner = v13;
            v12, v13 = v2(v9.minMeshCorner, v9.maxMeshCorner, v8:PointToWorldSpace(v11 / 2), v8:PointToWorldSpace(v11 / 2));
            v9.minMeshCorner = v12;
            v9.maxMeshCorner = v13;
        else
            local v14, v15 = v2(v9.minMeshCorner, v9.maxMeshCorner, v8:PointToWorldSpace(-(v7.Size / 2)), v8:PointToWorldSpace(-(v7.Size / 2)));
            v9.minMeshCorner = v14;
            v9.maxMeshCorner = v15;
            v14, v15 = v2(v9.minMeshCorner, v9.maxMeshCorner, v8:PointToWorldSpace(v7.Size / 2), v8:PointToWorldSpace(v7.Size / 2));
            v9.minMeshCorner = v14;
            v9.maxMeshCorner = v15;
        end;
        for _, v17 in v4.getAttachments(v6, v7.Name) do
            local l_v7_FirstChild_0 = v7:FindFirstChild(v17);
            assert(l_v7_FirstChild_0);
            if string.match(l_v7_FirstChild_0.Name, "RigAttachment$") ~= nil then
                local v19 = v8 * l_v7_FirstChild_0.CFrame;
                local v20, v21 = v2(v9.minRigAttachment, v9.maxRigAttachment, v19.Position, v19.Position);
                v9.minRigAttachment = v20;
                v9.maxRigAttachment = v21;
            end;
        end;
        local v22, v23 = v2(v9.minOverall, v9.maxOverall, v9.minMeshCorner, v9.maxMeshCorner);
        v9.minOverall = v22;
        v9.maxOverall = v23;
        v22, v23 = v2(v9.minOverall, v9.maxOverall, v9.minRigAttachment, v9.maxRigAttachment);
        v9.minOverall = v22;
        v9.maxOverall = v23;
    end
};
v24.traverseHierarchy = function(v25, v26, v27, v28, v29, v30, v31, v32, v33) --[[ Line: 93 ]] --[[ Name: traverseHierarchy ]]
    -- upvalues: v4 (copy), v24 (copy)
    local v34 = v26 and v27;
    assert(v25 ~= nil ~= (v34 ~= nil));
    local v35 = nil;
    v35 = if v25 then v25[v30] else v26:FindFirstChild(v30);
    assert(v35);
    local l_v29_0 = v29;
    if v28 then
        local v37 = nil;
        v37 = if v25 then v25[v28] else v26:FindFirstChild(v28);
        assert(v37);
        local v38 = v4.getRigAttachmentToParent(v27, v30);
        local l_v37_FirstChild_0 = v37:FindFirstChild(v38);
        assert(l_v37_FirstChild_0);
        local l_v35_FirstChild_0 = v35:FindFirstChild(v38);
        assert(l_v35_FirstChild_0);
        l_v29_0 = l_v29_0 * l_v37_FirstChild_0.CFrame * l_v35_FirstChild_0.CFrame:Inverse();
    else
        l_v29_0 = CFrame.new();
    end;
    v24.calculateBounds(v27, v35, l_v29_0, v32, v33);
    if v31.children then
        for v41, v42 in v31.children do
            v24.traverseHierarchy(v25, v26, v27, v30, l_v29_0, v41, v42, v32, v33);
        end;
    end;
end;
local v43 = nil;
local function v48() --[[ Line: 155 ]] --[[ Name: initRigParentToChild ]]
    -- upvalues: v43 (ref), v5 (copy)
    if v43 then
        return;
    else
        v43 = {};
        for _, v45 in {
            Enum.AssetType.LeftArm, 
            Enum.AssetType.RightArm, 
            Enum.AssetType.LeftLeg, 
            Enum.AssetType.RightLeg
        } do
            local v46 = v5(v45);
            v43[v45] = {};
            for v47 = 1, #v46 - 1 do
                v43[v45][v46[v47]] = v46[v47 + 1];
            end;
        end;
        return;
    end;
end;
v24.getAssetRigChild = function(v49, v50) --[[ Line: 171 ]] --[[ Name: getAssetRigChild ]]
    -- upvalues: v48 (copy), v43 (ref)
    v48();
    return assert(v43[v49], "Invalid asset type")[v50];
end;
v24.assetHierarchy = {
    [Enum.AssetType.DynamicHead] = {
        root = "Head"
    }, 
    [Enum.AssetType.Torso] = {
        root = "LowerTorso", 
        children = {
            UpperTorso = {}
        }
    }, 
    [Enum.AssetType.LeftArm] = {
        root = "LeftUpperArm", 
        children = {
            LeftLowerArm = {
                children = {
                    LeftHand = {}
                }
            }
        }
    }, 
    [Enum.AssetType.RightArm] = {
        root = "RightUpperArm", 
        children = {
            RightLowerArm = {
                children = {
                    RightHand = {}
                }
            }
        }
    }, 
    [Enum.AssetType.LeftLeg] = {
        root = "LeftUpperLeg", 
        children = {
            LeftLowerLeg = {
                children = {
                    LeftFoot = {}
                }
            }
        }
    }, 
    [Enum.AssetType.RightLeg] = {
        root = "RightUpperLeg", 
        children = {
            RightLowerLeg = {
                children = {
                    RightFoot = {}
                }
            }
        }
    }
};
return v24;