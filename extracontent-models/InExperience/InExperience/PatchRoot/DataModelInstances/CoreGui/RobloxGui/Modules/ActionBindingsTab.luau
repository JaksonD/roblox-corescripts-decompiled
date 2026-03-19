local l_CoreGui_0 = game:GetService("CoreGui");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_TweenService_0 = game:GetService("TweenService");
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local v6 = Color3.new(0.1, 0, 0);
local v7 = Color3.new(0, 0, 0);
local _ = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
local _ = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
local v10 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true, 0);
local v11 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
local v12 = nil;
local v13 = {};
local v14 = {};
local v15 = {};
local v16 = {};
local v17 = {};
local v18 = {};
local v19 = {};
local v20 = {};
local v21 = true;
local _ = {
    BoundInputType = 3, 
    TableHeader = 2, 
    BoundAction = 1
};
local function v27(v23, v24) --[[ Line: 43 ]] --[[ Name: sortInputTypeRows ]]
    -- upvalues: v14 (copy)
    local v25 = v14[v23];
    local v26 = v14[v24];
    return tostring(v25) < tostring(v26);
end;
local function v36(v28, v29) --[[ Line: 49 ]] --[[ Name: sortActionRows ]]
    -- upvalues: v16 (copy), v17 (copy)
    local v30 = v16[v28];
    local v31 = v16[v29];
    if v30 and v31 then
        local v32 = v17[v28];
        local v33 = v17[v29];
        if v32 ~= v33 then
            return tostring(v32) < tostring(v33);
        elseif v30.isCore and not v31.isCore then
            return true;
        elseif not v30.isCore and v31.isCore then
            return false;
        else
            local l_stackOrder_0 = v30.stackOrder;
            local l_stackOrder_1 = v31.stackOrder;
            if l_stackOrder_0 and l_stackOrder_1 then
                return l_stackOrder_1 < l_stackOrder_0;
            else
                return true;
            end;
        end;
    else
        return true;
    end;
end;
local function v41(v37, v38) --[[ Line: 75 ]] --[[ Name: createEmptyRow ]]
    -- upvalues: l_Create_0 (copy)
    local v39 = l_Create_0("Frame")({
        Name = v37, 
        BackgroundTransparency = 1, 
        ZIndex = 6, 
        Size = UDim2.new(1, 0, 0, v38 or 0)
    });
    local _ = l_Create_0("UIListLayout")({
        FillDirection = Enum.FillDirection.Horizontal, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Padding = UDim.new(0, 5), 
        Parent = v39
    });
    return v39;
end;
local function v46(v42, v43) --[[ Line: 91 ]] --[[ Name: createButtonRow ]]
    -- upvalues: l_Create_0 (copy)
    local v44 = l_Create_0("TextButton")({
        Name = v42, 
        BackgroundTransparency = 1, 
        ZIndex = 6, 
        Text = "", 
        Size = UDim2.new(1, 0, 0, v43 or 0)
    });
    local _ = l_Create_0("UIListLayout")({
        FillDirection = Enum.FillDirection.Horizontal, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Padding = UDim.new(0, 5), 
        Parent = v44
    });
    return v44;
end;
local function v49(v47, v48) --[[ Line: 108 ]] --[[ Name: createEmptyColumn ]]
    -- upvalues: l_Create_0 (copy)
    return (l_Create_0("Frame")({
        Name = v48, 
        BackgroundColor3 = Color3.new(0, 0, 0), 
        BackgroundTransparency = 0.75, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 1, 0), 
        ZIndex = 6, 
        ClipsDescendants = true, 
        Parent = v47
    }));
