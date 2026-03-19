return function(v0, v1, v2) --[[ Line: 1 ]]
    local l_storyRoots_0 = v0.storyRoots;
    local l_mapStory_0 = v0.mapStory;
    v1("SHOULD run all stories with no issue", function() --[[ Line: 5 ]]
        -- upvalues: l_storyRoots_0 (copy), v2 (copy), l_mapStory_0 (copy)
        for _, v6 in ipairs(l_storyRoots_0) do
            for _, v8 in ipairs(v6:GetDescendants()) do
                if v8:IsA("ModuleScript") and v8.Name:find(".story$") then
                    v2("SHOULD mount: " .. v8:GetFullName(), function(v9) --[[ Line: 10 ]]
                        -- upvalues: v8 (copy), l_mapStory_0 (ref)
                        local v10 = require(v8);
                        local v11 = l_mapStory_0(function() --[[ Line: 12 ]]
                            -- upvalues: v10 (copy)
                            return v10;
                        end)();
                        local _, v13 = v9.UnitTestHelpers.mountFrame(v11);
                        v13();
                    end);
                end;
            end;
        end;
    end);
end;