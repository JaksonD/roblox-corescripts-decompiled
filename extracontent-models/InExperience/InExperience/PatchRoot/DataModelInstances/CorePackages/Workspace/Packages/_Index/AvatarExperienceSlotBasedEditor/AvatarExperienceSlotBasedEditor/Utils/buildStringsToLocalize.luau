local _ = require(script.Parent.Parent.Types);
return function(v1) --[[ Line: 4 ]] --[[ Name: buildStringsToLocalize ]]
    local v2 = {};
    for _, v4 in v1 do
        v2[v4.nameTranslationKey] = v4.nameTranslationKey;
    end;
    return v2;
end;