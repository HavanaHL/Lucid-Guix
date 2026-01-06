;; This is an operating system configuration generated
;; by the graphical installer.
;;
;; Once installation is complete, you can learn and modify
;; this file to tweak the system configuration, and pass it
;; to the 'guix system reconfigure' command to effect your
;; changes.


;; Indicate which modules to import to access the variables
;; used in this configuration.
(use-modules (gnu))
(use-service-modules cups desktop networking ssh xorg)

(operating-system
  (locale "pt_BR.utf8")
  (timezone "America/Bahia")
  (keyboard-layout (keyboard-layout "br"))
  (host-name "Genesis")

  ;; The list of user accounts ('root' is implicit).
  (users (cons* (user-account
                  (name "deive")
                  (comment "deive")
                  (group "users")
                  (home-directory "/home/deive")
                  (supplementary-groups '("wheel" "netdev" "audio" "video")))
                %base-user-accounts))

  ;; Packages installed system-wide.  Users can also install packages
  ;; under their own account: use 'guix search KEYWORD' to search
  ;; for packages and 'guix install PACKAGE' to install a package.
  (packages (append (list 
                          (specification->package "nss-certs")
			                    (specification->package "intel-vaapi-driver")
			                    (specification->package "glibc-locales"))
                    %base-packages))

  ;; Below is the list of system services.  To search for available
  ;; services, run 'guix system search KEYWORD' in a terminal.
(services
  (append (list
            (service gnome-desktop-service-type))
          %desktop-services))

(bootloader (bootloader-configuration
              (bootloader grub-efi-bootloader)
              (targets (list "/boot/efi"))
              (keyboard-layout keyboard-layout)))

  ;; The list of file systems that get "mounted".  The unique
  ;; file system identifiers there ("UUIDs") can be obtained
  ;; by running 'blkid' in a terminal.
  (file-systems (cons* (file-system
                         (mount-point "/home")
                         (device (uuid
                                  "51f88f3b-e18a-4692-9d68-09c278807307"
                                  'xfs))
                         (type "xfs"))
                       (file-system
                         (mount-point "/")
                         (device (uuid
                                  "8838713d-9865-4e12-bcc3-dd20a060107d"
                                  'xfs))
                         (type "xfs"))
                       (file-system
                         (mount-point "/boot/efi")
                         (device (uuid "2D95-C19F"
                                       'fat32))
                         (type "vfat")) %base-file-systems)))
