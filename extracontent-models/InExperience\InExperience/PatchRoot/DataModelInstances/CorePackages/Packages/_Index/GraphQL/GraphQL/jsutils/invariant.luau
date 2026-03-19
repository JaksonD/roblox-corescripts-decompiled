return {
    invariant = function(v0, v1) --[[ Line: 8 ]] --[[ Name: invariant ]]
        if not v0 then
            error(v1 or "Unexpected invariant triggered.");
        end;
    end
};