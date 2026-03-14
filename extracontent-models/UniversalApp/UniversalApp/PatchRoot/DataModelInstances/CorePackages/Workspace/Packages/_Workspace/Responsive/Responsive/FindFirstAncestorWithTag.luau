FindFirstAncestorWithTag = function(v0, v1) --[[ Line: 1 ]] --[[ Name: FindFirstAncestorWithTag ]]
    if v0 == nil then
        return nil;
    elseif v0:HasTag(v1) then
        return v0;
    else
        return FindFirstAncestorWithTag(v0.Parent, v1);
    end;
end;
return FindFirstAncestorWithTag;