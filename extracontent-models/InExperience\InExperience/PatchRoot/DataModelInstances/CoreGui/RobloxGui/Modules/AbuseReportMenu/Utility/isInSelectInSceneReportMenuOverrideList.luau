local l_Players_0 = game:GetService("Players");
game:DefineFastString("SelectInSceneReportMenuOverrideUserIds", "");
isInSelectInSceneReportMenuOverrideList = function() --[[ Line: 5 ]] --[[ Name: isInSelectInSceneReportMenuOverrideList ]]
    -- upvalues: l_Players_0 (copy)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    while not l_LocalPlayer_0 do
        l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
        l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    end;
    for v2 in game:GetFastString("SelectInSceneReportMenuOverrideUserIds"):gmatch("%d+") do
        if l_LocalPlayer_0 and tonumber(v2) == l_LocalPlayer_0.UserId then
            return true;
        end;
    end;
    return false;
end;
return isInSelectInSceneReportMenuOverrideList;