local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.AssetTraversalUtils);
local v3 = require(l_Parent_0.ConstantsInterface);
return function(v4, v5, v6, v7, v8) --[[ Line: 10 ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v9 = {};
    if Enum.AssetType.DynamicHead == v7 then
        v2.calculateBounds(v7, v6, CFrame.new(), v9, v8);
        v4.CFrame = CFrame.new();
        v5.CFrame = CFrame.new();
        v4.Size = v5.Size;
    else
        local v10 = v2.assetHierarchy[v7];
        v2.traverseHierarchy(nil, v6, v7, nil, CFrame.new(), v10.root, v10, v9, v8);
        local function v11(v12, v13, v14, v15, v16) --[[ Line: 43 ]] --[[ Name: moveParts ]]
            -- upvalues: v3 (ref), v7 (copy), v11 (copy)
            local l_v12_FirstChild_0 = v12:FindFirstChild(v15);
            local l_v14_0 = v14;
            if v13 then
                local l_v12_FirstChild_1 = v12:FindFirstChild(v13);
                local v20 = v3.getRigAttachmentToParent(v7, v15);
                local l_l_v12_FirstChild_1_FirstChild_0 = l_v12_FirstChild_1:FindFirstChild(v20);
                local l_l_v12_FirstChild_0_FirstChild_0 = l_v12_FirstChild_0:FindFirstChild(v20);
                l_v14_0 = l_v14_0 * l_l_v12_FirstChild_1_FirstChild_0.CFrame * l_l_v12_FirstChild_0_FirstChild_0.CFrame:Inverse();
            end;
            l_v12_FirstChild_0.CFrame = l_v14_0;
            if v16.children then
                for v23, v24 in v16.children do
                    v11(v12, v15, l_v14_0, v23, v24);
                end;
            end;
        end;
        local v25 = CFrame.new();
        local l_root_0 = v10.root;
        local l_v5_FirstChild_0 = v5:FindFirstChild(l_root_0);
        local l_v25_0 = v25;
        l_v5_FirstChild_0.CFrame = l_v25_0;
        if v10.children then
            for v29, v30 in v10.children do
                v11(v5, l_root_0, l_v25_0, v29, v30);
            end;
        end;
        v25 = Vector3.new();
        l_root_0 = Vector3.new();
        v25 = if v9.maxOverall then v9.maxOverall else Vector3.new();
        l_root_0 = if v9.minOverall then v9.minOverall else Vector3.new();
        if v9.minOverall == nil or v9.maxOverall == nil then
            return false;
        else
            v4.Size = Vector3.new(v25.X - l_root_0.X, v25.Y - l_root_0.Y, v25.Z - l_root_0.Z);
            v4.Position = Vector3.new(l_root_0.X + v4.Size.X / 2, l_root_0.Y + v4.Size.Y / 2, l_root_0.Z + v4.Size.Z / 2);
        end;
    end;
    return true;
end;