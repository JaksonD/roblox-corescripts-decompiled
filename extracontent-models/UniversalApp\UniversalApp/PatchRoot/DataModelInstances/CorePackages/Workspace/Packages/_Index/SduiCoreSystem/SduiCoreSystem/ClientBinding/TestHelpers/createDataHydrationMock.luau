local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local v1 = require(l_script_FirstAncestor_0.ClientBinding.SduiDataBinderTransformUtils);
local l_snakeToCamel_0 = v1.snakeToCamel;
local l_protobufTimestampToLocalTimeString_0 = v1.protobufTimestampToLocalTimeString;
local v4 = {
    DataStatus = {
        Ready = "Ready", 
        NotReady = "NotReady", 
        Failed = "Failed"
    }
};
return {
    createDataHydrationMock = function(v5) --[[ Line: 30 ]] --[[ Name: createDataHydrationMock ]]
        -- upvalues: v4 (copy)
        local v6 = {
            Badges = v5 and v5.Badges or {
                getBadgeInfoStore = function() --[[ Line: 36 ]] --[[ Name: getBadgeInfoStore ]]
                    return {
                        getBadgeInfo = function() --[[ Line: 38 ]] --[[ Name: getBadgeInfo ]]
                            return {
                                data = function() --[[ Line: 40 ]] --[[ Name: data ]]
                                    return nil;
                                end, 
                                status = function() --[[ Line: 43 ]] --[[ Name: status ]]
                                    return "NotReady";
                                end
                            };
                        end, 
                        getBadgeInfos = function() --[[ Line: 48 ]] --[[ Name: getBadgeInfos ]]
                            return {};
                        end, 
                        clear = function() --[[ Line: 51 ]] --[[ Name: clear ]]

                        end, 
                        dispose = function() --[[ Line: 52 ]] --[[ Name: dispose ]]

                        end
                    };
                end
            }, 
            DataHydrationTypes = v4
        };
        if v5 and v5.extraFields then
            for v7, v8 in v5.extraFields do
                v6[v7] = v8;
            end;
        end;
        return v6;
    end, 
    createSduiDataBinderTransformUtilsMock = function() --[[ Line: 73 ]] --[[ Name: createSduiDataBinderTransformUtilsMock ]]
        -- upvalues: l_snakeToCamel_0 (copy), l_protobufTimestampToLocalTimeString_0 (copy)
        return {
            snakeToCamel = l_snakeToCamel_0, 
            protobufTimestampToLocalTimeString = l_protobufTimestampToLocalTimeString_0
        };
    end, 
    snakeToCamel = l_snakeToCamel_0, 
    protobufTimestampToLocalTimeString = l_protobufTimestampToLocalTimeString_0, 
    DataHydrationTypesMock = v4
};