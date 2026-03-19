return {
    create = function() --[[ Line: 6 ]] --[[ Name: create ]]
        return {};
    end, 
    register = function(v0, v1, v2) --[[ Line: 11 ]] --[[ Name: register ]]
        if not v0[v1] then
            v0[v1] = {};
        end;
        table.insert(v0[v1], v2);
    end
};