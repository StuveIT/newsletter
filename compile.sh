#pandoc --standalone -V volume:1 -V semester:"SS25" --template "template/template.html" "content/main.md"

# Arguments Parsing
# while getopts "V:S:" opt; do
#     case $opt in
#         V) volume="$OPTARG" ;;
#         S) semester="$OPTARG" ;;
#         *) echo "Invalid option: -$OPTARG" ;;
#     esac
# done
#
# Compile
homefeed=$(for file in ./content/main/*.md; do pandoc --standalone --template "template/home-template.html" "$file"; done)
sidefeed=$(for file in ./content/events/*.md; do pandoc --standalone --template "template/side-template.html" "$file"; done)

homefeed_en=$(for file in ./content/en/main/*.md; do pandoc --standalone --template "template/home-template.html" "$file"; done)
sidefeed_en=$(for file in ./content/en/events/*.md; do pandoc --standalone --template "template/side-template.html" "$file"; done)

issue=$(LC_TIME=de_DE.UTF-8 date +"%B %Y")

echo $homefeed | pandoc --standalone -V side-feed:"$sidefeed" -V home-feed-en:"$homefeed_en" -V side-feed-en:"$sidefeed_en" -V issue:"$issue" --template "template/template.html" | node utils/juice.js
