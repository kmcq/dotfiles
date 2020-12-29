# A workaround for Fish re-reading config for non-interactive execution:
# https://git.io/yj4KoA
if not status --is-interactive
  exit
end

# Autoload any files that update the $PATH first
for file in (find ~/.dotfiles/**/path.fish -maxdepth 2)
  source $file
end

# Autoload any files that end in .auto.fish
for file in (find ~/.dotfiles/**/*.auto.fish -maxdepth 2)
  source $file
end

# Autoload any files that end in auto.sh
# for file in (find ~/.dotfiles/**/*.auto.sh -maxdepth 2)
#   sh $file
# end
