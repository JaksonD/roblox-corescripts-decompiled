local l_CoreScriptSyncService_0 = game:GetService("CoreScriptSyncService");
return function(v1, v2, v3) --[[ Line: 4 ]] --[[ Name: getFileInfo ]]
    -- upvalues: l_CoreScriptSyncService_0 (copy)
    local l_game_0 = game;
    for _, v6 in string.split(v1, ".") do
        if l_game_0 ~= nil then
            l_game_0 = l_game_0:FindFirstChild(v6);
        else
            break;
        end;
    end;
    if typeof(l_game_0) ~= "Instance" or not l_game_0:IsA("ModuleScript") then
        warn("path led to non-ModuleScript:", v1, l_game_0.ClassName);
        l_game_0 = nil;
    end;
    local v7 = nil;
    if l_game_0 then
        v7 = l_CoreScriptSyncService_0:GetScriptFilePath(l_game_0);
        if v2 then
            local v8, v9 = string.find(v7, v2, 1, true);
            if v8 then
                v7 = string.sub(v7, if v3 then v8 else v9 + 1);
            end;
        end;
    end;
    return l_game_0, v7;
end;