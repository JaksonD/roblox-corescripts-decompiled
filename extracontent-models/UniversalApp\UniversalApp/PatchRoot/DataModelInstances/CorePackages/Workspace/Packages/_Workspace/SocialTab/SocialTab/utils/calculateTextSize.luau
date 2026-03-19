local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_t_0 = v1.t;
local l_Text_0 = v1.Text;
local l_memoize_0 = v1.memoize;
local v5 = l_t_0.interface({
    text = l_t_0.string, 
    font = l_t_0.interface({
        Font = l_t_0.Font, 
        RelativeSize = l_t_0.number
    }), 
    baseSize = l_t_0.number
});
return function() --[[ Line: 19 ]]
    -- upvalues: l_memoize_0 (copy), v5 (copy), l_Text_0 (copy)
    return l_memoize_0(function(v6, v7, v8) --[[ Line: 20 ]]
        -- upvalues: v5 (ref), l_Text_0 (ref)
        assert(v5({
            text = v6, 
            font = v7, 
            baseSize = v8
        }));
        local v9 = v7.RelativeSize * v8;
        return l_Text_0.GetTextBounds(v6, v7.Font, v9, Vector2.new(10000, 10000));
    end);
end;