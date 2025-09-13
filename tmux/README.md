# Bootstrap
Pasos a seguir para que esto quede funcionando:
- Crear un enlace simbolico para `.tmux.conf`
- Crear un enlace simbolico para `.tmux` (directorio base de tmux)
    - Con esto, tpm va a poder encontrar la carpeta tmux/plugins y va a poder terminar de instalar todo.
- Clonar repo tpm dentro de `tmux/plugins`
    - Dentro de `tmux`, `<Prefix>+I` (para instalar todo)
