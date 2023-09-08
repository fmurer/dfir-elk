# Inspired by https://github.com/philhagen/sof-elk/blob/main/supporting-scripts/split_kv_to_fields.rb

def register(p)
    @source = p["source"]
    @dest = p["dest"]
    @key = p["key"]
    @value = p["value"]
end

def filter(event)
    if event.get(@source).nil?
        return [event]
    end

    data = event.get(@source)
    result = Hash.new()

    if data.is_a?(Array)
        for item in data
            if item.key?(@value) && !(item[@value] == "")
                result[item[@key]] = item[@value]
            end
        end
    elsif data.is_a?(Hash)
        if data.key?(@value) && !(data[@value] == "")
            result[data[@key]] = data[@value]
        end
    end

    event.set(@dest, result)
    return [event]
end