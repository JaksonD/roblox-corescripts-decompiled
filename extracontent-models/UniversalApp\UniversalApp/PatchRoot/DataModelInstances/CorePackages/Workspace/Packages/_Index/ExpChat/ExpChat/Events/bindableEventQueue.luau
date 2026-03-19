local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v1 = require(l_script_FirstAncestor_0.DispatchBindableEvent);
return {
    queue = {}, 
    add = function(v2, v3) --[[ Line: 8 ]] --[[ Name: add ]]
        v2.queue[#v2.queue + 1] = v3;
    end, 
    flush = function(v4) --[[ Line: 12 ]] --[[ Name: flush ]]
        -- upvalues: v1 (copy)
        if #v4.queue then
            for _, v6 in pairs(v4.queue) do
                v1:Fire(v6);
            end;
        end;
    end
};