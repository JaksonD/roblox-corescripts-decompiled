local l_script_FirstAncestor_0 = script:FindFirstAncestor("InlineRichText");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Types);
local v3 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_script_FirstAncestor_0.NodeConfig);
local v6 = require(l_script_FirstAncestor_0.Parser.NodeStack);
local v7 = require(l_script_FirstAncestor_0.Enums.NodeType);
local v8 = require(l_script_FirstAncestor_0.Enums.TokenName);
local v43 = {
    [v8.Text] = function(v9, v10, _) --[[ Line: 16 ]]
        -- upvalues: v7 (copy), v3 (copy)
        local v12 = v9:peek();
        if not v12 or v12.type ~= v7.Plaintext then
            local _, v14 = v9:pushDefault(v7.Plaintext);
            if not v14 then
                v3:error("Failed to push default plaintext node to add text to");
                return nil;
            end;
        end;
        local v15 = v9:peek();
        v15.text = ("%*%*"):format(v15.text, v10.text);
    end, 
    [v8.Break] = function(v16, _, _) --[[ Line: 30 ]]
        -- upvalues: v7 (copy), v3 (copy), v4 (copy), v5 (copy)
        local v19, v20 = v16:push({
            type = v7.InlineCustom, 
            name = "BREAK", 
            text = "", 
            children = {}, 
            attributes = {}
        });
        local _, v22 = v16:findAndClose("BREAK");
        if not v20 or not v22 then
            v3:error("Failed to push break node");
            return nil;
        else
            for _, v24 in v4.List.reverse(v19) do
                local v25 = v16:peek();
                local v26 = v25 and v5.getByNode(v25);
                if v26 then
                    if v26.children[v24.type] then
                        local _, v28 = v16:push(v24);
                        if not v28 then
                            v3:error((("Failed to re-open node %* after break"):format(v24.name)));
                            return nil;
                        end;
                    end;
                else
                    break;
                end;
            end;
            return;
        end;
    end, 
    [v8.Open] = function(v29, v30, v31) --[[ Line: 64 ]]
        -- upvalues: v3 (copy)
        local v32 = v31.TagAliases[v30.text] or v30.text;
        local v33 = v31.TagConfigurations[v32];
        if not v33 then
            v3:error((("No configuration open tag name %*"):format(v32)));
            return nil;
        else
            v32 = v33.OverrideName or v32;
            local _, v35 = v29:push({
                type = v33.NodeType, 
                name = v32, 
                text = "", 
                children = {}, 
                attributes = v30.attributes
            });
            if not v35 then
                v3:error((("Failed to push open tag %*"):format(v32)));
                return nil;
            else
                return;
            end;
        end;
    end, 
    [v8.Close] = function(v36, v37, v38) --[[ Line: 87 ]]
        -- upvalues: v3 (copy)
        local v39 = v38.TagAliases[v37.text] or v37.text;
        local v40 = v38.TagConfigurations[v39];
        if not v40 then
            v3:error((("No configuration close tag name %*"):format(v39)));
            return nil;
        else
            v39 = v40.OverrideName or v39;
            local _, v42 = v36:findAndClose(v39);
            if not v42 then
                v3:error((("Failed to find and close tag %*"):format(v39)));
                return nil;
            else
                return;
            end;
        end;
    end
};
return function(v44, v45) --[[ Line: 106 ]] --[[ Name: buildTree ]]
    -- upvalues: v6 (copy), v43 (copy), v3 (copy)
    local v46 = v6.new();
    for _, v48 in v44 do
        local v49 = v43[v48.name];
        if not v49 then
            v3:error((("No processor for token name %*"):format(v48.name)));
        else
            v49(v46, v48, v45);
        end;
    end;
    return v46:buildRoot();
end;