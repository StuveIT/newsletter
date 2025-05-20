#pandoc --standalone -V volume:1 -V semester:"SS25" --template "template/template.html" "content/main.md"
homefeed=$(for file in ./content/main/*.md; do pandoc --standalone --template "template/home-template.html" "$file"; done)
sidefeed=$(for file in ./content/events/*.md; do pandoc --standalone --template "template/side-template.html" "$file"; done)

echo $homefeed | pandoc --standalone -V volume:1 -V semester:"SS25" -V side-feed:"$sidefeed" --template "template/template.html"