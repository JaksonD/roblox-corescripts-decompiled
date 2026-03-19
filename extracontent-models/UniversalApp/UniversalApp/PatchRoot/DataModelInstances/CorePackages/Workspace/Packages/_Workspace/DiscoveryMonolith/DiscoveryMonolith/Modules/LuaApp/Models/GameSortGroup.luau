local v0 = {
    new = function() --[[ Line: 10 ]] --[[ Name: new ]]
        return {
            sorts = {}, 
            pageId = ""
        };
    end
};
v0.mock = function() --[[ Line: 18 ]] --[[ Name: mock ]]
    -- upvalues: v0 (copy)
    local v1 = v0.new();
    v1.sorts = {};
    v1.pageId = "73261389094";
    return v1;
end;
return v0;