local function v0() --[[ Line: 1 ]] --[[ Name: noOpt ]]

end;
return function() --[[ Line: 3 ]]
    -- upvalues: v0 (copy)
    return function(v1) --[[ Line: 4 ]]
        -- upvalues: v0 (ref)
        assert(v1, "expected externalPolicy");
        return {
            read = function() --[[ Line: 8 ]] --[[ Name: read ]]
                -- upvalues: v1 (copy)
                return v1;
            end, 
            onPolicyChanged = function(v2) --[[ Line: 12 ]] --[[ Name: onPolicyChanged ]]
                -- upvalues: v0 (ref)
                local v3 = v2 or v0;
                return Instance.new("BindableEvent").Event:Connect(v3);
            end
        };
    end;
end;