require 'open-uri'
require 'json'

ENDPOINT = 'https://api.tfl.gov.uk/line/mode/tube,overground,dlr,tflrail/status'

json_data = URI.open(ENDPOINT).read

JSON.parse(json_data).each do |line|
    #Write the code to store the line's names
    line_name = line ['name']
    status = line ['lineaStatuses']

    puts "- #{status} na linha #{line_name}."

    if line['lineStatuses'].first['reason']
        reason = line['lineStatuses'].first['reason']
    #Display the reason of the incident:
        puts "A razão é #{reason}"
    end
    puts ""
end