return function(v0, v1) --[[ Line: 2 ]]
    for v2 = 1, #v1 do
        v0:sendText(v1:sub(v2, v2));
    end;
    wait(0);
end;