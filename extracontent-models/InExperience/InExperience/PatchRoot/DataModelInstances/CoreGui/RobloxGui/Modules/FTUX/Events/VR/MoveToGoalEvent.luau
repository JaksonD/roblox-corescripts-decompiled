local _ = require(script.Parent.Parent.EventType);
local v1 = {
    Name = "MoveToGoalEvent"
};
local v2 = nil;
local function _(v3, v4) --[[ Line: 11 ]] --[[ Name: spawnGoalArea ]]
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Anchored = true;
    l_Part_0.CanCollide = false;
    l_Part_0.Transparency = 1;
    l_Part_0.Size = Vector3.new(math.abs(v4.X - v3.X), 1, (math.abs(v4.Z - v3.Z)));
    l_Part_0.Position = Vector3.new((v4.X + v3.X) / 2, 6.3, (v4.Z + v3.Z) / 2);
    l_Part_0.Parent = workspace;
    return l_Part_0;
end;
v1.StartEvent = function(v7) --[[ Line: 24 ]] --[[ Name: StartEvent ]]
    -- upvalues: v2 (ref)
    local l_Part_1 = Instance.new("Part");
    l_Part_1.Anchored = true;
    l_Part_1.CanCollide = false;
    l_Part_1.Transparency = 1;
    l_Part_1.Size = Vector3.new(17, 1, 18, 0);
    l_Part_1.Position = Vector3.new(0.5, 6.300000190734863, -40, 0);
    l_Part_1.Parent = workspace;
    local l_l_Part_1_0 = l_Part_1;
    task.wait(1);
    v2 = l_l_Part_1_0.Touched:Connect(function(v10) --[[ Line: 32 ]]
        -- upvalues: l_l_Part_1_0 (copy), v7 (copy), v2 (ref)
        if game.Players:GetPlayerFromCharacter(v10.Parent) then
            l_l_Part_1_0:Destroy();
            task.wait(0.2);
            v7();
            if v2 then
                v2:Disconnect();
                v2 = nil;
            end;
        end;
    end);
end;
v1.StopEvent = function() --[[ Line: 51 ]] --[[ Name: StopEvent ]]
    -- upvalues: v2 (ref)
    if v2 then
        v2:Disconnect();
        v2 = nil;
    end;
end;
return v1;