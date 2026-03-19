return function(v0) --[[ Line: 8 ]] --[[ Name: createBrickColorsFromIds ]]
    local v1 = {};
    for _, v3 in v0 do
        local l_status_0, l_result_0 = pcall(BrickColor.new, v3);
        if l_status_0 and l_result_0 then
            table.insert(v1, l_result_0);
        else
            warn((("createBrickColorsFromIds: Failed to create BrickColor with ID %*"):format(v3)));
        end;
    end;
    return v1;
end;