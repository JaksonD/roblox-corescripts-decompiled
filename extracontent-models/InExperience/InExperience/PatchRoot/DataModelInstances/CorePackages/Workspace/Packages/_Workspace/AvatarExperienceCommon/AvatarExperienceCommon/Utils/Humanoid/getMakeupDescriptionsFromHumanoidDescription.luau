return function(v0) --[[ Line: 5 ]] --[[ Name: getMakeupDescriptionsFromHumanoidDescription ]]
    local v1 = {};
    for _, v3 in v0:GetChildren() do
        if v3:IsA("MakeupDescription") then
            table.insert(v1, v3);
        end;
    end;
    return v1;
end;