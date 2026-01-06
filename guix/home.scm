;; Este arquivo "home-environment" pode ser passado para 'guix home
;; reconfigure' para reproduzir o conteúdo do seu perfil. Isto é "simbólico":
;; ele apenas especifica nomes de pacotes. Para reproduzir exatamente o mesmo
;; perfil, você também precisa capturar os canais que estão sendo usados,
;; conforme retornado por "guix describe".
;; Veja a seção "Replicando Guix" no manual.

(use-modules (gnu home)
             (gnu packages)
             (gnu services)
             (gnu home services shells))

(home-environment
  ;; Abaixo está a lista de pacotes que aparecerão no seu
  ;; perfil pessoal, em ~/.guix-home/profile.
  (packages
    (specifications->packages
      (list
        "font-victor-mono"
        "glibc-locales"
        "helix"
        "grim"
        "slurp"
        "alacritty"
        "librewolf"
        "waybar"
        "wofi"
        )))

  ;; Abaixo está a lista de serviços Home. Para procurar por serviços
  ;; disponíveis, execute 'guix home search KEYWORD' em um terminal.
(services
   (append (list
            ;; Variáveis de ambiente pro GNOME não morrer
            (simple-service 'gnome-env
                           home-bash-service-type
                           (home-bash-extension
                            (environment-variables
                             '(("GSK_RENDERER" . "gl")
                               ("MUTTER_DEBUG_FORCE_KMS_MODE" . "simple")
                               ("CLUTTER_PAINT" . "disable-clipped-redraws:disable-culling")
                               ("GNOME_SHELL_SLOWDOWN_FACTOR" . "1")
                               ("WEBKIT_DISABLE_COMPOSITING_MODE" . "1"))))))
           %base-home-services)))
