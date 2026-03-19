local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local l_CorePackages_0 = game:GetService("CorePackages");
local v8 = require(l_CorePackages_0.Packages.React);
local v9 = require(l_CorePackages_0.Packages.UIBlox);
local l_GridMetrics_0 = v9.App.Grid.GridMetrics;
local l_DefaultMetricsGridView_0 = v9.App.Grid.DefaultMetricsGridView;
local v12 = require(script.Parent.Parent.Parent.Parent.Constants);
local v13 = require(script.Parent.AvatarItemCard);
local l_ItemTile_0 = v9.Tile.ItemTile;
local v15 = Vector2.new(20, 20);
local _ = function(v16) --[[ Line: 33 ]] --[[ Name: createObjectsFolder ]]
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = "R15ArtistIntent";
    for _, v19 in v16 do
        v19.Parent = l_Folder_0;
    end;
    return {
        [1] = l_Folder_0
    };
end;
local function _(v21, v22) --[[ Line: 43 ]] --[[ Name: getPart ]]
    return (v21:FindFirstChild(v22));
end;
local function v51(v24, _) --[[ Line: 47 ]] --[[ Name: getItems ]]
    local v26 = nil;
    local v27 = nil;
    local v28 = nil;
    for _, v30 in ipairs(v24:GetChildren()) do
        if v30:IsA("Accessory") then
            if v30.AccessoryType == Enum.AccessoryType.Eyebrow then
                v27 = v30;
            elseif v30.AccessoryType == Enum.AccessoryType.Eyelash then
                v26 = v30;
            elseif v30.AccessoryType == Enum.AccessoryType.Hair then
                v28 = v30;
            end;
        end;
    end;
    local v31 = {};
    local v32 = {
        asset = v24:FindFirstChild("Head"), 
        partName = "Head"
    };
    local v33 = {};
    local v34 = {
        v24:FindFirstChild("UpperTorso"), 
        (v24:FindFirstChild("LowerTorso"))
    };
    local l_Folder_1 = Instance.new("Folder");
    l_Folder_1.Name = "R15ArtistIntent";
    for _, v37 in v34 do
        v37.Parent = l_Folder_1;
    end;
    v33.asset = {
        [1] = l_Folder_1
    };
    v33.partName = "Torso";
    local v38 = {};
    l_Folder_1 = {
        v24:FindFirstChild("LeftUpperArm"), 
        v24:FindFirstChild("LeftLowerArm"), 
        (v24:FindFirstChild("LeftHand"))
    };
    local l_Folder_2 = Instance.new("Folder");
    l_Folder_2.Name = "R15ArtistIntent";
    for _, v41 in l_Folder_1 do
        v41.Parent = l_Folder_2;
    end;
    v38.asset = {
        [1] = l_Folder_2
    };
    v38.partName = "Left Arm";
    v34 = {};
    l_Folder_2 = {
        v24:FindFirstChild("LeftUpperLeg"), 
        v24:FindFirstChild("LeftLowerLeg"), 
        (v24:FindFirstChild("LeftFoot"))
    };
    local l_Folder_3 = Instance.new("Folder");
    l_Folder_3.Name = "R15ArtistIntent";
    for _, v44 in l_Folder_2 do
        v44.Parent = l_Folder_3;
    end;
    v34.asset = {
        [1] = l_Folder_3
    };
    v34.partName = "Left Leg";
    l_Folder_1 = {};
    l_Folder_3 = {
        v24:FindFirstChild("RightUpperArm"), 
        v24:FindFirstChild("RightLowerArm"), 
        (v24:FindFirstChild("RightHand"))
    };
    local l_Folder_4 = Instance.new("Folder");
    l_Folder_4.Name = "R15ArtistIntent";
    for _, v47 in l_Folder_3 do
        v47.Parent = l_Folder_4;
    end;
    l_Folder_1.asset = {
        [1] = l_Folder_4
    };
    l_Folder_1.partName = "Right Arm";
    l_Folder_2 = {};
    l_Folder_4 = {
        v24:FindFirstChild("RightUpperLeg"), 
        v24:FindFirstChild("RightLowerLeg"), 
        (v24:FindFirstChild("RightFoot"))
    };
    local l_Folder_5 = Instance.new("Folder");
    l_Folder_5.Name = "R15ArtistIntent";
    for _, v50 in l_Folder_4 do
        v50.Parent = l_Folder_5;
    end;
    l_Folder_2.asset = {
        [1] = l_Folder_5
    };
    l_Folder_2.partName = "Right Leg";
    v6(v31, 1, v32, v33, v38, v34, l_Folder_1, l_Folder_2);
    if v27 then
        table.insert(v31, {
            asset = v27, 
            partName = "Eyebrows"
        });
    end;
    if v26 then
        table.insert(v31, {
            asset = v26, 
            partName = "Eyelashes"
        });
    end;
    if v28 then
        table.insert(v31, {
            asset = v28, 
            partName = "Hair"
        });
    end;
    return v31;
end;
return function(v52) --[[ Line: 132 ]] --[[ Name: AvatarPartGrid ]]
    -- upvalues: v8 (copy), v51 (copy), v12 (copy), v13 (copy), l_ItemTile_0 (copy), l_DefaultMetricsGridView_0 (copy), l_GridMetrics_0 (copy), v15 (copy)
    local v53, v54 = v8.useState({});
    v8.useEffect(function() --[[ Line: 134 ]]
        -- upvalues: v52 (copy), v54 (copy), v51 (ref)
        if v52.humanoidModel then
            local v55 = v52.humanoidModel:Clone();
            v54((v51(v55, v52.name)));
            return;
        else
            local v56 = {};
            for v57 = 1, 6 do
                v56[v57] = {};
            end;
            v54(v56);
            return;
        end;
    end, {
        v52.humanoidModel
    });
    v8.useEffect(function() --[[ Line: 150 ]]
        -- upvalues: v53 (copy), v54 (copy)
        if v53[1] and v53[1].asset then
            local v58 = {};
            for v59, v60 in v53 do
                v58[v59] = {
                    asset = v60.asset, 
                    partName = v60.partName
                };
            end;
            v54(v58);
        end;
    end, {
        v52.name
    });
    local v61 = if v52.screenSize.Y > v52.screenSize.X then v12.ItemCardWidthPortrait else v12.ItemCardWidthLandscape;
    local v63 = v8.useCallback(function(v62) --[[ Line: 168 ]]
        -- upvalues: v8 (ref), v13 (ref), v52 (copy), v61 (copy), l_ItemTile_0 (ref)
        if v62.asset then
            return v8.createElement(v13, {
                asset = v62.asset, 
                bodyName = v52.name, 
                partName = v62.partName, 
                viewportSize = v61
            });
        else
            return v8.createElement(l_ItemTile_0);
        end;
    end, {
        v61, 
        v52.name
    });
    return v8.createElement("Frame", {
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = v52.LayoutOrder, 
        BackgroundTransparency = 1
    }, {
        Grid = v8.createElement(l_DefaultMetricsGridView_0, {
            getItemHeight = function(v64) --[[ Line: 190 ]] --[[ Name: getItemHeight ]]
                return v64 * 1.3333333333333333;
            end, 
            getItemMetrics = l_GridMetrics_0.makeCustomMetricsGetter({
                minimumItemsPerRow = 2, 
                minimumItemWidth = v61
            }), 
            renderItem = v63, 
            itemPadding = v15, 
            items = v53
        })
    });
end;