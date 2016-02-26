#Häufige Probleme
Fehler "compdef: unknown command or service: git"
- rm $HOME/.zcompdump*
- compaudit | sudo xargs chmod g-w
- compaudit | sudo xargs chown root
- compinit

