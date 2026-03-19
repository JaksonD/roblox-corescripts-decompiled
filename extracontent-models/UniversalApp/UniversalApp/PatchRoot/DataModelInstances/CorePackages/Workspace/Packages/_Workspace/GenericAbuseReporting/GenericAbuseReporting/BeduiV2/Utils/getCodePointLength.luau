return function(v0) --[[ Line: 1 ]] --[[ Name: getCodePointLength ]]
    if v0 == nil then
        return 0;
    else
        return utf8.len(v0) or v0:len();
    end;
end;