local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.LuauPolyfill);
return {
    didYouMean = function(v2, v3) --[[ Line: 20 ]] --[[ Name: didYouMean ]]
        local v4 = nil;
        local v5 = nil;
        if v3 then
            v4 = v2;
            v5 = v3;
        else
            v5 = v2;
        end;
        local v6 = " Did you mean ";
        if v4 then
            v6 = v6 .. v4 .. " ";
        end;
        local v7 = {};
        for v8 = 1, #v5 do
            v7[v8] = ("%q"):format(v5[v8]);
        end;
        local v9 = #v7;
        if v9 == 0 then
            return "";
        elseif v9 == 1 then
            return v6 .. v7[1] .. "?";
        elseif v9 == 2 then
            return v6 .. v7[1] .. " or " .. v7[2] .. "?";
        else
            local v10 = {};
            table.move(v7, 1, 5, 1, v10);
            local v11 = table.remove(v10);
            return v6 .. table.concat(v10, ", ") .. ", or " .. tostring(v11) .. "?";
        end;
    end
};