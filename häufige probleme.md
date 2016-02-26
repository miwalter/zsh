#Häufige Probleme
##Fehler "compdef: unknown command or service: git"
- rm $HOME/.zcompdump*
- compaudit | sudo xargs chmod g-w
- compaudit | sudo xargs chown root
- compinit

#Interessant
##Aktuelle zsh auf OSX
- sudo brew install zsh
- sudo nano /etc/shells (/usr/local/bin/zsh ergänzen)
- aus zsh raus/wieder rein
- ggf. Probleme beheben (siehe oben)