end;
local function v58(v50, v51, v52, v53, v54) --[[ Line: 123 ]] --[[ Name: createImageColumn ]]
    -- upvalues: v49 (copy), l_Create_0 (copy)
    local v55 = v49(v50, v51);
    local _ = l_Create_0("UIAspectRatioConstraint")({
        AspectRatio = v53 or 1, 
        Parent = v55
    });
    local _ = l_Create_0("ImageLabel")({
        Name = "ColumnImage", 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        Size = UDim2.new(v54 or 1, 0, v54 or 1, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        ZIndex = 6, 
        Image = v52, 
        Parent = v55
    });
    return v55;
end;
local function v64(v59, v60, v61) --[[ Line: 145 ]] --[[ Name: createTextColumn ]]
    -- upvalues: v49 (copy), l_Create_0 (copy)
    local v62 = v49(v59, v60);
    local _ = l_Create_0("TextLabel")({
        Name = "ColumnText", 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        Size = UDim2.new(1, -10, 1, -10), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        ZIndex = 6, 
        Text = v61, 
        TextSize = 18, 
        TextColor3 = Color3.new(1, 1, 1), 
        TextXAlignment = Enum.TextXAlignment.Left, 
        Font = Enum.Font.SourceSans, 
        Parent = v62
    });
    return v62;
end;
local function v73(v65, v66) --[[ Line: 166 ]] --[[ Name: createActionColumns ]]
    -- upvalues: v49 (copy), v64 (copy)
    local v67 = 0;
    local v68 = v49(v65, "Inset");
    v68.LayoutOrder = 0;
    v68.BackgroundTransparency = 1;
    v68.Size = UDim2.new(0, 30, 1, 0);
    v67 = v67 + 30 + 5;
    local v69 = v64(v65, "Priority", "Priority");
    v69.LayoutOrder = 1;
    v69.BackgroundColor3 = v66;
    v69.Size = UDim2.new(0, 80, 1, 0);
    v67 = v67 + 80 + 5;
    local v70 = v64(v65, "Security", "Security");
    v70.LayoutOrder = 2;
    v70.BackgroundColor3 = v66;
    v70.Size = UDim2.new(0, 80, 1, 0);
    v67 = v67 + 80 + 5;
    local v71 = v64(v65, "ActionName", "Action Name");
    v71.LayoutOrder = 3;
    v71.BackgroundColor3 = v66;
    v71.Size = UDim2.new(0.25, 0, 1, 0);
    local v72 = v64(v65, "InputTypes", "Input Types");
    v72.LayoutOrder = 4;
    v72.BackgroundColor3 = v66;
    v72.Size = UDim2.new(0.75, -v67 - 5, 1, 0);
    return v68, v69, v70, v71, v72;
end;
local function v88() --[[ Line: 203 ]] --[[ Name: updateContainerCanvas ]]
    -- upvalues: v21 (ref), v13 (copy), v27 (copy), v14 (copy), v19 (copy), v15 (copy), v36 (copy)
    debug.profilebegin("updateContainerCanvas");
    if v21 then
        v21 = false;
        local v74 = 1;
        local v75 = {};
        for _, v77 in pairs(v13) do
            table.insert(v75, v77);
        end;
        table.sort(v75, v27);
        for _, v79 in pairs(v75) do
            local v80 = v14[v79];
            v79.LayoutOrder = v74;
            v74 = v74 + 1;
            local v81 = v19[v80];
            if v81 then
                v81.LayoutOrder = v74;
                v74 = v74 + 1;
            end;
            local v82 = v15[v80];
            if v82 then
                local v83 = {};
                for _, v85 in pairs(v82) do
                    table.insert(v83, v85);
                end;
                table.sort(v83, v36);
                for _, v87 in pairs(v83) do
                    v87.LayoutOrder = v74;
                    v74 = v74 + 1;
                end;
            end;
        end;
    end;
    debug.profileend();
end;
local function v92(v89) --[[ Line: 245 ]] --[[ Name: scrollContainerToRow ]]
    -- upvalues: v12 (ref), l_TweenService_0 (copy), v11 (copy)
    local v90 = v89.AbsolutePosition.Y - v12.AbsolutePosition.Y;
    local v91 = v12.CanvasPosition + Vector2.new(0, v90);
    l_TweenService_0:Create(v12, v11, {
        CanvasPosition = v91
    }):Play();
end;
local v93 = {};
v93.initializeGui = function(v94) --[[ Line: 253 ]] --[[ Name: initializeGui ]]
    -- upvalues: l_Create_0 (copy), v12 (ref), v93 (copy), l_ContextActionService_0 (copy), v21 (ref), v88 (copy)
    local v95 = l_Create_0("ScrollingFrame")({
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        Size = UDim2.new(1, -10, 1, -10), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BorderSizePixel = 0, 
        ScrollBarThickness = 4, 
        BackgroundTransparency = 1, 
        ZIndex = 6, 
        Parent = v94
    });
    v12 = v95;
    local v96 = l_Create_0("UIListLayout")({
        Padding = UDim.new(0, 5), 
        Parent = v95
    });
    v96.SortOrder = Enum.SortOrder.LayoutOrder;
    v96:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() --[[ Line: 271 ]]
        -- upvalues: v12 (ref), v96 (copy)
        v12.CanvasSize = UDim2.new(0, 0, 0, v96.AbsoluteContentSize.Y);
    end);
    v93.updateGuis();
    l_ContextActionService_0.BoundActionAdded:connect(function(v97, _, v99, v100) --[[ Line: 275 ]]
        -- upvalues: v93 (ref), v21 (ref), v88 (ref)
        v99.isCore = v100;
        v93.updateActionRows(v97, v99);
        v21 = true;
        v88();
    end);
    l_ContextActionService_0.BoundActionRemoved:connect(function(v101, v102, v103) --[[ Line: 282 ]]
        -- upvalues: v93 (ref), v21 (ref), v88 (ref)
        v102.isCore = v103;
        v93.removeActionRows(v101, v102);
        v21 = true;
        v88();
    end);
