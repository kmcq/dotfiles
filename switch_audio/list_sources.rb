require "json"

sources = `/usr/local/bin/SwitchAudioSource -a -t output -f json`.split("\n").map do |line|
  parsed = JSON.parse(line)
  parsed["title"] = parsed["name"]
  parsed["arg"] = parsed["name"]
  parsed
end
sources = { items: sources }.to_json
STDOUT.write(sources)
