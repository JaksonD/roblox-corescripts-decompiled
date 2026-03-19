return function(v0) --[[ Line: 5 ]] --[[ Name: destroyMakeupDescriptions ]]
    for _, v2 in v0:GetChildren() do
        if v2:IsA("MakeupDescription") then
            v2:Destroy();
        end;
    end;
end;