end;
v93.updateBoundInputTypeRow = function(v104) --[[ Line: 291 ]] --[[ Name: updateBoundInputTypeRow ]]
    -- upvalues: v13 (copy), v46 (copy), v58 (copy), v64 (copy), v41 (copy), v73 (copy), v7 (copy), v14 (copy), v18 (copy), v19 (copy), v12 (ref), l_TweenService_0 (copy), v10 (copy), v20 (copy), v15 (copy), v88 (copy), v92 (copy)
    if not v13[v104] then
        local v105 = v46("BoundInputType", 30);
        local v106 = v58(v105, "ExpandImage", "rbxasset://textures/ui/ExpandArrowSheet.png", 1, 0.35);
        v106.ColumnImage.ImageRectSize = Vector2.new(21, 21);
        v106.ColumnImage.ImageRectOffset = Vector2.new(0, 0);
        local v107 = v64(v105, "InputType", (tostring(v104)));
        v107.Size = UDim2.new(1, -35, 1, 0);
        v107.ColumnText.Font = Enum.Font.SourceSansBold;
        local v108 = v41("TableHeader", 20);
        v108.Visible = false;
        local _, v110, v111, v112, v113 = v73(v108, v7);
        v110.ColumnText.Font = Enum.Font.SourceSansBold;
        v111.ColumnText.Font = Enum.Font.SourceSansBold;
        v112.ColumnText.Font = Enum.Font.SourceSansBold;
        v113.ColumnText.Font = Enum.Font.SourceSansBold;
        v13[v104] = v105;
        v14[v105] = v104;
        v18[v108] = v104;
        v19[v104] = v108;
        v108.Parent = v12;
        v105.Parent = v12;
        l_TweenService_0:Create(v107, v10, {
            BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
        }):Play();
        v20[v104] = false;
        v105.MouseButton1Click:connect(function() --[[ Line: 323 ]]
            -- upvalues: v20 (ref), v104 (copy), v15 (ref), v106 (copy), v108 (copy), v88 (ref), l_TweenService_0 (ref), v107 (copy), v10 (ref), v92 (ref), v105 (copy)
            v20[v104] = not v20[v104];
            local v114 = v15[v104];
            if not v20[v104] then
                v106.ColumnImage.ImageRectOffset = Vector2.new(0, 0);
                v108.Visible = false;
                if v114 then
                    for _, v116 in pairs(v114) do
                        v116.Visible = false;
                    end;
                end;
            else
                v106.ColumnImage.ImageRectOffset = Vector2.new(21, 0);
                v108.Visible = true;
                if v114 then
                    for _, v118 in pairs(v114) do
                        v118.Visible = true;
                    end;
                end;
            end;
            v88();
            if v20[v104] then
                l_TweenService_0:Create(v107, v10, {
                    BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
                }):Play();
                v92(v105);
            end;
        end);
    end;
