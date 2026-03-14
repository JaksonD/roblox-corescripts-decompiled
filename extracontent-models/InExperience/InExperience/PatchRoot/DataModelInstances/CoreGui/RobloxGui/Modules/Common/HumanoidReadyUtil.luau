local l_Players_0 = game:GetService("Players");
local function v6(...) --[[ Line: 5 ]] --[[ Name: waitForFirst ]]
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local v2 = {
        ...
    };
    local function v4(...) --[[ Line: 9 ]] --[[ Name: fire ]]
        -- upvalues: v2 (copy), l_BindableEvent_0 (copy)
        for v3 = 1, #v2 do
            v2[v3]:Disconnect();
        end;
        return l_BindableEvent_0:Fire(...);
    end;
    for v5 = 1, #v2 do
        v2[v5] = v2[v5]:Connect(v4);
    end;
    return l_BindableEvent_0.Event:Wait();
end;
return {
    registerHumanoidReady = function(v7) --[[ Line: 37 ]] --[[ Name: registerHumanoidReady ]]
        -- upvalues: v6 (copy), l_Players_0 (copy)
        local function v12(v8, v9) --[[ Line: 39 ]] --[[ Name: characterAdded ]]
            -- upvalues: v6 (ref), v7 (copy)
            if not v9.Parent then
                v6(v9.AncestryChanged, v8.CharacterAdded);
            end;
            if v8.Character ~= v9 or not v9.Parent then
                return;
            else
                local l_Humanoid_0 = v9:FindFirstChildOfClass("Humanoid");
                while v9:IsDescendantOf(game) and not l_Humanoid_0 do
                    v6(v9.ChildAdded, v9.AncestryChanged, v8.CharacterAdded);
                    l_Humanoid_0 = v9:FindFirstChildOfClass("Humanoid");
                end;
                if v8.Character ~= v9 or not v9:IsDescendantOf(game) then
                    return;
                else
                    local l_HumanoidRootPart_0 = v9:FindFirstChild("HumanoidRootPart");
                    while v9:IsDescendantOf(game) and not l_HumanoidRootPart_0 do
                        v6(v9.ChildAdded, v9.AncestryChanged, l_Humanoid_0.AncestryChanged, v8.CharacterAdded);
                        l_HumanoidRootPart_0 = v9:FindFirstChild("HumanoidRootPart");
                    end;
                    if l_HumanoidRootPart_0 and l_Humanoid_0:IsDescendantOf(game) and v9:IsDescendantOf(game) and v8.Character == v9 then
                        v7(v8, v9, l_Humanoid_0);
                    end;
                    return;
                end;
            end;
        end;
        local function v20(v13) --[[ Line: 79 ]] --[[ Name: playerAdded ]]
            -- upvalues: v12 (copy)
            local v15 = v13.CharacterAdded:Connect(function(v14) --[[ Line: 80 ]]
                -- upvalues: v12 (ref), v13 (copy)
                v12(v13, v14);
            end);
            local v16 = nil;
            v16 = v13.AncestryChanged:Connect(function(_, v18) --[[ Line: 86 ]]
                -- upvalues: v16 (ref), v15 (copy)
                if not game:IsAncestorOf(v18) then
                    v16:Disconnect();
                    v15:Disconnect();
                end;
            end);
            local l_Character_0 = v13.Character;
            if l_Character_0 then
                v12(v13, l_Character_0);
            end;
        end;
        l_Players_0.PlayerAdded:Connect(v20);
        for _, v22 in pairs(l_Players_0:GetPlayers()) do
            v20(v22);
        end;
    end
};