return function(v0) --[[ Line: 1 ]] --[[ Name: getContentFromObject ]]
    if typeof(v0) == "Object" then
        return Content.fromObject(v0);
    else
        return Content.none;
    end;
end;