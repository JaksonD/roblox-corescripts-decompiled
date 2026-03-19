local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local l_inspect_0 = require(l_Parent_0.LuauPolyfill).util.inspect;
local v3 = require(l_Parent_0.ReactRoblox);
local v4 = require(script.Parent.warnOnce);
return {
    mount = function(v5, v6, v7) --[[ Line: 31 ]] --[[ Name: mount ]]
        -- upvalues: v1 (copy), v4 (copy), l_inspect_0 (copy), v3 (copy)
        if v1.__DEV__ and v1.__COMPAT_WARNINGS__ then
            v4("mount", "Please use the createRoot API in ReactRoblox");
        end;
        if v6 ~= nil and typeof(v6) ~= "Instance" then
            error(string.format("Cannot mount element (`%s`) into a parent that is not a Roblox Instance (got type `%s`) \n%s", if v5 then tostring(v5.type) else "<unknown>", typeof(v6), (function() --[[ Line: 47 ]]
                -- upvalues: v6 (ref), l_inspect_0 (ref)
                if v6 ~= nil then
                    return l_inspect_0(v6);
                else
                    return "";
                end;
            end)()));
        end;
        local v8 = nil;
        v8 = if _G.__ROACT_17_COMPAT_LEGACY_ROOT__ then v3.createLegacyRoot(Instance.new("Folder")) else v3.createRoot(Instance.new("Folder"));
        if v6 == nil then
            local l_Folder_0 = Instance.new("Folder");
            l_Folder_0.Name = "Target";
            v6 = l_Folder_0;
        end;
        if v7 == nil then
            v7 = _G.__ROACT_17_COMPAT_LEGACY_ROOT__ and "ReactLegacyRoot" or "ReactRoot";
        end;
        if v1.__ROACT_17_INLINE_ACT__ then
            v3.act(function() --[[ Line: 82 ]]
                -- upvalues: v8 (ref), v3 (ref), v7 (ref), v5 (copy), v6 (ref)
                v8:render(v3.createPortal({
                    [v7] = v5
                }, v6));
            end);
        else
            v8:render(v3.createPortal({
                [v7] = v5
            }, v6));
        end;
        return {
            root = v8, 
            parent = v6, 
            key = v7
        };
    end, 
    update = function(v10, v11) --[[ Line: 98 ]] --[[ Name: update ]]
        -- upvalues: v1 (copy), v4 (copy), v3 (copy)
        if v1.__DEV__ and v1.__COMPAT_WARNINGS__ then
            v4("update", "Please use the createRoot API in ReactRoblox");
        end;
        local l_key_0 = v10.key;
        local l_parent_0 = v10.parent;
        if v1.__ROACT_17_INLINE_ACT__ then
            v3.act(function() --[[ Line: 108 ]]
                -- upvalues: v10 (copy), v3 (ref), l_key_0 (copy), v11 (copy), l_parent_0 (copy)
                v10.root:render(v3.createPortal({
                    [l_key_0] = v11
                }, l_parent_0));
            end);
            return v10;
        else
            v10.root:render(v3.createPortal({
                [l_key_0] = v11
            }, l_parent_0));
            return v10;
        end;
    end, 
    unmount = function(v14) --[[ Line: 122 ]] --[[ Name: unmount ]]
        -- upvalues: v1 (copy), v4 (copy), v3 (copy)
        if v1.__DEV__ and v1.__COMPAT_WARNINGS__ then
            v4("unmount", "Please use the createRoot API in ReactRoblox");
        end;
        if v1.__ROACT_17_INLINE_ACT__ then
            v3.act(function() --[[ Line: 130 ]]
                -- upvalues: v14 (copy)
                v14.root:unmount();
            end);
            return;
        else
            v14.root:unmount();
            return;
        end;
    end
};