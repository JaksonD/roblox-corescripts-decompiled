local l_CorePackages_0 = game:GetService("CorePackages");
local l_VRHub_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).VRHub;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v3 = require(l_CorePackages_0.Packages.React);
local l_RunService_0 = game:GetService("RunService");
local v5 = require(script.Parent.ToolTip);
local v6 = require(l_CorePackages_0.Packages.LuauPolyfill);
local v7 = {};
local function v13(_) --[[ Line: 28 ]] --[[ Name: onRenderStepped ]]
    -- upvalues: l_IsVRAppBuild_0 (copy), v7 (copy), l_VRHub_0 (copy)
    if l_IsVRAppBuild_0() then
        for _, v10 in pairs(v7) do
            local l_l_VRHub_0_ControllerModel_0 = l_VRHub_0:GetControllerModel(v10.Button.Controller);
            local v12 = nil;
            if l_l_VRHub_0_ControllerModel_0 then
                v12 = l_l_VRHub_0_ControllerModel_0:getButtonPosition(v10.Button.ButtonKeycode);
            end;
            if v10.Part then
                if l_l_VRHub_0_ControllerModel_0 == nil or v12 == nil then
                    v10.Part.Position = Vector3.new(-99999, -99999, -99999, 0);
                else
                    v10.Part.Position = v12;
                end;
            end;
        end;
    end;
end;
spawnTooltipPart = function() --[[ Line: 49 ]] --[[ Name: spawnTooltipPart ]]
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Name = "TooltipPart";
    l_Part_0.Position = Vector3.new(0, -100, 0, 0);
    l_Part_0.Anchored = true;
    l_Part_0.CanCollide = false;
    l_Part_0.Transparency = 1;
    l_Part_0.Size = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612, 0);
    l_Part_0.Parent = game.Workspace;
    local l_BillboardGui_0 = Instance.new("BillboardGui");
    l_BillboardGui_0.Parent = l_Part_0;
    l_BillboardGui_0.Adornee = l_Part_0;
    l_BillboardGui_0.AlwaysOnTop = true;
    l_BillboardGui_0.Active = false;
    l_BillboardGui_0.Size = UDim2.new(1, 0, 1, 0);
    return l_Part_0;
end;
showTooltipText = function(v16) --[[ Line: 69 ]] --[[ Name: showTooltipText ]]
    for _, v18 in ipairs(v16.Part:GetDescendants()) do
        if v18:IsA("TextLabel") and v18.Name == "Body" then
            v18.ZIndex = 10;
        end;
    end;
end;
Tooltips = function(v19) --[[ Line: 77 ]] --[[ Name: Tooltips ]]
    -- upvalues: v7 (copy), v3 (copy), l_RunService_0 (copy), v13 (copy), v6 (copy), v5 (copy)
    for v20, v21 in pairs(v19.tooltipButtons) do
        v7[v20] = {
            Button = v21, 
            Part = spawnTooltipPart()
        };
    end;
    v3.useEffect(function() --[[ Line: 85 ]]
        -- upvalues: v7 (ref)
        for _, v23 in pairs(v7) do
            showTooltipText(v23);
        end;
    end, {});
    l_RunService_0.RenderStepped:Connect(v13);
    return v3.createElement("Frame", {}, (v6.Array.map(v7, function(v24, v25) --[[ Line: 96 ]]
        -- upvalues: v3 (ref), v5 (ref), v19 (copy)
        return (v3.createElement(v5, {
            controllerPart = v24.Part, 
            tooltipText = v19.tooltipButtons[v25].Text
        }));
    end)));
end;
return Tooltips;