return {
    isIteratableObject = function(v0) --[[ Line: 27 ]] --[[ Name: isIteratableObject ]]
        if typeof(v0) ~= "table" then
            return false;
        elseif next(v0) == nil then
            return true;
        elseif #v0 == 0 then
            return false;
        else
            return true;
        end;
    end
};