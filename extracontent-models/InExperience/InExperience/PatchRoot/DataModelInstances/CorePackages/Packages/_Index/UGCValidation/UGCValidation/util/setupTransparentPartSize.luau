local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.AssetTraversalUtils);
local v3 = require(l_Parent_0.ConstantsInterface);
local v4 = require(l_Parent_0.util.R15plusUtils);
local v5 = require(l_Parent_0.util.getAttachmentCFrameInPartSpace);
return function(v6, v7, v8, v9, v10) --[[ Line: 15 ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), v5 (copy)
    local v11 = {};
    if Enum.AssetType.DynamicHead == v9 then
        v2.calculateBounds(v9, v8, CFrame.new(), v11, v10);
        v6.CFrame = CFrame.new();
        v7.CFrame = CFrame.new();
        v6.Size = v7.Size;
    else
        local v12 = v2.assetHierarchy[v9];
        v2.traverseHierarchy(nil, v8, v9, nil, CFrame.new(), v12.root, v12, v11, v10);
        local function v13(v14, v15, v16, v17, v18) --[[ Line: 48 ]] --[[ Name: moveParts ]]
            -- upvalues: v3 (ref), v9 (copy), v4 (ref), v5 (ref), v13 (copy)
            local l_v14_FirstChild_0 = v14:FindFirstChild(v17);
            local l_v16_0 = v16;
            if v15 then
                local l_v14_FirstChild_1 = v14:FindFirstChild(v15);
                local v22 = v3.getRigAttachmentToParent(v9, v17);
                local l_l_v14_FirstChild_1_FirstChild_0 = l_v14_FirstChild_1:FindFirstChild(v22, v4.checkFlagEnabledForAllowHrd());
                local l_l_v14_FirstChild_0_FirstChild_0 = l_v14_FirstChild_0:FindFirstChild(v22, v4.checkFlagEnabledForAllowHrd());
                l_v16_0 = l_v16_0 * v5(l_l_v14_FirstChild_1_FirstChild_0) * v5(l_l_v14_FirstChild_0_FirstChild_0):Inverse();
            end;
            l_v14_FirstChild_0.CFrame = l_v16_0;
            if v18.children then
                for v25, v26 in v18.children do
                    v13(v14, v17, l_v16_0, v25, v26);
                end;
            end;
        end;
        local v27 = CFrame.new();
        local l_root_0 = v12.root;
        local l_v7_FirstChild_0 = v7:FindFirstChild(l_root_0);
        local l_v27_0 = v27;
        l_v7_FirstChild_0.CFrame = l_v27_0;
        if v12.children then
            for v31, v32 in v12.children do
                v13(v7, l_root_0, l_v27_0, v31, v32);
            end;
        end;
        v27 = Vector3.new();
        l_root_0 = Vector3.new();
        v27 = if v11.maxOverall then v11.maxOverall else Vector3.new();
        l_root_0 = if v11.minOverall then v11.minOverall else Vector3.new();
        if v11.minOverall == nil or v11.maxOverall == nil then
            return false;
        else
            v6.Size = Vector3.new(v27.X - l_root_0.X, v27.Y - l_root_0.Y, v27.Z - l_root_0.Z);
            v6.Position = Vector3.new(l_root_0.X + v6.Size.X / 2, l_root_0.Y + v6.Size.Y / 2, l_root_0.Z + v6.Size.Z / 2);
        end;
    end;
    return true;
end;