end;
v93.updateActionRowForInputType = function(v119, v120, v121) --[[ Line: 354 ]] --[[ Name: updateActionRowForInputType ]]
    -- upvalues: v15 (copy), v41 (copy), v20 (copy), v73 (copy), v6 (copy), v7 (copy), v17 (copy), v16 (copy), v12 (ref), l_TweenService_0 (copy), v10 (copy), v13 (copy)
    local v122 = v15[v121];
    if not v122 then
        v122 = {};
        v15[v121] = v122;
    end;
    if not v122[v119] then
        local v123 = v41("BoundAction", 20);
        v123.Visible = v20[v121];
        local v124 = {};
        for v125, v126 in pairs(v120.inputTypes) do
            v124[v125] = tostring(v126);
        end;
        local _, v128, v129, v130, v131 = v73(v123, v120.isCore and v6 or v7);
        v128.ColumnText.Text = v120.priorityLevel or "Default";
        v129.ColumnText.Text = v120.isCore and "Core" or "Developer";
        v130.ColumnText.Text = v119;
        v131.ColumnText.Text = table.concat(v124, ", ");
        if v120.isCore then
            v128.ColumnText.Font = Enum.Font.SourceSansItalic;
            v129.ColumnText.Font = Enum.Font.SourceSansItalic;
            v130.ColumnText.Font = Enum.Font.SourceSansItalic;
            v131.ColumnText.Font = Enum.Font.SourceSansItalic;
        end;
        v122[v119] = v123;
        v17[v123] = v121;
        v16[v123] = v120;
        v123.Parent = v12;
        if v123.Visible then
            l_TweenService_0:Create(v130, v10, {
                BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
            }):Play();
        else
            local v132 = v13[v121];
            if v132 then
                l_TweenService_0:Create(v132.InputType, v10, {
                    BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
                }):Play();
            end;
        end;
        local _ = v123;
    end;
end;
v93.updateActionRows = function(v134, v135) --[[ Line: 402 ]] --[[ Name: updateActionRows ]]
    -- upvalues: v93 (copy)
    for _, v137 in pairs(v135.inputTypes) do
        v93.updateBoundInputTypeRow(v137);
        v93.updateActionRowForInputType(v134, v135, v137);
    end;
end;
v93.removeActionRows = function(v138, v139) --[[ Line: 409 ]] --[[ Name: removeActionRows ]]
    -- upvalues: v15 (copy), v13 (copy), v19 (copy), v88 (copy), v12 (ref)
    for _, v141 in pairs(v139.inputTypes) do
        local v142 = v15[v141];
        if v142 then
            v142[v138]:Destroy();
            v142[v138] = nil;
            local v143 = true;
            for _, _ in pairs(v142) do
                v143 = false;
                break;
            end;
            if v143 then
                local v146 = v13[v141];
                if v146 then
                    v146:Destroy();
                    v13[v141] = nil;
                end;
                local v147 = v19[v141];
                if v147 then
                    v19[v147] = nil;
                    v147:Destroy();
                    v19[v141] = nil;
                end;
            end;
        end;
    end;
    v88();
    v12.UIListLayout:ApplyLayout();
end;
v93.updateGuis = function() --[[ Line: 446 ]] --[[ Name: updateGuis ]]
    -- upvalues: l_ContextActionService_0 (copy), v93 (copy), v21 (ref), v88 (copy)
    local l_l_ContextActionService_0_AllBoundCoreActionInfo_0 = l_ContextActionService_0:GetAllBoundCoreActionInfo();
    for v149, v150 in pairs(l_l_ContextActionService_0_AllBoundCoreActionInfo_0) do
        v150.isCore = true;
        v93.updateActionRows(v149, v150);
    end;
    local l_l_ContextActionService_0_AllBoundActionInfo_0 = l_ContextActionService_0:GetAllBoundActionInfo();
    for v152, v153 in pairs(l_l_ContextActionService_0_AllBoundActionInfo_0) do
        v153.isCore = false;
        v93.updateActionRows(v152, v153);
    end;
    v21 = true;
    v88();
end;
return v93;