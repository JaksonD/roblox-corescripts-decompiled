local v0 = {};
local function v6(v1) --[[ Line: 11 ]] --[[ Name: getHeadAttachments ]]
    local v2 = {};
    local l_Head_0 = v1:FindFirstChild("Head");
    if l_Head_0 then
        for _, v5 in pairs(l_Head_0:GetChildren()) do
            if v5:IsA("Attachment") then
                v2[v5.Name] = true;
            end;
        end;
    end;
    return v2;
end;
local function _(v7, v8, v9, v10, v11) --[[ Line: 32 ]] --[[ Name: makeRotatedCorner ]]
    return v11 * Vector3.new(v7 * v10.X, v8 * v10.Y, v9 * v10.Z);
end;
local function v16(v13, v14, v15) --[[ Line: 41 ]] --[[ Name: growExtentsToIncludePoint ]]
    return Vector3.new(math.min(v15.X, v13.X), math.min(v15.Y, v13.Y), (math.min(v15.Z, v13.Z))), (Vector3.new(math.max(v15.X, v14.X), math.max(v15.Y, v14.Y), (math.max(v15.Z, v14.Z))));
end;
local function v31(v17, v18, v19, v20, v21, v22) --[[ Line: 68 ]] --[[ Name: growExtentsToInclude ]]
    -- upvalues: v16 (copy)
    local v23 = v19.Size / 2;
    local v24 = nil;
    for v25 = -1, 1, 2 do
        for v26 = -1, 1, 2 do
            for v27 = -1, 1, 2 do
                v24 = v19.CFrame * Vector3.new(v25 * v23.X, v26 * v23.Y, v27 * v23.Z);
                if v21 and v22 then
                    local v28 = v21:Inverse() * v24;
                    v24 = v21 * Vector3.new(v28.X, math.max(v22, v28.Y), v28.Z);
                end;
                v24 = v20 * v24;
                local v29, v30 = v16(v17, v18, v24);
                v17 = v29;
                v18 = v30;
            end;
        end;
    end;
    return v17, v18;
end;
local function _() --[[ Line: 103 ]] --[[ Name: initExtents ]]
    return Vector3.new(1e999, 1e999, 1e999, 0), (Vector3.new(-1e999, -1e999, -1e999, 0));
end;
local function v33(v34, v35, v36, v37, v38) --[[ Line: 118 ]] --[[ Name: recursiveCalculateExtents ]]
    -- upvalues: v31 (copy), v33 (copy)
    if not v38 then
        v38 = "";
    end;
    assert(v38, "indent is non-nil. Silence type checker.");
    v38 = v38 .. "  ";
    for _, v40 in pairs(v36:GetChildren()) do
        if v40:IsA("BasePart") then
            local v41, v42 = v31(v34, v35, v40, v37);
            v34 = v41;
            v35 = v42;
        end;
        local v43, v44 = v33(v34, v35, v40, v37, v38);
        v34 = v43;
        v35 = v44;
    end;
    return v34, v35;
end;
v0.CalculateModelExtents = function(v45, v46) --[[ Line: 145 ]]
    -- upvalues: v33 (copy)
    local v47 = Vector3.new(1e999, 1e999, 1e999, 0);
    local v48 = Vector3.new(-1e999, -1e999, -1e999, 0);
    local v49 = v46:Inverse();
    local v50, v51 = v33(v47, v48, v45, v49, "  ");
    return v50, v51;
end;
v0.CalculateHeadExtents = function(v52, v53) --[[ Line: 160 ]]
    -- upvalues: v31 (copy), v6 (copy)
    local v54 = Vector3.new(1e999, 1e999, 1e999, 0);
    local v55 = Vector3.new(-1e999, -1e999, -1e999, 0);
    local l_Head_1 = v52:FindFirstChild("Head");
    if not l_Head_1 then
        return v54, v55;
    else
        local v57 = v53:Inverse();
        local v58 = -l_Head_1.Size.Y / 2;
        local v59, v60 = v31(v54, v55, l_Head_1, v57);
        v54 = v59;
        v55 = v60;
        v59 = v6(v52);
        for _, v62 in pairs(v52:GetChildren()) do
            if v62:IsA("Accoutrement") then
                local l_Handle_0 = v62:FindFirstChild("Handle");
                if l_Handle_0 then
                    local l_Attachment_0 = l_Handle_0:FindFirstChildWhichIsA("Attachment");
                    if not l_Attachment_0 or v59[l_Attachment_0.Name] then
                        local v65, v66 = v31(v54, v55, l_Handle_0, v57, l_Head_1.CFrame, v58);
                        v54 = v65;
                        v55 = v66;
                    end;
                end;
            end;
        end;
        return v54, v55;
    end;
end;
v0.CalculateBodyPartsExtents = function(v67, v68) --[[ Line: 201 ]]
    -- upvalues: v31 (copy)
    local v69 = Vector3.new(1e999, 1e999, 1e999, 0);
    local v70 = Vector3.new(-1e999, -1e999, -1e999, 0);
    local v71 = v67:Inverse();
    for _, v73 in pairs(v68) do
        local v74, v75 = v31(v69, v70, v73, v71, v67);
        v69 = v74;
        v70 = v75;
    end;
    return v69, v70;
end;
v0.AllocateDebugExtentParts = function() --[[ Line: 217 ]]
    local v76 = {};
    for v77 = 1, 8 do
        local l_Part_0 = Instance.new("Part");
        l_Part_0.Parent = workspace;
        l_Part_0.Name = "DebugExtentPart" .. tostring(v77);
        l_Part_0.Shape = Enum.PartType.Ball;
        l_Part_0.Size = Vector3.new(0.25, 0.25, 0.25, 0);
        l_Part_0.Anchored = true;
        l_Part_0.CanCollide = false;
        v76[#v76 + 1] = l_Part_0;
    end;
    return v76;
end;
v0.PositionDebugExtentParts = function(v79, v80, v81, v82) --[[ Line: 237 ]]
    for v83 = 0, 1 do
        for v84 = 0, 1 do
            for v85 = 0, 1 do
                local v86 = v83 + v84 * 2 + v85 * 4 + 1;
                local v87 = Vector3.new(v83 == 0 and v80.X or v81.X, v84 == 0 and v80.Y or v81.Y, v85 == 0 and v80.Z or v81.Z);
                v79[v86].Position = v82 * v87;
            end;
        end;
    end;
end;
return v0;