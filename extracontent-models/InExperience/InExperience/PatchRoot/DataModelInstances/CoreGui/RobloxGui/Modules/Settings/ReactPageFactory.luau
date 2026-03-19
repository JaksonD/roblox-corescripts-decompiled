local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = {};
local function v9(v3) --[[ Line: 19 ]] --[[ Name: createNewPage ]]
    -- upvalues: v1 (copy)
    local v4 = {
        name = v3, 
        page = nil, 
        hubRef = nil
    };
    v4.setPage = function(_, v6) --[[ Line: 26 ]] --[[ Name: setPage ]]
        -- upvalues: v4 (copy)
        v4.page = v6;
    end;
    v4.createPage = function(_, v8) --[[ Line: 30 ]] --[[ Name: createPage ]]
        -- upvalues: v4 (copy), v1 (ref)
        if not v4.page then
            return nil;
        else
            return v1.createElement(v4.page, v8);
        end;
    end;
    return v4;
end;
v2.createNewPage = function(_, v11) --[[ Line: 41 ]] --[[ Name: createNewPage ]]
    -- upvalues: v9 (copy)
    return (v9(v11));
end;
return v2;