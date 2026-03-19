return function(v0) --[[ Line: 1 ]] --[[ Name: getPageSideMargin ]]
    if v0 > 600 then
        return 48;
    elseif v0 > 320 then
        return 24;
    else
        return 12;
    end;
end;