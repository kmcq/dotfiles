require "json"

sources = `/usr/local/bin/SwitchAudioSource -a -t output -f json`.split("\n").reject { |l| l.include?("Zoom") }.map do |line|
  parsed = JSON.parse(line)
  parsed["title"] = parsed["name"]
  parsed["arg"] = parsed["name"]
  parsed
end
STDOUT.write({ items: sources }.to_json)
