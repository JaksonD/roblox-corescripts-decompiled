local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
return {
    getChildKey = function(v2) --[[ Line: 28 ]] --[[ Name: getChildKey ]]
        if v2 == nil then
            return nil;
        elseif type(v2) ~= "table" then
            return nil;
        elseif v2.key ~= nil then
            return v2.key;
        elseif v2.props and v2.props.key ~= nil then
            return v2.props.key;
        else
            return nil;
        end;
    end, 
    onlyElements = function(v3) --[[ Line: 65 ]] --[[ Name: onlyElements ]]
        -- upvalues: v1 (copy)
        local v4 = {};
        v1.Children.forEach(v3, function(v5) --[[ Line: 68 ]]
            -- upvalues: v1 (ref), v4 (copy)
            if v1.isValidElement(v5) then
                table.insert(v4, v5);
            end;
        end);
        return v4;
    end, 
    useIdFallback = function() --[[ Line: 53 ]] --[[ Name: useIdFallback ]]
        local v6 = tostring(math.random(1000000));
        if v6 == nil then
            return "id-" .. v6;
        else
            return v6;
        end;
    end
};