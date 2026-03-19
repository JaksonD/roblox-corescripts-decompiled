local l_script_FirstAncestor_0 = script:FindFirstAncestor("InlineRichText");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Types);
local v3 = require(l_script_FirstAncestor_0.Enums.NodeType);
local v4 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_script_FirstAncestor_0.NodeConfig);
local v7 = {};
v7.__index = v7;
v7.new = function() --[[ Line: 42 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy)
    local v8 = setmetatable({}, v7);
    v8.__stack = {};
    v8.__index = 1;
    return v8;
end;
v7.push = function(v9, v10) --[[ Line: 51 ]] --[[ Name: push ]]
    -- upvalues: v6 (copy), v4 (copy), v3 (copy), v5 (copy)
    if not v6.getByNode(v10) then
        return {}, false;
    else
        local v11 = v9:peek();
        local v12 = {};
        while true do
            if v11 and not v6.isDescendant(v11, v10) then
                if not v9:__canCloseTop() then
                    v4:error("push: Cannot closeAndReduce top node. Last item in stack is not the root node");
                    return v12, false;
                else
                    local v13 = v9:__closeTopAndReduce();
                    if not v13 then
                        v4:error("push: Failed to closeAndReduce top node");
                        return v12, false;
                    else
                        v11 = v9:peek();
                        table.insert(v12, v13);
                    end;
                end;
            elseif not v11 and v10.type == v3.Root then
                v9:__push(v10);
                return v12, true;
            else
                local v14 = v11 and v6.getByNode(v11);
                if v14 and v14.children[v10.type] then
                    v9:__push(v10);
                    return v12, true;
                else
                    local v15 = v6.getByNode(v10);
                    local v16 = v15 and v15.defaultParent;
                    if not v16 then
                        v4:error((("push: No default parent found for node type %*"):format(v10.type)));
                        return v12, false;
                    else
                        local v17, v18 = v9:pushDefault(v16);
                        v12 = v5.List.join(v12, v17);
                        if not v18 then
                            return v12, false;
                        else
                            v9:__push(v10);
                            return v12, true;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v7.pushDefault = function(v19, v20) --[[ Line: 102 ]] --[[ Name: pushDefault ]]
    -- upvalues: v6 (copy), v4 (copy)
    local v21 = v6.getByType(v20);
    if not v21 or not v21.getDefault then
        v4:error((("pushDefault: No config or getDefault function found for node type %*"):format(v20)));
        return {}, false;
    else
        return v19:push((v21.getDefault()));
    end;
end;
v7.findAndClose = function(v22, v23) --[[ Line: 112 ]] --[[ Name: findAndClose ]]
    -- upvalues: v4 (copy)
    if not v22:__has(v23) then
        return {}, false;
    else
        local v24 = {};
        local v25 = false;
        while true do
            if v22:__canCloseTop() then
                local v26 = v22:__closeTopAndReduce();
                if not v26 then
                    v4:error("findAndClose: Failed to closeAndReduce top node");
                    return v24, false;
                else
                    table.insert(v24, v26);
                    if v26.name == v23 then
                        return v24, true;
                    end;
                end;
            else
                return v24, v25;
            end;
        end;
    end;
end;
v7.buildRoot = function(v27) --[[ Line: 135 ]] --[[ Name: buildRoot ]]
    -- upvalues: v4 (copy), v3 (copy)
    while v27:__canCloseTop() do
        if not v27:__closeTopAndReduce() then
            v4:error("buildRoot: Failed to closeAndReduce top node");
            break;
        end;
    end;
    if #v27.__stack == 0 then
        v27:pushDefault(v3.Root);
    end;
    local v28 = v27.__stack[1];
    if v28 and v28.type ~= v3.Root then
        v4:error("buildRoot: Last node on stack is not the root node");
    end;
    return {
        name = "ROOT", 
        text = "", 
        type = v3.Root, 
        children = v28.children, 
        attributes = v28.attributes, 
        index = v28.index
    };
end;
v7.peek = function(v29) --[[ Line: 162 ]] --[[ Name: peek ]]
    return v29.__stack[#v29.__stack];
end;
v7.__push = function(v30, v31) --[[ Line: 169 ]] --[[ Name: __push ]]
    -- upvalues: v5 (copy)
    local v32 = v5.Dictionary.join(v31, {
        index = v30.__index
    });
    table.insert(v30.__stack, v32);
    v30.__index = v30.__index + 1;
    return nil;
end;
v7.__closeTopAndReduce = function(v33) --[[ Line: 179 ]] --[[ Name: __closeTopAndReduce ]]
    -- upvalues: v4 (copy), v5 (copy)
    local v34 = v33.__stack[#v33.__stack];
    local v35 = v33.__stack[#v33.__stack - 1];
    if not v34 or not v35 then
        v4:error("closeTop: No top or next node found");
        return nil;
    else
        local v36 = v5.Dictionary.join(v35, {
            children = v5.List.join(v35.children, {
                v34
            })
        });
        table.remove(v33.__stack, #v33.__stack);
        v33.__stack[#v33.__stack] = v36;
        return {
            name = v34.name, 
            text = "", 
            type = v34.type, 
            children = {}, 
            attributes = v34.attributes, 
            index = v34.index
        };
    end;
end;
v7.__canCloseTop = function(v37) --[[ Line: 202 ]] --[[ Name: __canCloseTop ]]
    return #v37.__stack > 1;
end;
v7.__has = function(v38, v39) --[[ Line: 206 ]] --[[ Name: __has ]]
    -- upvalues: v5 (copy)
    return v5.List.findWhere(v38.__stack, function(v40) --[[ Line: 207 ]]
        -- upvalues: v39 (copy)
        return v40.name == v39;
    end) ~= nil;
end;
return v7;