local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Error_0 = v2.Error;
local l_inspect_0 = v2.util.inspect;
local v5 = require(script.Parent.getComponentName);
local _ = script:FindFirstAncestor("ReactUtils");
local l___DEV___0 = v1.__DEV__;
local v8 = require(l_Parent_0.SafeFlags).createGetFFlag("ReactInstanceMapDisableErrorChecking")();
local v9 = {};
local function _(v10) --[[ Line: 44 ]] --[[ Name: isValidFiber ]]
    local v11 = false;
    if v10.tag ~= nil then
        v11 = false;
        if v10.subtreeFlags ~= nil then
            v11 = false;
            if v10.lanes ~= nil then
                v11 = v10.childLanes ~= nil;
            end;
        end;
    end;
    return v11;
end;
v9.remove = function(v13) --[[ Line: 51 ]]
    v13._reactInternals = nil;
end;
if not v8 or l___DEV___0 then
    v9.get = function(v14) --[[ Line: 56 ]]
        -- upvalues: l_Error_0 (copy), v5 (copy), l_inspect_0 (copy)
        local l__reactInternals_0 = v14._reactInternals;
        local v16 = false;
        if l__reactInternals_0.tag ~= nil then
            v16 = false;
            if l__reactInternals_0.subtreeFlags ~= nil then
                v16 = false;
                if l__reactInternals_0.lanes ~= nil then
                    v16 = l__reactInternals_0.childLanes ~= nil;
                end;
            end;
        end;
        if not v16 then
            error(l_Error_0.new("invalid fiber in " .. (v5(v14) or "UNNAMED Component") .. " during get from ReactInstanceMap! " .. l_inspect_0(l__reactInternals_0)));
            return l__reactInternals_0;
        else
            if l__reactInternals_0.alternate ~= nil then
                local l_alternate_0 = l__reactInternals_0.alternate;
                v16 = false;
                if l_alternate_0.tag ~= nil then
                    v16 = false;
                    if l_alternate_0.subtreeFlags ~= nil then
                        v16 = false;
                        if l_alternate_0.lanes ~= nil then
                            v16 = l_alternate_0.childLanes ~= nil;
                        end;
                    end;
                end;
                if not v16 then
                    error(l_Error_0.new("invalid alternate fiber (" .. (v5(v14) or "UNNAMED alternate") .. ") in " .. (v5(v14) or "UNNAMED Component") .. " during get from ReactInstanceMap! " .. l_inspect_0(l__reactInternals_0.alternate)));
                end;
            end;
            return l__reactInternals_0;
        end;
    end;
else
    v9.get = function(v18) --[[ Line: 82 ]]
        return v18._reactInternals;
    end;
end;
v9.has = function(v19) --[[ Line: 87 ]]
    return v19._reactInternals ~= nil;
end;
if not v8 or l___DEV___0 then
    v9.set = function(v20, v21) --[[ Line: 92 ]]
        -- upvalues: v5 (copy), l_inspect_0 (copy), l_Error_0 (copy)
        local l_v21_0 = v21;
        local v23 = nil;
        while l_v21_0 ~= nil do
            local l_l_v21_0_0 = l_v21_0;
            local v25 = false;
            if l_l_v21_0_0.tag ~= nil then
                v25 = false;
                if l_l_v21_0_0.subtreeFlags ~= nil then
                    v25 = false;
                    if l_l_v21_0_0.lanes ~= nil then
                        v25 = l_l_v21_0_0.childLanes ~= nil;
                    end;
                end;
            end;
            if not v25 then
                v23 = "invalid fiber in " .. (v5(v20) or "UNNAMED Component") .. " being set in ReactInstanceMap! " .. l_inspect_0(l_v21_0) .. "\n";
                if v21 ~= l_v21_0 then
                    v23 = v23 .. " (from original fiber " .. (v5(v20) or "UNNAMED Component") .. ")";
                end;
                error(l_Error_0.new(v23));
            elseif l_v21_0.alternate ~= nil then
                l_l_v21_0_0 = l_v21_0.alternate;
                v25 = false;
                if l_l_v21_0_0.tag ~= nil then
                    v25 = false;
                    if l_l_v21_0_0.subtreeFlags ~= nil then
                        v25 = false;
                        if l_l_v21_0_0.lanes ~= nil then
                            v25 = l_l_v21_0_0.childLanes ~= nil;
                        end;
                    end;
                end;
                if not v25 then
                    v23 = "invalid alternate fiber (" .. (v5(v20) or "UNNAMED alternate") .. ") in " .. (v5(v20) or "UNNAMED Component") .. " being set in ReactInstanceMap! " .. l_inspect_0(l_v21_0.alternate) .. "\n";
                    if v21 ~= l_v21_0 then
                        v23 = v23 .. " (from original fiber " .. (v5(v20) or "UNNAMED Component") .. ")";
                    end;
                    error(l_Error_0.new(v23));
                end;
            end;
            l_v21_0 = l_v21_0.return_;
        end;
        v20._reactInternals = v21;
    end;
    return v9;
else
    v9.set = function(v26, v27) --[[ Line: 129 ]]
        v26._reactInternals = v27;
    end;
    return v9;
end;