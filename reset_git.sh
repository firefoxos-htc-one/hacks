find ../B2G/ -name '.git' -exec bash -c "cd {}; cd ..; pwd; git reset --hard" \;
