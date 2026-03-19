local l_script_FirstAncestor_0 = script:FindFirstAncestor("InlineRichText");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_RunService_0 = game:GetService("RunService");
local _ = require(l_script_FirstAncestor_0.Types);
local v4 = require(l_script_FirstAncestor_0.Enums.NodeType);
local v5 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local v6 = require(l_Parent_0.Cryo);
local v7 = require(l_script_FirstAncestor_0.Utils.isDescendant);
local v8 = require(l_Parent_0.ReactIs);
local l_isInlineElement_0 = require(l_Parent_0.InlineLayout).Utils.isInlineElement;
local v10 = l_RunService_0:IsStudio();
local v12 = {
    getDefault = function() --[[ Line: 50 ]] --[[ Name: getDefault ]]
        -- upvalues: v4 (copy)
        return {
            name = "ROOT", 
            text = "", 
            type = v4.Root, 
            children = {}, 
            attributes = {}
        };
    end, 
    children = {
        [v4.InlineCustom] = true
    }, 
    validateRenderResult = function(v11) --[[ Line: 60 ]] --[[ Name: validateRenderResult ]]
        -- upvalues: v8 (copy)
        return v8.isElement(v11);
    end
};
local v16 = {
    [v4.InlineCustom] = {
        defaultParent = v4.Root, 
        getDefault = function() --[[ Line: 67 ]] --[[ Name: getDefault ]]
            -- upvalues: v4 (copy)
            return {
                name = "TEXT_SPAN", 
                text = "", 
                type = v4.InlineCustom, 
                children = {}, 
                attributes = {}
            };
        end, 
        children = {
            [v4.EngineTag] = true, 
            [v4.Plaintext] = true
        }, 
        validateRenderResult = function(v13) --[[ Line: 80 ]] --[[ Name: validateRenderResult ]]
            -- upvalues: l_isInlineElement_0 (copy)
            return l_isInlineElement_0(v13);
        end
    }, 
    [v4.EngineTag] = {
        defaultParent = v4.InlineCustom, 
        children = {
            [v4.EngineTag] = true, 
            [v4.Plaintext] = true
        }, 
        validateRenderResult = function(_) --[[ Line: 91 ]] --[[ Name: validateRenderResult ]]
            return true;
        end
    }, 
    [v4.Plaintext] = {
        defaultParent = v4.InlineCustom, 
        getDefault = function() --[[ Line: 97 ]] --[[ Name: getDefault ]]
            -- upvalues: v4 (copy)
            return {
                name = "TEXT", 
                text = "", 
                type = v4.Plaintext, 
                children = {}, 
                attributes = {}
            };
        end, 
        children = {}, 
        validateRenderResult = function(_) --[[ Line: 107 ]] --[[ Name: validateRenderResult ]]
            return true;
        end
    }
};
local v17 = v6.Dictionary.union(v16, {
    [v4.Root] = v12
});
local function v20(v18) --[[ Line: 115 ]] --[[ Name: getByType ]]
    -- upvalues: v17 (copy), v5 (copy)
    local v19 = v17[v18];
    if not v19 then
        v5:error((("getByType: No config found for node type %*"):format(v18)));
        return nil;
    else
        return v19;
    end;
end;
local function v24(v21) --[[ Line: 124 ]] --[[ Name: getByNode ]]
    -- upvalues: v5 (copy), v17 (copy)
    if not v21 then
        v5:error("getByNode: No node provided");
        return nil;
    else
        local l_type_0 = v21.type;
        local v23 = v17[l_type_0];
        if not v23 then
            v5:error((("getByType: No config found for node type %*"):format(l_type_0)));
            return nil;
        else
            return v23;
        end;
    end;
end;
local function v27(v25, v26) --[[ Line: 133 ]]
    -- upvalues: v7 (copy), v17 (copy)
    return v7(v17, "InlineRichTextNodeConfigGraph", v25.type, v26.type);
end;
if _G.__DEV__ or v10 then
    for v28, v29 in v16 do
        if not v7(v17, "InlineRichTextNodeConfigGraph", v4.Root, v28) then
            error((("NodeConfigNonRoot: Node type %* does not descend from the root node"):format(v28)));
        end;
        if v7(v17, "InlineRichTextNodeConfigGraph", v28, v4.Root) then
            error((("NodeConfigNonRoot: Node type %* descends from the root node"):format(v28)));
        end;
        if v29.getDefault and v29.getDefault().type ~= v28 then
            error((("NodeConfigNonRoot: Node type %* getDefault function returns a node with type %* instead of %*"):format(v28, v29.getDefault().type, v28)));
        end;
        if not v29.defaultParent then
            error((("NodeConfigNonRoot: Node type %* has no defaultParent"):format(v28)));
        end;
        if not v17[v29.defaultParent].getDefault then
            error((("NodeConfigNonRoot: Node type %* has no getDefault function, but %* has it as its defaultParent"):format(v29.defaultParent, v28)));
        end;
    end;
end;
return {
    getByType = v20, 
    getByNode = v24, 
    isDescendant = v27
};