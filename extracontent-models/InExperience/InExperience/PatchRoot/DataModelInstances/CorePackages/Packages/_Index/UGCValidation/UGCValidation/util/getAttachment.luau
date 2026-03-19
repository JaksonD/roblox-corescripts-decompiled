return function(v0, v1) --[[ Line: 1 ]] --[[ Name: getAttachment ]]
    for _, v3 in pairs(v1) do
        local l_v0_FirstChild_0 = v0:FindFirstChild(v3);
        if l_v0_FirstChild_0 then
            if l_v0_FirstChild_0:IsA("Attachment") then
                return l_v0_FirstChild_0;
            else
                return l_v0_FirstChild_0;
            end;
        end;
    end;
    return nil;
end;