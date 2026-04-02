local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.calculateMinMax);
local v3 = require(l_Parent_0.util.getExpectedPartSize);
local v4 = require(l_Parent_0.ConstantsInterface);
local v5 = require(l_Parent_0.util.getPartNamesInHierarchyOrder);
local v6 = require(l_Parent_0.util.R15plusUtils);
local v7 = require(l_Parent_0.util.getAttachmentCFrameInPartSpace);
local v26 = {
    calculateBounds = function(v8, v9, v10, v11, v12) --[[ Line: 25 ]] --[[ Name: calculateBounds ]]
        -- upvalues: v3 (copy), v2 (copy), v4 (copy), v6 (copy), v7 (copy)
        if v12 then
            local v13 = v3(v9, v12);
            local v14, v15 = v2(v11.minMeshCorner, v11.maxMeshCorner, v10:PointToWorldSpace(-(v13 / 2)), v10:PointToWorldSpace(-(v13 / 2)));
            v11.minMeshCorner = v14;
            v11.maxMeshCorner = v15;
            v14, v15 = v2(v11.minMeshCorner, v11.maxMeshCorner, v10:PointToWorldSpace(v13 / 2), v10:PointToWorldSpace(v13 / 2));
            v11.minMeshCorner = v14;
            v11.maxMeshCorner = v15;
        else
            local v16, v17 = v2(v11.minMeshCorner, v11.maxMeshCorner, v10:PointToWorldSpace(-(v9.Size / 2)), v10:PointToWorldSpace(-(v9.Size / 2)));
            v11.minMeshCorner = v16;
            v11.maxMeshCorner = v17;
            v16, v17 = v2(v11.minMeshCorner, v11.maxMeshCorner, v10:PointToWorldSpace(v9.Size / 2), v10:PointToWorldSpace(v9.Size / 2));
            v11.minMeshCorner = v16;
            v11.maxMeshCorner = v17;
        end;
        for _, v19 in v4.getAttachments(v8, v9.Name) do
            local l_v9_FirstChild_0 = v9:FindFirstChild(v19, v6.checkFlagEnabledForAllowHrd());
            assert(l_v9_FirstChild_0);
            if string.match(l_v9_FirstChild_0.Name, "RigAttachment$") ~= nil then
                local v21 = v10 * v7(l_v9_FirstChild_0);
                local v22, v23 = v2(v11.minRigAttachment, v11.maxRigAttachment, v21.Position, v21.Position);
                v11.minRigAttachment = v22;
                v11.maxRigAttachment = v23;
            end;
        end;
        local v24, v25 = v2(v11.minOverall, v11.maxOverall, v11.minMeshCorner, v11.maxMeshCorner);
        v11.minOverall = v24;
        v11.maxOverall = v25;
        v24, v25 = v2(v11.minOverall, v11.maxOverall, v11.minRigAttachment, v11.maxRigAttachment);
        v11.minOverall = v24;
        v11.maxOverall = v25;
    end
};
v26.traverseHierarchy = function(v27, v28, v29, v30, v31, v32, v33, v34, v35) --[[ Line: 98 ]] --[[ Name: traverseHierarchy ]]
    -- upvalues: v4 (copy), v6 (copy), v7 (copy), v26 (copy)
    local v36 = v28 and v29;
    assert(v27 ~= nil ~= (v36 ~= nil));
    local v37 = nil;
    v37 = if v27 then v27[v32] else v28:FindFirstChild(v32);
    assert(v37);
    local l_v31_0 = v31;
    if v30 then
        local v39 = nil;
        v39 = if v27 then v27[v30] else v28:FindFirstChild(v30);
        assert(v39);
        local v40 = v4.getRigAttachmentToParent(v29, v32);
        local l_v39_FirstChild_0 = v39:FindFirstChild(v40, v6.checkFlagEnabledForAllowHrd());
        assert(l_v39_FirstChild_0);
        local l_v37_FirstChild_0 = v37:FindFirstChild(v40, v6.checkFlagEnabledForAllowHrd());
        assert(l_v37_FirstChild_0);
        l_v31_0 = l_v31_0 * v7(l_v39_FirstChild_0) * v7(l_v37_FirstChild_0):Inverse();
    else
        l_v31_0 = CFrame.new();
    end;
    v26.calculateBounds(v29, v37, l_v31_0, v34, v35);
    if v33.children then
        for v43, v44 in v33.children do
            v26.traverseHierarchy(v27, v28, v29, v32, l_v31_0, v43, v44, v34, v35);
        end;
    end;
end;
local v45 = nil;
local function v50() --[[ Line: 163 ]] --[[ Name: initRigParentToChild ]]
    -- upvalues: v45 (ref), v5 (copy)
    if v45 then
        return;
    else
        v45 = {};
        for _, v47 in {
            Enum.AssetType.LeftArm, 
            Enum.AssetType.RightArm, 
            Enum.AssetType.LeftLeg, 
            Enum.AssetType.RightLeg
        } do
            local v48 = v5(v47);
            v45[v47] = {};
            for v49 = 1, #v48 - 1 do
                v45[v47][v48[v49]] = v48[v49 + 1];
            end;
        end;
        return;
    end;
end;
v26.getAssetRigChild = function(v51, v52) --[[ Line: 179 ]] --[[ Name: getAssetRigChild ]]
    -- upvalues: v50 (copy), v45 (ref)
    v50();
    return assert(v45[v51], "Invalid asset type")[v52];
end;
v26.assetHierarchy = {
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
return v26;