require "json"

switch_audio = `command -v /usr/local/bin/SwitchAudioSource || command -v /opt/homebrew/bin/SwitchAudioSource`.to_s.strip
sources = `#{switch_audio} -a -t output -f json`.split("\n").reject { |l| l.include?("Zoom") }.map do |line|
  parsed = JSON.parse(line)
  parsed["title"] = parsed["name"]
  parsed["arg"] = parsed["name"]
  parsed
end
STDOUT.write({ items: sources }.to_json)
