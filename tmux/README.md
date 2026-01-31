# Bootstrap
Pasos a seguir para que esto quede funcionando:
- Crear un enlace simbolico para `.tmux.conf`
- Crear un enlace simbolico para `.tmux` (directorio base de tmux)
    - Con esto, tpm va a poder encontrar la carpeta tmux/plugins y va a poder terminar de instalar todo.
- Clonar repo `tpm` dentro de `tmux/plugins`
    - https://github.com/tmux-plugins/tpm.git
    - Dentro de `tmux`, `<Prefix>+I` (para instalar todo)
- Instalar `tmux-tools`
    - Clonar el repo correspondiente: git clone https://github.com/raine/tmux-tools.git ~/.tmux-tools
    - Agregarlo al path: `export PATH="$PATH:$HOME/.tmux-tools"`
        - tmux-file-picker
            - fd (apt install fd-find)
            - 
        - tmux-bro (uno de los 3 de abajo)
            - sudo apt install w3m
            - sudo apt install lynx
            - pip install --user git+https://github.com/rafaelrinaldi/bro.git

