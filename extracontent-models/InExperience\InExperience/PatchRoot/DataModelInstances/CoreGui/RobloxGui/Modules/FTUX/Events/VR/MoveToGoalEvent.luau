local _ = require(script.Parent.Parent.EventType);
local v1 = {
    Name = "MoveToGoalEvent"
};
local v2 = nil;
local function v6(v3, v4) --[[ Line: 11 ]] --[[ Name: spawnGoalArea ]]
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
    -- upvalues: v6 (copy), v2 (ref)
    local v8 = v6(Vector3.new(-8, 6.300000190734863, -31, 0), (Vector3.new(9, 6.300000190734863, -49, 0)));
    task.wait(1);
    v2 = v8.Touched:Connect(function(v9) --[[ Line: 32 ]]
        -- upvalues: v8 (copy), v7 (copy), v2 (ref)
        if game.Players:GetPlayerFromCharacter(v9.Parent) then
            v8:Destroy();
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