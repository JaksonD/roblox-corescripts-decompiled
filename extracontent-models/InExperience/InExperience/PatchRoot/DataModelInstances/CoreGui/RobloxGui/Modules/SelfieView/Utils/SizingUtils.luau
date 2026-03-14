local function _(v0) --[[ Line: 6 ]] --[[ Name: getWidth ]]
    return v0 * 0.6596491228070176;
end;
return {
    getSize = function(v2, v3) --[[ Line: 10 ]] --[[ Name: getSize ]]
        local v4 = math.min(math.round(v2.Y * 0.7), 285);
        local v5 = v4 * 0.6596491228070176;
        if not v3 then
            v4 = v4 * 0.45614035087719296;
        end;
        return Vector2.new(v5, v4);
    end
};