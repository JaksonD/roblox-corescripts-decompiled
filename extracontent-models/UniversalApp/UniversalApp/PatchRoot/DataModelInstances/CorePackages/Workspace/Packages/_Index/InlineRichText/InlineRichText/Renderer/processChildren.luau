local l_script_FirstAncestor_0 = script:FindFirstAncestor("InlineRichText");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local v3 = require(l_Parent_0.Cryo);
local _ = require(l_script_FirstAncestor_0.Types);
local v5 = require(l_script_FirstAncestor_0.Enums.NodeType);
local l_NodeRenderers_0 = script.Parent.NodeRenderers;
local v7 = require(l_NodeRenderers_0.PlaintextRenderer);
local v8 = require(l_NodeRenderers_0.EngineTagRenderer);
local v9 = require(l_NodeRenderers_0.InlineCustomRenderer);
local v10 = require(l_script_FirstAncestor_0.NodeConfig);
local v11 = {
    [v5.Plaintext] = v7, 
    [v5.EngineTag] = v8, 
    [v5.InlineCustom] = v9
};
return function(v12, v13) --[[ Line: 20 ]] --[[ Name: processChildren ]]
    -- upvalues: v10 (copy), v2 (copy), v3 (copy), v11 (copy)
    local v14 = {};
    local v15 = v10.getByNode(v12);
    if not v15 then
        v2:warning((("Node %*: No config found for node type %*"):format(v12.name, v12.type)));
        return v14;
    else
        for _, v23 in (v3.List.map(v12.children, function(v16) --[[ Line: 28 ]]
            -- upvalues: v10 (ref), v2 (ref), v15 (copy), v12 (copy), v11 (ref), v13 (copy), v3 (ref)
            local v17 = v10.getByNode(v16);
            if not v17 then
                v2:warning((("Node %*: No config found for node %* type %*"):format(v16.name, v16.name, v16.type)));
                return {};
            elseif not v15.children[v16.type] then
                v2:warning((("Node %*: Node type %* is not a valid child of node %* type %*"):format(v16.name, v16.type, v12.name, v12.type)));
                return {};
            else
                local v18 = v11[v16.type];
                if v18 then
                    local v19 = v18(v16, v13);
                    if typeof(v19) ~= "table" then
                        v19 = {
                            v19
                        };
                    end;
                    if not v3.List.foldLeft(v19, function(v20, v21) --[[ Line: 49 ]]
                        -- upvalues: v17 (copy)
                        return v20 and v17.validateRenderResult(v21);
                    end, true) then
                        v2:warning((("Node %*: Rendered result is not valid for type %*"):format(v16.name, v16.type)));
                        return {};
                    else
                        return v19;
                    end;
                else
                    v2:warning((("Node %*: No renderer found for type %*"):format(v16.name, v16.type)));
                    return {};
                end;
            end;
        end)) do
            for _, v25 in v23 do
                table.insert(v14, v25);
            end;
        end;
        return v14;
    end;
end;